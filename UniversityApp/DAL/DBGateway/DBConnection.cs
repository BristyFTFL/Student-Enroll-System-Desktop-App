using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UniversityApp.DAL.DBGateway
{
    public class DBConnection
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ToString();
        public SqlConnection aSqlConnection;
        public SqlCommand aSqlCommand;
       
        
        public DBConnection()
        {
            aSqlConnection = new SqlConnection(connectionString);
          
        }

        
           
      
    }
}
