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
    public partial class EditExitFormMgr : System.Web.UI.Page
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

            TextBox6.Text = dtt.Rows[0]["Region"].ToString();

            tbMgrName.Text = dtt.Rows[0]["ManagerName"].ToString();
            tbMgrName.ReadOnly = true;

            TextBox4.Text = dtt.Rows[0]["PrimaryEmployer"].ToString();

            DropDownList1.SelectedItem.Text = dtt.Rows[0]["ReasonsForLeaving"].ToString();

            tbId5.Text = dtt.Rows[0]["ReasonsForLeavingOthers"].ToString();

            TextBox5.Text = dtt.Rows[0]["AdditionalComments"].ToString();

            DropDownList11.SelectedItem.Text = dtt.Rows[0]["HighestEducation"].ToString();

            TextBox13.Text = dtt.Rows[0]["Hometown"].ToString();

            DropDownList12.SelectedItem.Text = dtt.Rows[0]["State"].ToString();

            DropDownList2.SelectedItem.Text = dtt.Rows[0]["MgrComments1"].ToString();

            TextBox10.Text = dtt.Rows[0]["MgrComments2"].ToString();

            

            Con1.Close();

        }

        protected void Submit_Button(object sender, EventArgs args)
        {


            Con1.Open();
            SqlCommand cmd = Con1.CreateCommand();

            string CommandText = "UPDATE [dbo].[tbExitInterviewForm] SET MgrComments1=@MgrComments1,MgrComments2=@MgrComments2,LWD=@LWD,ManagerSubmission='Yes' WHERE EmployeeID=@EmployeeID";
            cmd = new SqlCommand(CommandText, Con1);
            cmd.Parameters.AddWithValue("@EmployeeID", tbId1.Text);
            cmd.Parameters.AddWithValue("@MgrComments1", DropDownList2.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@MgrComments2", TextBox10.Text);
            cmd.Parameters.AddWithValue("@LWD", TextBox1.Text);

            SqlDataReader dr = cmd.ExecuteReader();
            Con1.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Response Recorded');window.location ='Exit_Mgr_Dashboard.aspx';", true);
        }
    }
}