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
    public partial class OM_View : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("OM_Login.aspx");
            }
            else
            {

                if (!IsPostBack)
                {
                    bind_data();

                    string SelectMgr = "SELECT Reporting_Manager from [dbo].[FY21VoiceLegend] UNION SELECT Reporting_Manager from[dbo].[FY21SoMeLegend] UNION SELECT Reporting_Manager from[dbo].[FY21ChatLegend] UNION SELECT Reporting_Manager from[dbo].[FY21ADXLegend]";
                    SqlDataAdapter adpt = new SqlDataAdapter(SelectMgr, Con);
                    DataTable dt = new DataTable();
                    adpt.Fill(dt);
                    //Distinct Manager
                    ddManagerSelect.DataSource = dt;
                    ddManagerSelect.DataBind();
                    ddManagerSelect.DataTextField = "Reporting_Manager";
                    ddManagerSelect.DataBind();
                    ddManagerSelect.Items.Insert(0, new ListItem("--Select--", "0"));

                    string SelectForm = "SELECT AuditFormType from [dbo].[FY21VoiceLegend] UNION SELECT AuditFormType from[dbo].[FY21SoMeLegend] UNION SELECT AuditFormType from[dbo].[FY21ChatLegend] UNION SELECT AuditFormType from[dbo].[FY21ADXLegend]";
                    SqlDataAdapter adpt2 = new SqlDataAdapter(SelectForm, Con);
                    DataTable dt2 = new DataTable();
                    adpt2.Fill(dt2);

                    //Distint Form Type
                    ddFormSelect.DataSource = dt2;
                    ddFormSelect.DataBind();
                    ddFormSelect.DataTextField = "AuditFormType";
                    ddFormSelect.DataBind();
                    ddFormSelect.Items.Insert(0, new ListItem("--Select--", "0"));
                }
            }
        }

        public void bind_data()
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("OM_Login.aspx");
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

                
                //Count calculation by Form type
                SqlCommand VoiceCount = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY21VoiceLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager='" + emp_name + "'", Con);
                VoiceCount.Connection = Con;
                Con.Open();
                float voicecount = Convert.ToInt32(VoiceCount.ExecuteScalar());
                Con.Close();

                SqlCommand SoMeCount = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY21SoMeLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager='" + emp_name + "'", Con);
                SoMeCount.Connection = Con;
                Con.Open();
                float somecount = Convert.ToInt32(SoMeCount.ExecuteScalar());
                Con.Close();

                SqlCommand ChatCount = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY21ChatLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager='" + emp_name + "'", Con);
                ChatCount.Connection = Con;
                Con.Open();
                float chatcount = Convert.ToInt32(ChatCount.ExecuteScalar());
                Con.Close();

                SqlCommand ADXCount = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY21ADXLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager='" + emp_name + "'", Con);
                ADXCount.Connection = Con;
                Con.Open();
                float adxcount = Convert.ToInt32(ADXCount.ExecuteScalar());
                Con.Close();

                //Dashboard Details Calculations
                SqlCommand query1 = new SqlCommand("select SUM(Count) as Count from(SELECT AuditResult,count(AuditScore) as Count from[dbo].[FY21VoiceLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY AuditResult " +
                    "UNION" +
                    " SELECT AuditResult, count(AuditScore) as Count from[dbo].[FY21SoMeLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY AuditResult " +
                    "UNION" +
                    " SELECT AuditResult, count(AuditScore) as Count from[dbo].[FY21ChatLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY AuditResult " +
                    "UNION" +
                    " SELECT AuditResult, count(AuditScore) as Count from[dbo].[FY21ADXLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY AuditResult) as JointTable", Con);
                query1.Connection = Con;
                Con.Open();
                float count = Convert.ToInt32(query1.ExecuteScalar());
                TotalAudits.Text = count.ToString();
                Con.Close();

                SqlCommand query2 = new SqlCommand("select SUM(Count) as Count from (SELECT AuditResult,count(AuditScore) as Count from [dbo].[FY21VoiceLegend] LEFT JOIN tblHeadCount B on Reporting_Manager=B.EmployeeFullName where B.ReportingManager='" + emp_name + "' GROUP BY AuditResult " +
                    "UNION" +
                    " SELECT AuditResult, count(AuditScore) as Count from[dbo].[FY21SoMeLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY AuditResult " +
                    "UNION" +
                    " SELECT AuditResult, count(AuditScore) as Count from[dbo].[FY21ChatLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY AuditResult " +
                    "UNION" +
                    " SELECT AuditResult, count(AuditScore) as Count from[dbo].[FY21ADXLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY AuditResult) as JointTable where AuditResult = 'Pass'", Con);
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

                SqlCommand query3 = new SqlCommand("select SUM(Count) as Count from (SELECT AuditResult,count(AuditScore) as Count from [dbo].[FY21VoiceLegend] LEFT JOIN tblHeadCount B on Reporting_Manager=B.EmployeeFullName where B.ReportingManager='" + emp_name + "' GROUP BY AuditResult " +
                    "UNION" +
                    " SELECT AuditResult, count(AuditScore) as Count from[dbo].[FY21SoMeLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY AuditResult " +
                    "UNION" +
                    " SELECT AuditResult, count(AuditScore) as Count from[dbo].[FY21ChatLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY AuditResult " +
                    "UNION" +
                    " SELECT AuditResult, count(AuditScore) as Count from[dbo].[FY21ADXLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY AuditResult) as JointTable where AuditResult = 'Fail'", Con);
                query3.Connection = Con;
                Con.Open();
                float countfail = Convert.ToInt32(query3.ExecuteScalar());
                FailedAudits.Text = countfail.ToString();
                Con.Close();

                SqlCommand query4 = new SqlCommand("select isnull(CAST(AVG(AverageAuditScore) AS DECIMAL(10,2)),0) AS AuditScore from (SELECT AVG(AuditScore) as AverageAuditScore from [dbo].[FY21VoiceLegend] LEFT JOIN tblHeadCount B on Reporting_Manager=B.EmployeeFullName where B.ReportingManager='" + emp_name + "' GROUP BY Reporting_Manager " +
                    "UNION" +
                " SELECT AVG(AuditScore) as AverageAuditScore from[dbo].[FY21SoMeLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY Reporting_Manager " +
                    "UNION" +
                " SELECT AVG(AuditScore) as AverageAuditScore from[dbo].[FY21ChatLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY Reporting_Manager " +
                    "UNION" +
                " SELECT AVG(AuditScore) as AverageAuditScore from[dbo].[FY21ADXLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY Reporting_Manager) as JointTable", Con);
                query4.Connection = Con;
                Con.Open();
                float avgScore = Convert.ToInt32(query4.ExecuteScalar());
                AvgAuditScore.Text = avgScore.ToString() + "%";
                Con.Close();

                SqlCommand query5 = new SqlCommand("Select SUM(TotalDefects) as DefectsOverall from( " +
                /*Voice*/
                "Select Sum(opening1 + opening2 + opening3 + opening4 + ToolUsage1 + ToolUsage2 + ToolUsage3 + ToolUsage4 + Probing + Troubleshooting + Sol_Res + Behavioural1 + Behavioural2 + Behavioural3 + Behavioural4 + Behavioural5 + Behavioural6 + Communication1 + Communication2 + Communication3 + Communication4 + Communication5 + Communication6 + Communication7 + CustObsdBehav1 + CustObsdBehav2 + CustObsdBehav3 + CustObsdBehav4 + CustObsdBehav5 + CustObsdBehav6 + Time_Manage + Callback + CaseOwnership1 + CaseOwnership2 + CaseOwnership3 + CaseOwnership4 + CaseOwnership5 + Case_Call_Logging + Closing) as TotalDefects from( " +
                "select Reporting_Manager, " +
                  "sum(case when Opening1 = 'Met' or Opening1 = 'NA' then 0 else 1 end) as opening1, " +
                  "sum(case when Opening2 = 'Met' or Opening2 = 'NA' then 0 else 1 end) as opening2, " +
                  "sum(case when Opening3 = 'Met' or Opening3 = 'NA' then 0 else 1 end) as opening3, " +
                  "sum(case when Opening4 = 'Met' or Opening4 = 'NA' then 0 else 1 end) as opening4, " +
                  "sum(case when ToolUsage1 = 'Met' or ToolUsage1 = 'NA' then 0 else 1 end) as ToolUsage1, " +
                  "sum(case when ToolUsage2 = 'Met' or ToolUsage2 = 'NA' then 0 else 1 end) as ToolUsage2, " +
                  "sum(case when ToolUsage3 = 'Met' or ToolUsage3 = 'NA' then 0 else 1 end) as ToolUsage3, " +
                  "sum(case when ToolUsage4 = 'Met' or ToolUsage4 = 'NA' then 0 else 1 end) as ToolUsage4, " +
                  "sum(case when Probing = 'Met' or Probing = 'NA' then 0 else 1 end) as Probing, " +
                  "sum(case when Troubleshooting = 'Met' or Troubleshooting = 'NA' then 0 else 1 end) as Troubleshooting, " +
                  "sum(case when Sol_Res = 'Completed' or Sol_Res = 'Pending' then 0 else 1 end) as Sol_Res, " +
                  "sum(case when Behavioural1 = 'Met' or Behavioural1 = 'NA' then 0 else 1 end) as Behavioural1, " +
                  "sum(case when Behavioural2 = 'Met' or Behavioural2 = 'NA' then 0 else 1 end) as Behavioural2, " +
                  "sum(case when Behavioural3 = 'Met' or Behavioural3 = 'NA' then 0 else 1 end) as Behavioural3, " +
                  "sum(case when Behavioural4 = 'Met' or Behavioural4 = 'NA' then 0 else 1 end) as Behavioural4, " +
                  "sum(case when Behavioural5 = 'Met' or Behavioural5 = 'NA' then 0 else 1 end) as Behavioural5, " +
                  "sum(case when Behavioural6 = 'Met' or Behavioural6 = 'NA' then 0 else 1 end) as Behavioural6, " +
                  "sum(case when Communication1 = 'Met' or Communication1 = 'NA' then 0 else 1 end) as Communication1, " +
                  "sum(case when Communication2 = 'Met' or Communication2 = 'NA' then 0 else 1 end) as Communication2, " +
                  "sum(case when Communication3 = 'Met' or Communication3 = 'NA' then 0 else 1 end) as Communication3, " +
                  "sum(case when Communication4 = 'Met' or Communication4 = 'NA' then 0 else 1 end) as Communication4, " +
                  "sum(case when Communication5 = 'Met' or Communication5 = 'NA' then 0 else 1 end) as Communication5, " +
                  "sum(case when Communication6 = 'Met' or Communication6 = 'NA' then 0 else 1 end) as Communication6, " +
                  "sum(case when Communication7 = 'Met' or Communication7 = 'NA' then 0 else 1 end) as Communication7, " +
                  "sum(case when CustObsdBehav1 = 'Met' or CustObsdBehav1 = 'NA' then 0 else 1 end) as CustObsdBehav1, " +
                  "sum(case when CustObsdBehav2 = 'Met' or CustObsdBehav2 = 'NA' then 0 else 1 end) as CustObsdBehav2, " +
                  "sum(case when CustObsdBehav3 = 'Met' or CustObsdBehav3 = 'NA' then 0 else 1 end) as CustObsdBehav3, " +
                  "sum(case when CustObsdBehav4 = 'Met' or CustObsdBehav4 = 'NA' then 0 else 1 end) as CustObsdBehav4, " +
                  "sum(case when CustObsdBehav5 = 'Met' or CustObsdBehav5 = 'NA' then 0 else 1 end) as CustObsdBehav5, " +
                  "sum(case when CustObsdBehav6 = 'Met' or CustObsdBehav6 = 'NA' then 0 else 1 end) as CustObsdBehav6, " +
                  "sum(case when Time_Manage = 'Met' then 0 else 1 end) as Time_Manage, " +
                  "sum(case when Callback = 'Met' or Callback = 'NA' then 0 else 1 end) as Callback, " +
                  "sum(case when CaseOwnership1 = 'Met' or CaseOwnership1 = 'NA' then 0 else 1 end) as CaseOwnership1, " +
                  "sum(case when CaseOwnership2 = 'Met' or CaseOwnership2 = 'NA' then 0 else 1 end) as CaseOwnership2, " +
                  "sum(case when CaseOwnership3 = 'Met' or CaseOwnership3 = 'NA' then 0 else 1 end) as CaseOwnership3, " +
                  "sum(case when CaseOwnership4 = 'Met' or CaseOwnership4 = 'NA' then 0 else 1 end) as CaseOwnership4, " +
                  "sum(case when CaseOwnership5 = 'Met' or CaseOwnership5 = 'NA' then 0 else 1 end) as CaseOwnership5, " +
                  "sum(case when Case_Call_Logging = 'Met' then 0 else 1 end) as Case_Call_Logging, " +
                  "sum(case when Closing = 'Met' or Closing = 'NA' then 0 else 1 end) as Closing " +
                 "from FY21VoiceLegend where AuditCount > 0 group by Reporting_Manager) as Table1 LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY Reporting_Manager " +

                "UNION " +
                /*Chat*/
                "Select Sum(opening1 + opening2 + opening3 + opening4 + ToolUsage1 + ToolUsage2 + ToolUsage3 + ToolUsage4 + Probing + Troubleshooting + Sol_Res + Behavioural1 + Behavioural2 + Behavioural3 + Behavioural4 + Behavioural5 + Behavioural6 + Communication1 + Communication2 + Communication3 + Communication4 + Communication5 + Communication6 + CustObsdBehav1 + CustObsdBehav2 + CustObsdBehav3 + CustObsdBehav4 + CustObsdBehav5 + CustObsdBehav6 + Time_Manage + Callback + CaseOwnership1 + CaseOwnership2 + CaseOwnership3 + CaseOwnership4 + CaseOwnership5 + Case_Call_Logging + Closing) as TotalDefects from( " +
                "select Reporting_Manager, " +
                  "sum(case when Opening1 = 'Met' or Opening1 = 'NA' then 0 else 1 end) as opening1, " +
                  "sum(case when Opening2 = 'Met' or Opening2 = 'NA' then 0 else 1 end) as opening2, " +
                  "sum(case when Opening3 = 'Met' or Opening3 = 'NA' then 0 else 1 end) as opening3, " +
                  "sum(case when Opening4 = 'Met' or Opening4 = 'NA' then 0 else 1 end) as opening4, " +
                  "sum(case when ToolUsage1 = 'Met' or ToolUsage1 = 'NA' then 0 else 1 end) as ToolUsage1, " +
                  "sum(case when ToolUsage2 = 'Met' or ToolUsage2 = 'NA' then 0 else 1 end) as ToolUsage2, " +
                  "sum(case when ToolUsage3 = 'Met' or ToolUsage3 = 'NA' then 0 else 1 end) as ToolUsage3, " +
                  "sum(case when ToolUsage4 = 'Met' or ToolUsage4 = 'NA' then 0 else 1 end) as ToolUsage4, " +
                  "sum(case when Probing = 'Met' or Probing = 'NA' then 0 else 1 end) as Probing, " +
                  "sum(case when Troubleshooting = 'Met' or Troubleshooting = 'NA' then 0 else 1 end) as Troubleshooting, " +
                  "sum(case when Sol_Res = 'Completed' or Sol_Res = 'Pending' then 0 else 1 end) as Sol_Res, " +
                  "sum(case when Behavioural1 = 'Met' or Behavioural1 = 'NA' then 0 else 1 end) as Behavioural1, " +
                  "sum(case when Behavioural2 = 'Met' or Behavioural2 = 'NA' then 0 else 1 end) as Behavioural2, " +
                  "sum(case when Behavioural3 = 'Met' or Behavioural3 = 'NA' then 0 else 1 end) as Behavioural3, " +
                  "sum(case when Behavioural4 = 'Met' or Behavioural4 = 'NA' then 0 else 1 end) as Behavioural4, " +
                  "sum(case when Behavioural5 = 'Met' or Behavioural5 = 'NA' then 0 else 1 end) as Behavioural5, " +
                  "sum(case when Behavioural6 = 'Met' or Behavioural6 = 'NA' then 0 else 1 end) as Behavioural6, " +
                  "sum(case when Communication1 = 'Met' or Communication1 = 'NA' then 0 else 1 end) as Communication1, " +
                  "sum(case when Communication2 = 'Met' or Communication2 = 'NA' then 0 else 1 end) as Communication2, " +
                  "sum(case when Communication3 = 'Met' or Communication3 = 'NA' then 0 else 1 end) as Communication3, " +
                  "sum(case when Communication4 = 'Met' or Communication4 = 'NA' then 0 else 1 end) as Communication4, " +
                  "sum(case when Communication5 = 'Met' or Communication5 = 'NA' then 0 else 1 end) as Communication5, " +
                  "sum(case when Communication6 = 'Met' or Communication6 = 'NA' then 0 else 1 end) as Communication6, " +
                  "sum(case when CustObsdBehav1 = 'Met' or CustObsdBehav1 = 'NA' then 0 else 1 end) as CustObsdBehav1, " +
                  "sum(case when CustObsdBehav2 = 'Met' or CustObsdBehav2 = 'NA' then 0 else 1 end) as CustObsdBehav2, " +
                  "sum(case when CustObsdBehav3 = 'Met' or CustObsdBehav3 = 'NA' then 0 else 1 end) as CustObsdBehav3, " +
                  "sum(case when CustObsdBehav4 = 'Met' or CustObsdBehav4 = 'NA' then 0 else 1 end) as CustObsdBehav4, " +
                  "sum(case when CustObsdBehav5 = 'Met' or CustObsdBehav5 = 'NA' then 0 else 1 end) as CustObsdBehav5, " +
                  "sum(case when CustObsdBehav6 = 'Met' or CustObsdBehav6 = 'NA' then 0 else 1 end) as CustObsdBehav6, " +
                  "sum(case when Time_Manage = 'Met' then 0 else 1 end) as Time_Manage, " +
                  "sum(case when Callback = 'Met' or Callback = 'NA' then 0 else 1 end) as Callback, " +
                  "sum(case when CaseOwnership1 = 'Met' or CaseOwnership1 = 'NA' then 0 else 1 end) as CaseOwnership1, " +
                  "sum(case when CaseOwnership2 = 'Met' or CaseOwnership2 = 'NA' then 0 else 1 end) as CaseOwnership2, " +
                  "sum(case when CaseOwnership3 = 'Met' or CaseOwnership3 = 'NA' then 0 else 1 end) as CaseOwnership3, " +
                  "sum(case when CaseOwnership4 = 'Met' or CaseOwnership4 = 'NA' then 0 else 1 end) as CaseOwnership4, " +
                  "sum(case when CaseOwnership5 = 'Met' or CaseOwnership5 = 'NA' then 0 else 1 end) as CaseOwnership5, " +
                  "sum(case when Case_Call_Logging = 'Met' then 0 else 1 end) as Case_Call_Logging, " +
                  "sum(case when Closing = 'Met' or Closing = 'NA' then 0 else 1 end) as Closing " +
                 "from FY21ChatLegend where AuditCount > 0 group by Reporting_Manager) as Table1 LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY Reporting_Manager " +

                "UNION " +
                /*SoMe*/
                "Select Sum(opening1 + opening2 + opening3 + opening4 + ToolUsage1 + ToolUsage2 + ToolUsage3 + ToolUsage4 + Probing + Troubleshooting + Sol_Res + Behavioural1 + Behavioural2 + Behavioural3 + Behavioural4 + Behavioural5 + Behavioural6 + Communication1 + Communication2 + Communication3 + Communication4 + Communication5 + Communication6 + CustObsdBehav1 + CustObsdBehav2 + CustObsdBehav3 + CustObsdBehav4 + CustObsdBehav5 + CustObsdBehav6 + CaseFollowUp + CaseOwnership1 + CaseOwnership2 + CaseOwnership3 + CaseOwnership4 + CaseOwnership5 + CaseOwnership6 + Case_Call_Logging + Closing) as TotalDefects from(" +
                "select Reporting_Manager, " +
                  "sum(case when Opening1 = 'Met' or Opening1 = 'NA' then 0 else 1 end) as opening1, " +
                  "sum(case when Opening2 = 'Met' or Opening2 = 'NA' then 0 else 1 end) as opening2, " +
                  "sum(case when Opening3 = 'Met' or Opening3 = 'NA' then 0 else 1 end) as opening3, " +
                  "sum(case when Opening4 = 'Met' or Opening4 = 'NA' then 0 else 1 end) as opening4, " +
                  "sum(case when ToolUsage1 = 'Met' or ToolUsage1 = 'NA' then 0 else 1 end) as ToolUsage1, " +
                  "sum(case when ToolUsage2 = 'Met' or ToolUsage2 = 'NA' then 0 else 1 end) as ToolUsage2, " +
                  "sum(case when ToolUsage3 = 'Met' or ToolUsage3 = 'NA' then 0 else 1 end) as ToolUsage3, " +
                  "sum(case when ToolUsage4 = 'Met' or ToolUsage4 = 'NA' then 0 else 1 end) as ToolUsage4, " +
                  "sum(case when Probing = 'Met' or Probing = 'NA' then 0 else 1 end) as Probing, " +
                  "sum(case when Troubleshooting = 'Met' or Troubleshooting = 'NA' then 0 else 1 end) as Troubleshooting, " +
                  "sum(case when Sol_Res = 'Completed' or Sol_Res = 'Pending' then 0 else 1 end) as Sol_Res, " +
                  "sum(case when Behavioural1 = 'Met' or Behavioural1 = 'NA' then 0 else 1 end) as Behavioural1, " +
                  "sum(case when Behavioural2 = 'Met' or Behavioural2 = 'NA' then 0 else 1 end) as Behavioural2, " +
                  "sum(case when Behavioural3 = 'Met' or Behavioural3 = 'NA' then 0 else 1 end) as Behavioural3, " +
                  "sum(case when Behavioural4 = 'Met' or Behavioural4 = 'NA' then 0 else 1 end) as Behavioural4, " +
                  "sum(case when Behavioural5 = 'Met' or Behavioural5 = 'NA' then 0 else 1 end) as Behavioural5, " +
                  "sum(case when Behavioural6 = 'Met' or Behavioural6 = 'NA' then 0 else 1 end) as Behavioural6, " +
                  "sum(case when Communication1 = 'Met' or Communication1 = 'NA' then 0 else 1 end) as Communication1, " +
                  "sum(case when Communication2 = 'Met' or Communication2 = 'NA' then 0 else 1 end) as Communication2, " +
                  "sum(case when Communication3 = 'Met' or Communication3 = 'NA' then 0 else 1 end) as Communication3, " +
                  "sum(case when Communication4 = 'Met' or Communication4 = 'NA' then 0 else 1 end) as Communication4, " +
                  "sum(case when Communication5 = 'Met' or Communication5 = 'NA' then 0 else 1 end) as Communication5, " +
                  "sum(case when Communication6 = 'Met' or Communication6 = 'NA' then 0 else 1 end) as Communication6, " +
                  "sum(case when CustObsdBehav1 = 'Met' or CustObsdBehav1 = 'NA' then 0 else 1 end) as CustObsdBehav1, " +
                  "sum(case when CustObsdBehav2 = 'Met' or CustObsdBehav2 = 'NA' then 0 else 1 end) as CustObsdBehav2, " +
                  "sum(case when CustObsdBehav3 = 'Met' or CustObsdBehav3 = 'NA' then 0 else 1 end) as CustObsdBehav3, " +
                  "sum(case when CustObsdBehav4 = 'Met' or CustObsdBehav4 = 'NA' then 0 else 1 end) as CustObsdBehav4, " +
                  "sum(case when CustObsdBehav5 = 'Met' or CustObsdBehav5 = 'NA' then 0 else 1 end) as CustObsdBehav5, " +
                  "sum(case when CustObsdBehav6 = 'Met' or CustObsdBehav6 = 'NA' then 0 else 1 end) as CustObsdBehav6, " +
                  "sum(case when CaseFollowUp = 'Met' or CaseFollowUp = 'NA' then 0 else 1 end) as CaseFollowUp, " +
                  "sum(case when CaseOwnership1 = 'Met' or CaseOwnership1 = 'NA' then 0 else 1 end) as CaseOwnership1, " +
                  "sum(case when CaseOwnership2 = 'Met' or CaseOwnership2 = 'NA' then 0 else 1 end) as CaseOwnership2, " +
                  "sum(case when CaseOwnership3 = 'Met' or CaseOwnership3 = 'NA' then 0 else 1 end) as CaseOwnership3, " +
                  "sum(case when CaseOwnership4 = 'Met' or CaseOwnership4 = 'NA' then 0 else 1 end) as CaseOwnership4, " +
                  "sum(case when CaseOwnership5 = 'Met' or CaseOwnership5 = 'NA' then 0 else 1 end) as CaseOwnership5, " +
                  "sum(case when CaseOwnership6 = 'Met' or CaseOwnership6 = 'NA' then 0 else 1 end) as CaseOwnership6, " +
                  "sum(case when Case_Call_Logging = 'Met' then 0 else 1 end) as Case_Call_Logging, " +
                  "sum(case when Closing = 'Met' or Closing = 'NA' then 0 else 1 end) as Closing " +
                 "from FY21SoMeLegend where AuditCount > 0 group by Reporting_Manager) as Table1 LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY Reporting_Manager " +

                "UNION " +
                /*ADX*/
                "Select Sum(opening1 + opening2 + Probing + Troubleshooting + Sol_Res + Setting_Expectation + CaseOwnership1 + CaseOwnership2 + CaseOwnership3 + Behavioural1 + Behavioural2 + Behavioural3 + Behavioural4 + Behavioural5 + Behavioural6 + Communication1 + Communication2 + Communication3 + CallEtiquettes1 + CallEtiquettes2 + CallEtiquettes3 + CallEtiquettes4 + CallEtiquettes5 + CallEtiquettes6 + CallEtiquettes7 + CaseHandling) as TotalDefects from(" +
                "select Reporting_Manager, " +
                  "sum(case when Opening1 = 'Met' or Opening1 = 'NA' then 0 else 1 end) as opening1, " +
                  "sum(case when Opening2 = 'Met' or Opening2 = 'NA' then 0 else 1 end) as opening2, " +
                  "sum(case when Probing = 'Met' or Probing = 'NA' then 0 else 1 end) as Probing, " +
                  "sum(case when Troubleshooting = 'Met' or Troubleshooting = 'NA' then 0 else 1 end) as Troubleshooting, " +
                  "sum(case when Sol_Res = 'Completed' or Sol_Res = 'Pending' then 0 else 1 end) as Sol_Res, " +
                  "sum(case when Setting_Expectation = 'Met' then 0 else 1 end) as Setting_Expectation, " +
                  "sum(case when CaseOwnership1 = 'Met' or CaseOwnership1 = 'NA' then 0 else 1 end) as CaseOwnership1, " +
                  "sum(case when CaseOwnership2 = 'Met' or CaseOwnership2 = 'NA' then 0 else 1 end) as CaseOwnership2, " +
                  "sum(case when CaseOwnership3 = 'Met' or CaseOwnership3 = 'NA' then 0 else 1 end) as CaseOwnership3, " +
                  "sum(case when Behavioural1 = 'Met' or Behavioural1 = 'NA' then 0 else 1 end) as Behavioural1, " +
                  "sum(case when Behavioural2 = 'Met' or Behavioural2 = 'NA' then 0 else 1 end) as Behavioural2, " +
                  "sum(case when Behavioural3 = 'Met' or Behavioural3 = 'NA' then 0 else 1 end) as Behavioural3, " +
                  "sum(case when Behavioural4 = 'Met' or Behavioural4 = 'NA' then 0 else 1 end) as Behavioural4, " +
                  "sum(case when Behavioural5 = 'Met' or Behavioural5 = 'NA' then 0 else 1 end) as Behavioural5, " +
                  "sum(case when Behavioural6 = 'Met' or Behavioural6 = 'NA' then 0 else 1 end) as Behavioural6, " +
                  "sum(case when Communication1 = 'Met' or Communication1 = 'NA' then 0 else 1 end) as Communication1, " +
                  "sum(case when Communication2 = 'Met' or Communication2 = 'NA' then 0 else 1 end) as Communication2, " +
                  "sum(case when Communication3 = 'Met' or Communication3 = 'NA' then 0 else 1 end) as Communication3, " +
                  "sum(case when CallEtiquettes1 = 'Met' or CallEtiquettes1 = 'NA' then 0 else 1 end) as CallEtiquettes1, " +
                  "sum(case when CallEtiquettes2 = 'Met' or CallEtiquettes2 = 'NA' then 0 else 1 end) as CallEtiquettes2, " +
                  "sum(case when CallEtiquettes3 = 'Met' or CallEtiquettes3 = 'NA' then 0 else 1 end) as CallEtiquettes3, " +
                  "sum(case when CallEtiquettes4 = 'Met' or CallEtiquettes4 = 'NA' then 0 else 1 end) as CallEtiquettes4, " +
                  "sum(case when CallEtiquettes5 = 'Met' or CallEtiquettes5 = 'NA' then 0 else 1 end) as CallEtiquettes5, " +
                  "sum(case when CallEtiquettes6 = 'Met' or CallEtiquettes6 = 'NA' then 0 else 1 end) as CallEtiquettes6, " +
                  "sum(case when CallEtiquettes7 = 'Met' or CallEtiquettes7 = 'NA' then 0 else 1 end) as CallEtiquettes7, " +
                  "sum(case when CaseHandling = 'Met' then 0 else 1 end) as CaseHandling " +
                 "from FY21ADXLegend where AuditCount > 0 group by Reporting_Manager) as Table1 LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY Reporting_Manager) AS DefectTotal", Con);
                query5.Connection = Con;
                Con.Open();
                float Defects = Convert.ToInt32(query5.ExecuteScalar());
                DefectCount.Text = Defects.ToString();
                float defectper = 0;
                if (count != 0)
                {
                    defectper = ((39 * voicecount) + (38 * chatcount) + (38 * somecount) + (26 * adxcount)) / Defects;
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
                SqlDataSource1.SelectCommand = "select Reporting_Manager,SUM(Count) as TotalAudits,CAST(AVG(AverageAuditScore) AS DECIMAL(10,2)) AS AuditScore,CAST(AVG(CC) AS DECIMAL(10,2)) AS CustomerCritical, CAST(AVG(BC) AS DECIMAL(10,2)) AS BusinessCritical from (SELECT AVG(AuditScore) as AverageAuditScore, AVG(CustCritical) as CC,AVG(BusCritical) as BC,Reporting_Manager,count(AuditScore) as Count from [dbo].[FY21VoiceLegend] LEFT JOIN tblHeadCount B on Reporting_Manager=B.EmployeeFullName where B.ReportingManager='" + emp_name + "' GROUP BY Reporting_Manager " +
                    "UNION" +
                " SELECT AVG(AuditScore) as AverageAuditScore, AVG(CustCritical) as CC,AVG(BusCritical) as BC,Reporting_Manager,count(AuditScore) as Count from[dbo].[FY21SoMeLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY Reporting_Manager " +
                    "UNION" +
                " SELECT AVG(AuditScore) as AverageAuditScore, AVG(CustCritical) as CC,AVG(BusCritical) as BC,Reporting_Manager, count(AuditScore) as Count from[dbo].[FY21ChatLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY Reporting_Manager " +
                    "UNION" +
                " SELECT AVG(AuditScore) as AverageAuditScore, AVG(CustCritical) as CC,AVG(BusCritical) as BC,Reporting_Manager, count(AuditScore) as Count from[dbo].[FY21ADXLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY Reporting_Manager) as JointTable GROUP BY Reporting_Manager";
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
            Response.Redirect("AuditSheetMgrFY21Voice.aspx?case=" + cass);

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("OM_Login.aspx");
        }
        

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("LegendSelectMgr.aspx");
        }

        protected void ddManagerSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("OM_Login.aspx");
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

                SqlDataSource SqlDataSource1 = new SqlDataSource();
                SqlDataSource1.ID = "SqlDataSource1";
                this.Page.Controls.Add(SqlDataSource1);
                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CString"].ConnectionString;
                SqlDataSource1.SelectCommand = "select Reporting_Manager,SUM(Count) as TotalAudits,CAST(AVG(AverageAuditScore) AS DECIMAL(10,2)) AS AuditScore,CAST(AVG(CC) AS DECIMAL(10,2)) AS CustomerCritical, CAST(AVG(BC) AS DECIMAL(10,2)) AS BusinessCritical from (SELECT AVG(AuditScore) as AverageAuditScore, AVG(CustCritical) as CC,AVG(BusCritical) as BC,Reporting_Manager,count(AuditScore) as Count from [dbo].[FY21VoiceLegend] LEFT JOIN tblHeadCount B on Reporting_Manager=B.EmployeeFullName where B.ReportingManager='" + emp_name + "' GROUP BY Reporting_Manager " +
                    "UNION" +
                " SELECT AVG(AuditScore) as AverageAuditScore, AVG(CustCritical) as CC,AVG(BusCritical) as BC,Reporting_Manager,count(AuditScore) as Count from[dbo].[FY21SoMeLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY Reporting_Manager " +
                    "UNION" +
                " SELECT AVG(AuditScore) as AverageAuditScore, AVG(CustCritical) as CC,AVG(BusCritical) as BC,Reporting_Manager, count(AuditScore) as Count from[dbo].[FY21ChatLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY Reporting_Manager " +
                    "UNION" +
                " SELECT AVG(AuditScore) as AverageAuditScore, AVG(CustCritical) as CC,AVG(BusCritical) as BC,Reporting_Manager, count(AuditScore) as Count from[dbo].[FY21ADXLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY Reporting_Manager) as JointTable where Reporting_Manager='" + ddManagerSelect.SelectedItem.Text + "' GROUP BY Reporting_Manager";
                UserGrid.DataSource = SqlDataSource1;
                UserGrid.DataBind();
            }
        }

        protected void ddFormSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("OM_Login.aspx");
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

                SqlDataSource SqlDataSource1 = new SqlDataSource();
                SqlDataSource1.ID = "SqlDataSource1";
                this.Page.Controls.Add(SqlDataSource1);
                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CString"].ConnectionString;
                SqlDataSource1.SelectCommand = "select Reporting_Manager,SUM(Count) as TotalAudits,CAST(AVG(AverageAuditScore) AS DECIMAL(10,2)) AS AuditScore,AuditFormType,CAST(AVG(CC) AS DECIMAL(10,2)) AS CustomerCritical, CAST(AVG(BC) AS DECIMAL(10,2)) AS BusinessCritical from (SELECT AVG(AuditScore) as AverageAuditScore, AVG(CustCritical) as CC,AVG(BusCritical) as BC,Reporting_Manager,count(AuditScore) as Count,AuditFormType from [dbo].[FY21VoiceLegend] LEFT JOIN tblHeadCount B on Reporting_Manager=B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY Reporting_Manager,AuditFormType " +
                    "UNION" +
                " SELECT AVG(AuditScore) as AverageAuditScore, AVG(CustCritical) as CC,AVG(BusCritical) as BC,Reporting_Manager,count(AuditScore) as TotalAudits,AuditFormType from[dbo].[FY21SoMeLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY Reporting_Manager,AuditFormType " +
                    "UNION" +
                " SELECT AVG(AuditScore) as AverageAuditScore, AVG(CustCritical) as CC,AVG(BusCritical) as BC,Reporting_Manager,count(AuditScore) as TotalAudits,AuditFormType from[dbo].[FY21ChatLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY Reporting_Manager,AuditFormType " +
                    "UNION" +
                " SELECT AVG(AuditScore) as AverageAuditScore, AVG(CustCritical) as CC,AVG(BusCritical) as BC,Reporting_Manager,count(AuditScore) as TotalAudits,AuditFormType from[dbo].[FY21ADXLegend] LEFT JOIN tblHeadCount B on Reporting_Manager = B.EmployeeFullName where B.ReportingManager = '" + emp_name + "' GROUP BY Reporting_Manager,AuditFormType) as JointTable where AuditFormType='" + ddFormSelect.SelectedItem.Text + "' GROUP BY Reporting_Manager, AuditFormType";
                UserGrid.DataSource = SqlDataSource1;
                UserGrid.DataBind();
            }
        }
    }
}