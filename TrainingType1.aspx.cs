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
    public partial class TrainingType1 : System.Web.UI.Page
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

            string CommandText = "INSERT INTO [dbo].[NewHireForm](TrainerName,TrainerMail,EmployeeID,EmployeeName,MgrName,SStrainer,TechTrainer,TrainingStartDate,TrainingEndDate,Batch_No,Duration,UAT_1,UAT_2,UAT_3,sNPS_0_to_30,sNPS_30_to_60,TrainerFeedback,PoshTraining,PCI_Compliance,GlobalTrade,NPS,CW_CodeOfConduct,ComBaselineScores,TechBaselineScores,TG1,TG2,TG3,Quality_Score_wk1,Quality_Score_wk2,Quality_Score_wk3,Quality_Score_wk4) values " +
            "(@TrainerName,@TrainerMail,@EmployeeID,@EmployeeName,@MgrName,@SStrainer,@TechTrainer,@TrainingStartDate,@TrainingEndDate,@Batch_No,@Duration,@UAT_1,@UAT_2,@UAT_3,@sNPS_0_to_30,@sNPS_30_to_60,@TrainerFeedback,@PoshTraining,@PCI_Compliance,@GlobalTrade,@NPS,@CW_CodeOfConduct,@ComBaselineScores,@TechBaselineScores,@TG1,@TG2,@TG3,@Quality_Score_wk1,@Quality_Score_wk2,@Quality_Score_wk3,@Quality_Score_wk4)";
            cmd = new SqlCommand(CommandText, Conn);
            cmd.Parameters.AddWithValue("@TrainerName", tbId1.Text);
            cmd.Parameters.AddWithValue("@TrainerMail", tbId1a.Text);
            cmd.Parameters.AddWithValue("@EmployeeID", tbId2.Text);
            cmd.Parameters.AddWithValue("@EmployeeName", tbId3.Text);
            cmd.Parameters.AddWithValue("@MgrName", tbId4.Text);
            cmd.Parameters.AddWithValue("@SStrainer", ddl7.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@TechTrainer", ddl8.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@TrainingStartDate", tbId7.Text);
            cmd.Parameters.AddWithValue("@TrainingEndDate", tbId8.Text);
            cmd.Parameters.AddWithValue("@Batch_No", tbId9.Text);
            cmd.Parameters.AddWithValue("@Duration", tbId10.Text);
            cmd.Parameters.AddWithValue("@UAT_1", TextBox1.Text);
            cmd.Parameters.AddWithValue("@UAT_2", TextBox2.Text);
            cmd.Parameters.AddWithValue("@UAT_3", TextBox3.Text);
            cmd.Parameters.AddWithValue("@sNPS_0_to_30", TextBox4.Text);
            cmd.Parameters.AddWithValue("@sNPS_30_to_60", TextBox5.Text);
            cmd.Parameters.AddWithValue("@TrainerFeedback", TextBox10.Text);
            cmd.Parameters.AddWithValue("@PoshTraining", ddl1.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@PCI_Compliance", ddl2.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@GlobalTrade", ddl3.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@NPS", ddl4.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CW_CodeOfConduct", ddl5.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@TopicsCovered", tbId11.Text);
            cmd.Parameters.AddWithValue("@ComBaselineScores", tbId12.Text);
            cmd.Parameters.AddWithValue("@TechBaselineScores", tbId13.Text);
            cmd.Parameters.AddWithValue("@TG1", tbId14.Text);
            cmd.Parameters.AddWithValue("@TG2", tbId15.Text);
            cmd.Parameters.AddWithValue("@TG3", tbId16.Text);
            cmd.Parameters.AddWithValue("@Quality_Score_wk1", TextBox6.Text);
            cmd.Parameters.AddWithValue("@Quality_Score_wk2", TextBox7.Text);
            cmd.Parameters.AddWithValue("@Quality_Score_wk3", TextBox8.Text);
            cmd.Parameters.AddWithValue("@Quality_Score_wk4", TextBox9.Text);


            SqlDataReader dr = cmd.ExecuteReader();
            Con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Training Details Saved Successfully');window.location ='TrainingType1.aspx';", true);
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("TrainerLogin.aspx");
        }

        protected void TrainingDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrainingDashboardNH.aspx");
        }

        protected void DataUpload_Click(object sender, EventArgs e)
        {
            Response.Redirect("DataUploadNH.aspx");
        }
    }
}