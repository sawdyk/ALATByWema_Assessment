using DataAccess.EFCore.AppDbContext;
using Domain.Helpers.Interface;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Helpers
{
    public class Checkers : IChecker
    {
        private readonly CustomerDbContext _customerDbContext;
        private readonly ILogger<Checkers> _logger;

        public Checkers(CustomerDbContext customerDbContext, ILogger<Checkers> logger)
        {
            _customerDbContext = customerDbContext;
            _logger = logger;
        }

        //check if Lga exists
        public bool checkLgaById(int lgaId)
        {
            try
            {
                bool itExists = false;
                var result = _customerDbContext.Lga.Where(s => s.Id == lgaId).FirstOrDefault();
                if (result != null)
                {
                    itExists = true;
                }

                return itExists;
            }
            catch (Exception ex)
            {
                _logger.LogError($"Mesage: {ex.Message}; StackTrace: {ex.StackTrace}; DateTime: {DateTime.Now}");
                return false;
            }
        }

        //check if state exists
        public bool checkStateById(int stateId)
        {
            try
            {
                bool itExists = false;
                var result = _customerDbContext.State.Where(s => s.Id == stateId).FirstOrDefault();
                if (result != null)
                {
                    itExists = true;
                }

                return itExists;
            }
            catch (Exception ex)
            {
                _logger.LogError($"Mesage: {ex.Message}; StackTrace: {ex.StackTrace}; DateTime: {DateTime.Now}");
                return false;
            }
        }
    }
}
