using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UniversityApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void departmentButton_Click(object sender, EventArgs e)
        {
            DepartmentEntryUI aDepartmentEntryUI = new DepartmentEntryUI();
            aDepartmentEntryUI.Show();
        }

        private void studentButton_Click(object sender, EventArgs e)
        {
            StudentEntryUI aStudentEntryUI = new StudentEntryUI();
            aStudentEntryUI.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            CourseEntryUI aCourseEntryUI = new CourseEntryUI();
            aCourseEntryUI.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            CourseEnrollmentUI aCourseEnrollmentUI = new CourseEnrollmentUI();
            aCourseEnrollmentUI.Show();
        }
    }
}
