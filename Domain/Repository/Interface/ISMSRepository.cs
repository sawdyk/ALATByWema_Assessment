using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Repository.Interface
{
    public interface ISMSRepository
    {
        bool SendSMSAsync(string customerPhoneNo, string smsBody);
    }
}
