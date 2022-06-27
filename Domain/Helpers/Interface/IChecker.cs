using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Helpers.Interface
{
    public interface IChecker
    {
        bool checkLgaById(int lgaId);
        bool checkStateById(int stateId);
    }
}
