using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UniversityApp.DAL.DAO;
using UniversityApp.DAL.DBGateway;

namespace UniversityApp.BLL
{
    public class StudentManager : DBGateway
    {
        public string Save(Student aStudent)
        {
            Student foundStudent = aStudentDBGateway.FindRegNo(aStudent.regNo);
            Student foundEmail = aStudentDBGateway.FindEmail(aStudent.email);

            if (foundStudent == null)
            {
                if (foundEmail == null)
                {
                    aStudentDBGateway.Save(aStudent);
                    return "Successfully Saved";
                }
                else
                {
                    return "This Email already Exist";
                }
            }
            else
            {
                return "Student already Exist";
            }
        }

        public List<Department> GetDepartments()
        {
            return aDepartmentDBGateway.GetDepartments();
        }

        internal List<Student> GetStudents()
        {
            return aStudentDBGateway.GetStudents();
        }
    }
}
