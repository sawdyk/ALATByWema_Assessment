using Assessment.Configs;
using DataAccess.EFCore.AppDbContext;
using Domain.Entities;
using Domain.Models.Response;
using Domain.Repository.Interface;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Repository
{
    public class OTPRepository : IOTPRepository
    {
        private static Random random = new Random();
        private readonly CustomerDbContext _customerDbContext;
        private readonly ISMSRepository _sMSRepository;
        private readonly ILogger<OTPRepository> _logger;
        private readonly IOptions<SMSBody> _sMSBody;
        public OTPRepository(CustomerDbContext customerDbContext, ISMSRepository sMSRepository, ILogger<OTPRepository> logger, IOptions<SMSBody> sMSBody)
        {
            _customerDbContext = customerDbContext;
            _sMSRepository = sMSRepository;
            _logger = logger;
            _sMSBody = sMSBody;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public string GenerateOTPAsync()
        {
            try
            {
                const string numbers = "0123456789";
                string otpGenerated = new string(Enumerable.Repeat(numbers, 6).Select(s => s[random.Next(s.Length)]).ToArray());

                return otpGenerated;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="customerPhoneNo"></param>
        /// <returns></returns>
        public async Task<GenericResponse> GetCustomerOTPAsync(string customerPhoneNo)
        {
            try
            {
                var customerOTP = _customerDbContext.OtpGenerated.Where(x => x.CustomerPhoneNo == customerPhoneNo.Trim()).FirstOrDefault();
                if (customerOTP != null)
                {
                    return new GenericResponse { ResponseCode = HttpStatusCode.OK, ResponseMessage = "Successful", Data = customerOTP.OTP };
                }

                return new GenericResponse { ResponseCode = HttpStatusCode.NoContent, ResponseMessage = "No Customer with the Specified Phone Number"};
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
        /// <param name="customerPhoneNo"></param>
        /// <returns></returns>
        public async Task<GenericResponse> SendOTPAsync(string customerPhoneNo)
        {
            try
            {
                string otp = GenerateOTPAsync(); //Generates OTP for customer
                string? smsBody = _sMSBody.Value.SMSMessage.ToString().Replace("{otp}", otp); //Body of the SMS to be sent to the Customers phone
                Customers customer = _customerDbContext.Customers.Where(x => x.PhoneNumber == customerPhoneNo.Trim()).FirstOrDefault();

                if (customer != null)
                {
                    var customerOTP = _customerDbContext.OtpGenerated.Where(x => x.CustomerPhoneNo == customer.PhoneNumber).FirstOrDefault();
                    if (customerOTP != null)
                    {
                        customerOTP.OTP = otp;
                    }
                    else
                    {
                        var newCustomerOTP = new OtpGenerated
                        {
                            CustomerPhoneNo = customerPhoneNo,
                            OTP = otp,
                            DateGenerated = DateTime.Now
                        };

                        await _customerDbContext.OtpGenerated.AddAsync(newCustomerOTP);
                    }

                    int result = await _customerDbContext.SaveChangesAsync();
                    if (result > 0)
                    {
                        //SMS service to send OTP goes here!
                        var smsResult = _sMSRepository.SendSMSAsync(customerPhoneNo, smsBody);
                        return new GenericResponse { ResponseCode = HttpStatusCode.OK, ResponseMessage = "Successful", Data = smsBody };
                    }

                    return new GenericResponse { ResponseCode = HttpStatusCode.InternalServerError, ResponseMessage = "An Error Occurred" };
                }

                return new GenericResponse { ResponseCode = HttpStatusCode.BadRequest, ResponseMessage = "Customer does not exist"};
            }
            catch (Exception ex)
            {
                _logger.LogError($"Mesage: {ex.Message}; StackTrace: {ex.StackTrace}; DateTime: {DateTime.Now}");
                return new GenericResponse { ResponseCode = HttpStatusCode.InternalServerError, ResponseMessage = "An Error Occurred!" };
            }
        }
    }
}
