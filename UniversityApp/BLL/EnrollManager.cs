using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UniversityApp.DAL.DAO;
using UniversityApp.DAL.DBGateway;

namespace UniversityApp.BLL
{
    public class EnrollManager : DBGateway
    {
        public StudentDepartmentView EnrollStudent(Student aStudent)
        {
            return aEnrollDBGateway.EnrollStudent(aStudent);
            
        }

     
        public string Save(Enroll aEnroll)
        {
            int numberOfCourseTaken = aEnrollDBGateway.GetNumberOfCourseTaken(aEnroll);
            if (numberOfCourseTaken < 3)
            {
                aEnrollDBGateway.Save(aEnroll);
                return "Enroll complete successfully";
            }
            else
            {
                return "Student can't take more then 3 course";
            }
        }
    }
}
