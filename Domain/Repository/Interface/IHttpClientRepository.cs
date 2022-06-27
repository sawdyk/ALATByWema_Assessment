using Domain.Models.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Repository.Interface
{
    public interface IHttpClientRepository
    {
        Task<GetAllBanksResponse> GetBanksAsync();
    }
}
