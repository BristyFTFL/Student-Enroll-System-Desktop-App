using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UniversityApp.DAL.DAO;
using UniversityApp.DAL.DBGateway;

namespace UniversityApp.BLL
{
    public class CourseManager : DBGateway
    {

        public string Save(Course aCourse)
        {
            Course foundCourse = aCourseDBGateway.FindCourseCode(aCourse.courseCode);
       

            if (foundCourse == null)
            {
                if (aCourse.credit > 0)
                {
                    aCourseDBGateway.Save(aCourse);
                    return "Successfully Saved";
                }
                else
                {
                    return "Credit can not be negative";
                }
            }
            else
            {
                return "Course already Exist";
            }
        }

        public List<Course> GetAllCourses()
        {
            return aCourseDBGateway.GetAllCourses();
        }
    }
}
