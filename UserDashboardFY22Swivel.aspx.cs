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
    public partial class UserDashboardFY22Swivel : System.Web.UI.Page
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
                Response.Redirect("AgentLogin.aspx");
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
                SqlCommand query1 = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY22SwivelDaasLegend] where Employee_Name='" + emp_name + "'", Con);
                query1.Connection = Con;
                Con.Open();
                float count = Convert.ToInt32(query1.ExecuteScalar());
                TotalAudits.Text = count.ToString();
                Con.Close();

                SqlCommand query2 = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY22SwivelDaasLegend] where Employee_Name='" + emp_name + "' and AuditResult = 'Pass'", Con);
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

                SqlCommand query3 = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY22SwivelDaasLegend] where Employee_Name='" + emp_name + "' and AuditResult = 'Fail'", Con);
                query3.Connection = Con;
                Con.Open();
                float countfail = Convert.ToInt32(query3.ExecuteScalar());
                FailedAudits.Text = countfail.ToString();
                Con.Close();

                SqlCommand query4 = new SqlCommand("SELECT ISNULL(AVG([AuditScore]),0) from [dbo].[FY22SwivelDaasLegend] where Employee_Name='" + emp_name + "'", Con);
                query4.Connection = Con;
                Con.Open();
                float avgScore = Convert.ToInt32(query4.ExecuteScalar());
                AvgAuditScore.Text = avgScore.ToString() + "%";
                Con.Close();

                SqlCommand query5 = new SqlCommand("Select Sum(TimelyAction + RightProcess + ToolUsage + RightParticulars + Behavioural1 + Behavioural2 + Behavioural3 + Behavioural4 + EmailComm1 + EmailComm2 + EmailComm3 + Callback + SetRightExpectations + Ownership1 + Ownership2 + Ownership3 + Documentation ) as TotalDefects from ( " +
                "select Employee_Name, " +
                  "sum(case when TimelyAction = 'Met' or TimelyAction = 'NA' then 0 else 1 end) as TimelyAction, " +
                  "sum(case when RightProcess = 'Met' or RightProcess = 'NA' then 0 else 1 end) as RightProcess, " +
                  "sum(case when ToolUsage = 'Met' or ToolUsage = 'NA' then 0 else 1 end) as ToolUsage, " +
                  "sum(case when RightParticulars = 'Met' or RightParticulars = 'NA' then 0 else 1 end) as RightParticulars, " +
                  "sum(case when Behavioural1 = 'Met' or Behavioural1 = 'NA' then 0 else 1 end) as Behavioural1, " +
                  "sum(case when Behavioural2 = 'Met' or Behavioural2 = 'NA' then 0 else 1 end) as Behavioural2, " +
                  "sum(case when Behavioural3 = 'Met' or Behavioural3 = 'NA' then 0 else 1 end) as Behavioural3, " +
                  "sum(case when Behavioural4 = 'Met' or Behavioural4 = 'NA' then 0 else 1 end) as Behavioural4, " +
                  "sum(case when EmailComm1 = 'Met' or EmailComm1 = 'NA' then 0 else 1 end) as EmailComm1, " +
                  "sum(case when EmailComm2 = 'Met' or EmailComm2 = 'NA' then 0 else 1 end) as EmailComm2, " +
                  "sum(case when EmailComm3 = 'Met' or EmailComm3 = 'NA' then 0 else 1 end) as EmailComm3, " +
                  "sum(case when Callback = 'Met' or Callback = 'NA' then 0 else 1 end) as Callback, " +
                  "sum(case when SetRightExpectations = 'Met' or SetRightExpectations = 'NA' then 0 else 1 end) as SetRightExpectations, " +
                  "sum(case when Ownership1 = 'Met' or Ownership1 = 'NA' then 0 else 1 end) as Ownership1, " +
                  "sum(case when Ownership2 = 'Met' or Ownership2 = 'NA' then 0 else 1 end) as Ownership2, " +
                  "sum(case when Ownership3 = 'Met' or Ownership3 = 'NA' then 0 else 1 end) as Ownership3, " +
                  "sum(case when Documentation = 'Met' or Documentation = 'NA' then 0 else 1 end) as Documentation " +
                 "from FY22SwivelDaasLegend where AuditCount > 0 group by Employee_Name) as Table1 where Employee_Name = '" + emp_name + "' group by Employee_Name", Con);
                query5.Connection = Con;
                Con.Open();
                float Defects = Convert.ToInt32(query5.ExecuteScalar());
                DefectCount.Text = Defects.ToString();
                float defectper = 0;
                if (count != 0)
                {
                    defectper = (Defects / (17 * count)) * 100;
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
                SqlDataSource1.SelectCommand = "select EmployeeID,Employee_Name,CallID_SR_ID,CallDate,EvaluationDate,QAName,AuditStatus,AuditScore FROM [dbo].[FY22SwivelDaasLegend] where Employee_Mail='" + emp_mail + "' order by AuditCount desc";
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
            Response.Redirect("AuditSheetUserFY22Swivel.aspx?case=" + cass);

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
                SqlDataSource1.SelectCommand = "select EmployeeID,Employee_Name,CallID_SR_ID,CallDate,EvaluationDate,QAName,AuditStatus,AuditScore FROM [dbo].[FY22SwivelDaasLegend] where CallID_SR_ID='" + searchbar.Text + "' order by AuditCount desc";
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
            Response.Redirect("LegendSelectAgent.aspx");
        }
    }
}