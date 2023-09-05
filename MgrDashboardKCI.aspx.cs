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
    public partial class MgrDashboardKCI : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                bind_data();

            }
        }

        public void bind_data()
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("MgrLogin.aspx");
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
                Con.Close();

                //Dashboard Details Calculations
                SqlCommand query1 = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY22KCI2Legend] where Reporting_Manager='" + emp_name + "'", Con);
                query1.Connection = Con;
                Con.Open();
                float count = Convert.ToInt32(query1.ExecuteScalar());
                TotalAudits.Text = count.ToString();
                Con.Close();

                SqlCommand query2 = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY22KCI2Legend] where Reporting_Manager='" + emp_name + "' and AuditResult = 'Pass'", Con);
                query2.Connection = Con;
                Con.Open();
                float countpass = Convert.ToInt32(query2.ExecuteScalar());
                float passper = 0;
                if (count != 0)
                {
                    passper = Convert.ToInt32((countpass / count) * 100);
                }
                else
                {
                    passper = 0;
                }

                PassPer.Text = passper.ToString() + "%";
                PassedAudits.Text = countpass.ToString();
                Con.Close();

                SqlCommand query3 = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY22KCI2Legend] where Reporting_Manager='" + emp_name + "' and AuditResult = 'Fail'", Con);
                query3.Connection = Con;
                Con.Open();
                float countfail = Convert.ToInt32(query3.ExecuteScalar());
                FailedAudits.Text = countfail.ToString();
                Con.Close();

                SqlCommand query4 = new SqlCommand("SELECT ISNULL(AVG([AuditScore]),0) from [dbo].[FY22KCI2Legend] where Reporting_Manager='" + emp_name + "'", Con);
                query4.Connection = Con;
                Con.Open();
                float avgScore = Convert.ToInt32(query4.ExecuteScalar());
                AvgAuditScore.Text = avgScore.ToString() + "%";
                Con.Close();

                SqlCommand query5 = new SqlCommand("Select Sum(CallOpening1 + CallOpening2 + ToolUsage1 + ToolUsage2 + ToolUsage3 + CallLogging + Res_Info + Comm_Behaviour1 + Comm_Behaviour2 + Comm_Behaviour3 + Comm_Behaviour4 + Comm_Behaviour5 + Comm_Behaviour6 + Comm_Behaviour7 + Comm_Behaviour8 + Comm_Behaviour9 + RDT + Time_Management + WOW_DAB + Ownership + Closing ) as TotalDefects from ( " +
                "select Reporting_Manager, " +
                  "sum(case when CallOpening1 = 'Met' or CallOpening1 = 'NA' then 0 else 1 end) as CallOpening1, " +
                  "sum(case when CallOpening2 = 'Met' or CallOpening2 = 'NA' then 0 else 1 end) as CallOpening2, " +
                  "sum(case when ToolUsage1 = 'Met' or ToolUsage1 = 'NA' then 0 else 1 end) as ToolUsage1, " +
                  "sum(case when ToolUsage2 = 'Met' or ToolUsage2 = 'NA' then 0 else 1 end) as ToolUsage2, " +
                  "sum(case when ToolUsage3 = 'Met' or ToolUsage3 = 'NA' then 0 else 1 end) as ToolUsage3, " +
                  "sum(case when CallLogging = 'Met' or CallLogging = 'NA' then 0 else 1 end) as CallLogging, " +
                  "sum(case when Res_Info = 'Met' then 0 else 1 end) as Res_Info, " +
                  "sum(case when Comm_Behaviour1 = 'Met' or Comm_Behaviour1 = 'NA' then 0 else 1 end) as Comm_Behaviour1, " +
                  "sum(case when Comm_Behaviour2 = 'Met' or Comm_Behaviour2 = 'NA' then 0 else 1 end) as Comm_Behaviour2, " +
                  "sum(case when Comm_Behaviour3 = 'Met' or Comm_Behaviour3 = 'NA' then 0 else 1 end) as Comm_Behaviour3, " +
                  "sum(case when Comm_Behaviour4 = 'Met' or Comm_Behaviour4 = 'NA' then 0 else 1 end) as Comm_Behaviour4, " +
                  "sum(case when Comm_Behaviour5 = 'Met' or Comm_Behaviour5 = 'NA' then 0 else 1 end) as Comm_Behaviour5, " +
                  "sum(case when Comm_Behaviour6 = 'Met' or Comm_Behaviour6 = 'NA' then 0 else 1 end) as Comm_Behaviour6, " +
                  "sum(case when Comm_Behaviour7 = 'Met' or Comm_Behaviour7 = 'NA' then 0 else 1 end) as Comm_Behaviour7, " +
                  "sum(case when Comm_Behaviour8 = 'Met' or Comm_Behaviour8 = 'NA' then 0 else 1 end) as Comm_Behaviour8, " +
                  "sum(case when Comm_Behaviour9 = 'Met' or Comm_Behaviour9 = 'NA' then 0 else 1 end) as Comm_Behaviour9, " +
                  "sum(case when RDT = 'Met' or RDT = 'NA' then 0 else 1 end) as RDT, " +
                  "sum(case when Time_Management = 'Met' then 0 else 1 end) as Time_Management, " +
                  "sum(case when WOW_DAB = 'Met' or WOW_DAB = 'NA' then 0 else 1 end) as WOW_DAB, " +
                  "sum(case when Ownership = 'Met' or Ownership = 'NA' then 0 else 1 end) as Ownership, " +
                  "sum(case when Closing = 'Met' or Closing = 'NA' then 0 else 1 end) as Closing " +
                 "from FY22KCI2Legend where AuditCount > 0 group by Reporting_Manager) as Table1 where Reporting_Manager = '" + emp_name + "' group by Reporting_Manager", Con);
                query5.Connection = Con;
                Con.Open();
                float Defects = Convert.ToInt32(query5.ExecuteScalar());
                DefectCount.Text = Defects.ToString();
                float defectper = 0;
                if (count != 0)
                {
                    defectper = (Defects / (21 * count)) * 100;
                }
                else
                {
                    defectper = 0;
                }
                DefectPer.Text = Math.Round(defectper, 2).ToString() + "%";
                Con.Close();
                //End of Dashboard details

                SqlDataSource SqlDataSource1 = new SqlDataSource();
                SqlDataSource1.ID = "SqlDataSource1";
                this.Page.Controls.Add(SqlDataSource1);
                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CString"].ConnectionString;
                SqlDataSource1.SelectCommand = "select EmployeeID,Employee_Name,CallID_SR_ID,CallDate,EvaluationDate,QAName,AuditStatus,AuditScore FROM [dbo].[FY22KCI2Legend] where Reporting_Manager_Mail='" + emp_mail + "' or TLMail='" + emp_mail + "' order by AuditCount desc";
                UserGrid.DataSource = SqlDataSource1;
                UserGrid.DataBind();
            }

        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            UserGrid.PageIndex = e.NewPageIndex;
            bind_data();
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            Label caseid = (Label)row.FindControl("lblcase");
            string cass = caseid.Text;
            Response.Redirect("AuditSheetMgrFY22KCI.aspx?case=" + cass);

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("AgentLogin.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
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
                Con.Close();

                SqlDataSource SqlDataSource1 = new SqlDataSource();
                SqlDataSource1.ID = "SqlDataSource1";
                this.Page.Controls.Add(SqlDataSource1);
                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CString"].ConnectionString;
                SqlDataSource1.SelectCommand = "select EmployeeID,Employee_Name,CallID_SR_ID,CallDate,EvaluationDate,QAName,AuditStatus,AuditScore FROM [dbo].[FY22KCI2Legend] where CallID_SR_ID='" + searchbar.Text + "' AND Reporting_Manager_Mail='" + emp_mail + "' or TLMail='" + emp_mail + "' order by AuditCount desc";
                UserGrid.DataSource = SqlDataSource1;
                UserGrid.DataBind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Enter a Valid Call ID');", true);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("LegendSelectMgr.aspx");
        }
    }
}