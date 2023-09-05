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
    public partial class QADashboardFY21SAPOSLegend : System.Web.UI.Page
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
                Response.Redirect("QALogin.aspx");
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
                SqlCommand query1 = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY21SAPOSLegend] where QAName='" + emp_name + "'", Con);
                query1.Connection = Con;
                Con.Open();
                float count = Convert.ToInt32(query1.ExecuteScalar());
                TotalAudits.Text = count.ToString();
                Con.Close();

                SqlCommand query2 = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY21SAPOSLegend] where QAName='" + emp_name + "' and AuditResult = 'Pass'", Con);
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

                SqlCommand query3 = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY21SAPOSLegend] where QAName='" + emp_name + "' and AuditResult = 'Fail'", Con);
                query3.Connection = Con;
                Con.Open();
                float countfail = Convert.ToInt32(query3.ExecuteScalar());
                FailedAudits.Text = countfail.ToString();
                Con.Close();

                SqlCommand query4 = new SqlCommand("SELECT ISNULL(AVG([AuditScore]),0) from [dbo].[FY21SAPOSLegend] where QAName='" + emp_name + "'", Con);
                query4.Connection = Con;
                Con.Open();
                float avgScore = Convert.ToInt32(query4.ExecuteScalar());
                AvgAuditScore.Text = avgScore.ToString() + "%";
                Con.Close();

                SqlCommand query5 = new SqlCommand("Select Sum(opening1 + opening2 + opening3 + opening4 +ToolUsage1 + ToolUsage2 + ToolUsage3 + ToolUsage4 + Probing + Sol_Res + Behavioural1 + Behavioural2 + Behavioural3 + Behavioural4 + Behavioural5 + Communication1 + Communication2 + Communication3 + Communication4 + CustObsdBehav1 + CustObsdBehav2 + CustObsdBehav3 + CustObsdBehav4 + CustObsdBehav5 + Time_Manage + Callback + CaseOwnership1 + CaseOwnership2 + Case_Call_Logging + Case_Call_Logging1 + Case_Call_Logging2 + Case_Call_Logging3 + Case_Call_Logging4 + Closing) as TotalDefects from ( " +
                "select QAName, " +
                  "sum(case when Opening1 = 'Met' or Opening1 = 'NA' then 0 else 1 end) as opening1, " +
                  "sum(case when Opening2 = 'Met' or Opening2 = 'NA' then 0 else 1 end) as opening2, " +
                  "sum(case when Opening3 = 'Met' or Opening3 = 'NA' then 0 else 1 end) as opening3, " +
                  "sum(case when Opening4 = 'Met' or Opening4 = 'NA' then 0 else 1 end) as opening4, " +
                  "sum(case when ToolUsage1 = 'Met' or ToolUsage1 = 'NA' then 0 else 1 end) as ToolUsage1, " +
                  "sum(case when ToolUsage2 = 'Met' or ToolUsage2 = 'NA' then 0 else 1 end) as ToolUsage2, " +
                  "sum(case when ToolUsage3 = 'Met' or ToolUsage3 = 'NA' then 0 else 1 end) as ToolUsage3, " +
                  "sum(case when ToolUsage4 = 'Met' or ToolUsage4 = 'NA' then 0 else 1 end) as ToolUsage4, " +
                  "sum(case when Probing = 'Met' or Probing = 'NA' then 0 else 1 end) as Probing, " +
                  "sum(case when Sol_Res = 'Completed' or Sol_Res = 'Pending' then 0 else 1 end) as Sol_Res, " +
                  "sum(case when Behavioural1 = 'Met' or Behavioural1 = 'NA' then 0 else 1 end) as Behavioural1, " +
                  "sum(case when Behavioural2 = 'Met' or Behavioural2 = 'NA' then 0 else 1 end) as Behavioural2, " +
                  "sum(case when Behavioural3 = 'Met' or Behavioural3 = 'NA' then 0 else 1 end) as Behavioural3, " +
                  "sum(case when Behavioural4 = 'Met' or Behavioural4 = 'NA' then 0 else 1 end) as Behavioural4, " +
                  "sum(case when Behavioural5 = 'Met' or Behavioural5 = 'NA' then 0 else 1 end) as Behavioural5, " +
                  "sum(case when Communication1 = 'Met' or Communication1 = 'NA' then 0 else 1 end) as Communication1, " +
                  "sum(case when Communication2 = 'Met' or Communication2 = 'NA' then 0 else 1 end) as Communication2, " +
                  "sum(case when Communication3 = 'Met' or Communication3 = 'NA' then 0 else 1 end) as Communication3, " +
                  "sum(case when Communication4 = 'Met' or Communication4 = 'NA' then 0 else 1 end) as Communication4, " +
                  "sum(case when CustObsdBehav1 = 'Met' or CustObsdBehav1 = 'NA' then 0 else 1 end) as CustObsdBehav1, " +
                  "sum(case when CustObsdBehav2 = 'Met' or CustObsdBehav2 = 'NA' then 0 else 1 end) as CustObsdBehav2, " +
                  "sum(case when CustObsdBehav3 = 'Met' or CustObsdBehav3 = 'NA' then 0 else 1 end) as CustObsdBehav3, " +
                  "sum(case when CustObsdBehav4 = 'Met' or CustObsdBehav4 = 'NA' then 0 else 1 end) as CustObsdBehav4, " +
                  "sum(case when CustObsdBehav5 = 'Met' or CustObsdBehav5 = 'NA' then 0 else 1 end) as CustObsdBehav5, " +
                  "sum(case when Time_Manage = 'Met' then 0 else 1 end) as Time_Manage, " +
                  "sum(case when Callback = 'Met' or Callback = 'NA' then 0 else 1 end) as Callback, " +
                  "sum(case when CaseOwnership1 = 'Met' or CaseOwnership1 = 'NA' then 0 else 1 end) as CaseOwnership1, " +
                  "sum(case when CaseOwnership2 = 'Met' or CaseOwnership2 = 'NA' then 0 else 1 end) as CaseOwnership2, " +
                  "sum(case when Case_Call_Logging = 'Met' then 0 else 1 end) as Case_Call_Logging, " +
                  "sum(case when Case_Call_Logging1 = 'Met' then 0 else 1 end) as Case_Call_Logging1, " +
                  "sum(case when Case_Call_Logging2 = 'Met' then 0 else 1 end) as Case_Call_Logging2, " +
                  "sum(case when Case_Call_Logging3 = 'Met' then 0 else 1 end) as Case_Call_Logging3, " +
                  "sum(case when Case_Call_Logging4 = 'Met' then 0 else 1 end) as Case_Call_Logging4, " +
                  "sum(case when Closing = 'Met' or Closing = 'NA' then 0 else 1 end) as Closing " +
                 "from FY21SAPOSLegend where AuditCount > 0 group by QAName) as Table1 where QAName = '" + emp_name + "' group by QAName", Con);
                query5.Connection = Con;
                Con.Open();
                float Defects = Convert.ToInt32(query5.ExecuteScalar());
                DefectCount.Text = Defects.ToString();
                float defectper = 0;
                if (count != 0)
                {
                    defectper = (Defects / (34 * count)) * 100;
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
                SqlDataSource1.SelectCommand = "select EmployeeID,Employee_Name,CaseID,CallID_SR_ID,CallDate,EvaluationDate,QAName,AuditStatus,AuditScore FROM [dbo].[FY21SAPOSLegend] where QAName='" + emp_name + "' order by AuditCount desc";
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
            Label caseid = (Label)row.FindControl("lblcase");
            string cass = caseid.Text;
            Response.Redirect("AuditSheetSAPOSQA.aspx?case=" + cass);

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("QALogin.aspx");
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
                SqlDataSource1.SelectCommand = "select EmployeeID,Employee_Name,CaseID,CallID_SR_ID,CallDate,EvaluationDate,QAName,AuditStatus,AuditScore FROM [dbo].[FY21SAPOSLegend] where CallID_SR_ID='" + searchbar.Text + "' or EmployeeID='" + searchbar.Text + "' order by AuditCount desc";
                UserGrid.DataSource = SqlDataSource1;
                UserGrid.DataBind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Call ID or Employee ID invalid!!');", true);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("21_SAPOSLegend.aspx");
        }

        protected void btnTrend_Click(object sender, EventArgs e)
        {
            Response.Redirect("QATrendViewSAPOSLegend.aspx");
        }
    }
}