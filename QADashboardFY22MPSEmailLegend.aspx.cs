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
    public partial class QADashboardFY22MPSEmailLegend : System.Web.UI.Page
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
                SqlCommand query1 = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY22MPS_EmailLegend] where QAName='" + emp_name + "'", Con);
                query1.Connection = Con;
                Con.Open();
                float count = Convert.ToInt32(query1.ExecuteScalar());
                TotalAudits.Text = count.ToString();
                Con.Close();

                SqlCommand query2 = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY22MPS_EmailLegend] where QAName='" + emp_name + "' and AuditResult = 'Pass'", Con);
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

                SqlCommand query3 = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY22MPS_EmailLegend] where QAName='" + emp_name + "' and AuditResult = 'Fail'", Con);
                query3.Connection = Con;
                Con.Open();
                float countfail = Convert.ToInt32(query3.ExecuteScalar());
                FailedAudits.Text = countfail.ToString();
                Con.Close();

                SqlCommand query4 = new SqlCommand("SELECT ISNULL(AVG([AuditScore]),0) from [dbo].[FY22MPS_EmailLegend] where QAName='" + emp_name + "'", Con);
                query4.Connection = Con;
                Con.Open();
                float avgScore = Convert.ToInt32(query4.ExecuteScalar());
                AvgAuditScore.Text = avgScore.ToString() + "%";
                Con.Close();

                SqlCommand query5 = new SqlCommand("Select Sum(ActionCaseWithinTime1 + ActionCaseWithinTime2 + ActionWithRightDocs + RightTonerSupplies + Res_Info + Behavioural1 + Behavioural2 + Behavioural3 + Behavioural4 + Behavioural5 + Behavioural6 + EmailCommunication1 + EmailCommunication2 + EmailCommunication3 + Setting_Expectation + CaseOwnership1 + CaseOwnership2 + CaseOwnership3 + CaseOwnership4 + Documentation ) as TotalDefects from ( " +
                "select QAName, " +
                  "sum(case when ActionCaseWithinTime1 = 'Met' or ActionCaseWithinTime1 = 'NA' then 0 else 1 end) as ActionCaseWithinTime1, " +
                  "sum(case when ActionCaseWithinTime2 = 'Met' or ActionCaseWithinTime2 = 'NA' then 0 else 1 end) as ActionCaseWithinTime2, " +
                  "sum(case when ActionWithRightDocs = 'Met' or ActionWithRightDocs = 'NA' then 0 else 1 end) as ActionWithRightDocs, " +
                  "sum(case when RightTonerSupplies = 'Completed' or RightTonerSupplies = 'Pending' then 0 else 1 end) as RightTonerSupplies, " +
                  "sum(case when Res_Info = 'Met' or Res_Info = 'NA' then 0 else 1 end) as Res_Info, " +
                  "sum(case when Behavioural1 = 'Met' or Behavioural1 = 'NA' then 0 else 1 end) as Behavioural1, " +
                  "sum(case when Behavioural2 = 'Met' or Behavioural2 = 'NA' then 0 else 1 end) as Behavioural2, " +
                  "sum(case when Behavioural3 = 'Met' or Behavioural3 = 'NA' then 0 else 1 end) as Behavioural3, " +
                  "sum(case when Behavioural4 = 'Met' or Behavioural4 = 'NA' then 0 else 1 end) as Behavioural4, " +
                  "sum(case when Behavioural5 = 'Met' or Behavioural5 = 'NA' then 0 else 1 end) as Behavioural5, " +
                  "sum(case when Behavioural6 = 'Met' or Behavioural6 = 'NA' then 0 else 1 end) as Behavioural6, " +
                  "sum(case when EmailCommunication1 = 'Met' or EmailCommunication1 = 'NA' then 0 else 1 end) as EmailCommunication1, " +
                  "sum(case when EmailCommunication2 = 'Met' or EmailCommunication2 = 'NA' then 0 else 1 end) as EmailCommunication2, " +
                  "sum(case when EmailCommunication3 = 'Met' or EmailCommunication3 = 'NA' then 0 else 1 end) as EmailCommunication3, " +
                  "sum(case when Setting_Expectation = 'Met' then 0 else 1 end) as Setting_Expectation, " +
                  "sum(case when CaseOwnership1 = 'Met' or CaseOwnership1 = 'NA' then 0 else 1 end) as CaseOwnership1, " +
                  "sum(case when CaseOwnership2 = 'Met' or CaseOwnership2 = 'NA' then 0 else 1 end) as CaseOwnership2, " +
                  "sum(case when CaseOwnership3 = 'Met' or CaseOwnership3 = 'NA' then 0 else 1 end) as CaseOwnership3, " +
                  "sum(case when CaseOwnership4 = 'Met' or CaseOwnership4 = 'NA' then 0 else 1 end) as CaseOwnership4, " +
                  "sum(case when Documentation = 'Met' then 0 else 1 end) as Documentation " +
                 "from FY22MPS_EmailLegend where AuditCount > 0 group by QAName) as Table1 where QAName = '" + emp_name + "' group by QAName", Con);
                query5.Connection = Con;
                Con.Open();
                float Defects = Convert.ToInt32(query5.ExecuteScalar());
                DefectCount.Text = Defects.ToString();
                float defectper = 0;
                if (count != 0)
                {
                    defectper = (Defects / (20 * count)) * 100;
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
                SqlDataSource1.SelectCommand = "select EmployeeID,Employee_Name,CaseID,CallDate,EvaluationDate,QAName,AuditStatus,AuditScore FROM [dbo].[FY22MPS_EmailLegend] where QAName='" + emp_name + "' order by AuditCount desc";
                UserGrid.DataSource = SqlDataSource1;
                UserGrid.DataBind();

                //SqlDataSource SqlDataSource2 = new SqlDataSource();
                //SqlDataSource2.ID = "SqlDataSource2";
                //this.Page.Controls.Add(SqlDataSource2);
                //SqlDataSource2.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CString"].ConnectionString;
                //SqlDataSource2.SelectCommand = "Select Employee_Name,EvaluationDate,Opening,Probing,Troubleshooting,Sol_Res,Behavioural,Communication,CallEtiquettes,Setting_Expectation,CaseOwnership,CaseHandling from FY21ADXLegend where QAName='" + emp_name + "' order by AuditCount desc";
                //TrendGrid.ControlStyle.Font.Size = 50;
                //TrendGrid.DataSource = SqlDataSource2;
                //TrendGrid.DataBind();
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
            Response.Redirect("AuditSheetMPSEmailQA.aspx?case=" + cass);

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
                SqlDataSource1.SelectCommand = "select EmployeeID,Employee_Name,CaseID,CallDate,EvaluationDate,QAName,AuditStatus,AuditScore FROM [dbo].[FY22MPS_EmailLegend] where CaseID='" + searchbar.Text + "' or EmployeeID='" + searchbar.Text + "' order by AuditCount desc";
                UserGrid.DataSource = SqlDataSource1;
                UserGrid.DataBind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Case ID or Employee ID invalid!!');", true);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("22_Email_PSCC_MPS_Legend.aspx");
        }
    }
}