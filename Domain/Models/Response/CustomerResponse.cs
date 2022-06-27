using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models.Response
{
    public class CustomerResponse
    {
        public int Id { get; set; }
        public string? PhoneNumber { get; set; }
        public string? EmailAddress { get; set; }
        public string? State { get; set; }
        public string? LGA { get; set; }
        public bool isVerified { get; set; }
        public object? OTPSMS { get; set; }
        public DateTime? DateVerified { get; set; }
        public DateTime? DateCreated { get; set; }
    }
}
