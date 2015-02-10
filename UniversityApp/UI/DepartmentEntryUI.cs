using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using UniversityApp.BLL;
using UniversityApp.DAL.DAO;

namespace UniversityApp 
{

    public partial class DepartmentEntryUI : Form 
    {
        public DepartmentEntryUI() 
        {
            InitializeComponent();
        }
        Department aDepartment = new Department();
        DepartmentManager aDepartmentManager = new DepartmentManager();
        private void saveButton_Click(object sender, EventArgs e)
        {
            aDepartment.deptCode = departmentCodeTextBox.Text;
            aDepartment.deptTitle = departmentTitleTextBox.Text;
            string msg = aDepartmentManager.Save(aDepartment);
            MessageBox.Show(msg);
        }
    }

   
}
