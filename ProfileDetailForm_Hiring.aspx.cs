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
    public partial class ProfileDetailForm_Hiring : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        SqlConnection ConStr = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            { Response.Redirect("Attrition_HiringLogin.aspx"); }
            else
            {
                if (!IsPostBack)
                {
                    bind_data();

                }
            }
        }

        public void bind_data()
        {
            SqlCommand cmd = new SqlCommand("Select * from [dbo].[EmployeeDatabase] where HP_EmployeeID=@HP_EmployeeID", ConStr);
            cmd.Parameters.AddWithValue("@HP_EmployeeID", Request.QueryString["case"].ToString());
            cmd.Connection = ConStr;
            ConStr.Open();
            SqlDataAdapter daa = new SqlDataAdapter(cmd);

            DataTable dtt = new DataTable();
            daa.Fill(dtt);

            tbId0.Text = dtt.Rows[0]["DateOfSubmission"].ToString();
            tbId0.ReadOnly = true;

            tbId1.Text = dtt.Rows[0]["DOJ"].ToString();
            tbId1.ReadOnly = true;

            tbId2.Text = dtt.Rows[0]["HP_Mail"].ToString();
            tbId2.ReadOnly = true;

            tbId3.Text = dtt.Rows[0]["HP_EmployeeID"].ToString();
            tbId3.ReadOnly = true;

            tbId4.Text = dtt.Rows[0]["EmployeeName"].ToString();
            tbId4.ReadOnly = true;

            tbGender.Text = dtt.Rows[0]["Gender"].ToString();
            tbGender.ReadOnly = true;

            tbId5.Text = dtt.Rows[0]["DOB"].ToString();
            tbId5.ReadOnly = true;

            tbId6.Text = dtt.Rows[0]["ContactNumber"].ToString();

            tbId7.Text = dtt.Rows[0]["EmergencyContactNumber"].ToString();
            tbId7.ReadOnly = true;

            tbId8.Text = dtt.Rows[0]["PersonalMailID"].ToString();
            tbId8.ReadOnly = true;

            tbId9.Text = dtt.Rows[0]["ResidentialAddress_PostalCode"].ToString();

            tbId10.Text = dtt.Rows[0]["City"].ToString();
            tbId10.ReadOnly = true;

            tbState.Text = dtt.Rows[0]["State"].ToString();
            tbState.ReadOnly = true;

            tbId11.Text = dtt.Rows[0]["ResidentialAddress_Link_LnL"].ToString();
            tbId11.ReadOnly = true;

            tbId12.Text = dtt.Rows[0]["ParmanentAddress_PostalCode"].ToString();
            tbId12.ReadOnly = true;

            tbVendor.Text = dtt.Rows[0]["Vendor"].ToString();
            tbVendor.ReadOnly = true;

            tbEduStat.Text = dtt.Rows[0]["EducationStatus"].ToString();
            tbEduStat.ReadOnly = true;

            tbCertmark.Text = dtt.Rows[0]["Certificates_Marksheet"].ToString();
            tbCertmark.ReadOnly = true;

            tbHighQual.Text = dtt.Rows[0]["HighestQualification"].ToString();
            tbHighQual.ReadOnly = true;

            tbId13.Text = dtt.Rows[0]["CollegeName"].ToString();
            tbId13.ReadOnly = true;

            tbId14.Text = dtt.Rows[0]["WorkExperience"].ToString();
            tbId14.ReadOnly = true;

            tbId15.Text = dtt.Rows[0]["Designation"].ToString();
            tbId15.ReadOnly = true;

            tbExpCert.Text = dtt.Rows[0]["ExperienceCertificates"].ToString();
            tbExpCert.ReadOnly = true;

            tbId16.Text = dtt.Rows[0]["LastOrg"].ToString();
            tbId16.ReadOnly = true;

            tbMarket.Text = dtt.Rows[0]["Market"].ToString();
            tbMarket.ReadOnly = true;

            tbBU.Text = dtt.Rows[0]["BU"].ToString();
            tbBU.ReadOnly = true;

            tbRole.Text = dtt.Rows[0]["Role"].ToString();
            tbRole.ReadOnly = true;

            tbProcess.Text = dtt.Rows[0]["Process"].ToString();
            tbProcess.ReadOnly = true;

            tbSSTrainers.Text = dtt.Rows[0]["SSTrainer"].ToString();
            tbSSTrainers.ReadOnly = true;

            tbTechTrainers.Text = dtt.Rows[0]["TechTrainer"].ToString();
            tbTechTrainers.ReadOnly = true;

            tbId20.Text = dtt.Rows[0]["BatchNo"].ToString();
            tbId20.ReadOnly = true;

            tbMgr.Text = dtt.Rows[0]["ManagerName"].ToString();
            tbMgr.ReadOnly = true;

            tbId21.Text = dtt.Rows[0]["ManagerMail"].ToString();
            tbId21.ReadOnly = true;

            tbGovtID.Text = dtt.Rows[0]["GovtID_Details"].ToString();
            tbGovtID.ReadOnly = true;
            
            ConStr.Close();

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ConStr.Open();
            SqlCommand cmd1 = new SqlCommand("Update [dbo].[EmployeeDatabase] SET [JobLevel]=@JobLevel where HP_EmployeeID=@HP_EmployeeID", ConStr);
            cmd1.Parameters.AddWithValue("@JobLevel", ddJobLevel.SelectedItem.Text);
            cmd1.Parameters.AddWithValue("@HP_EmployeeID", Request.QueryString["case"].ToString());
            cmd1.ExecuteNonQuery();
            ConStr.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Details updated');", true);
        }

        
    }
}