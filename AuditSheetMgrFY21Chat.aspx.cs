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
    public partial class AuditSheetMgrFY21Chat : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            //Hiding details
            tbId1.Visible = false;
            tbId1a.Visible = false;
            TextBox3.Visible = false;

            tbDispDetails.Visible = false;
            btnDispute.Visible = false;
            rfvDispDetails.Visible = false;

            if (string.IsNullOrEmpty(Convert.ToString(Session["Username"])))
            {
                Response.Redirect("MgrLogin.aspx?url=" + Server.UrlEncode(Request.Url.AbsoluteUri));
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
        }

        public void bind_data()
        {
            SqlCommand cmd = new SqlCommand("Select * from [dbo].[FY21ChatLegend] where (ChatID_SR_ID=@ChatID_SR_ID and Reporting_Manager_Mail=@Username) or (ChatID_SR_ID=@ChatID_SR_ID and TLMail=@Username) or (ChatID_SR_ID=@ChatID_SR_ID and CCMail like '%'+ @Username + '%')", Con);
            cmd.Parameters.AddWithValue("@ChatID_SR_ID", Request.QueryString["case"].ToString());
            cmd.Parameters.AddWithValue("@Username", Session["Username"]);
            cmd.Connection = Con;
            Con.Open();
            SqlDataAdapter daa = new SqlDataAdapter(cmd);

            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            tbId2.Text = dtt.Rows[0]["EmployeeID"].ToString();
            tbId2.ReadOnly = true;

            tbId3.Text = dtt.Rows[0]["Employee_Name"].ToString();
            tbId3.ReadOnly = true;

            TextBox3.Text = dtt.Rows[0]["Employee_Mail"].ToString();
            TextBox3.ReadOnly = true;

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

            tbId4.Text = dtt.Rows[0]["ChatDate"].ToString();
            tbId4.ReadOnly = true;

            tbId5.Text = dtt.Rows[0]["EvaluationDate"].ToString();
            tbId5.ReadOnly = true;

            tbId6.Text = dtt.Rows[0]["CaseID"].ToString();
            tbId6.ReadOnly = true;

            tbId7.Text = dtt.Rows[0]["ChatID_SR_ID"].ToString();
            tbId7.ReadOnly = true;

            tbId8.Text = dtt.Rows[0]["ChatDuration"].ToString();
            tbId8.ReadOnly = true;

            tbAuditType.Text = dtt.Rows[0]["AuditType"].ToString();
            tbAuditType.ReadOnly = true;

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

            Q01e.Text = dtt.Rows[0]["Opening5"].ToString();
            Q01e.ReadOnly = true;

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

            Q02e.Text = dtt.Rows[0]["ToolUsage5"].ToString();
            Q02e.ReadOnly = true;

            Q02f.Text = dtt.Rows[0]["ToolUsage6"].ToString();
            Q02f.ReadOnly = true;

            Q02g.Text = dtt.Rows[0]["ToolUsage7"].ToString();
            Q02g.ReadOnly = true;

            Q02h.Text = dtt.Rows[0]["ToolUsage8"].ToString();
            Q02h.ReadOnly = true;

            C02.Text = dtt.Rows[0]["ToolUsage_Cmnts"].ToString();
            C02.ReadOnly = true;

            Q03.Text = dtt.Rows[0]["Probing"].ToString();
            Q03.ReadOnly = true;

            C03.Text = dtt.Rows[0]["Probing_Cmnts"].ToString();
            C03.ReadOnly = true;

            Q04.Text = dtt.Rows[0]["Troubleshooting"].ToString();
            Q04.ReadOnly = true;

            C04.Text = dtt.Rows[0]["Troubleshooting_Cmnts"].ToString();
            C04.ReadOnly = true;

            Q05.Text = dtt.Rows[0]["Sol_Res"].ToString();
            Q05.ReadOnly = true;

            C05.Text = dtt.Rows[0]["Sol_Res_Cmnts"].ToString();
            C05.ReadOnly = true;

            Q06a.Text = dtt.Rows[0]["Behavioural1"].ToString();
            Q06a.ReadOnly = true;

            Q06b.Text = dtt.Rows[0]["Behavioural2"].ToString();
            Q06b.ReadOnly = true;

            Q06c.Text = dtt.Rows[0]["Behavioural3"].ToString();
            Q06c.ReadOnly = true;

            Q06d.Text = dtt.Rows[0]["Behavioural4"].ToString();
            Q06d.ReadOnly = true;

            Q06e.Text = dtt.Rows[0]["Behavioural5"].ToString();
            Q06e.ReadOnly = true;

            C06.Text = dtt.Rows[0]["Behavioural_Cmnts"].ToString();
            C06.ReadOnly = true;

            Q07a.Text = dtt.Rows[0]["Communication1"].ToString();
            Q07a.ReadOnly = true;

            Q07b.Text = dtt.Rows[0]["Communication2"].ToString();
            Q07b.ReadOnly = true;

            Q07c.Text = dtt.Rows[0]["Communication3"].ToString();
            Q07c.ReadOnly = true;

            Q07d.Text = dtt.Rows[0]["Communication4"].ToString();
            Q07d.ReadOnly = true;

            C07.Text = dtt.Rows[0]["Communication_Cmnts"].ToString();
            C07.ReadOnly = true;

            Q08a.Text = dtt.Rows[0]["CustObsdBehav1"].ToString();
            Q08a.ReadOnly = true;

            Q08b.Text = dtt.Rows[0]["CustObsdBehav2"].ToString();
            Q08b.ReadOnly = true;

            Q08c.Text = dtt.Rows[0]["CustObsdBehav3"].ToString();
            Q08c.ReadOnly = true;

            Q08d.Text = dtt.Rows[0]["CustObsdBehav4"].ToString();
            Q08d.ReadOnly = true;

            Q08e.Text = dtt.Rows[0]["CustObsdBehav5"].ToString();
            Q08e.ReadOnly = true;

            C08.Text = dtt.Rows[0]["CustObsdBehav_Cmnts"].ToString();
            C08.ReadOnly = true;

            Q09.Text = dtt.Rows[0]["Time_Manage"].ToString();
            Q09.ReadOnly = true;

            C09.Text = dtt.Rows[0]["Time_Manage_Cmnts"].ToString();
            C09.ReadOnly = true;

            Q12.Text = dtt.Rows[0]["Callback"].ToString();
            Q12.ReadOnly = true;

            C12.Text = dtt.Rows[0]["Callback_Cmnts"].ToString();
            C12.ReadOnly = true;

            Q13a.Text = dtt.Rows[0]["CaseOwnership1"].ToString();
            Q13a.ReadOnly = true;

            Q13b.Text = dtt.Rows[0]["CaseOwnership2"].ToString();
            Q13b.ReadOnly = true;

            Q13c.Text = dtt.Rows[0]["CaseOwnership3"].ToString();
            Q13c.ReadOnly = true;

            Q13d.Text = dtt.Rows[0]["CaseOwnership4"].ToString();
            Q13d.ReadOnly = true;

            C13.Text = dtt.Rows[0]["CaseOwnership_Cmnts"].ToString();
            C13.ReadOnly = true;

            Q10.Text = dtt.Rows[0]["Case_Call_Logging"].ToString();
            Q10.ReadOnly = true;

            C10.Text = dtt.Rows[0]["Case_Call_Logging_Cmnts"].ToString();
            C10.ReadOnly = true;

            Q11.Text = dtt.Rows[0]["Closing"].ToString();
            Q11.ReadOnly = true;

            C11.Text = dtt.Rows[0]["Closing_Cmnts"].ToString();
            C11.ReadOnly = true;

            Q14.Text = dtt.Rows[0]["WOW_DAB"].ToString();
            Q14.ReadOnly = true;

            C14.Text = dtt.Rows[0]["WOW_DAB_Cmnts"].ToString();
            C14.ReadOnly = true;

            Q15a.Text = dtt.Rows[0]["SAPOS"].ToString();
            Q15a.ReadOnly = true;

            Q15.Text = dtt.Rows[0]["SAPOS1a"].ToString();
            Q15.ReadOnly = true;

            Q15b.Text = dtt.Rows[0]["SAPOS1b"].ToString();
            Q15b.ReadOnly = true;

            C15.Text = dtt.Rows[0]["SAPOS1_Cmnts"].ToString();
            C15.ReadOnly = true;

            Q16.Text = dtt.Rows[0]["SAPOS2"].ToString();
            Q16.ReadOnly = true;

            C16.Text = dtt.Rows[0]["SAPOS2_Cmnts"].ToString();
            C16.ReadOnly = true;

            Q17.Text = dtt.Rows[0]["SAPOS3"].ToString();
            Q17.ReadOnly = true;

            C17.Text = dtt.Rows[0]["SAPOS3_Cmnts"].ToString();
            C17.ReadOnly = true;

            Q18.Text = dtt.Rows[0]["FCR"].ToString();
            Q18.ReadOnly = true;

            C18.Text = dtt.Rows[0]["FCR_Cmnts"].ToString();
            C18.ReadOnly = true;

            Con.Close();

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("MgrLogin.aspx");
        }

        protected void Accept_Button(object sender, EventArgs e)
        {
            Con.Open();
            SqlCommand cmd = new SqlCommand("Update [dbo].[FY21ChatLegend] SET [AuditStatus]='Accepted by Manager' where ChatID_SR_ID=@ChatID_SR_ID", Con);
            cmd.Parameters.AddWithValue("@ChatID_SR_ID", Request.QueryString["case"].ToString());
            cmd.ExecuteNonQuery();
            Con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Your Response has been Received successfully');window.location ='MgrDashboardChat.aspx';", true);
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
                

                foreach (string CCEmail in ccc)
                {
                    if (!string.IsNullOrWhiteSpace(CCEmail))
                    {
                        mail.CC.Add(new MailAddress(CCEmail)); //Adding Multiple CC email Id
                    }
                }

                mail.Subject = "Chat Audit | " + tbId3.Text + " | Dispute";
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
            string body2 = "A dispute has been raised against an Audit for the below mentioned Case ID. You can review the audit by logging in to the following URL";
            string case_id = "Chat ID is : " + tbId7.Text;
            string body = "http://15.42.19.247:120/AuditSheetVoiceQA.aspx?case=" + tbId7.Text;
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
                SqlCommand cmd = new SqlCommand("Update [dbo].[FY21ChatLegend] SET [AuditStatus]='Disputed by Manager' where ChatID_SR_ID=@ChatID_SR_ID", Con);
                cmd.Parameters.AddWithValue("@ChatID_SR_ID", Request.QueryString["case"].ToString());
                cmd.Connection = Con;
                cmd.ExecuteNonQuery();
                Con.Close();
                maildetails();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Your Response has been Received successfully');window.location ='MgrDashboardChat.aspx';", true);
            }
        }
    }
}