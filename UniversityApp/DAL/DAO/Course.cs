using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UniversityApp.DAL.DAO
{
    public class Course
    {
        public int id { set; get; }
        public string courseCode { set; get; }
        public string courseTitle { set; get; }
        public int credit { set; get; }
        public int deptId { set; get; }
    }
}
