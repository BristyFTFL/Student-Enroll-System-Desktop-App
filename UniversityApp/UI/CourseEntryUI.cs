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
using UniversityApp.DAL.DBGateway;

namespace UniversityApp
{
    public partial class CourseEntryUI : Form
    {
       DepartmentManager aDepartmentManager = new DepartmentManager();
        CourseManager aCourseManager = new CourseManager();
        private Course aCourse;
        private Department selectedDepartment;
        public CourseEntryUI()
        {
            InitializeComponent();
            departmentComboBox.DataSource = aDepartmentManager.GetDepartments();
            departmentComboBox.DisplayMember = "deptTitle";
            departmentComboBox.ValueMember = "id";
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void saveButton_Click(object sender, EventArgs e)
        {
            aCourse = new Course();
            aCourse.courseCode = codeTextBox.Text;
            aCourse.courseTitle = titleTextBox.Text;
            aCourse.credit = Convert.ToInt32(creditTextBox.Text);
            aCourse.deptId = selectedDepartment.id;
            string msg = aCourseManager.Save(aCourse);
            MessageBox.Show(msg);
        }

        private void departmentComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedDepartment = (Department)departmentComboBox.SelectedItem;
        }
    }
}
