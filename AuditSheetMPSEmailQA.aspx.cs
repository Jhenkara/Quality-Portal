﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Net.Mail;
using System.Net;
using System.Text;

namespace Audit_Legends
{
    public partial class AuditSheetMPSEmailQA : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        StringBuilder table = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {


            //Hiding details
            tbId1.Visible = false;
            tbId1a.Visible = false;
            TextBox2.Visible = false;
            TextBox3.Visible = false;
            TextBox1.Visible = false;


            if (Session["Username"] == null)
            { Response.Redirect("QALogin.aspx"); }
            else
            {
                SqlCommand cmd = new SqlCommand("Select EmployeeFullName,ReportingManager from tblHeadCount where EmployeeEmailID=@EmailAddress", Con);
                cmd.Parameters.AddWithValue("@EmailAddress", Session["Username"]);
                cmd.Connection = Con;
                Con.Open();
                SqlDataAdapter daa = new SqlDataAdapter(cmd);

                DataTable dtt = new DataTable();
                daa.Fill(dtt);
                string emp_name = dtt.Rows[0]["EmployeeFullName"].ToString();
                tbId1.Text = emp_name;
                tbId1.ReadOnly = true;
                tbId1a.Text = Convert.ToString(Session["Username"]);
                tbId1a.ReadOnly = true;
                lblUserDetails.Text = "Hello " + emp_name;
                Con.Close();
                if (!IsPostBack)
                {
                    bind_data();

                }
            }
        }

        public void bind_data()
        {
            SqlCommand cmd = new SqlCommand("Select * from [dbo].[FY22MPS_EmailLegend] where CaseID=@CaseID and QAMail=@Username", Con);
            cmd.Parameters.AddWithValue("@CaseID", Request.QueryString["case"].ToString());
            cmd.Parameters.AddWithValue("@Username", Session["Username"]);
            cmd.Connection = Con;
            Con.Open();
            SqlDataAdapter daa = new SqlDataAdapter(cmd);

            DataTable dtt = new DataTable();
            daa.Fill(dtt);

            tbId2.Text = dtt.Rows[0]["EmployeeID"].ToString();

            tbId3.Text = dtt.Rows[0]["Employee_Name"].ToString();
            tbId3.ReadOnly = true;

            TextBox3.Text = dtt.Rows[0]["Employee_Mail"].ToString();
            TextBox3.ReadOnly = true;

            ddBU.SelectedItem.Text = dtt.Rows[0]["BusinessUnit"].ToString();

            ddBS.SelectedItem.Text = dtt.Rows[0]["BusinessSegment"].ToString();

            ddMonth.SelectedItem.Text = dtt.Rows[0]["Month"].ToString();

            TextBox5.Text = dtt.Rows[0]["TLName"].ToString();
            TextBox5.ReadOnly = true;

            TextBox6.Text = dtt.Rows[0]["Reporting_Manager"].ToString();
            TextBox6.ReadOnly = true;

            TextBox2.Text = dtt.Rows[0]["TLMail"].ToString();

            TextBox1.Text = dtt.Rows[0]["Reporting_Manager_Mail"].ToString();

            tbTeamName.Text = dtt.Rows[0]["TeamName"].ToString();
            tbTeamName.ReadOnly = true;

            TextBox4.Text = dtt.Rows[0]["CCMail"].ToString();

            tbId4.Text = dtt.Rows[0]["CallDate"].ToString();

            tbId5.Text = dtt.Rows[0]["EvaluationDate"].ToString();
            tbId5.ReadOnly = true;

            tbId6.Text = dtt.Rows[0]["CaseID"].ToString();
            tbId6.ReadOnly = true;

            tbId7.Text = dtt.Rows[0]["CallID_SR_ID"].ToString();
            tbId7.ReadOnly = true;

            ddCallDuration.SelectedItem.Text = dtt.Rows[0]["CallDuration"].ToString();

            ddCaseType.SelectedItem.Text = dtt.Rows[0]["CaseType"].ToString();

            ddProbDes.SelectedItem.Text = dtt.Rows[0]["ProblemDescription"].ToString();

            tbAuditRes.Text = dtt.Rows[0]["AuditResult"].ToString();
            tbAuditRes.ReadOnly = true;

            ddNonComp.SelectedItem.Text = dtt.Rows[0]["NonCompliance"].ToString();

            tbNonComp.Text = dtt.Rows[0]["NonComplianceDetail"].ToString();

            TotalCompl.Text = dtt.Rows[0]["AuditScore"].ToString();

            CustCrit.Text = dtt.Rows[0]["CustCritical"].ToString();

            BusCrit.Text = dtt.Rows[0]["BusCritical"].ToString();

            //scoring

            Q01.SelectedItem.Text = dtt.Rows[0]["ActionCaseWithinTime"].ToString();

            Q01a.SelectedItem.Text = dtt.Rows[0]["ActionCaseWithinTime1"].ToString();

            Q01b.SelectedItem.Text = dtt.Rows[0]["ActionCaseWithinTime2"].ToString();

            C01.Text = dtt.Rows[0]["ActionCaseWithinTime_Cmnts"].ToString();

            Q02.SelectedItem.Text = dtt.Rows[0]["ActionWithRightDocs"].ToString();

            C02.Text = dtt.Rows[0]["ActionWithRightDocs_Cmnts"].ToString();

            Q03.SelectedItem.Text = dtt.Rows[0]["RightTonerSupplies"].ToString();

            C03.Text = dtt.Rows[0]["RightTonerSupplies_Cmnts"].ToString();

            Q04.SelectedItem.Text = dtt.Rows[0]["Res_Info"].ToString();

            C04.Text = dtt.Rows[0]["Res_Info"].ToString();

            Q05.SelectedItem.Text = dtt.Rows[0]["Behavioural"].ToString();

            Q05a.SelectedItem.Text = dtt.Rows[0]["Behavioural1"].ToString();

            Q05b.SelectedItem.Text = dtt.Rows[0]["Behavioural2"].ToString();

            Q05c.SelectedItem.Text = dtt.Rows[0]["Behavioural3"].ToString();

            Q05d.SelectedItem.Text = dtt.Rows[0]["Behavioural4"].ToString();

            Q05e.SelectedItem.Text = dtt.Rows[0]["Behavioural5"].ToString();

            Q05f.SelectedItem.Text = dtt.Rows[0]["Behavioural6"].ToString();

            C05.Text = dtt.Rows[0]["Behavioural_Cmnts"].ToString();

            Q06.SelectedItem.Text = dtt.Rows[0]["EmailCommunication"].ToString();

            Q06a.SelectedItem.Text = dtt.Rows[0]["EmailCommunication1"].ToString();

            Q06b.SelectedItem.Text = dtt.Rows[0]["EmailCommunication2"].ToString();

            Q06c.SelectedItem.Text = dtt.Rows[0]["EmailCommunication3"].ToString();

            C06.Text = dtt.Rows[0]["EmailCommunication_Cmnts"].ToString();

            Q07.SelectedItem.Text = dtt.Rows[0]["Setting_Expectation"].ToString();

            C07.Text = dtt.Rows[0]["Setting_Expectation_Cmnts"].ToString();

            Q08.SelectedItem.Text = dtt.Rows[0]["CaseOwnership"].ToString();

            Q08a.SelectedItem.Text = dtt.Rows[0]["CaseOwnership1"].ToString();

            Q08b.SelectedItem.Text = dtt.Rows[0]["CaseOwnership2"].ToString();

            Q08c.SelectedItem.Text = dtt.Rows[0]["CaseOwnership3"].ToString();

            Q08d.SelectedItem.Text = dtt.Rows[0]["CaseOwnership4"].ToString();

            C08.Text = dtt.Rows[0]["CaseOwnership_Cmnts"].ToString();

            Q09.SelectedItem.Text = dtt.Rows[0]["Documentation"].ToString();

            C09.Text = dtt.Rows[0]["Documentation_Cmnts"].ToString();

            Q10.SelectedItem.Text = dtt.Rows[0]["WOW_DAB"].ToString();

            C10.Text = dtt.Rows[0]["WOW_DAB_Cmnts"].ToString();

            Con.Close();

        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string Compl = Convert.ToString(TotalCompl.Text);

            Con.Open();
            SqlCommand cmd = Con.CreateCommand();

            string CommandText = "UPDATE [dbo].[FY22MPS_EmailLegend] SET Month=@Month,EmployeeID=@EmployeeID,Employee_Name=@Employee_Name,Employee_Mail=@Employee_Mail,TLName=@TLName,TLMail=@TLMail,Reporting_Manager=@Reporting_Manager,Reporting_Manager_Mail=@Reporting_Manager_Mail,TeamName=@TeamName,CCMail=@CCMail,CaseID=@CaseID,CallID_SR_ID=@CallID_SR_ID,NonCompliance=@NonCompliance,NonComplianceDetail=@NonComplianceDetail,NonComplianceScore=@NonComplianceScore,AuditScore=@AuditScore,CustCritical=@CustCritical,BusCritical=@BusCritical,ActionCaseWithinTime=@ActionCaseWithinTime,ActionCaseWithinTime1=@ActionCaseWithinTime1,ActionCaseWithinTime2=@ActionCaseWithinTime2,ActionCaseWithinTime_Cmnts=@ActionCaseWithinTime_Cmnts,ActionWithRightDocs=@ActionWithRightDocs,ActionWithRightDocs_Cmnts=@ActionWithRightDocs_Cmnts,RightTonerSupplies=@RightTonerSupplies,RightTonerSupplies_Cmnts=@RightTonerSupplies_Cmnts,Res_Info=@Res_Info,Res_Info_Cmnts=@Res_Info_Cmnts,Behavioural=@Behavioural,Behavioural1=@Behavioural1,Behavioural2=@Behavioural2,Behavioural3=@Behavioural3,Behavioural4=@Behavioural4,Behavioural5=@Behavioural5,Behavioural6=@Behavioural6,Behavioural_Cmnts=@Behavioural_Cmnts,EmailCommunication=@EmailCommunication,EmailCommunication1=@EmailCommunication1,EmailCommunication2=@EmailCommunication2,EmailCommunication3=@EmailCommunication3,EmailCommunication_Cmnts=@EmailCommunication_Cmnts,Setting_Expectation=@Setting_Expectation,Setting_Expectation_Cmnts=@Setting_Expectation_Cmnts,CaseOwnership=@CaseOwnership,CaseOwnership1=@CaseOwnership1,CaseOwnership2=@CaseOwnership2,CaseOwnership3=@CaseOwnership3,CaseOwnership4=@CaseOwnership4,CaseOwnership_Cmnts=@CaseOwnership_Cmnts,Documentation=@Documentation,Documentation_Cmnts=@Documentation_Cmnts,WOW_DAB=@WOW_DAB,WOW_DAB_Cmnts=@WOW_DAB_Cmnts,AuditResult=@AuditResult,[AuditStatus]='Resolved' WHERE CaseID=@CaseID";
            cmd = new SqlCommand(CommandText, Con);
            cmd.Parameters.AddWithValue("@QAName", tbId1.Text);
            cmd.Parameters.AddWithValue("@QAMail", tbId1a.Text);
            cmd.Parameters.AddWithValue("@BusinessUnit", ddBU.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@BusinessSegment", ddBS.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Month", ddMonth.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@EmployeeID", tbId2.Text);
            cmd.Parameters.AddWithValue("@Employee_Name", tbId3.Text);
            cmd.Parameters.AddWithValue("@Employee_Mail", TextBox3.Text);
            cmd.Parameters.AddWithValue("@TLName", TextBox5.Text);
            cmd.Parameters.AddWithValue("@TLMail", TextBox2.Text);
            cmd.Parameters.AddWithValue("@Reporting_Manager", TextBox6.Text);
            cmd.Parameters.AddWithValue("@Reporting_Manager_Mail", TextBox1.Text);
            cmd.Parameters.AddWithValue("@TeamName", tbTeamName.Text);
            cmd.Parameters.AddWithValue("@CCMail", TextBox4.Text);
            cmd.Parameters.AddWithValue("@CaseID", tbId6.Text);
            cmd.Parameters.AddWithValue("@CallID_SR_ID", tbId7.Text);
            cmd.Parameters.AddWithValue("@CallDuration", ddCallDuration.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CaseType", ddCaseType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ProblemDescription", ddProbDes.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@NonCompliance", ddNonComp.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@NonComplianceDetail", tbNonComp.Text);
            cmd.Parameters.AddWithValue("@NonComplianceScore", hfv_NCS.Value);
            cmd.Parameters.AddWithValue("@AuditScore", Compliance.Value);
            cmd.Parameters.AddWithValue("@CustCritical", hfv_CustCrit.Value);
            cmd.Parameters.AddWithValue("@BusCritical", hfv_BusCrit.Value);
            cmd.Parameters.AddWithValue("@ActionCaseWithinTime", Q01.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ActionCaseWithinTime1", Q01a.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ActionCaseWithinTime2", Q01b.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ActionCaseWithinTime_Cmnts", C01.Text);
            cmd.Parameters.AddWithValue("@ActionWithRightDocs", Q02.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ActionWithRightDocs_Cmnts", C02.Text);
            cmd.Parameters.AddWithValue("@RightTonerSupplies", Q03.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@RightTonerSupplies_Cmnts", C03.Text);
            cmd.Parameters.AddWithValue("@Res_Info", Q04.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Res_Info_Cmnts", C04.Text);
            cmd.Parameters.AddWithValue("@Behavioural", Q05.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Behavioural1", Q05a.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Behavioural2", Q05b.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Behavioural3", Q05c.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Behavioural4", Q05d.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Behavioural5", Q05e.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Behavioural6", Q05f.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Behavioural_Cmnts", C05.Text);
            cmd.Parameters.AddWithValue("@EmailCommunication", Q06.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@EmailCommunication1", Q06a.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@EmailCommunication2", Q06b.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@EmailCommunication3", Q06c.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@EmailCommunication_Cmnts", C06.Text);
            cmd.Parameters.AddWithValue("@Setting_Expectation", Q07.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Setting_Expectation_Cmnts", C07.Text);
            cmd.Parameters.AddWithValue("@CaseOwnership", Q08.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CaseOwnership1", Q08a.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CaseOwnership2", Q08b.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CaseOwnership3", Q08c.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CaseOwnership4", Q08d.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CaseOwnership_Cmnts", C08.Text);
            cmd.Parameters.AddWithValue("@Documentation", Q09.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Documentation_Cmnts", C09.Text);
            cmd.Parameters.AddWithValue("@WOW_DAB", Q10.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@WOW_DAB_Cmnts", C10.Text);
            cmd.Parameters.AddWithValue("@AuditResult", hfv_AuditRes.Value);
            SqlDataReader dr = cmd.ExecuteReader();
            Con.Close();
            maildetails();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Audit Updated Successfully');window.location ='QADashboardFY22MPSEmailLegend.aspx';", true);
        }

        private bool ResendEmail(string to, string from, string password, string subject, string body, string cc, string tl)
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
                if (!string.IsNullOrWhiteSpace(TextBox2.Text))
                {
                    mail.CC.Add(tl);
                }

                if (FileUploadControl.HasFile)
                {
                    string fileName = Path.GetFileName(FileUploadControl.PostedFile.FileName);
                    Attachment myAttachment = new Attachment(FileUploadControl.FileContent, fileName);
                    mail.Attachments.Add(myAttachment);
                }

                mail.CC.Add(TextBox1.Text); //Adding Manager to CC
                foreach (string CCEmail in ccc)
                {
                    if (!string.IsNullOrWhiteSpace(CCEmail))
                    {
                        mail.CC.Add(new MailAddress(CCEmail)); //Adding Multiple CC email Id
                    }
                }



                mail.Subject = "MPS PSCC Email Audit | " + ddMonth.SelectedItem.Text + " | " + tbId3.Text;
                mail.Body = body;
                mail.IsBodyHtml = true;
                SmtpServer.Port = Convert.ToInt32(ConfigurationManager.AppSettings["smtpPort"]);
                SmtpServer.UseDefaultCredentials = false;
                string QAName = Convert.ToString(Session["Username"]);
                SmtpServer.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings[QAName], ConfigurationManager.AppSettings["smtpPass"].ToString());
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
        public bool resend_maildetails()
        {
            string body2 = "An Audit has been conducted for the below mentioned Call ID. You can find your audit sheet to review by logging in to the following URL and provide a response.";
            string case_id = "Case ID is : " + tbId6.Text;
            string body = "http://15.42.19.247:120/AuditSheetUserFY22MPSEmail.aspx?case=" + tbId6.Text;
            string body0 = "<b style=" + "color:red" + "><i>Login Instructions :</i></b> To Login use your email ID as the Username and Employee Id as the Password";
            string body1 = "<b style=" + "color:red" + "><i>Note to the Engineer :</i></b> This Audit is open to discussion for the next 96 hours, there after the submitted score stands unchanged and audit status would change to <b><i>'Audited and Auto Accepted'<i/><b/>";
            string body3 = "<b style=" + "color:red" + "><i>Note to the Manager :</i></b> Please click on the below link to review the Engineer's Audit. To Login, use your email ID as the Username and Employee Id as the Password";
            string body4 = "http://15.42.19.247:120/AuditSheetMgrFY22MPSEmail.aspx?case=" + tbId6.Text;
            string salutation1 = "Warm Regards,";
            string signature = tbId1.Text;


            StringBuilder sb = new StringBuilder();
            sb.AppendLine("<div style=\"  width:1100px;  padding-left:5px;border:1px solid; \" >");
            sb.AppendLine("<table width=1100px style=table-layout:fixed;  >");
            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=2><span style=\"font-family: 'Times New Roman'; text-align:center; font-size:25px; font-weight:bold\">  </span> </th>");
            sb.AppendLine("</tr>");

            sb.AppendLine("<tr>");
            sb.AppendLine("<th style=\"font-family: 'Verdana'; text-align:left; font-size:14px;font-weight:200; \"><b style='font-family:Times New Roman, sans-serif;color:Black'> </b>Hi " + tbId3.Text + "</th>");
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
            sb.AppendLine("<th colspan=2><span style=\"font-family: 'Times New Roman'; text-align:center; font-size:25px; font-weight:bold\">  </span> </th>");
            sb.AppendLine("</tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp; " + body0 + " </td>");
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
            sb.AppendLine("<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp; " + body3 + " </td>");
            sb.AppendLine("</tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=2><br> </th>");
            sb.AppendLine("</tr>");

            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=1><span style=\"font-family: 'Times New Roman'; text-align:center; font-size:25px; font-weight:bold\">  </span> </th>");
            sb.AppendLine("</tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp; " + body4 + "</td>");
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
            string QAName = Convert.ToString(Session["Username"]);
            string from = QAName;
            string to = TextBox3.Text;
            string cc = QAName;
            string tl = TextBox2.Text;
            //string cc = "shaziya.sadaf@hp.com";

            string password = "bid.sun-21";
            string subject = sb.ToString();
            body = sb.ToString();

            bool status = ResendEmail(to, from, password, subject, string.Format(body), cc, tl);
            return true;
        }

        private bool SendEmail(string to, string from, string password, string subject, string body, string cc, string tl)
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
                if (!string.IsNullOrWhiteSpace(TextBox2.Text))
                {
                    mail.CC.Add(tl);
                }

                if (FileUploadControl.HasFile)
                {
                    string fileName = Path.GetFileName(FileUploadControl.PostedFile.FileName);
                    Attachment myAttachment = new Attachment(FileUploadControl.FileContent, fileName);
                    mail.Attachments.Add(myAttachment);
                }

                mail.CC.Add(TextBox1.Text); //Adding Manager to CC
                foreach (string CCEmail in ccc)
                {
                    if (!string.IsNullOrWhiteSpace(CCEmail))
                    {
                        mail.CC.Add(new MailAddress(CCEmail)); //Adding Multiple CC email Id
                    }
                }



                mail.Subject = "Resolved MPS PSCC Email Audit | " + ddMonth.SelectedItem.Text + " | " + tbId3.Text;
                mail.Body = body;
                mail.IsBodyHtml = true;
                SmtpServer.Port = Convert.ToInt32(ConfigurationManager.AppSettings["smtpPort"]);
                SmtpServer.UseDefaultCredentials = false;
                string QAName = Convert.ToString(Session["Username"]);
                SmtpServer.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings[QAName], ConfigurationManager.AppSettings["smtpPass"].ToString());
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
            string body2 = "An Audit has been conducted for the below mentioned Call ID. You can find your audit sheet to review by logging in to the following URL and provide a response.";
            string case_id = "Case ID is : " + tbId6.Text;
            string body = "http://15.42.19.247:120/AuditSheetUserFY22MPSEmail.aspx?case=" + tbId6.Text;
            string body0 = "<b style=" + "color:red" + "><i>Login Instructions :</i></b> To Login use your email ID as the Username and Employee Id as the Password";
            string body1 = "<b style=" + "color:red" + "><i>Note to the Engineer :</i></b> This Audit is open to discussion for the next 96 hours, there after the submitted score stands unchanged and audit status would change to <b><i>'Audited and Auto Accepted'<i/><b/>";
            string body3 = "<b style=" + "color:red" + "><i>Note to the Manager :</i></b> Please click on the below link to review the Engineer's Audit. To Login, use your email ID as the Username and Employee Id as the Password";
            string body4 = "http://15.42.19.247:120/AuditSheetMgrFY22MPSEmail.aspx?case=" + tbId6.Text;
            string salutation1 = "Warm Regards,";
            string signature = tbId1.Text;


            StringBuilder sb = new StringBuilder();
            sb.AppendLine("<div style=\"  width:1100px;  padding-left:5px;border:1px solid; \" >");
            sb.AppendLine("<table width=1100px style=table-layout:fixed;  >");
            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=2><span style=\"font-family: 'Times New Roman'; text-align:center; font-size:25px; font-weight:bold\">  </span> </th>");
            sb.AppendLine("</tr>");

            sb.AppendLine("<tr>");
            sb.AppendLine("<th style=\"font-family: 'Verdana'; text-align:left; font-size:14px;font-weight:200; \"><b style='font-family:Times New Roman, sans-serif;color:Black'> </b>Hi " + tbId3.Text + "</th>");
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
            sb.AppendLine("<th colspan=2><span style=\"font-family: 'Times New Roman'; text-align:center; font-size:25px; font-weight:bold\">  </span> </th>");
            sb.AppendLine("</tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp; " + body0 + " </td>");
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
            sb.AppendLine("<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp; " + body3 + " </td>");
            sb.AppendLine("</tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=2><br> </th>");
            sb.AppendLine("</tr>");

            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=1><span style=\"font-family: 'Times New Roman'; text-align:center; font-size:25px; font-weight:bold\">  </span> </th>");
            sb.AppendLine("</tr>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp; " + body4 + "</td>");
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
            string QAName = Convert.ToString(Session["Username"]);
            string from = QAName;
            string to = TextBox3.Text;
            string cc = QAName;
            string tl = TextBox2.Text;
            //string cc = "shaziya.sadaf@hp.com";

            string password = "bid.sun-21";
            string subject = sb.ToString();
            body = sb.ToString();

            bool status = SendEmail(to, from, password, subject, string.Format(body), cc, tl);
            return true;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("QALogin.aspx");
        }

        protected void tbId2_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select EmployeeFullName,EmployeeEmailID,TeamLeadName,TeamLeadEmailId,ReportingManager,TeamAlignment from tblHeadCount where EmployeeID=@EmployeeID", Con);
            cmd.Parameters.AddWithValue("@EmployeeID", tbId2.Text.Trim());
            cmd.Connection = Con;
            Con.Open();
            SqlDataAdapter daa = new SqlDataAdapter(cmd);

            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            string empl_name = dtt.Rows[0]["EmployeeFullName"].ToString();
            string empl_mail = dtt.Rows[0]["EmployeeEmailID"].ToString();
            string tl_name = dtt.Rows[0]["TeamLeadName"].ToString();
            string tl_mail = dtt.Rows[0]["TeamLeadEmailId"].ToString();
            string Mgr_name = dtt.Rows[0]["ReportingManager"].ToString();
            string TeamName = dtt.Rows[0]["TeamAlignment"].ToString();
            tbId3.Text = empl_name;
            tbId3.ReadOnly = true;
            TextBox3.Text = empl_mail;
            TextBox3.ReadOnly = true;
            TextBox5.Text = tl_name;
            TextBox5.ReadOnly = true;
            TextBox2.Text = tl_mail;
            TextBox2.ReadOnly = true;
            TextBox6.Text = Mgr_name;
            TextBox6.ReadOnly = true;
            tbTeamName.Text = TeamName;
            tbTeamName.ReadOnly = true;
            Con.Close();

        }

        protected void FileDownload(object sender, EventArgs e)
        {
            Response.Redirect("~/Download/FY23 MPS Email PSCC Report.xlsx");
        }

        protected void QADashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("QADashboardFY22MPSEmailLegend.aspx");
        }

        protected void btnCaseIdCheck_Click(object sender, EventArgs e)
        {
            Con.Open();
            SqlCommand cmd = new SqlCommand("select * from [dbo].[FY22MPS_EmailLegend] where CaseID=@CaseId", Con);
            cmd.Parameters.AddWithValue("@CaseId", tbId6.Text);
            cmd.Connection = Con;
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                lblCaseChk.Visible = true;
                lblCaseChk.Text = "Case ID exists!!";
                lblCaseChk.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblCaseChk.Visible = true;
                lblCaseChk.Text = "This is a new Case!!";
                lblCaseChk.ForeColor = System.Drawing.Color.Green;
            }
        }

        protected void btnCallIDChk(object sender, EventArgs e)
        {
            Con.Open();
            SqlCommand cmd = new SqlCommand("select * from [dbo].[FY22MPS_EmailLegend] where CallID_SR_ID=@CallID_SR_ID", Con);
            cmd.Parameters.AddWithValue("@CallID_SR_ID", tbId7.Text);
            cmd.Connection = Con;
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                lblCallIdChk.Visible = true;
                lblCallIdChk.Text = "Call ID exists!!";
                lblCallIdChk.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblCallIdChk.Visible = true;
                lblCallIdChk.Text = "This is a new Call ID!!";
                lblCallIdChk.ForeColor = System.Drawing.Color.Green;
            }
        }

        protected void MenuFeedback_Click(object sender, EventArgs e)
        {
            Response.Redirect("AuditFeedbackFormMPSEmail.aspx");
        }

        protected void SoMe_GuideLines_Click(object sender, EventArgs e)
        {
            //Page.ClientScript.RegisterStartupScript(
            //this.GetType(), "OpenWindow", "window.open('21_SoMeLegendGL.aspx','_newtab');", true); //Opens in a new Tab
            //Server.Transfer("21_ADXLegendGL.aspx");
        }

        protected void ddBU_SelectedIndexChanged(object sender, EventArgs e)
        {
            var value = ddBU.SelectedItem.Value;
            if (value == "0")
            {
                ddProbDes.Items.Clear();
                ddProbDes.Items.Insert(0, new ListItem("--Choose--", "-1"));
                ddProbDes.Items.Add("Battery / Adapter");
                ddProbDes.Items.Add("Battery Swelling");
                ddProbDes.Items.Add("BIOS");
                ddProbDes.Items.Add("Branding MPM Unlock / SMC Request");
                ddProbDes.Items.Add("BSOD");
                ddProbDes.Items.Add("Bundled Applications");
                ddProbDes.Items.Add("CID / Liquid Spillage");
                ddProbDes.Items.Add("Display / Graphics");
                ddProbDes.Items.Add("Dock Issues");
                ddProbDes.Items.Add("Driver Issue");
                ddProbDes.Items.Add("Fan Issue");
                ddProbDes.Items.Add("Hardware Related");
                ddProbDes.Items.Add("Information Call");
                ddProbDes.Items.Add("Internet Connectivity");
                ddProbDes.Items.Add("Keyboard");
                ddProbDes.Items.Add("Mouse / Touch Pad");
                ddProbDes.Items.Add("No Boot");
                ddProbDes.Items.Add("No Post");
                ddProbDes.Items.Add("No Power");
                ddProbDes.Items.Add("Operating System");
                ddProbDes.Items.Add("Part_Product query");
                ddProbDes.Items.Add("Performance");
                ddProbDes.Items.Add("Port I/O Related _ USB");
                ddProbDes.Items.Add("Product Specifications");
                ddProbDes.Items.Add("PSIR");
                ddProbDes.Items.Add("RCD");
                ddProbDes.Items.Add("Sound Issue");
                ddProbDes.Items.Add("Storage");
                ddProbDes.Items.Add("Third Party Apps");
                ddProbDes.Items.Add("Trade / SAPOS");
                ddProbDes.Items.Add("USB");
                ddProbDes.Items.Add("Warranty Update ");
                ddProbDes.Items.Add("Webcam");
                ddProbDes.Focus();
            }
            else if (value == "1")
            {
                ddProbDes.Items.Clear();
                ddProbDes.Items.Insert(0, new ListItem("--Choose--", "-1"));
                ddProbDes.Items.Add("ADF Issue");
                ddProbDes.Items.Add("Broken Part");
                ddProbDes.Items.Add("Carriage Jam");
                ddProbDes.Items.Add("Cartridges / Ink heads");
                ddProbDes.Items.Add("Communication");
                ddProbDes.Items.Add("Complaint");
                ddProbDes.Items.Add("CPMD");
                ddProbDes.Items.Add("Display / Touch screen Issue");
                ddProbDes.Items.Add("Duplexer");
                ddProbDes.Items.Add("Error Message");
                ddProbDes.Items.Add("Fax");
                ddProbDes.Items.Add("Hardware Issue");
                ddProbDes.Items.Add("Information Call");
                ddProbDes.Items.Add("Installation");
                ddProbDes.Items.Add("Instant Ink / Account Issue");
                ddProbDes.Items.Add("Jobs in queue");
                ddProbDes.Items.Add("Noise Issue");
                ddProbDes.Items.Add("Paper Jam");
                ddProbDes.Items.Add("Paper Pick");
                ddProbDes.Items.Add("Part Number");
                ddProbDes.Items.Add("Power related");
                ddProbDes.Items.Add("Pre Sales Query");
                ddProbDes.Items.Add("Print / Scan Quality");
                ddProbDes.Items.Add("Printer Offline");
                ddProbDes.Items.Add("Printing Issue");
                ddProbDes.Items.Add("Product Specifications");
                ddProbDes.Items.Add("Promotional Info");
                ddProbDes.Items.Add("Regionalization");
                ddProbDes.Items.Add("Scanning");
                ddProbDes.Items.Add("Slow Printing");
                ddProbDes.Items.Add("TC / PH / Ink");
                ddProbDes.Items.Add("Third Party Applications");
                ddProbDes.Items.Add("Trade / SAPOS");
                ddProbDes.Items.Add("Tray Settings");
                ddProbDes.Items.Add("Warranty Update ");
                ddProbDes.Items.Add("Wireless Printing");
                ddProbDes.Focus();
            }
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("22_Email_PSCC_MPS_Legend.aspx");
        }

        protected void btnSendMail_Click(object sender, EventArgs e)
        {
            resend_maildetails();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Mail Resent Successfully');window.location ='QADashboardFY22MPSEmailLegend.aspx';", true);
        }
    }
}