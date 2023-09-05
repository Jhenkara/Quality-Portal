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
    public partial class EditExitForm : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        SqlConnection Con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            tbGender.Visible = false;

            if (!IsPostBack)
            {
                bind_data();

            }
        }

        protected void ddGender_SelectedIndexChanged(object sender, EventArgs e)
        {
            var value = ddGender.SelectedItem.Value;
            if (value == "2")
            {
                tbGender.Visible = true;
                tbGender.Focus();
            }
        }

        public void bind_data()
        {
            SqlCommand cmd = new SqlCommand("Select * from [dbo].[tbExitInterviewForm] where EmployeeID=@EmployeeID", Con1);
            cmd.Parameters.AddWithValue("@EmployeeID", Request.QueryString["case"].ToString());
            cmd.Connection = Con1;
            Con1.Open();
            SqlDataAdapter daa = new SqlDataAdapter(cmd);

            DataTable dtt = new DataTable();
            daa.Fill(dtt);

            tbId1.Text = dtt.Rows[0]["EmployeeID"].ToString();

            tbId1a.Text = dtt.Rows[0]["EmployeeName"].ToString();
            tbId1a.ReadOnly = true;

            TextBox3.Text = dtt.Rows[0]["PhoneNo"].ToString();

            ddGender.SelectedItem.Text = dtt.Rows[0]["Gender"].ToString();

            tbGender.Text = dtt.Rows[0]["GenderOptions"].ToString();

            tbId2.Text = dtt.Rows[0]["DOJ"].ToString();
            tbId2.ReadOnly = true;

            tbId3.Text = dtt.Rows[0]["ResignationDate"].ToString();
            tbId3.ReadOnly = true;

            TextBox2.Text = dtt.Rows[0]["LWD"].ToString();
            TextBox2.ReadOnly = true;

            TextBox6.Text = dtt.Rows[0]["Region"].ToString();

            tbMgrName.Text = dtt.Rows[0]["ManagerName"].ToString();
            tbMgrName.ReadOnly = true;

            TextBox4.Text = dtt.Rows[0]["PrimaryEmployer"].ToString();

            DropDownList1.SelectedItem.Text = dtt.Rows[0]["ReasonsForLeaving"].ToString();

            tbId5.Text = dtt.Rows[0]["ReasonsForLeavingOthers"].ToString();

            TextBox16.Text = dtt.Rows[0]["AdditionalComments"].ToString();

            DropDownList11.SelectedItem.Text = dtt.Rows[0]["HighestEducation"].ToString();

            TextBox13.Text = dtt.Rows[0]["Hometown"].ToString();

            DropDownList12.SelectedItem.Text = dtt.Rows[0]["State"].ToString();

            DropDownList2.SelectedItem.Text = dtt.Rows[0]["AttritionType"].ToString();

            TextBox5.Text = dtt.Rows[0]["OpportunitiesNSuggestions1"].ToString();

            TextBox7.Text = dtt.Rows[0]["OpportunitiesNSuggestions2"].ToString();

            DropDownList4.SelectedItem.Text = dtt.Rows[0]["OpportunitiesNSuggestions3"].ToString();

            DropDownList3.SelectedItem.Text = dtt.Rows[0]["OpportunitiesNSuggestions4"].ToString();

            TextBox10.Text = dtt.Rows[0]["OpportunitiesNSuggestions5"].ToString();

            TextBox8.Text = dtt.Rows[0]["Comments"].ToString();

            TextBox9.Text = dtt.Rows[0]["Date"].ToString();

            DropDownList13.SelectedItem.Text = dtt.Rows[0]["MgrComments1"].ToString();

            TextBox15.Text = dtt.Rows[0]["MgrComments2"].ToString();

            DropDownList5.SelectedItem.Text = dtt.Rows[0]["ClientNParentCompany1"].ToString();

            DropDownList6.SelectedItem.Text = dtt.Rows[0]["ClientNParentCompany2"].ToString();

            DropDownList7.SelectedItem.Text = dtt.Rows[0]["ClientNParentCompany3"].ToString();

            DropDownList8.SelectedItem.Text = dtt.Rows[0]["ClientNParentCompany4"].ToString();

            DropDownList9.SelectedItem.Text = dtt.Rows[0]["ClientNParentCompany5"].ToString();

            TextBox11.Text = dtt.Rows[0]["ClientNParentCompany6"].ToString();

            DropDownList10.SelectedItem.Text = dtt.Rows[0]["NewOrganization1"].ToString();

            TextBox12.Text = dtt.Rows[0]["NewOrganization2"].ToString();

            TextBox1.Text = dtt.Rows[0]["NewOrganization3"].ToString();

            TextBox14.Text = dtt.Rows[0]["NewOrganization4"].ToString();

            Con1.Close();

        }

        protected void Submit_Button(object sender, EventArgs args)
        {
            

            Con1.Open();
            SqlCommand cmd = Con1.CreateCommand();

            string CommandText = "UPDATE [dbo].[tbExitInterviewForm] SET EmployeeID=@EmployeeID,EmployeeName=@EmployeeName,PhoneNo=@PhoneNo,Gender=@Gender,GenderOptions=@GenderOptions,Region=@Region,ManagerName=@ManagerName,PrimaryEmployer=@PrimaryEmployer,ReasonsForLeaving=@ReasonsForLeaving,ReasonsForLeavingOthers=@ReasonsForLeavingOthers,HighestEducation=@HighestEducation,Hometown=@Hometown,State=@State,OpportunitiesNSuggestions1=@OpportunitiesNSuggestions1,OpportunitiesNSuggestions2=@OpportunitiesNSuggestions2,OpportunitiesNSuggestions3=@OpportunitiesNSuggestions3,OpportunitiesNSuggestions4=@OpportunitiesNSuggestions4,OpportunitiesNSuggestions5=@OpportunitiesNSuggestions5,AttritionType=@AttritionType,Comments=@Comments,Date=@Date,ClientNParentCompany1=@ClientNParentCompany1,ClientNParentCompany2=@ClientNParentCompany2,ClientNParentCompany3=@ClientNParentCompany3,ClientNParentCompany4=@ClientNParentCompany4,ClientNParentCompany5=@ClientNParentCompany5,ClientNParentCompany6=@ClientNParentCompany6,NewOrganization1=@NewOrganization1,NewOrganization2=@NewOrganization2,NewOrganization3=@NewOrganization3,NewOrganization4=@NewOrganization4,HiringSubmission='Yes' WHERE EmployeeID=@EmployeeID";
            cmd = new SqlCommand(CommandText, Con1);
            cmd.Parameters.AddWithValue("@EmployeeID", tbId1.Text);
            cmd.Parameters.AddWithValue("@EmployeeName", tbId1a.Text);
            cmd.Parameters.AddWithValue("@PhoneNo", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Gender", ddGender.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@GenderOptions", tbGender.Text);
            cmd.Parameters.AddWithValue("@Region", TextBox6.Text);
            cmd.Parameters.AddWithValue("@ManagerName", tbMgrName.Text);
            cmd.Parameters.AddWithValue("@PrimaryEmployer", TextBox4.Text);
            cmd.Parameters.AddWithValue("@ReasonsForLeaving", DropDownList1.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ReasonsForLeavingOthers", tbId5.Text);
            cmd.Parameters.AddWithValue("@HighestEducation", DropDownList11.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Hometown", TextBox13.Text);
            cmd.Parameters.AddWithValue("@State", DropDownList12.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@OpportunitiesNSuggestions1", TextBox5.Text);
            cmd.Parameters.AddWithValue("@OpportunitiesNSuggestions2", TextBox7.Text);
            cmd.Parameters.AddWithValue("@OpportunitiesNSuggestions3", DropDownList4.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@OpportunitiesNSuggestions4", DropDownList3.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@OpportunitiesNSuggestions5", TextBox10.Text);
            cmd.Parameters.AddWithValue("@AttritionType", DropDownList2.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Comments", TextBox8.Text);
            cmd.Parameters.AddWithValue("@Date", TextBox9.Text);
            cmd.Parameters.AddWithValue("@ClientNParentCompany1", DropDownList5.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ClientNParentCompany2", DropDownList6.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ClientNParentCompany3", DropDownList7.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ClientNParentCompany4", DropDownList8.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ClientNParentCompany5", DropDownList9.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ClientNParentCompany6", TextBox11.Text);
            cmd.Parameters.AddWithValue("@NewOrganization1", DropDownList10.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@NewOrganization2", TextBox12.Text);
            cmd.Parameters.AddWithValue("@NewOrganization3", TextBox1.Text);
            cmd.Parameters.AddWithValue("@NewOrganization4", TextBox14.Text);

            SqlDataReader dr = cmd.ExecuteReader();
            Con1.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Response Recorded');window.location ='ExitInterview_Dashboard.aspx';", true);
        }
    }
}