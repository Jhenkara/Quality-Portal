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
    public partial class TrainingSheetNH : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Username"] == null)
            {
                Response.Redirect("TrainerLogin.aspx");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("Select EmployeeFullName,EmployeeEmailID,ReportingManager from tblHeadCount where EmployeeEmailID=@EmployeeEmailID", Con);
                cmd.Parameters.AddWithValue("@EmployeeEmailID", Session["Username"]);
                cmd.Connection = Con;
                Con.Open();
                SqlDataAdapter daa = new SqlDataAdapter(cmd);

                DataTable dtt = new DataTable();
                daa.Fill(dtt);
                string emp_name = dtt.Rows[0]["EmployeeFullName"].ToString();
                string emp_mail = dtt.Rows[0]["EmployeeEmailID"].ToString();
                tbId1.Text = emp_name;
                tbId1.ReadOnly = true;
                tbId1a.Text = Convert.ToString(Session["Username"]);
                tbId1a.ReadOnly = true;
                lblUserDetails.Text = "Hello " + emp_name;
                Con.Close();
                if (!IsPostBack)
                {
                    bind_data();

                }
            }
        }

        protected void TrainingDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("QADashboard.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("TrainerLogin.aspx");
        }

        public void bind_data()
        {
            SqlCommand cmd = new SqlCommand("Select * from [dbo].[NewHireForm] where Training_Count=@Training_Count", Conn);
            cmd.Parameters.AddWithValue("@Training_Count", Request.QueryString["case"].ToString());
            cmd.Parameters.AddWithValue("@Username", Session["Username"]);
            cmd.Connection = Conn;
            Conn.Open();
            SqlDataAdapter daa = new SqlDataAdapter(cmd);

            DataTable dtt = new DataTable();
            daa.Fill(dtt);

            tbId2.Text = dtt.Rows[0]["EmployeeID"].ToString();

            tbId3.Text = dtt.Rows[0]["EmployeeName"].ToString();

            tbId4.Text = dtt.Rows[0]["MgrName"].ToString();

            cbl1.SelectedItem.Text = dtt.Rows[0]["SStrainer"].ToString();

            ddl8.SelectedItem.Text = dtt.Rows[0]["TechTrainer"].ToString();

            tbId7.Text = dtt.Rows[0]["TrainingStartDate"].ToString();

            tbId8.Text = dtt.Rows[0]["TrainingEndDate"].ToString();

            tbId9.Text = dtt.Rows[0]["Batch_No"].ToString();

            tbId10.Text = dtt.Rows[0]["Duration"].ToString();

            TextBox1.Text = dtt.Rows[0]["UAT_1"].ToString();

            TextBox2.Text = dtt.Rows[0]["UAT_2"].ToString();

            TextBox3.Text = dtt.Rows[0]["UAT_3"].ToString();

            TextBox4.Text = dtt.Rows[0]["sNPS_0_to_30"].ToString();

            TextBox5.Text = dtt.Rows[0]["sNPS_30_to_60"].ToString();

            TextBox10.Text = dtt.Rows[0]["TrainerFeedback"].ToString();

            ddl1.SelectedItem.Text = dtt.Rows[0]["PoshTraining"].ToString();

            ddl2.SelectedItem.Text = dtt.Rows[0]["PCI_Compliance"].ToString();

            ddl3.SelectedItem.Text = dtt.Rows[0]["GlobalTrade"].ToString();

            ddl4.SelectedItem.Text = dtt.Rows[0]["NPS"].ToString();

            ddl5.SelectedItem.Text = dtt.Rows[0]["CW_CodeOfConduct"].ToString();

            //tbId11.Text = dtt.Rows[0]["TopicsCovered"].ToString();

            tbId12.Text = dtt.Rows[0]["ComBaselineScores"].ToString();

            tbId13.Text = dtt.Rows[0]["TechBaselineScores"].ToString();

            tbId14.Text = dtt.Rows[0]["TG1"].ToString();

            tbId15.Text = dtt.Rows[0]["TG2"].ToString();

            tbId16.Text = dtt.Rows[0]["TG3"].ToString();

            TextBox6.Text = dtt.Rows[0]["Quality_Score_wk1"].ToString();

            TextBox7.Text = dtt.Rows[0]["Quality_Score_wk2"].ToString();

            TextBox8.Text = dtt.Rows[0]["Quality_Score_wk3"].ToString();

            TextBox9.Text = dtt.Rows[0]["Quality_Score_wk4"].ToString();

            Con.Close();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Conn.Open();
            SqlCommand cmd = Conn.CreateCommand();

            string CommandText = "UPDATE [dbo].[NewHireForm] SET EmployeeID=@EmployeeID,EmployeeName=@EmployeeName,MgrName=@MgrName,SSTrainer=@SSTrainer,TechTrainer=@TechTrainer,TrainingStartDate=@TrainingStartDate,TrainingEndDate=@TrainingEndDate,Batch_No=@Batch_No,Duration=@Duration,UAT_1=@UAT_1,UAT_2=@UAT_2,UAT_3=@UAT_3,sNPS_0_to_30=@sNPS_0_to_30,sNPS_30_to_60=@sNPS_30_to_60,TrainerFeedback=@TrainerFeedback,PoshTraining=@PoshTraining,PCI_Compliance=@PCI_Compliance,GlobalTrade=@GlobalTrade,NPS=@NPS,CW_CodeOfConduct=@CW_CodeOfConduct,ComBaselineScores=@ComBaselineScores,TechBaselineScores=@TechBaselineScores,TG1=@TG1,TG2=@TG2,TG3=@TG3,Quality_Score_wk1=@Quality_Score_wk1,Quality_Score_wk2=@Quality_Score_wk2,Quality_Score_wk3=@Quality_Score_wk3,Quality_Score_wk4=@Quality_Score_wk4";
            cmd = new SqlCommand(CommandText, Con);
            cmd.Parameters.AddWithValue("@EmployeeID", tbId2.Text);
            cmd.Parameters.AddWithValue("@EmployeeName", tbId3.Text);
            cmd.Parameters.AddWithValue("@MgrName", tbId4.Text);
            cmd.Parameters.AddWithValue("@SStrainer", cbl1.Text);
            cmd.Parameters.AddWithValue("@TechTrainer", ddl8.Text);
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
            Conn.Close();
            //maildetails();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Training Details Updated Successfully');window.location ='TrainingDashboard.aspx';", true);
        }

        
    }
}