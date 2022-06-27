using Domain.Repository.Interface;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Assessment.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class OTPController : ControllerBase
    {
        private readonly IOTPRepository _oTPRepository;

        public OTPController(IOTPRepository oTPRepository)
        {
            _oTPRepository = oTPRepository;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="customerPhoneNo"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("GetCustomerOTP")]
        [SwaggerOperation(Summary = "Get Customer OTP", Description = "Returns a Customer OTP using the Customer Phone Number")]
        public async Task<IActionResult> GetCustomerOTPAsync(string customerPhoneNo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var result = await _oTPRepository.GetCustomerOTPAsync(customerPhoneNo);

            return Ok(result);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="customerPhoneNo"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("SendOTP")]
        [SwaggerOperation(Summary = "Send OTP", Description = "Send/Resend OTP to a Customer")]
        public async Task<IActionResult> SendOTPAsync(string customerPhoneNo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var result = await _oTPRepository.SendOTPAsync(customerPhoneNo);

            return Ok(result);
        }
    }
}
