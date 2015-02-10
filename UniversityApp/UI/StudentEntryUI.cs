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
    public partial class StudentEntryUI : Form
    {
        public StudentEntryUI()
        {
            InitializeComponent();
            departmentComboBox.DataSource = aDepartmentManager.GetDepartments();
            departmentComboBox.DisplayMember = "deptTitle";
            departmentComboBox.ValueMember = "id";
        }

        private Department selectedDepartment;
        DepartmentManager aDepartmentManager = new DepartmentManager();
        StudentManager aStudentManager = new StudentManager();
        Student aStudent;
        private void saveButton_Click(object sender, EventArgs e)
        {
            aStudent = new Student();
            aStudent.stdName = nameTextBox.Text;
            aStudent.contact = contactTextBox.Text;
            aStudent.regNo = regNoTextBox.Text;
            aStudent.email = emailTextBox.Text;
            aStudent.address = addressTextBox.Text;
            aStudent.deptId = selectedDepartment.id;
            string msg = aStudentManager.Save(aStudent);
            MessageBox.Show(msg);

        }

        private void departmentComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedDepartment = (Department)departmentComboBox.SelectedItem;
        }
    }
}
