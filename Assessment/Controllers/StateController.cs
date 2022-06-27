using Domain.Repository.Interface;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Assessment.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class StateController : ControllerBase
    {
        private readonly IStateRepository _stateRepository;

        public StateController(IStateRepository stateRepository)
        {
            _stateRepository = stateRepository;
        }

        [HttpGet]
        [Route("GetAllStates")]
        [SwaggerOperation(Summary = "Get all States", Description = "Returns All 36 States")]
        public async Task<IActionResult> GetAllStatesAsync()
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var result = await _stateRepository.GetAllStatesAsync();

            return Ok(result);
        }

        [HttpGet]
        [Route("GetAllLgaByStateId")]
        [SwaggerOperation(Summary = "Get all LGA in a State", Description = "Returns all LGA in a State")]
        public async Task<IActionResult> GetAllLgaByStateIdAsync(int stateId)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var result = await _stateRepository.GetAllLgaByStateIdAsync(stateId);

            return Ok(result);
        }

        [HttpGet]
        [Route("GetStateById")]
        [SwaggerOperation(Summary = "Get State", Description = "Returns a State")]

        public async Task<IActionResult> GetStateByIdAsync(int stateId)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var result = await _stateRepository.GetStateByIdAsync(stateId);

            return Ok(result);
        }

        [HttpGet]
        [Route("GetLgaById")]
        [SwaggerOperation(Summary = "Get LGA", Description = "Returns a LGA")]

        public async Task<IActionResult> GetLgaByIdAsync(int lgaId)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var result = await _stateRepository.GetLgaByIdAsync(lgaId);

            return Ok(result);
        }
    }
}
