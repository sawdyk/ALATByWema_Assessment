using DataAccess.EFCore.AppDbContext;
using Domain.Entities;
using Domain.Helpers.Interface;
using Domain.Models.Request;
using Domain.Models.Response;
using Domain.Repository.Interface;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Repository
{
    public class CustomerRepository : ICustomerRepository
    {
        private readonly CustomerDbContext _customerDbContext;
        private readonly IPasswordSecurityRepository _passwordSecurityRepository;
        private readonly IOTPRepository _oTPRepository;
        private readonly IChecker _checker;
        private readonly ILogger<CustomerRepository> _logger;

        public CustomerRepository(CustomerDbContext customerDbContext, IPasswordSecurityRepository passwordSecurityRepository, 
            IOTPRepository oTPRepository, ILogger<CustomerRepository> logger, IChecker checker)
        {
            _customerDbContext = customerDbContext;
            _passwordSecurityRepository = passwordSecurityRepository;
            _oTPRepository = oTPRepository;
            _logger = logger;
            _checker = checker;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="req"></param>
        /// <returns></returns>
        public async Task<GenericResponse> CreateCustomerAsync(CreateCustomerReq req)
        {
            try
            {
                Customers customer = _customerDbContext.Customers.Where(x => x.PhoneNumber == req.PhoneNumber && x.EmailAddress == req.EmailAddress).FirstOrDefault();
                if (customer is null)
                {
                    //Check if state and LGA Ids passed are valid
                    if (_checker.checkLgaById(req.LgaId) && _checker.checkStateById(req.StateId))
                    {
                        //Check if the LGA selected belongs to the State selected
                        var chkState = _customerDbContext.Lga.Where(x => x.StateId == req.StateId).ToList().Select(c => c.Id).Contains(req.LgaId);
                        if (chkState)
                        {
                            //Hash the customer password for security
                            string salt = _passwordSecurityRepository.GettSalt();
                            string password = _passwordSecurityRepository.HashedPassword(req.Password, salt);

                            var newCustomer = new Customers
                            {
                                PhoneNumber = req.PhoneNumber,
                                EmailAddress = req.EmailAddress,
                                Salt = salt,
                                PasswordHash = password,
                                StateId = req.StateId,
                                LgaId = req.LgaId,
                                isVerified = false,
                                DateCreated = DateTime.Now,
                            };

                            await _customerDbContext.Customers.AddAsync(newCustomer);
                            int result = await _customerDbContext.SaveChangesAsync();

                            //Generate OTP and send to Customers Phone Number provided
                            if (result > 0)
                            {
                                var otpResponse = await _oTPRepository.SendOTPAsync(newCustomer.PhoneNumber); 
                                
                                var response = new CustomerResponse() { Id = newCustomer.Id, PhoneNumber = newCustomer.PhoneNumber, EmailAddress = newCustomer.EmailAddress,
                                    State = newCustomer.State.StateName, LGA = newCustomer.Lga.lgaName, OTPSMS = otpResponse.Data,  DateCreated = newCustomer.DateCreated, DateVerified = newCustomer.DateVerified };
                                return new GenericResponse { ResponseCode = HttpStatusCode.OK, ResponseMessage = "Successfully Created Customer", Data = response };
                            }

                            return new GenericResponse { ResponseCode = HttpStatusCode.InternalServerError, ResponseMessage = "An Error Occured"};
                        }

                        return new GenericResponse { ResponseCode = HttpStatusCode.BadRequest, ResponseMessage = "LGA does not belong to the Selected State" };
                    }

                    return new GenericResponse { ResponseCode = HttpStatusCode.BadRequest, ResponseMessage = "Invalid State/LGA" };
                }

                return new GenericResponse { ResponseCode = HttpStatusCode.BadRequest, ResponseMessage = "Customer Already exists"};
            }
            catch (Exception ex)
            {
                _logger.LogError($"Mesage: {ex.Message}; StackTrace: {ex.StackTrace}; DateTime: {DateTime.Now}");
                return new GenericResponse { ResponseCode = HttpStatusCode.InternalServerError, ResponseMessage = $"An Error Occurred! {ex.Message}" };
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public async Task<GenericResponse> GetAllCustomersAsync()
        {
            try
            {
                var allCustomers = (from c in _customerDbContext.Customers
                                   select new
                                   {
                                       c.Id,
                                       c.PhoneNumber,
                                       c.EmailAddress,
                                       c.State.StateName,
                                       c.Lga.lgaName,
                                       c.isVerified,
                                       c.DateCreated,
                                       c.DateVerified
                                   }).ToList();
             
                if (allCustomers.Count() > 0)
                {
                    return new GenericResponse { ResponseCode = HttpStatusCode.OK, ResponseMessage = "Successful", Data = allCustomers };
                }

                return new GenericResponse { ResponseCode = HttpStatusCode.NoContent, ResponseMessage = "No Data Found" };
            }
            catch (Exception ex)
            {
                _logger.LogError($"Mesage: {ex.Message}; StackTrace: {ex.StackTrace}; DateTime: {DateTime.Now}");
                return new GenericResponse { ResponseCode = HttpStatusCode.InternalServerError, ResponseMessage = $"An Error Occurred! {ex.Message}" };
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="req"></param>
        /// <returns></returns>
        public async Task<GenericResponse> VerifyCustomerAsync(VerifyCustomerReq req)
        {
            try
            {
                Customers customer = _customerDbContext.Customers.Where(x => x.PhoneNumber == req.PhoneNumber).FirstOrDefault();
                if (customer != null)
                {
                    if (customer.isVerified == false)
                    {
                        var customerOTP = _customerDbContext.OtpGenerated.Where(x => x.CustomerPhoneNo == customer.PhoneNumber && x.OTP == req.OTP).FirstOrDefault();
                        if (customerOTP != null)
                        {
                            customer.isVerified = true;
                            customer.DateVerified = DateTime.Now;
                            await _customerDbContext.SaveChangesAsync();

                            return new GenericResponse { ResponseCode = HttpStatusCode.OK, ResponseMessage = "Verification Successful"};
                        }

                        return new GenericResponse { ResponseCode = HttpStatusCode.BadRequest, ResponseMessage = "Invalid OTP" };
                    }

                    return new GenericResponse { ResponseCode = HttpStatusCode.BadRequest, ResponseMessage = "Customer Account has already been verified"};
                }

                return new GenericResponse { ResponseCode = HttpStatusCode.BadRequest, ResponseMessage = "Customer does not exist" };
            }
            catch (Exception ex)
            {
                _logger.LogError($"Mesage: {ex.Message}; StackTrace: {ex.StackTrace}; DateTime: {DateTime.Now}");
                return new GenericResponse { ResponseCode = HttpStatusCode.InternalServerError, ResponseMessage = $"An Error Occurred! {ex.Message}" };
            }
        }
    }
}
