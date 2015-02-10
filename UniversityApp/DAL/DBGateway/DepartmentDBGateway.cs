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
    public class DepartmentDBGateway : DBConnection
    {
      
        public void Save(Department aDepartment)
        {
            string query = "INSERT INTO t_Department VALUES ('" + aDepartment.deptCode + "','" + aDepartment.deptTitle + "')";
            aSqlConnection.Open();
            aSqlCommand = new SqlCommand(query, aSqlConnection);
            aSqlCommand.ExecuteNonQuery();
            aSqlConnection.Close();
        }
        public Department Find(string code)
        {
            string query = "SELECT * FROM t_Department WHERE dept_code = '" + code + "'";
            aSqlConnection.Open();
            aSqlCommand = new SqlCommand(query, aSqlConnection);
            SqlDataReader aDataReader = aSqlCommand.ExecuteReader();
            Department aDepartment;

            if (aDataReader.HasRows)
            {
                aDepartment = new Department();
                aDataReader.Read();
                aDepartment.id = Convert.ToInt32(aDataReader["id"]);
                aDepartment.deptCode = aDataReader["dept_code"].ToString();
                aDepartment.deptTitle = aDataReader["dept_Title"].ToString();
                aDataReader.Close();
                aSqlConnection.Close();
                return aDepartment;
            }
            else
            {
                aSqlConnection.Close();
                return null;
            }
        }


        public List<Department> GetDepartments()
        {
            string query = "SELECT * FROM t_Department ";
            aSqlConnection.Open();
            aSqlCommand = new SqlCommand(query, aSqlConnection);
            SqlDataReader aDataReader = aSqlCommand.ExecuteReader();
            Department aDepartment;
            List<Department> departments = new List<Department>();
            while (aDataReader.Read())
            {
                aDepartment = new Department();
                
                aDepartment.id = Convert.ToInt32(aDataReader["id"]);
                aDepartment.deptCode = aDataReader["dept_code"].ToString();
                aDepartment.deptTitle = aDataReader["dept_Title"].ToString();
               departments.Add(aDepartment);
            }
            aDataReader.Close();
            aSqlConnection.Close();
            return departments;
        }
    }
}
