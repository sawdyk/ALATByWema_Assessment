using Domain.Models.Request;
using Domain.Models.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Repository.Interface
{
    public interface ICustomerRepository
    {
        Task<GenericResponse> CreateCustomerAsync(CreateCustomerReq req);
        Task<GenericResponse> VerifyCustomerAsync(VerifyCustomerReq req);
        Task<GenericResponse> GetAllCustomersAsync();
    }
}
