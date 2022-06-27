using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.EFCore.AppDbContext
{
    public class CustomerDbContext : DbContext
    {
        public CustomerDbContext()
        {
        }

        public CustomerDbContext(DbContextOptions<CustomerDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Customers>? Customers { get; set; }
        public virtual DbSet<State>? State { get; set; }
        public virtual DbSet<Lga>? Lga { get; set; }
        public virtual DbSet<OtpGenerated>? OtpGenerated { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
        }
    }
}
