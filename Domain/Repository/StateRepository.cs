using DataAccess.EFCore.AppDbContext;
using Domain.Models.Response;
using Domain.Repository.Interface;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Repository
{
    public class StateRepository : IStateRepository
    {
        private readonly CustomerDbContext _customerDbContext;
        private readonly ILogger<StateRepository> _logger;

        public StateRepository(CustomerDbContext customerDbContext, ILogger<StateRepository> logger)
        {
            _customerDbContext = customerDbContext;
            _logger = logger;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="stateId"></param>
        /// <returns></returns>
        public async Task<GenericResponse> GetAllLgaByStateIdAsync(int stateId)
        {
            try
            {
                var allLgas = from c in _customerDbContext.Lga where c.StateId == stateId 
                              select new
                               {
                                  c.Id,
                                  c.StateId,
                                  c.lgaName,
                                  c.State.StateName
                               };
                if (allLgas.Count() > 0)
                {
                    return new GenericResponse { ResponseCode = HttpStatusCode.OK, ResponseMessage = "Successful", Data = allLgas };
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
        /// <returns></returns>
        public async Task<GenericResponse> GetAllStatesAsync()
        {
            try
            {
                var allStates = from c in _customerDbContext.State select c;
                if (allStates.Count() > 0)
                {
                    return new GenericResponse { ResponseCode = HttpStatusCode.OK, ResponseMessage = "Successful", Data = allStates.ToList() };
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
        /// <param name="stateId"></param>
        /// <returns></returns>
        public async Task<GenericResponse> GetStateByIdAsync(int stateId)
        {
            try
            {
                var allStates = from c in _customerDbContext.State where c.Id == stateId select c;
                if (allStates.Count() > 0)
                {
                    return new GenericResponse { ResponseCode = HttpStatusCode.OK, ResponseMessage = "Successful", Data = allStates.FirstOrDefault()};
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
        /// <param name="lgaId"></param>
        /// <returns></returns>
        public async Task<GenericResponse> GetLgaByIdAsync(int lgaId)
        {
            try
            {
                var allLgas = from c in _customerDbContext.Lga where c.Id == lgaId
                                select new
                                {
                                    c.Id,
                                    c.StateId,
                                    c.lgaName,
                                    c.State.StateName
                                };
                if (allLgas.Count() > 0)
                {
                    return new GenericResponse { ResponseCode = HttpStatusCode.OK, ResponseMessage = "Successful", Data = allLgas.FirstOrDefault() };
                }

                return new GenericResponse { ResponseCode = HttpStatusCode.NoContent, ResponseMessage = "No Data Found" };
            }
            catch (Exception ex)
            {
                _logger.LogError($"Mesage: {ex.Message}; StackTrace: {ex.StackTrace}; DateTime: {DateTime.Now}");
                return new GenericResponse { ResponseCode = HttpStatusCode.InternalServerError, ResponseMessage = $"An Error Occurred! {ex.Message}" };
            }
        }
    }
}
