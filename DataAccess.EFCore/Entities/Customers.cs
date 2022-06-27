using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entities
{
    public class Customers
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string? PhoneNumber { get; set; }
        public string? EmailAddress { get; set; }
        public string? Salt { get; set; }
        public string? PasswordHash { get; set; }
        public int StateId { get; set; }
        public int LgaId { get; set; }
        public bool isVerified { get; set; }
        public DateTime? DateVerified{ get; set; }
        public DateTime? DateCreated { get; set; }

        [ForeignKey("StateId")]
        public virtual State? State { get; set; }

        [ForeignKey("LgaId")]
        public virtual Lga? Lga { get; set; }
    }
}
