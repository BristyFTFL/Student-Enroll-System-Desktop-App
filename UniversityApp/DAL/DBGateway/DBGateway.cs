using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UniversityApp.DAL.DBGateway
{
    public class DBGateway
    {
        public CourseDBGateway aCourseDBGateway = new CourseDBGateway();
        public DepartmentDBGateway aDepartmentDBGateway = new DepartmentDBGateway();
        public EnrollDBGateway aEnrollDBGateway = new EnrollDBGateway();
        public StudentDBGateway aStudentDBGateway = new StudentDBGateway();
    }
}
