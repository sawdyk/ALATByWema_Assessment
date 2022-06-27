using Domain.Models.Request;
using Domain.Repository.Interface;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Assessment.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        private readonly ICustomerRepository _customerRepository;

        public CustomerController(ICustomerRepository customerRepository)
        {
            _customerRepository = customerRepository;
        }

        [HttpPost]
        [Route("CreateCustomer")]
        [SwaggerOperation(Summary = "Create Customer", Description = "Creates a new Customer")]
        public async Task<IActionResult> CreateCustomerAsync(CreateCustomerReq req)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var result = await _customerRepository.CreateCustomerAsync(req);

            return Ok(result);
        }


        [HttpGet]
        [Route("GetAllCustomers")]
        [SwaggerOperation(Summary = "Get All Customers", Description = "Returns all Customers that are previously Onboarded")]
        public async Task<IActionResult> GetAllCustomersAsync()
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var result = await _customerRepository.GetAllCustomersAsync();

            return Ok(result);
        }


        [HttpPut]
        [Route("VerifyCustomer")]
        [SwaggerOperation(Summary = "Verify Customer", Description = "Verify a Customer's Phone Number with OTP")]
        public async Task<IActionResult> VerifyCustomerAsync(VerifyCustomerReq req)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var result = await _customerRepository.VerifyCustomerAsync(req);

            return Ok(result);
        }


    }
}
