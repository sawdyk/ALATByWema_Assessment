using Domain.Repository.Interface;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Repository
{
    public class PasswordSecurityRepository : IPasswordSecurityRepository
    {
        private readonly ILogger<PasswordSecurityRepository> _logger;
        public PasswordSecurityRepository(ILogger<PasswordSecurityRepository> logger)
        {
            _logger = logger;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="password"></param>
        /// <returns></returns>
        public string GettHash(string password)
        {
            try
            {
                using (var sha256 = SHA256.Create())
                {
                    var hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                    var hash = BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
                    return hash;
                }
            }
            catch (Exception ex)
            {
                _logger.LogError($"Mesage: {ex.Message}; StackTrace: {ex.StackTrace}; DateTime: {DateTime.Now}");
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public string GettSalt()
        {
            try
            {
                byte[] bytes = new byte[128 / 8];
                using (var keyGenerator = RandomNumberGenerator.Create())
                {
                    keyGenerator.GetBytes(bytes);
                    return BitConverter.ToString(bytes).Replace("-", "").ToLower();
                }
            }
            catch (Exception ex)
            {
                _logger.LogError($"Mesage: {ex.Message}; StackTrace: {ex.StackTrace}; DateTime: {DateTime.Now}");
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="password"></param>
        /// <param name="salt"></param>
        /// <returns></returns>
        public string HashedPassword(string password, string salt)
        {
            try
            {
                string hashPassword = GettHash(password + salt);
                return hashPassword;
            }
            catch (Exception ex)
            {
                _logger.LogError($"Mesage: {ex.Message}; StackTrace: {ex.StackTrace}; DateTime: {DateTime.Now}");
                return null;
            }
        }
    }
}
