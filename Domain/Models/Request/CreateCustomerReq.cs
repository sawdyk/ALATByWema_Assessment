using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Models.Request
{
    public class CreateCustomerReq
    {
        [Required(ErrorMessage = "Phone Number is Required")]
        [RegularExpression(@"^(\d{11})$", ErrorMessage = "Invalid Phone number")]
        public string? PhoneNumber { get; set; }
        [Required(ErrorMessage = "Email Address is Required")]
        [DataType(DataType.EmailAddress)]
        [EmailAddress]
        public string? EmailAddress { get; set; }
        [Required(ErrorMessage = "Password is Required")]
        [RegularExpression("^((?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])|(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[^a-zA-Z0-9])|(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[^a-zA-Z0-9])|(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^a-zA-Z0-9])).{8,}$", ErrorMessage = "Passwords must be have at least 8 characters and contain 3 of 4 of the following: upper case (A-Z), lower case (a-z), number (0-9) and special character (e.g. !@#$%^&*)")]
        public string? Password { get; set; }
        [Required(ErrorMessage = "State is Required")]
        public int StateId { get; set; }
        [Required(ErrorMessage = "LGA is Required")]
        public int LgaId { get; set; }
    }
}
