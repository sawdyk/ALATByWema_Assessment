using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entities
{
    public class Lga
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public int localId { get; set; }
        public int StateId { get; set; }
        public string? lgaName { get; set; }

        [ForeignKey("StateId")]
        public virtual State? State { get; set; }
    }
}
