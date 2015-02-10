using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UniversityApp.DAL.DAO
{
    public class Enroll
    {
        public int id { set; get; }
        public int courseId { set; get; }
        public int studentId { set; get; }
        public DateTime enrollmentDate { set; get; }
      
    }
}
