using Domain.Models.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Repository.Interface
{
    public interface IStateRepository
    {
        Task<GenericResponse> GetAllStatesAsync();
        Task<GenericResponse> GetStateByIdAsync(int stateId);
        Task<GenericResponse> GetAllLgaByStateIdAsync(int stateId);
        Task<GenericResponse> GetLgaByIdAsync(int lgaId);
    }
}
