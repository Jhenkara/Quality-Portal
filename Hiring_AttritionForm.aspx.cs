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
    public partial class Hiring_AttritionForm : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        SqlConnection ConStr = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            AttClassify.Enabled = false;

            if (Session["Username"] == null)
            { Response.Redirect("Attrition_ManagerLogin.aspx"); }
            else
            {
                SqlCommand cmd = new SqlCommand("Select EmployeeFullName,ReportingManager from tblHeadCount where EmployeeEmailID=@EmailAddress", Con);
                cmd.Parameters.AddWithValue("@EmailAddress", Session["Username"]);
                cmd.Connection = Con;
                Con.Open();
                SqlDataAdapter daa = new SqlDataAdapter(cmd);

                DataTable dtt = new DataTable();
                daa.Fill(dtt);
                string emp_name = dtt.Rows[0]["EmployeeFullName"].ToString();
                hfv_MgrName.Value = emp_name;
                hfv_MgrMail.Value = Convert.ToString(Session["Username"]);
                lblUserDetails.Text = "Hello " + emp_name;
                Con.Close();
            }
        }

        protected void tbId3_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select DOJ,HP_Mail,JobLevel,EmployeeName,Gender,DOB,ContactNumber,EmergencyContactNumber,PersonalMailID,ResidentialAddress_PostalCode,City,State,ManagerName,Vendor,EducationStatus from [dbo].[EmployeeDatabase] where HP_EmployeeID=@HP_EmployeeID", ConStr);
            cmd.Parameters.AddWithValue("@HP_EmployeeID", tbId3.Text.Trim());
            cmd.Connection = ConStr;
            ConStr.Open();
            SqlDataAdapter daa = new SqlDataAdapter(cmd);

            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            tbId1.Text = dtt.Rows[0]["DOJ"].ToString();
            tbId2.Text = dtt.Rows[0]["HP_Mail"].ToString();
            TextBox1.Text = dtt.Rows[0]["JobLevel"].ToString();
            tbId4.Text = dtt.Rows[0]["EmployeeName"].ToString();
            tbGender.Text = dtt.Rows[0]["Gender"].ToString();
            tbId5.Text = dtt.Rows[0]["DOB"].ToString();
            tbId6.Text = dtt.Rows[0]["ContactNumber"].ToString();
            tbId7.Text = dtt.Rows[0]["EmergencyContactNumber"].ToString();
            tbId8.Text = dtt.Rows[0]["PersonalMailID"].ToString();
            tbId9.Text = dtt.Rows[0]["ResidentialAddress_PostalCode"].ToString();
            tbId10.Text = dtt.Rows[0]["City"].ToString();
            TextBox2.Text = dtt.Rows[0]["State"].ToString();
            TextBox5.Text = dtt.Rows[0]["ManagerName"].ToString();
            TextBox3.Text = dtt.Rows[0]["Vendor"].ToString();
            TextBox4.Text = dtt.Rows[0]["EducationStatus"].ToString();
            Con.Close();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Attrition_ManagerLogin.aspx");
        }

        protected void ddAttritionType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((ddAttritionType.SelectedItem.Text == "Ops referback") || (ddAttritionType.SelectedItem.Text == "Training referback") || (ddAttritionType.SelectedItem.Text == "Contract Closure"))
            {
                AttClassify.Text = "Involuntary";
            }

            else
            {
                AttClassify.Text = "Voluntary";
            }
        }
    }
}