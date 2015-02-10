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
    public class StudentDBGateway : DBConnection
    {
       
        public void Save(Student aStudent)
        {
            string query = "INSERT INTO t_Student VALUES ('" + aStudent.stdName + "','" + aStudent.contact + "','" + aStudent.regNo + "','" + aStudent.email + "','" + aStudent.address + "','" + aStudent.deptId + "')";
            aSqlConnection.Open();
            aSqlCommand = new SqlCommand(query, aSqlConnection);
            aSqlCommand.ExecuteNonQuery();
            aSqlConnection.Close();
        }
        public Student FindRegNo(string regNo)
        {
            string query = "SELECT * FROM t_Student WHERE reg_no = '" + regNo + "'";
            aSqlConnection.Open();
            aSqlCommand = new SqlCommand(query, aSqlConnection);
            SqlDataReader aDataReader = aSqlCommand.ExecuteReader();
            Student aStudent;

            if (aDataReader.HasRows)
            {
                aStudent = new Student();
                aDataReader.Read();
                aStudent.id = Convert.ToInt32(aDataReader["id"]);
                aStudent.stdName = aDataReader["std_name"].ToString();
                aStudent.contact = aDataReader["contact"].ToString();
                aStudent.regNo = aDataReader["reg_no"].ToString(); 
                aStudent.email = aDataReader["email"].ToString();
                aStudent.address = aDataReader["address"].ToString();
                aStudent.deptId = Convert.ToInt32(aDataReader["dept_id"]);
                aDataReader.Close();
                aSqlConnection.Close();
                return aStudent;
            }
            else
            {
                aSqlConnection.Close();
                return null;
            }
        }
        public Student FindEmail(string email)
        {
            string query = "SELECT * FROM t_Student WHERE email = '" + email + "'";
            aSqlConnection.Open();
            aSqlCommand = new SqlCommand(query, aSqlConnection);
            SqlDataReader aDataReader = aSqlCommand.ExecuteReader();
            Student aStudent;

            if (aDataReader.HasRows)
            {
                aStudent = new Student();
                aDataReader.Read();
                aStudent.id = Convert.ToInt32(aDataReader["id"]);
                aStudent.stdName = aDataReader["std_name"].ToString();
                aStudent.contact = aDataReader["contact"].ToString();
                aStudent.regNo = aDataReader["reg_no"].ToString();
                aStudent.email = aDataReader["email"].ToString();
                aStudent.address = aDataReader["address"].ToString();
                aStudent.deptId = Convert.ToInt32(aDataReader["dept_id"]);
                aDataReader.Close();
                aSqlConnection.Close();
                return aStudent;
            }
            else
            {
                aSqlConnection.Close();
                return null;
            }
        }
        public List<Student> GetStudents()
        {
            string query = "SELECT * FROM t_Student";
            aSqlConnection.Open();
            aSqlCommand = new SqlCommand(query, aSqlConnection);
            SqlDataReader aDataReader = aSqlCommand.ExecuteReader();
            List<Student> students = new List<Student>();
            Student aStudent;
            while (aDataReader.Read())
            {
                aStudent = new Student();
                aStudent.id = Convert.ToInt32(aDataReader["id"]);
                aStudent.stdName = aDataReader["std_name"].ToString();
                aStudent.contact = aDataReader["contact"].ToString();
                aStudent.regNo = aDataReader["reg_no"].ToString();
                aStudent.email = aDataReader["email"].ToString();
                aStudent.address = aDataReader["address"].ToString();
                aStudent.deptId = Convert.ToInt32(aDataReader["dept_id"]);
               students.Add(aStudent);
            }
          aDataReader.Close();
          aSqlConnection.Close();
          return students;
        }
    }
}
