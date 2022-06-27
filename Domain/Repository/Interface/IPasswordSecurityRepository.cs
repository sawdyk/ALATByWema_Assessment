using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Repository.Interface
{
    public interface IPasswordSecurityRepository
    {
        string GettHash(string password);
        string GettSalt();
        string HashedPassword(string password, string salt);
    }
}
