using System;
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
    public partial class AuditSheetQA_TOC : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            
            TextBox13.Visible = false;
            TextBox14.Visible = false;

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

        protected void QADashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("QADashboardTOC.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("QALogin.aspx");
        }

        protected void tbId2_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select EmployeeFullName,EmployeeEmailID,ReportingManager from tblHeadCount where EmployeeID=@EmployeeID", Con);
            cmd.Parameters.AddWithValue("@EmployeeID", tbId2.Text.Trim());
            cmd.Connection = Con;
            Con.Open();
            SqlDataAdapter daa = new SqlDataAdapter(cmd);

            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            string empl_name = dtt.Rows[0]["EmployeeFullName"].ToString();
            string empl_mail = dtt.Rows[0]["EmployeeEmailID"].ToString();
            string Mgr_name = dtt.Rows[0]["ReportingManager"].ToString();
            tbId3.Text = empl_name;
            tbId3.ReadOnly = true;
            TextBox3.Text = empl_mail;
            TextBox3.ReadOnly = true;
            TextBox6.Text = Mgr_name;
            TextBox6.ReadOnly = true;
            Con.Close();
        }

        public void bind_data()
        {
            SqlCommand cmd = new SqlCommand("Select * from [dbo].[TOCLegend] where CaseID=@CaseID and QAMail=@Username", Con);
            cmd.Parameters.AddWithValue("@CaseID", Request.QueryString["case"].ToString());
            cmd.Parameters.AddWithValue("@Username", Session["Username"]);
            cmd.Connection = Con;
            Con.Open();
            SqlDataAdapter daa = new SqlDataAdapter(cmd);

            DataTable dtt = new DataTable();
            daa.Fill(dtt);

            ddCusType.SelectedItem.Text = dtt.Rows[0]["CustomerType"].ToString();

            ddBU.SelectedItem.Text = dtt.Rows[0]["BusinessUnit"].ToString();

            ddBS.SelectedItem.Text = dtt.Rows[0]["BusinessSegment"].ToString();

            ddDeliType.SelectedItem.Text = dtt.Rows[0]["DeliveryType"].ToString();

            ddMonth.SelectedItem.Text = dtt.Rows[0]["Month"].ToString();

            tbId2.Text = dtt.Rows[0]["EmployeeID"].ToString();

            tbId3.Text = dtt.Rows[0]["Employee_Name"].ToString();
            tbId3.ReadOnly = true;

            TextBox3.Text = dtt.Rows[0]["Employee_Mail"].ToString();
            TextBox3.ReadOnly = true;

            TextBox15.Text = dtt.Rows[0]["TLName"].ToString();
            TextBox15.ReadOnly = true;

            TextBox13.Text = dtt.Rows[0]["TLMail"].ToString();
            TextBox13.ReadOnly = true;

            TextBox6.Text = dtt.Rows[0]["Reporting_Manager"].ToString();
            TextBox6.ReadOnly = true;

            TextBox14.Text = dtt.Rows[0]["Reporting_Manager_Mail"].ToString();
            TextBox14.ReadOnly = true;

            ddTeamName.SelectedItem.Text = dtt.Rows[0]["TeamName"].ToString();

            TextBox4.Text = dtt.Rows[0]["CCMail"].ToString();

            tbId4.Text = dtt.Rows[0]["CallDate"].ToString();

            tbId5.Text = dtt.Rows[0]["EvaluationDate"].ToString();
            tbId5.ReadOnly = true;

            tbId6.Text = dtt.Rows[0]["CaseID"].ToString();
            tbId6.ReadOnly = true;

            ddCaseType.SelectedItem.Text = dtt.Rows[0]["CaseType"].ToString();

            ddProbDes.SelectedItem.Text = dtt.Rows[0]["ProblemDescription"].ToString();

            ddProdLin.SelectedItem.Text = dtt.Rows[0]["ProductLine"].ToString();

            tbProfLvl.Text = dtt.Rows[0]["ProficiencyLevel"].ToString();
            tbProfLvl.ReadOnly = true;

            ddNonComp.SelectedItem.Text = dtt.Rows[0]["NonCompliance"].ToString();

            tbNonComp.Text = dtt.Rows[0]["NonComplianceDetail"].ToString();

            TextBox1.Text = dtt.Rows[0]["WhatWentWell"].ToString();

            TextBox2.Text = dtt.Rows[0]["Opportunities"].ToString();

            TotalCompl.Text = dtt.Rows[0]["TotalCompliance"].ToString();

            //scoring

            C01.SelectedItem.Text = dtt.Rows[0]["C01"].ToString();

            C02.SelectedItem.Text = dtt.Rows[0]["C02"].ToString();

            C03.SelectedItem.Text = dtt.Rows[0]["C03"].ToString();

            C04.SelectedItem.Text = dtt.Rows[0]["C04"].ToString();

            C05.SelectedItem.Text = dtt.Rows[0]["C05"].ToString();

            C06.SelectedItem.Text = dtt.Rows[0]["C06"].ToString();

            C07.SelectedItem.Text = dtt.Rows[0]["C07"].ToString();

            Cm01.Text = dtt.Rows[0]["Cm01"].ToString();

            Cm02.Text = dtt.Rows[0]["Cm02"].ToString();

            Cm03.Text = dtt.Rows[0]["Cm03"].ToString();

            Cm04.Text = dtt.Rows[0]["Cm04"].ToString();

            Cm05.Text = dtt.Rows[0]["Cm05"].ToString();

            Cm06.Text = dtt.Rows[0]["Cm06"].ToString();

            Cm07.Text = dtt.Rows[0]["Cm07"].ToString();

            Con.Close();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string Compl = Convert.ToString(TotalCompl.Text);

            Con.Open();
            SqlCommand cmd = Con.CreateCommand();

            string CommandText = "UPDATE [dbo].[TOCLegend] SET CustomerType=@CustomerType,BusinessUnit=@BusinessUnit,BusinessSegment=@BusinessSegment,DeliveryType=@DeliveryType,Month=@Month,EmployeeID=@EmployeeID,Employee_Name=@Employee_Name,Employee_Mail=@Employee_Mail,Reporting_Manager=@Reporting_Manager,TeamName=@TeamName,CCMail=@CCMail,EvaluationDate=@EvaluationDate,CallDate=@CallDate,CaseType=@CaseType,ProblemDescription=@ProblemDescription,ProductLine=@ProductLine,ProficiencyLevel=@ProficiencyLevel,NonCompliance=@NonCompliance,NonComplianceDetail=@NonComplianceDetail,TotalCompliance=@TotalCompliance,CustCritical=@CustCritical,BusCritical=@BusCritical,WhatWentWell=@WhatWentWell,Opportunities=@Opportunities,C01=@C01,C02=@C02,C03=@C03,C04=@C04,C05=@C05,C06=@C06,C07=@C07,Cm01=@Cm01,Cm02=@Cm02,Cm03=@Cm03,Cm04=@Cm04,Cm05=@Cm05,Cm06=@Cm06,Cm07=@Cm07,[AuditStatus]='Resolved' WHERE CaseID=@CaseID";
            cmd = new SqlCommand(CommandText, Con);
            cmd.Parameters.AddWithValue("@CustomerType", ddCusType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@BusinessUnit", ddBU.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@BusinessSegment", ddBS.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@DeliveryType", ddDeliType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Month", ddMonth.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@EmployeeID", tbId2.Text);
            cmd.Parameters.AddWithValue("@Employee_Name", tbId3.Text);
            cmd.Parameters.AddWithValue("@Employee_Mail", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Reporting_Manager", TextBox6.Text);
            cmd.Parameters.AddWithValue("@TeamName", ddTeamName.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CCMail", TextBox4.Text);
            cmd.Parameters.AddWithValue("@EvaluationDate", tbId5.Text);
            cmd.Parameters.AddWithValue("@CaseID", tbId6.Text);
            cmd.Parameters.AddWithValue("@CallDate", tbId4.Text);
            cmd.Parameters.AddWithValue("@CaseType", ddCaseType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ProblemDescription", ddProbDes.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ProductLine", ddProdLin.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ProficiencyLevel", tbProfLvl.Text);
            cmd.Parameters.AddWithValue("@NonCompliance", ddNonComp.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@NonComplianceDetail", tbNonComp.Text);
            cmd.Parameters.AddWithValue("@TotalCompliance", Compliance.Value);
            cmd.Parameters.AddWithValue("@CustCritical", hfv_CustCrit.Value);
            cmd.Parameters.AddWithValue("@BusCritical", hfv_BusCrit.Value);
            cmd.Parameters.AddWithValue("@WhatWentWell", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Opportunities", TextBox2.Text);
            cmd.Parameters.AddWithValue("@C01", C01.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@C02", C02.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@C03", C03.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@C04", C04.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@C05", C05.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@C06", C06.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@C07", C07.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Cm01", Cm01.Text);
            cmd.Parameters.AddWithValue("@Cm02", Cm02.Text);
            cmd.Parameters.AddWithValue("@Cm03", Cm03.Text);
            cmd.Parameters.AddWithValue("@Cm04", Cm04.Text);
            cmd.Parameters.AddWithValue("@Cm05", Cm05.Text);
            cmd.Parameters.AddWithValue("@Cm06", Cm06.Text);
            cmd.Parameters.AddWithValue("@Cm07", Cm07.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            Con.Close();
            maildetails();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Audit Updated Successfully');window.location ='QADashboardTOC.aspx';", true);
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
                if (!string.IsNullOrWhiteSpace(TextBox13.Text))
                {
                    mail.CC.Add(tl);
                }

                if (FileUploadControl.HasFile)
                {
                    string fileName = Path.GetFileName(FileUploadControl.PostedFile.FileName);
                    Attachment myAttachment = new Attachment(FileUploadControl.FileContent, fileName);
                    mail.Attachments.Add(myAttachment);
                }

                mail.CC.Add(TextBox14.Text); //Adding Manager to CC
                foreach (string CCEmail in ccc)
                {
                    if (!string.IsNullOrWhiteSpace(CCEmail))
                    {
                        mail.CC.Add(new MailAddress(CCEmail)); //Adding Multiple CC email Id
                    }
                }



                mail.Subject = "TOC/DVT Audit | " + ddMonth.SelectedItem.Text + " | " + tbId3.Text;
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
            string body = "http://15.42.19.247:120/AuditSheetUserTOC.aspx?case=" + tbId6.Text;
            string body0 = "<b style=" + "color:red" + "><i>Login Instructions :</i></b> To Login use your email ID as the Username and Employee Id as the Password";
            string body1 = "<b style=" + "color:red" + "><i>Note to the Engineer :</i></b> This Audit is open to discussion for the next 96 hours, there after the submitted score stands unchanged and audit status would change to <b><i>'Audited and Auto Accepted'<i/><b/>";
            string body3 = "<b style=" + "color:red" + "><i>Note to the Manager :</i></b> Please click on the below link to review the Engineer's Audit. To Login, use your email ID as the Username and Employee Id as the Password";
            string body4 = "http://15.42.19.247:120/AuditSheetMgrTOC.aspx?case=" + tbId6.Text;
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
            string tl = TextBox13.Text;
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



                mail.Subject = "Resolved TOC/DVT Audit | " + ddMonth.SelectedItem.Text + " | " + tbId3.Text;
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
            string body = "http://15.42.19.247:120/AuditSheetUserTOC.aspx?case=" + tbId6.Text;
            string body0 = "<b style=" + "color:red" + "><i>Login Instructions :</i></b> To Login use your email ID as the Username and Employee Id as the Password";
            string body1 = "<b style=" + "color:red" + "><i>Note to the Engineer :</i></b> This Audit is open to discussion for the next 96 hours, there after the submitted score stands unchanged and audit status would change to <b><i>'Audited and Auto Accepted'<i/><b/>";
            string body3 = "<b style=" + "color:red" + "><i>Note to the Manager :</i></b> Please click on the below link to review the Engineer's Audit. To Login, use your email ID as the Username and Employee Id as the Password";
            string body4 = "http://15.42.19.247:120/AuditSheetMgrTOC.aspx?case=" + tbId6.Text;
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

        protected void MenuFeedback_Click(object sender, EventArgs e)
        {
            Response.Redirect("AuditFeedbackFormTOC.aspx");
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
            Response.Redirect("TOC_Legend.aspx");
        }

        protected void btnSendMail_Click(object sender, EventArgs e)
        {
            resend_maildetails();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Mail Resent Successfully');window.location ='QADashboardTOC.aspx';", true);
        }
    }
}