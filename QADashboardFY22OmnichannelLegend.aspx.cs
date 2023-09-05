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
    public partial class QADashboardFY22OmnichannelLegend : System.Web.UI.Page
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
                SqlCommand query1 = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY22OmnnichannelLegend] where QAName='" + emp_name + "'", Con);
                query1.Connection = Con;
                Con.Open();
                float count = Convert.ToInt32(query1.ExecuteScalar());
                TotalAudits.Text = count.ToString();
                Con.Close();

                SqlCommand query2 = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY22OmnnichannelLegend] where QAName='" + emp_name + "' and AuditResult = 'Pass'", Con);
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

                SqlCommand query3 = new SqlCommand("SELECT count(AuditResult) from [dbo].[FY22OmnnichannelLegend] where QAName='" + emp_name + "' and AuditResult = 'Fail'", Con);
                query3.Connection = Con;
                Con.Open();
                float countfail = Convert.ToInt32(query3.ExecuteScalar());
                FailedAudits.Text = countfail.ToString();
                Con.Close();

                SqlCommand query4 = new SqlCommand("SELECT ISNULL(AVG([AuditScore]),0) from [dbo].[FY22OmnnichannelLegend] where QAName='" + emp_name + "'", Con);
                query4.Connection = Con;
                Con.Open();
                float avgScore = Convert.ToInt32(query4.ExecuteScalar());
                AvgAuditScore.Text = avgScore.ToString() + "%";
                Con.Close();

                SqlCommand query5 = new SqlCommand("Select Sum(Understand_Req + Action_Within_TAT + Involve_Right_People + Respond_Accordingly + ShowOwnership + Lang_Communication + UpdateNotes + UpdatedInSharepoint ) as TotalDefects from ( " +
                "select QAName, " +
                  "sum(case when Understand_Req = 'Met' or Understand_Req = 'NA' then 0 else 1 end) as Understand_Req, " +
                  "sum(case when Action_Within_TAT = 'Met' or Action_Within_TAT = 'NA' then 0 else 1 end) as Action_Within_TAT, " +
                  "sum(case when Involve_Right_People = 'Met' or Involve_Right_People = 'NA' then 0 else 1 end) as Involve_Right_People, " +
                  "sum(case when Respond_Accordingly = 'Met' or Respond_Accordingly = 'NA' then 0 else 1 end) as Respond_Accordingly, " +
                  "sum(case when ShowOwnership = 'Met' or ShowOwnership = 'NA' then 0 else 1 end) as ShowOwnership, " +
                  "sum(case when Lang_Communication = 'Met' or Lang_Communication = 'NA' then 0 else 1 end) as Lang_Communication, " +
                  "sum(case when UpdateNotes = 'Met' or UpdateNotes = 'NA' then 0 else 1 end) as UpdateNotes, " +
                  "sum(case when UpdatedInSharepoint = 'Met' or UpdatedInSharepoint = 'NA' then 0 else 1 end) as UpdatedInSharepoint " +
                 "from FY22OmnnichannelLegend where AuditCount > 0 group by QAName) as Table1 where QAName = '" + emp_name + "' group by QAName", Con);
                query5.Connection = Con;
                Con.Open();
                float Defects = Convert.ToInt32(query5.ExecuteScalar());
                DefectCount.Text = Defects.ToString();
                float defectper = 0;
                if (count != 0)
                {
                    defectper = (Defects / (8 * count)) * 100;
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
                SqlDataSource1.SelectCommand = "select EmployeeID,Employee_Name,CallID_SR_ID,CallDate,EvaluationDate,QAName,AuditStatus,AuditScore FROM [dbo].[FY22OmnnichannelLegend] where QAName='" + emp_name + "' order by AuditCount desc";
                UserGrid.DataSource = SqlDataSource1;
                UserGrid.DataBind();

                //SqlDataSource SqlDataSource2 = new SqlDataSource();
                //SqlDataSource2.ID = "SqlDataSource2";
                //this.Page.Controls.Add(SqlDataSource2);
                //SqlDataSource2.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CString"].ConnectionString;
                //SqlDataSource2.SelectCommand = "Select Employee_Name,EvaluationDate,Opening,Probing,Troubleshooting,Sol_Res,Behavioural,Communication,CallEtiquettes,Setting_Expectation,CaseOwnership,CaseHandling from FY21CDTLegend where QAName='" + emp_name + "' order by AuditCount desc";
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
            Response.Redirect("AuditSheetOmnichannelQA.aspx?case=" + cass);

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
                SqlDataSource1.SelectCommand = "select EmployeeID,Employee_Name,CallID_SR_ID,CallDate,EvaluationDate,QAName,AuditStatus,AuditScore FROM [dbo].[FY22OmnnichannelLegend] where CaseID='" + searchbar.Text + "' or EmployeeID='" + searchbar.Text + "' order by AuditCount desc";
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
            Response.Redirect("22_Omnichannel_Legend.aspx");
        }
    }
}