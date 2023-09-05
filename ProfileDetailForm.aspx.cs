using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Net.Mail;
using System.Net;
using System.Text;

namespace Audit_Legends
{
    public partial class ProfileDetailForm : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
        StringBuilder table = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            var dateAsString = DateTime.Now.ToString("MM/dd/yyyy");
            tbId0.Text = dateAsString;
            //Loading ManagerName Dropdown
            if (!IsPostBack)
            {
                SqlCommand cmd1 = new SqlCommand("Select * from [dbo].[DataTable]", Con);
                cmd1.Connection = Con;
                Con.Open();
                SqlDataAdapter adpt = new SqlDataAdapter(cmd1);
                DataTable dt = new DataTable();
                adpt.Fill(dt);
                ddMgr.DataSource = dt;
                //ddMgr.DataBind();
                ddMgr.DataTextField = "ReportingManager";
                ddMgr.DataValueField = "SlNum";
                ddMgr.DataBind();
                Con.Close();

                ddMgr.Items.Insert(0, new ListItem("---Choose---", "-1"));
            }
            

        }

        protected void TextBox13_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Submit_Button(object sender, EventArgs args)
        {
            

            Con.Open();
            SqlCommand cmd = Con.CreateCommand();

            string CommandText = "INSERT INTO [dbo].[EmployeeDatabase](DateOfSubmission,DOJ,HP_Mail,HP_EmployeeID,EmployeeName,Gender,DOB,ContactNumber,EmergencyContactNumber,PersonalMailID,ResidentialAddress_PostalCode,City,State,ResidentialAddress_Link_LnL,ParmanentAddress_PostalCode,Vendor,EducationStatus,Certificates_Marksheet,HighestQualification,CollegeName,WorkExperience,Designation,ExperienceCertificates,LastOrg,Market,BU,Role,Process,SSTrainer,TechTrainer,BatchNo,ManagerName,ManagerMail,GovtID_Details) values " +
                "(@DateOfSubmission,@DOJ,@HP_Mail,@HP_EmployeeID,@EmployeeName,@Gender,@DOB,@ContactNumber,@EmergencyContactNumber,@PersonalMailID,@ResidentialAddress_PostalCode,@City,@State,@ResidentialAddress_Link_LnL,@ParmanentAddress_PostalCode,@Vendor,@EducationStatus,@Certificates_Marksheet,@HighestQualification,@CollegeName,@WorkExperience,@Designation,@ExperienceCertificates,@LastOrg,@Market,@BU,@Role,@Process,@SSTrainer,@TechTrainer,@BatchNo,@ManagerName,@ManagerMail,@GovtID_Details)";
            cmd = new SqlCommand(CommandText, Con);
            cmd.Parameters.AddWithValue("@DateOfSubmission", tbId0.Text);
            cmd.Parameters.AddWithValue("@DOJ", tbId1.Text);
            cmd.Parameters.AddWithValue("@HP_Mail", tbId2.Text);
            cmd.Parameters.AddWithValue("@HP_EmployeeID", tbId3.Text);
            //cmd.Parameters.AddWithValue("@JobLevel", ddJobLevel.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@EmployeeName", tbId4.Text);
            cmd.Parameters.AddWithValue("@Gender", ddGender.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@DOB", tbId5.Text);
            cmd.Parameters.AddWithValue("@ContactNumber", tbId6.Text);
            cmd.Parameters.AddWithValue("@EmergencyContactNumber", tbId7.Text);
            cmd.Parameters.AddWithValue("@PersonalMailID", tbId8.Text);
            cmd.Parameters.AddWithValue("@ResidentialAddress_PostalCode", tbId9.Text);
            cmd.Parameters.AddWithValue("@City", tbId10.Text);
            cmd.Parameters.AddWithValue("@State", ddState.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ResidentialAddress_Link_LnL", tbId11.Text);
            cmd.Parameters.AddWithValue("@ParmanentAddress_PostalCode", tbId12.Text);
            cmd.Parameters.AddWithValue("@Vendor", ddVendor.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@EducationStatus", ddEduStat.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Certificates_Marksheet", ddCertMark.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@HighestQualification", ddHighQual.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CollegeName", tbId13.Text);
            cmd.Parameters.AddWithValue("@WorkExperience", tbId14.Text);
            cmd.Parameters.AddWithValue("@Designation", tbId15.Text);
            cmd.Parameters.AddWithValue("@ExperienceCertificates", ddExpCert.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@LastOrg", tbId16.Text);
            cmd.Parameters.AddWithValue("@Market", ddMarket.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@BU", ddBU.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Role", ddRole.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Process", ddProcess.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SSTrainer", ddSSTrainers.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@TechTrainer", ddTechTrainers.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@BatchNo", tbId20.Text);
            cmd.Parameters.AddWithValue("@ManagerName", ddMgr.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ManagerMail", tbId21.Text);
            string govtid="";
            for (int i = 0; i < cbGovtID.Items.Count - 1; i++)
            {
                if (cbGovtID.Items[i].Selected)//changed 1 to i 
                    govtid += cbGovtID.Items[i].Text.ToString() + ","; //changed 1 to i
            }
            cmd.Parameters.AddWithValue("@GovtID_Details", govtid);
            SqlDataReader dr = cmd.ExecuteReader();
            Con.Close();
            //maildetails();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Profile Created Successfully');window.location ='ProfileDetailForm.aspx';", true);
        }

        protected void btnEmpIDCheck_Click(object sender, EventArgs e)
        {
            Con.Open();
            SqlCommand cmd = new SqlCommand("select * from [dbo].[EmployeeDatabase] where HP_EmployeeID=@HP_EmployeeID", Con);
            cmd.Parameters.AddWithValue("@HP_EmployeeID", tbId3.Text);
            cmd.Connection = Con;
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                lblEmpIDChk.Visible = true;
                lblEmpIDChk.Text = "Employee ID exists!!";
                lblEmpIDChk.ForeColor = System.Drawing.Color.Red;
                btnSubmit.Visible = false;
            }
            else
            {
                lblEmpIDChk.Visible = true;
                lblEmpIDChk.Text = "This is a new Employee ID!!";
                lblEmpIDChk.ForeColor = System.Drawing.Color.Green;
                btnSubmit.Visible = true;
            }
        }
    }
}