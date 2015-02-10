using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UniversityApp.DAL.DAO;

namespace UniversityApp.DAL.DBGateway
{
    public class CourseDBGateway : DBConnection
    {
       
        internal Course FindCourseCode(string code)
        {
            string query = "SELECT * FROM t_course WHERE course_code = '" + code + "'";
            aSqlConnection.Open();
            aSqlCommand = new SqlCommand(query, aSqlConnection);
            SqlDataReader aDataReader = aSqlCommand.ExecuteReader();
            Course aCourse;

            if (aDataReader.HasRows)
            {
                aCourse = new Course();
                aDataReader.Read();
                aCourse.id = Convert.ToInt32(aDataReader["id"]);
                aCourse.courseCode = aDataReader["course_code"].ToString();
                aCourse.courseTitle = aDataReader["course_title"].ToString();
                aCourse.deptId = (int)aDataReader["dept_id"];
                aDataReader.Close();
                aSqlConnection.Close();
                return aCourse;
            }
            else
            {
                aSqlConnection.Close();
                return null;
            }
        }

        public void Save(Course aCourse)
        {
            string query = "INSERT INTO t_course VALUES ('" + aCourse.courseCode + "','" + aCourse.courseTitle + "','" + aCourse.credit + "','" + aCourse.deptId + "')";
            aSqlConnection.Open();
            aSqlCommand = new SqlCommand(query, aSqlConnection);
            aSqlCommand.ExecuteNonQuery();
            aSqlConnection.Close();
        }
        public List<Course> GetAllCourses()
        {
            string query = "SELECT * FROM t_course ";
            aSqlConnection.Open();
            aSqlCommand = new SqlCommand(query, aSqlConnection);
            SqlDataReader aDataReader = aSqlCommand.ExecuteReader();
            Course aCourse;
            List<Course> courses = new List<Course>();
            while (aDataReader.Read())
            {
                aCourse = new Course();

                aCourse.id = Convert.ToInt32(aDataReader["id"]);
                aCourse.courseCode = aDataReader["course_code"].ToString();
                aCourse.courseTitle = aDataReader["course_title"].ToString();
                aCourse.deptId = (int)aDataReader["dept_id"];
                courses.Add(aCourse);
            }
            aDataReader.Close();
            aSqlConnection.Close();
            return courses;
        }
    }
}
