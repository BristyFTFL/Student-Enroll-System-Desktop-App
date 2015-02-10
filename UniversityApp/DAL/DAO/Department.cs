using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UniversityApp.BLL;

namespace UniversityApp.DAL.DAO
{
    public class Department : DepartmentManager
    {
        public int id { set; get; }
        public string deptCode { set; get; }
        public string deptTitle { set; get; }
    }
}
