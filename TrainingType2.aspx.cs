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
    public partial class TrainingType2 : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //var dateAsString = DateTime.Now.ToString("MM/dd/yyyy");
            //tbId5.Text = dateAsString;

            if (Session["Username"] == null)
            { Response.Redirect("TrainerLogin.aspx"); }
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
                tbId1.Text = emp_name;
                tbId1.ReadOnly = true;
                tbId1a.Text = Convert.ToString(Session["Username"]);
                tbId1a.ReadOnly = true;
                lblUserDetails.Text = "Hello " + emp_name;
                Con.Close();
            }
        }

        protected void Submit_Button(object sender, EventArgs args)
        {
            Conn.Open();
            SqlCommand cmd = Conn.CreateCommand();

            string CommandText = "INSERT INTO [dbo].[RefresherForm](TrainerName,TrainerMail,EmployeeID,EmployeeName,TrainingStartDate,TrainingEndDate,TeamName,Batch_No,Duration,ManagerName,TopicsCovered,Scores_if_any) values " +
            "(@TrainerName,@TrainerMail,@EmployeeID,@EmployeeName,@TrainingStartDate,@TrainingEndDate,@TeamName,@Batch_No,@Duration,@ManagerName,@TopicsCovered,@Scores_if_any)";
            cmd = new SqlCommand(CommandText, Conn);
            cmd.Parameters.AddWithValue("@TrainerName", tbId1.Text);
            cmd.Parameters.AddWithValue("@TrainerMail", tbId1a.Text);
            cmd.Parameters.AddWithValue("@EmployeeID", tbId2.Text);
            cmd.Parameters.AddWithValue("@EmployeeName", tbId3.Text);
            cmd.Parameters.AddWithValue("@TrainingStartDate", tbId4.Text);
            cmd.Parameters.AddWithValue("@TrainingEndDate", tbId5.Text);
            cmd.Parameters.AddWithValue("@TeamName", ddTeam.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Batch_No", tbId6.Text);
            cmd.Parameters.AddWithValue("@Duration", tbId7.Text);
            cmd.Parameters.AddWithValue("@ManagerName", tbId9.Text);
            cmd.Parameters.AddWithValue("@TopicsCovered", tbId10.Text);
            cmd.Parameters.AddWithValue("@Scores_if_any", tbId11.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            Con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Training details saved Successfully');window.location ='TrainingType2.aspx';", true);
        }

        protected void tbId2_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select EmployeeFullName,EmployeeEmailID,ReportingManager from tblHeadCount where EmployeeID=@EmployeeID", Con);
            cmd.Parameters.AddWithValue("@EmployeeID", tbId2.Text.Trim());
            cmd.Connection = Con;
            Con.Open();
            SqlDataAdapter daa = new SqlDataAdapter(cmd);

            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            string empl_name = dtt.Rows[0]["EmployeeFullName"].ToString();
            string empl_mail = dtt.Rows[0]["EmployeeEmailID"].ToString();
            string Mgr_name = dtt.Rows[0]["ReportingManager"].ToString();
            tbId3.Text = empl_name;
            tbId3.ReadOnly = true;
            tbId9.Text = Mgr_name;
            tbId9.ReadOnly = true;
            Con.Close();
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("TrainerLogin.aspx");
        }
    }
}