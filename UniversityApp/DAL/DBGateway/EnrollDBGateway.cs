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
    public class EnrollDBGateway : DBConnection
    {
        public StudentDepartmentView EnrollStudent(Student student)
        {
            string query = "SELECT t_student.std_name,t_student.email,t_department.dept_title FROM t_student JOIN t_department ON t_student.dept_id = t_department.id where reg_no = '"+ student.regNo +"' ";
            aSqlConnection.Open();
            aSqlCommand = new SqlCommand(query, aSqlConnection);
            SqlDataReader aDataReader = aSqlCommand.ExecuteReader();
            StudentDepartmentView aStudentDepartmentView;
            

            if (aDataReader.HasRows)
            {
               aStudentDepartmentView = new StudentDepartmentView();  
                aDataReader.Read();
                aStudentDepartmentView.stdName = aDataReader["std_name"].ToString();
                aStudentDepartmentView.email = aDataReader["email"].ToString();
                aStudentDepartmentView.deptTitle = aDataReader["dept_title"].ToString();
                aDataReader.Close();
                aSqlConnection.Close();
                return aStudentDepartmentView;
            }
            else
            {
                aSqlConnection.Close();
                return null;
            }
        }
        public int Save(Enroll aEnroll)
        {

            string date = aEnroll.enrollmentDate.ToString("yyyy-MM-dd HH:mm tt");
            string query = "INSERT INTO t_enrollment VALUES ('" + aEnroll.courseId + "','" + aEnroll.studentId + "','"+ date +"')";
         
            aSqlConnection.Open();
            aSqlCommand = new SqlCommand(query, aSqlConnection);
            int rowaffected = aSqlCommand.ExecuteNonQuery();
            aSqlConnection.Close();
            return rowaffected;
        }

        internal int GetNumberOfCourseTaken(Enroll aEnroll)
        {
            int numberOfCourseTaken = 0;
            string query = "SELECT COUNT(course_id) as numberOfCourseTaken FROM t_enrollment  where student_id = '"+aEnroll.studentId+"'";
            aSqlConnection.Open();
            aSqlCommand = new SqlCommand(query, aSqlConnection);
            SqlDataReader aDataReader = aSqlCommand.ExecuteReader();
            Enroll enroll;
            aDataReader.Read();
            if (aDataReader.HasRows)
            {
                numberOfCourseTaken =(int) aDataReader["numberOfCourseTaken"];
            }
            aDataReader.Close();
            aSqlConnection.Close();
            return numberOfCourseTaken;
        }
    }
}
