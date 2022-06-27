using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models.Response
{
    public class GenericResponse
    {
        public HttpStatusCode ResponseCode { get; set; }
        public string? ResponseMessage { get; set; }
        public object? Data { get; set; }
    }
}
