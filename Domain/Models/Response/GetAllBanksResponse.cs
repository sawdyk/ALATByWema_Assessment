using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models.Response
{
    public class GetAllBanksResponse
    {
        public IList<Result>? result { get; set; }
        public string? errorMessage { get; set; }
        public IList<string>? errorMessages { get; set; }
        public bool? hasError { get; set; }
        public string? timeGenerated { get; set; }
    }

    public class Result
    {
        public string? bankName { get; set; }
        public string? bankCode { get; set; }

    }
}
