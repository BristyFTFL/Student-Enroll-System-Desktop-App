using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UniversityApp.BLL
{
    public class Manager
    {
       public CourseManager aCourseManager = new CourseManager();
       public DepartmentManager aDepartmentManager = new DepartmentManager();
        public EnrollManager aEnrollManager = new EnrollManager();
        public StudentManager aStudentManager = new StudentManager();
    }
}
