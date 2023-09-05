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
    public partial class MgrDashboardOnsitePURR : System.Web.UI.Page
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
                SqlCommand query1 = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY22OnsitePURRLegend] where Reporting_Manager='" + emp_name + "'", Con);
                query1.Connection = Con;
                Con.Open();
                float count = Convert.ToInt32(query1.ExecuteScalar());
                TotalAudits.Text = count.ToString();
                Con.Close();

                SqlCommand query2 = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY22OnsitePURRLegend] where Reporting_Manager='" + emp_name + "' and AuditResult = 'Pass'", Con);
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

                SqlCommand query3 = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY22OnsitePURRLegend] where Reporting_Manager='" + emp_name + "' and AuditResult = 'Fail'", Con);
                query3.Connection = Con;
                Con.Open();
                float countfail = Convert.ToInt32(query3.ExecuteScalar());
                FailedAudits.Text = countfail.ToString();
                Con.Close();

                SqlCommand query4 = new SqlCommand("SELECT ISNULL(AVG([AuditScore]),0) from [dbo].[FY22OnsitePURRLegend] where Reporting_Manager='" + emp_name + "'", Con);
                query4.Connection = Con;
                Con.Open();
                float avgScore = Convert.ToInt32(query4.ExecuteScalar());
                AvgAuditScore.Text = avgScore.ToString() + "%";
                Con.Close();

                SqlCommand query5 = new SqlCommand("Select Sum(TAT + WorkOrder_PURR + DeliveryInstructions + RDT_Documentation + KCI_SettingExpectation + ConsignmentDetails + CorrectDispatch + GoogleSheets_Sharepoint + ConfirmAddress ) as TotalDefects from ( " +
                "select Reporting_Manager, " +
                  "sum(case when TAT = 'Met' or TAT = 'NA' then 0 else 1 end) as TAT, " +
                  "sum(case when WorkOrder_PURR = 'Met' or WorkOrder_PURR = 'NA' then 0 else 1 end) as WorkOrder_PURR, " +
                  "sum(case when DeliveryInstructions = 'Met' or DeliveryInstructions = 'NA' then 0 else 1 end) as DeliveryInstructions, " +
                  "sum(case when RDT_Documentation = 'Met' or RDT_Documentation = 'NA' then 0 else 1 end) as RDT_Documentation, " +
                  "sum(case when KCI_SettingExpectation = 'Met' or KCI_SettingExpectation = 'NA' then 0 else 1 end) as KCI_SettingExpectation, " +
                  "sum(case when ConsignmentDetails = 'Met' or ConsignmentDetails = 'NA' then 0 else 1 end) as ConsignmentDetails, " +
                  "sum(case when CorrectDispatch = 'Met' or CorrectDispatch = 'NA' then 0 else 1 end) as CorrectDispatch, " +
                  "sum(case when GoogleSheets_Sharepoint = 'Met' or GoogleSheets_Sharepoint = 'NA' then 0 else 1 end) as GoogleSheets_Sharepoint, " +
                  "sum(case when ConfirmAddress = 'Met' or ConfirmAddress = 'NA' then 0 else 1 end) as ConfirmAddress " +
                 "from FY22OnsitePURRLegend where AuditCount > 0 group by Reporting_Manager) as Table1 where Reporting_Manager = '" + emp_name + "' group by Reporting_Manager", Con);
                query5.Connection = Con;
                Con.Open();
                float Defects = Convert.ToInt32(query5.ExecuteScalar());
                DefectCount.Text = Defects.ToString();
                float defectper = 0;
                if (count != 0)
                {
                    defectper = (Defects / (9 * count)) * 100;
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
                SqlDataSource1.SelectCommand = "select EmployeeID,Employee_Name,CallID_SR_ID,CallDate,EvaluationDate,QAName,AuditStatus,AuditScore FROM [dbo].[FY22OnsitePURRLegend] where Reporting_Manager_Mail='" + emp_mail + "' or TLMail='" + emp_mail + "' order by AuditCount desc";
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
            Response.Redirect("AuditSheetMgrFY22OnsitePURR.aspx?case=" + cass);

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("MgrLogin.aspx");
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
                SqlDataSource1.SelectCommand = "select EmployeeID,Employee_Name,CallID_SR_ID,CallDate,EvaluationDate,QAName,AuditStatus,AuditScore FROM [dbo].[FY22OnsitePURRLegend] where CallID_SR_ID='" + searchbar.Text + "' AND Reporting_Manager_Mail='" + emp_mail + "' or TLMail='" + emp_mail + "' order by AuditCount desc";
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