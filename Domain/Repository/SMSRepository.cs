using Domain.Repository.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Repository
{
    public class SMSRepository : ISMSRepository
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="customerPhoneNo"></param>
        /// <param name="smsBody"></param>
        /// <returns></returns>
        public bool SendSMSAsync(string customerPhoneNo, string smsBody)
        {
            try
            {
                //SMS service goes here!
                return true;
            }
            catch (Exception exMessage)
            {
                return false;
                throw exMessage;
            }
        }
    }
}
