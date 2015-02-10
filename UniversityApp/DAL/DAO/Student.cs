using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UniversityApp.DAL.DAO
{
    public class Student
    {
        public int id { set; get; }
        public string stdName { set; get; }
        public string contact { set; get; }
        public string email { set; get; }
        public string address { set; get; }
        public string regNo { set; get; }
        public int deptId { set; get; }
    }
}
