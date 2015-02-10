using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UniversityApp.DAL.DAO;
using UniversityApp.DAL.DBGateway;

namespace UniversityApp.BLL
{
    public class DepartmentManager : DBGateway
    {
     
        public string Save(Department aDepartment)
        {
            Department founDepartment = aDepartmentDBGateway.Find(aDepartment.deptCode);
            if (founDepartment == null)
            {
                aDepartmentDBGateway.Save(aDepartment);
                return "Successfully Saved";
            }
            else
            {
                return "Department already Exist";
            }
        }


        public List<Department> GetDepartments()
        {
            return aDepartmentDBGateway.GetDepartments();
        }
    }
}
