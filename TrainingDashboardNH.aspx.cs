using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.Net.Mail;
using System.IO;

namespace Audit_Legends
{
    public partial class TrainingDashboardNH : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                string CS = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
                using (SqlConnection Cn = new SqlConnection(CS)) ;
                {
                    SqlCommand qcmd = new SqlCommand("select distinct(Batch_No) from NewHireForm", Conn);
                    Conn.Open();
                    dd_batchno.DataSource = qcmd.ExecuteReader();
                    dd_batchno.DataBind();
                    dd_batchno.Items.Insert(0, new ListItem("--Choose Batch No--", ""));
                }
                
                bind_data();

            }
        }

        public void bind_data()
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
                lblUserDetails.Text = "Hello " + emp_name;
                Conn.Close();

                SqlDataSource SqlDataSource1 = new SqlDataSource();
                SqlDataSource1.ID = "SqlDataSource1";
                this.Page.Controls.Add(SqlDataSource1);
                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
                SqlDataSource1.SelectCommand = "select Batch_No,EmployeeID,EmployeeName,Training_Count,SSTrainer,TechTrainer,TrainingStartDate,TrainingEndDate,ComBaselineScores,TechBaselineScores,TG1,TG2,TG3,PoshTraining,PCI_Compliance,GlobalTrade,CW_CodeOfConduct FROM [dbo].[NewHireForm] where Batch_No='" + dd_batchno.SelectedItem.Text + "' order by Training_Count desc";
                UserGrid.DataSource = SqlDataSource1;
                UserGrid.DataBind();
            }

        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            UserGrid.PageIndex = e.NewPageIndex;
            bind_data();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            Label count = (Label)row.FindControl("count");
            string T_Count = count.Text;
            Response.Redirect("TrainingSheetNH.aspx?case=" + T_Count);

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("TrainerLogin.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {

                SqlCommand cmd = new SqlCommand("Select EmployeeFullName,EmployeeEmailID,ReportingManager from tblHeadCount where EmployeeEmailID=@EmployeeEmailID", Conn);
                cmd.Parameters.AddWithValue("@EmployeeEmailID", Session["Username"]);
                cmd.Connection = Conn;
                Conn.Open();
                SqlDataAdapter daa = new SqlDataAdapter(cmd);

                DataTable dtt = new DataTable();
                daa.Fill(dtt);
                string emp_name = dtt.Rows[0]["EmployeeFullName"].ToString();
                string emp_mail = dtt.Rows[0]["EmployeeEmailID"].ToString();
                lblUserDetails.Text = "Hello " + emp_name;
                Conn.Close();

                SqlDataSource SqlDataSource1 = new SqlDataSource();
                SqlDataSource1.ID = "SqlDataSource1";
                this.Page.Controls.Add(SqlDataSource1);
                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CString"].ConnectionString;
                SqlDataSource1.SelectCommand = "select Batch_No,EmployeeID,EmployeeName,Training_Count,SSTrainer,TechTrainer,TrainingStartDate,TrainingEndDate,ComBaselineScores,TechBaselineScores,TG1,TG2,TG3,PoshTraining,PCI_Compliance,GlobalTrade,CW_CodeOfConduct FROM [dbo].[NewHireForm] where Batch_No='" + searchbar.Text + "'order by Training_Count desc";
                UserGrid.DataSource = SqlDataSource1;
                UserGrid.DataBind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Batch Number invalid!!');", true);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrainingType1.aspx");
        }

        protected void btnBind_Click(object sender, EventArgs e)
        {
            bind_data();
        }
    }
}