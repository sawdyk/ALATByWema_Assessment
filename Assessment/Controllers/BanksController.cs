using Domain.Repository.Interface;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Assessment.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class BanksController : ControllerBase
    {
        private readonly IHttpClientRepository _httpClientRepository;

        public BanksController(IHttpClientRepository httpClientRepository)
        {
            _httpClientRepository = httpClientRepository;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("GetBanks")]
        [SwaggerOperation(Summary = "Get Banks", Description = "Get All Banks from the GetBanks ALAT Tech Test API endpoint")]
        public async Task<IActionResult> GetBanksAsync()
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var result = await _httpClientRepository.GetBanksAsync();

            return Ok(result);
        }
    }
}
