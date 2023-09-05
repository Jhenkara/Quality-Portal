using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Net.Mail;
using System.Net;
using System.Text;

namespace Audit_Legends
{
    public partial class AuditSheetUserFY21SAPOS : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            //Hiding details
            tbId1.Visible = false;
            tbId1a.Visible = false;
            TextBox3.Visible = false;
            TextBox2.Visible = false;
            TextBox1.Visible = false;

            tbDispDetails.Visible = false;
            btnDispute.Visible = false;
            rfvDispDetails.Visible = false;

            if (string.IsNullOrEmpty(Convert.ToString(Session["Username"])))
            {
                Response.Redirect("AgentLogin.aspx?url=" + Server.UrlEncode(Request.Url.AbsoluteUri));
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
                bind_data();
            }

            DateTime d1 = DateTime.Now;
            DateTime d2 = tbId5.Text != string.Empty ? Convert.ToDateTime(tbId5.Text) : DateTime.MinValue;
            TimeSpan tspan = d1 - d2;
            //tbId13.Text = tspan.TotalDays.ToString();
            if (tspan.Days > 4)
            {
                btnDisp.Visible = false;
                btnAccept.Visible = false;
            }

            //string target = Request.Params["_EVENTTARGET"].ToString();
            if (!IsPostBack)
            {
                Con.Open();
                SqlCommand cmd1 = new SqlCommand("Update [dbo].[FY21SAPOSLegend] SET [AuditStatus]='Viewed' where CallID_SR_ID=@CallID_SR_ID and AuditStatus='Not Viewed'", Con);
                cmd1.Parameters.AddWithValue("@CallID_SR_ID", Request.QueryString["case"].ToString());
                cmd1.ExecuteNonQuery();
                Con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You have Viewed the Audit');", true);
            }
        }

        public void bind_data()
        {
            SqlCommand cmd = new SqlCommand("Select * from [dbo].[FY21SAPOSLegend] where CallID_SR_ID=@CallID_SR_ID and Employee_Mail=@Username", Con);
            cmd.Parameters.AddWithValue("@CallID_SR_ID", Request.QueryString["case"].ToString());
            cmd.Parameters.AddWithValue("@Username", Session["Username"]);
            cmd.Connection = Con;
            Con.Open();
            SqlDataAdapter daa = new SqlDataAdapter(cmd);

            DataTable dtt = new DataTable();
            daa.Fill(dtt);

            tbId1a.Text = dtt.Rows[0]["QAMail"].ToString();
            tbId1a.ReadOnly = true;

            tbId2.Text = dtt.Rows[0]["EmployeeID"].ToString();
            tbId2.ReadOnly = true;

            tbId3.Text = dtt.Rows[0]["Employee_Name"].ToString();
            tbId3.ReadOnly = true;

            TextBox3.Text = dtt.Rows[0]["Employee_Mail"].ToString();
            TextBox3.ReadOnly = true;

            TextBox2.Text = dtt.Rows[0]["TLMail"].ToString();
            TextBox2.ReadOnly = true;

            TextBox1.Text = dtt.Rows[0]["Reporting_Manager_Mail"].ToString();
            TextBox1.ReadOnly = true;

            tbBU.Text = dtt.Rows[0]["BusinessUnit"].ToString();
            tbBU.ReadOnly = true;

            tbMonth.Text = dtt.Rows[0]["Month"].ToString();
            tbMonth.ReadOnly = true;

            TextBox5.Text = dtt.Rows[0]["TLName"].ToString();
            TextBox5.ReadOnly = true;

            TextBox6.Text = dtt.Rows[0]["Reporting_Manager"].ToString();
            TextBox6.ReadOnly = true;

            tbTeamName.Text = dtt.Rows[0]["TeamName"].ToString();
            tbTeamName.ReadOnly = true;

            TextBox4.Text = dtt.Rows[0]["CCMail"].ToString();
            TextBox4.ReadOnly = true;

            tbId4.Text = dtt.Rows[0]["CallDate"].ToString();
            tbId4.ReadOnly = true;

            tbId5.Text = dtt.Rows[0]["EvaluationDate"].ToString();
            tbId5.ReadOnly = true;

            tbId6.Text = dtt.Rows[0]["CaseID"].ToString();
            tbId6.ReadOnly = true;

            tbId7.Text = dtt.Rows[0]["CallID_SR_ID"].ToString();
            tbId7.ReadOnly = true;

            tbId8.Text = dtt.Rows[0]["CallDuration"].ToString();
            tbId8.ReadOnly = true;

            tbCaseType.Text = dtt.Rows[0]["CaseType"].ToString();
            tbCaseType.ReadOnly = true;

            tbProbDes.Text = dtt.Rows[0]["ProblemDescription"].ToString();
            tbProbDes.ReadOnly = true;

            tbAuditRes.Text = dtt.Rows[0]["AuditResult"].ToString();
            tbAuditRes.ReadOnly = true;

            NonComptb.Text = dtt.Rows[0]["NonCompliance"].ToString();
            NonComptb.ReadOnly = true;

            tbNonComp.Text = dtt.Rows[0]["NonComplianceDetail"].ToString();
            tbNonComp.ReadOnly = true;

            TotalCompl.Text = dtt.Rows[0]["AuditScore"].ToString();

            CustCrit.Text = dtt.Rows[0]["CustCritical"].ToString();

            BusCrit.Text = dtt.Rows[0]["BusCritical"].ToString();

            //scoring

            Q01a.Text = dtt.Rows[0]["Opening1"].ToString();
            Q01a.ReadOnly = true;

            Q01b.Text = dtt.Rows[0]["Opening2"].ToString();
            Q01b.ReadOnly = true;

            Q01c.Text = dtt.Rows[0]["Opening3"].ToString();
            Q01c.ReadOnly = true;

            Q01d.Text = dtt.Rows[0]["Opening4"].ToString();
            Q01d.ReadOnly = true;

            C01.Text = dtt.Rows[0]["Opening_Cmnts"].ToString();
            C01.ReadOnly = true;

            Q02a.Text = dtt.Rows[0]["ToolUsage1"].ToString();
            Q02a.ReadOnly = true;

            Q02b.Text = dtt.Rows[0]["ToolUsage2"].ToString();
            Q02b.ReadOnly = true;

            Q02c.Text = dtt.Rows[0]["ToolUsage3"].ToString();
            Q02c.ReadOnly = true;

            Q02d.Text = dtt.Rows[0]["ToolUsage4"].ToString();
            Q02d.ReadOnly = true;

            C02.Text = dtt.Rows[0]["ToolUsage_Cmnts"].ToString();
            C02.ReadOnly = true;

            Q03.Text = dtt.Rows[0]["Probing"].ToString();
            Q03.ReadOnly = true;

            C03.Text = dtt.Rows[0]["Probing_Cmnts"].ToString();
            C03.ReadOnly = true;

            Q04.Text = dtt.Rows[0]["Sol_Res"].ToString();
            Q04.ReadOnly = true;

            C04.Text = dtt.Rows[0]["Sol_Res_Cmnts"].ToString();
            C04.ReadOnly = true;

            Q05a.Text = dtt.Rows[0]["Behavioural1"].ToString();
            Q05a.ReadOnly = true;

            Q05b.Text = dtt.Rows[0]["Behavioural2"].ToString();
            Q05b.ReadOnly = true;

            Q05c.Text = dtt.Rows[0]["Behavioural3"].ToString();
            Q05c.ReadOnly = true;

            Q05d.Text = dtt.Rows[0]["Behavioural4"].ToString();
            Q05d.ReadOnly = true;

            Q05e.Text = dtt.Rows[0]["Behavioural5"].ToString();
            Q05e.ReadOnly = true;

            C05.Text = dtt.Rows[0]["Behavioural_Cmnts"].ToString();
            C05.ReadOnly = true;

            Q06a.Text = dtt.Rows[0]["Communication1"].ToString();
            Q06a.ReadOnly = true;

            Q06b.Text = dtt.Rows[0]["Communication2"].ToString();
            Q06b.ReadOnly = true;

            Q06c.Text = dtt.Rows[0]["Communication3"].ToString();
            Q06c.ReadOnly = true;

            Q06d.Text = dtt.Rows[0]["Communication4"].ToString();
            Q06d.ReadOnly = true;

            C06.Text = dtt.Rows[0]["Communication_Cmnts"].ToString();
            C06.ReadOnly = true;

            Q07a.Text = dtt.Rows[0]["CustObsdBehav1"].ToString();
            Q07a.ReadOnly = true;

            Q07b.Text = dtt.Rows[0]["CustObsdBehav2"].ToString();
            Q07b.ReadOnly = true;

            Q07c.Text = dtt.Rows[0]["CustObsdBehav3"].ToString();
            Q07c.ReadOnly = true;

            Q07d.Text = dtt.Rows[0]["CustObsdBehav4"].ToString();
            Q07d.ReadOnly = true;

            Q07e.Text = dtt.Rows[0]["CustObsdBehav5"].ToString();
            Q07e.ReadOnly = true;

            C07.Text = dtt.Rows[0]["CustObsdBehav_Cmnts"].ToString();
            C07.ReadOnly = true;

            Q08.Text = dtt.Rows[0]["Time_Manage"].ToString();
            Q08.ReadOnly = true;

            C08.Text = dtt.Rows[0]["Time_Manage_Cmnts"].ToString();
            C08.ReadOnly = true;

            Q09.Text = dtt.Rows[0]["Callback"].ToString();
            Q09.ReadOnly = true;

            C09.Text = dtt.Rows[0]["Callback_Cmnts"].ToString();
            C09.ReadOnly = true;

            Q10a.Text = dtt.Rows[0]["CaseOwnership1"].ToString();
            Q10a.ReadOnly = true;

            Q10b.Text = dtt.Rows[0]["CaseOwnership2"].ToString();
            Q10b.ReadOnly = true;

            C10.Text = dtt.Rows[0]["CaseOwnership_Cmnts"].ToString();
            C10.ReadOnly = true;

            Q11a.Text = dtt.Rows[0]["Case_Call_Logging1"].ToString();
            Q11a.ReadOnly = true;

            Q11b.Text = dtt.Rows[0]["Case_Call_Logging2"].ToString();
            Q11b.ReadOnly = true;

            Q11c.Text = dtt.Rows[0]["Case_Call_Logging3"].ToString();
            Q11c.ReadOnly = true;

            Q11d.Text = dtt.Rows[0]["Case_Call_Logging4"].ToString();
            Q11d.ReadOnly = true;

            C11.Text = dtt.Rows[0]["Case_Call_Logging_Cmnts"].ToString();
            C11.ReadOnly = true;

            Q12.Text = dtt.Rows[0]["Closing"].ToString();
            Q12.ReadOnly = true;

            C12.Text = dtt.Rows[0]["Closing_Cmnts"].ToString();
            C12.ReadOnly = true;

            Q13.Text = dtt.Rows[0]["WOW_DAB"].ToString();
            Q13.ReadOnly = true;

            C13.Text = dtt.Rows[0]["WOW_DAB_Cmnts"].ToString();
            C13.ReadOnly = true;

            Q14.Text = dtt.Rows[0]["FCR"].ToString();
            Q14.ReadOnly = true;

            C14.Text = dtt.Rows[0]["FCR_Cmnts"].ToString();
            C14.ReadOnly = true;

            Con.Close();

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("AgentLogin.aspx");
        }

        protected void Accept_Button(object sender, EventArgs e)
        {
            Con.Open();
            SqlCommand cmd = new SqlCommand("Update [dbo].[FY21SAPOSLegend] SET [AuditStatus]='Accepted by Agent' where CallID_SR_ID=@CallID_SR_ID", Con);
            cmd.Parameters.AddWithValue("@CallID_SR_ID", Request.QueryString["case"].ToString());
            cmd.ExecuteNonQuery();
            Con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Your Response has been Received successfully');window.location ='UserDashboardFY21SAPOS.aspx';", true);
        }

        protected void Dispute_Button(object sender, EventArgs e)
        {
            tbDispDetails.Visible = true;
            btnDispute.Visible = true;
            tbDispDetails.Focus();
        }

        private bool SendEmail(string to, string from, string password, string subject, string body, string cc)
        {
            //,string[] bcc
            //ReturnClass.ReturnBool rb = new ReturnClass.ReturnBool();
            try
            {
                bool status = true;
                //byte[] bytes;
                //string fileName;

                MailMessage mail = new MailMessage();
                mail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                SmtpClient SmtpServer = new SmtpClient(ConfigurationManager.AppSettings["smtpServer"].ToString());
                mail.From = new MailAddress(from);
                mail.To.Add(to);
                string[] ccc = TextBox4.Text.Split(';');
                mail.CC.Add(cc);


                mail.CC.Add(TextBox1.Text); //Adding Manager to CC
                //mail.CC.Add(TextBox2.Text); //Adding TL to CC

                foreach (string CCEmail in ccc)
                {
                    if (!string.IsNullOrWhiteSpace(CCEmail))
                    {
                        mail.CC.Add(new MailAddress(CCEmail)); //Adding Multiple CC email Id
                    }
                }

                mail.Subject = "SAPOS Audit | " + tbId3.Text + " | Dispute";
                mail.Body = body;
                mail.IsBodyHtml = true;
                SmtpServer.Port = Convert.ToInt32(ConfigurationManager.AppSettings["smtpPort"]);
                SmtpServer.UseDefaultCredentials = false;
                string AgentName = Convert.ToString(Session["Username"]);
                SmtpServer.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings[AgentName], ConfigurationManager.AppSettings["smtpPass"].ToString());
                SmtpServer.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                SmtpServer.Send(mail);
            }


            //SmtpServer.Send(mail);
            //rb.status = true;

            // }
            catch (Exception ex)
            {
                //rb.message = ex.ToString();
                //rb.status = false;
            }
            return true;
        }
        public bool maildetails()
        {
            string body2 = "A dispute has been raised against an Audit for the below mentioned Call ID. You can review the audit by logging in to the following URL";
            string case_id = "Call ID is : " + tbId7.Text;
            string body = "http://15.42.19.247:120/AuditSheetSAPOSQA.aspx?case=" + tbId7.Text;
            string body1 = "<b style=" + "color:red" + "><i>Dispute Details : </i></b>" + tbDispDetails.Text;
            string salutation1 = "Warm Regards,";
            string signature = tbId3.Text;


            StringBuilder sb = new StringBuilder();
            sb.AppendLine("<div style=\"  width:1100px;  padding-left:5px;border:1px solid; \" >");
            sb.AppendLine("<table width=1100px style=table-layout:fixed;  >");
            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=2><span style=\"font-family: 'Times New Roman'; text-align:center; font-size:25px; font-weight:bold\">  </span> </th>");
            sb.AppendLine("</tr>");

            sb.AppendLine("<tr>");
            sb.AppendLine("<th style=\"font-family: 'Verdana'; text-align:left; font-size:14px;font-weight:200; \"><b style='font-family:Times New Roman, sans-serif;color:Black'> </b>Hi " + tbId1.Text + "</th>");
            sb.AppendLine("</tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=2><br> </th>");
            sb.AppendLine("</tr>");

            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=2><span style=\"font-family: 'Times New Roman'; text-align:center; font-size:25px; font-weight:bold\">  </span> </th>");
            sb.AppendLine("</tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp; " + body2 + " </td>");
            sb.AppendLine("</tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=2><br> </th>");
            sb.AppendLine("</tr>");

            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=2><span style=\"font-family: 'Times New Roman'; text-align:center; font-size:25px; font-weight:bold\">  </span> </th>");
            sb.AppendLine("</tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp; " + case_id + "</td>");
            sb.AppendLine("</tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=2><br> </th>");

            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=2><span style=\"font-family: 'Times New Roman'; text-align:center; font-size:25px; font-weight:bold\">  </span> </th>");
            sb.AppendLine("</tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp; " + body + " </td>");
            sb.AppendLine("</tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=2><br> </th>");
            sb.AppendLine("</tr>");

            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=1><span style=\"font-family: 'Times New Roman'; text-align:center; font-size:25px; font-weight:bold\">  </span> </th>");
            sb.AppendLine("</tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp; " + body1 + "</td>");
            sb.AppendLine("</tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=2><br> </th>");
            sb.AppendLine("</tr>");


            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=2><span style=\"font-family: 'Times New Roman'; text-align:center; font-size:25px; font-weight:bold\">  </span> </th>");
            sb.AppendLine("</tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp; " + salutation1 + " </td>");
            sb.AppendLine("</tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp; " + signature + " </td>");
            sb.AppendLine("</tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=2><br> </th>");
            sb.AppendLine("</tr>");

            //test credentials
            //string from = "apjchangemanagement@hp.com";
            ////string from = "nikhil.r@hp.com";
            //string to = "nikhil.r@hp.com";
            //string cc = "neetan.t.n@hp.com";

            ////working Credentials
            string AgentName = Convert.ToString(Session["Username"]);
            string from = AgentName;
            string to = tbId1a.Text;
            string cc = AgentName;
            //string cc = "shaziya.sadaf@hp.com";

            string password = "bid.sun-21";
            string subject = sb.ToString();
            body = sb.ToString();

            bool status = SendEmail(to, from, password, subject, string.Format(body), cc);
            return true;
        }

        protected void DisputeOptions(object sender, EventArgs e)
        {
            if (tbDispDetails.Text == "")
            {
                tbDispDetails.Visible = true;
                btnDispute.Visible = true;
                tbDispDetails.Focus();
                rfvDispDetails.Visible = true;
            }

            else
            {
                Con.Open();
                SqlCommand cmd = new SqlCommand("Update [dbo].[FY21SAPOSLegend] SET [AuditStatus]='Disputed by Agent' where CallID_SR_ID=@CallID_SR_ID", Con);
                cmd.Parameters.AddWithValue("@CallID_SR_ID", Request.QueryString["case"].ToString());
                cmd.Connection = Con;
                cmd.ExecuteNonQuery();
                Con.Close();
                maildetails();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Your Response has been Received successfully');window.location ='UserDashboardFY21SAPOS.aspx';", true);
            }
        }

        protected void EngDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardFY21SAPOS.aspx");
        }
    }
}