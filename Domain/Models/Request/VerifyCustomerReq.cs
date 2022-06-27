using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models.Request
{
    public class VerifyCustomerReq
    {
        [Required(ErrorMessage = "Phone Number is Required")]
        [RegularExpression(@"^(\d{11})$", ErrorMessage = "Invalid Phone number")]
        public string? PhoneNumber { get; set; }
        [Required(ErrorMessage = "OTP is Required")]
        public string? OTP { get; set; }
    }
}
