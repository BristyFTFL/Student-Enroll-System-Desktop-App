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
    public partial class CourseEnrollmentUI : Form
    {
        StudentManager aStudentManager = new StudentManager();
        CourseManager aCourseManager = new CourseManager();
        EnrollManager aEnrollManager = new EnrollManager();
        private Enroll aEnroll;
        public CourseEnrollmentUI()
        {
            InitializeComponent();
            courseTitleComboBox.DataSource = aCourseManager.GetAllCourses();
            courseTitleComboBox.DisplayMember = "courseTitle";
            courseTitleComboBox.ValueMember = "id";
            regNoComboBox.DataSource = aStudentManager.GetStudents();
            regNoComboBox.DisplayMember = "regNo";
            regNoComboBox.ValueMember = "id";
        }

        private void enrollButton_Click(object sender, EventArgs e)
        {
            aEnroll = new Enroll();
            aEnroll.courseId = selectedCourse.id;
            aEnroll.studentId = selectedStudent.id;
            aEnroll.enrollmentDate = enrollDateTimePicker.Value;
            string msg = aEnrollManager.Save(aEnroll);
            MessageBox.Show(msg);
        }

        private Course selectedCourse;
        private StudentDepartmentView aStudentDepartmentView;
        private Student selectedStudent;
        private void courseTitleComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedCourse = (Course)courseTitleComboBox.SelectedItem;
        }

        private void regNoComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedStudent = (Student)regNoComboBox.SelectedItem;
            aStudentDepartmentView = aEnrollManager.EnrollStudent(selectedStudent);
            nameTextBox.Text = aStudentDepartmentView.stdName;
            emailTextBox.Text = aStudentDepartmentView.email;
            departmentTextBox.Text = aStudentDepartmentView.deptTitle;

        }
    }
}
