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
    public partial class _21_VoiceLegend : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        StringBuilder table = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            var dateAsString = DateTime.Now.ToString("MM/dd/yyyy");
            tbId5.Text = dateAsString;

            //Hiding details
            tbId1.Visible = false;
            tbId1a.Visible = false;
            TextBox3.Visible = false;
            TextBox2.Visible = false;
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
            }
        }

        protected int AddFile(string temp, string extension, string contentType, byte[] document)
        {
            SqlDatabase sqlDatabase = new SqlDatabase(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
            string sql = "spFile_Add";
            SqlCommand sqlCommand = sqlDatabase.GetStoredProcCommand(sql) as SqlCommand;
            Object obj = null;
            try
            {
                sqlDatabase.AddInParameter(sqlCommand, "@Filename", SqlDbType.VarChar, temp);
                sqlDatabase.AddInParameter(sqlCommand, "@Extension", SqlDbType.VarChar, extension);
                sqlDatabase.AddInParameter(sqlCommand, "@ContentType", SqlDbType.VarChar, contentType);
                sqlDatabase.AddInParameter(sqlCommand, "@Document", SqlDbType.VarBinary, document);
                obj = sqlDatabase.ExecuteScalar(sqlCommand);
                if (obj != null)
                {
                    return int.Parse(obj.ToString());

                }
                else
                    return 0;
            }

            catch (Exception err)
            {
                throw new ApplicationException(err.Message);
            }
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUploadControl.PostedFile != null && FileUploadControl.PostedFile.ContentLength > 0)
            {
                string filename = Path.GetFileName(FileUploadControl.PostedFile.FileName);
                string temp = tbId6.Text;
                string extension = Path.GetExtension(filename);
                string contentType = FileUploadControl.PostedFile.ContentType;
                byte[] document = new byte[FileUploadControl.PostedFile.ContentLength];
                int fileId = AddFile(temp, extension, contentType, document);
                //StatusLabel.Text = "File Uploaded Successfully!";
            }
        }

        protected void Submit_Button(object sender, EventArgs args)
        {
            //Response.Write(Request.Form["ddProbDesc"]);
            string Compl = Convert.ToString(TotalCompl.Text);
            //var temp = Request.Form("ddProbDesc");
            foreach (string name in Request.Form.AllKeys)
            {
                string value = Request.Form[name];
                // Do something with (name, value).
            }

            Con.Open();
            SqlCommand cmd = Con.CreateCommand();

            string CommandText = "INSERT INTO [dbo].[FY21VoiceLegend](QAName,QAMail,BusinessUnit,BusinessSegment,Month,EmployeeID,Employee_Name,Employee_Mail,TLName,TLMail,Reporting_Manager,Reporting_Manager_Mail,TeamName,CCMail,CallDate,EvaluationDate,CaseID,CallID_SR_ID,CallDuration,AuditType,CaseType,CallType,ProblemDescription,Language,NonCompliance,NonComplianceDetail,NonComplianceScore,AuditScore,CustCritical,BusCritical,Opening,Opening1,Opening2,Opening3,Opening4,Opening_Cmnts,ToolUsage,ToolUsage1,ToolUsage2,ToolUsage3,ToolUsage4,ToolUsage5,ToolUsage6,ToolUsage7,ToolUsage8,ToolUsage9,ToolUsage10,ToolUsage_Cmnts,Probing,Probing_Cmnts,Troubleshooting,Troubleshooting_Cmnts,Sol_Res,Sol_Res_Cmnts,Behavioural,Behavioural1,Behavioural2,Behavioural3,Behavioural4,Behavioural5,Behavioural_Cmnts,Communication,Communication1,Communication2,Communication3,Communication4,Communication_Cmnts,CustObsdBehav,CustObsdBehav1,CustObsdBehav2,CustObsdBehav3,CustObsdBehav4,CustObsdBehav5,CustObsdBehav_Cmnts,Time_Manage,Time_Manage_Cmnts,Callback,Callback_Cmnts,CaseOwnership,CaseOwnership1,CaseOwnership2,CaseOwnership3,CaseOwnership_Cmnts,Case_Call_Logging,Case_Call_Logging_Cmnts,Closing,Closing_Cmnts,WOW_DAB,WOW_DAB_Cmnts,SAPOS,SAPOS1a,SAPOS1b,SAPOS1_Cmnts,SAPOS2,SAPOS2_Cmnts,SAPOS3,SAPOS3_Cmnts,FCR,FCR_Cmnts,AuditResult) values " +
                "(@QAName,@QAMail,@BusinessUnit,@BusinessSegment,@Month,@EmployeeID,@Employee_Name,@Employee_Mail,@TLName,@TLMail,@Reporting_Manager,@Reporting_Manager_Mail,@TeamName,@CCMail,@CallDate,@EvaluationDate,@CaseID,@CallID_SR_ID,@CallDuration,@AuditType,@CaseType,@CallType,@ProblemDescription,@Language,@NonCompliance,@NonComplianceDetail,@NonComplianceScore,@AuditScore,@CustCritical,@BusCritical,@Opening,@Opening1,@Opening2,@Opening3,@Opening4,@Opening_Cmnts,@ToolUsage,@ToolUsage1,@ToolUsage2,@ToolUsage3,@ToolUsage4,@ToolUsage5,@ToolUsage6,@ToolUsage7,@ToolUsage8,@ToolUsage9,@ToolUsage10,@ToolUsage_Cmnts,@Probing,@Probing_Cmnts,@Troubleshooting,@Troubleshooting_Cmnts,@Sol_Res,@Sol_Res_Cmnts,@Behavioural,@Behavioural1,@Behavioural2,@Behavioural3,@Behavioural4,@Behavioural5,@Behavioural_Cmnts,@Communication,@Communication1,@Communication2,@Communication3,@Communication4,@Communication_Cmnts,@CustObsdBehav,@CustObsdBehav1,@CustObsdBehav2,@CustObsdBehav3,@CustObsdBehav4,@CustObsdBehav5,@CustObsdBehav_Cmnts,@Time_Manage,@Time_Manage_Cmnts,@Callback,@Callback_Cmnts,@CaseOwnership,@CaseOwnership1,@CaseOwnership2,@CaseOwnership3,@CaseOwnership_Cmnts,@Case_Call_Logging,@Case_Call_Logging_Cmnts,@Closing,@Closing_Cmnts,@WOW_DAB,@WOW_DAB_Cmnts,@SAPOS,@SAPOS1a,@SAPOS1b,@SAPOS1_Cmnts,@SAPOS2,@SAPOS2_Cmnts,@SAPOS3,@SAPOS3_Cmnts,@FCR,@FCR_Cmnts,@AuditResult)";
            cmd = new SqlCommand(CommandText, Con);
            cmd.Parameters.AddWithValue("@QAName", tbId1.Text);
            cmd.Parameters.AddWithValue("@QAMail", tbId1a.Text);
            cmd.Parameters.AddWithValue("@BusinessUnit", ddBU.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@BusinessSegment", ddBS.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Month", ddMonth.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@EmployeeID", tbId2.Text);
            cmd.Parameters.AddWithValue("@Employee_Name", tbId3.Text);
            cmd.Parameters.AddWithValue("@TLName", TextBox5.Text);
            cmd.Parameters.AddWithValue("@TLMail", TextBox2.Text);
            cmd.Parameters.AddWithValue("@Employee_Mail", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Reporting_Manager", TextBox6.Text);
            cmd.Parameters.AddWithValue("@Reporting_Manager_Mail", TextBox1.Text);
            cmd.Parameters.AddWithValue("@TeamName", tbTeamName.Text);
            cmd.Parameters.AddWithValue("@CCMail", TextBox4.Text);
            cmd.Parameters.AddWithValue("@CallDate", tbId4.Text);
            cmd.Parameters.AddWithValue("@EvaluationDate", tbId5.Text);
            cmd.Parameters.AddWithValue("@CaseID", tbId6.Text);
            cmd.Parameters.AddWithValue("@CallID_SR_ID", tbId7.Text);
            cmd.Parameters.AddWithValue("@CallDuration", ddCallDuration.SelectedItem.Text); 
            cmd.Parameters.AddWithValue("@AuditType", ddAuditType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CaseType", ddCaseType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CallType", ddCallType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ProblemDescription", ddProbDes.SelectedValue);
            cmd.Parameters.AddWithValue("@Language", ddLang.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@NonCompliance", ddNonComp.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@NonComplianceDetail", tbNonComp.Text);
            cmd.Parameters.AddWithValue("@NonComplianceScore", hfv_NCS.Value);
            cmd.Parameters.AddWithValue("@AuditScore", Compliance.Value);
            cmd.Parameters.AddWithValue("@CustCritical", hfv_CustCrit.Value);
            cmd.Parameters.AddWithValue("@BusCritical", hfv_BusCrit.Value);
            cmd.Parameters.AddWithValue("@Opening", Q01.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Opening1", Q01a.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Opening2", Q01b.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Opening3", Q01c.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Opening4", Q01d.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Opening_Cmnts", C01.Text);
            cmd.Parameters.AddWithValue("@ToolUsage", Q02.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ToolUsage1", Q02a.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ToolUsage2", Q02b.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ToolUsage3", Q02c.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ToolUsage4", Q02d.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ToolUsage5", Q02e.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ToolUsage6", Q02f.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ToolUsage7", Q02g.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ToolUsage8", Q02h.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ToolUsage9", Q02i.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ToolUsage10", Q02j.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ToolUsage_Cmnts", C02.Text);
            cmd.Parameters.AddWithValue("@Probing", Q03.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Probing_Cmnts", C03.Text);
            cmd.Parameters.AddWithValue("@Troubleshooting", Q04.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Troubleshooting_Cmnts", C04.Text);
            cmd.Parameters.AddWithValue("@Sol_Res", Q05.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Sol_Res_Cmnts", C05.Text);
            cmd.Parameters.AddWithValue("@Behavioural", Q06.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Behavioural1", Q06a.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Behavioural2", Q06b.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Behavioural3", Q06c.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Behavioural4", Q06d.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Behavioural5", Q06e.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Behavioural_Cmnts", C06.Text);
            cmd.Parameters.AddWithValue("@Communication", Q07.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Communication1", Q07a.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Communication2", Q07b.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Communication3", Q07c.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Communication4", Q07d.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Communication_Cmnts", C07.Text);
            cmd.Parameters.AddWithValue("@CustObsdBehav", Q08.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CustObsdBehav1", Q08a.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CustObsdBehav2", Q08b.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CustObsdBehav3", Q08c.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CustObsdBehav4", Q08d.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CustObsdBehav5", Q08e.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CustObsdBehav_Cmnts", C08.Text);
            cmd.Parameters.AddWithValue("@Time_Manage", Q09.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Time_Manage_Cmnts", C09.Text);
            cmd.Parameters.AddWithValue("@Callback", Q12.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Callback_Cmnts", C12.Text);
            cmd.Parameters.AddWithValue("@CaseOwnership", Q13.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CaseOwnership1", Q13a.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CaseOwnership2", Q13b.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CaseOwnership3", Q13c.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CaseOwnership_Cmnts", C13.Text);
            cmd.Parameters.AddWithValue("@Case_Call_Logging", Q10.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Case_Call_Logging_Cmnts", C10.Text);
            cmd.Parameters.AddWithValue("@Closing", Q11.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Closing_Cmnts", C11.Text);
            cmd.Parameters.AddWithValue("@WOW_DAB", Q14.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@WOW_DAB_Cmnts", C14.Text);
            cmd.Parameters.AddWithValue("@SAPOS", Q15a.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SAPOS1a", Q15.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SAPOS1b", Q15b.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SAPOS1_Cmnts", C15.Text);
            cmd.Parameters.AddWithValue("@SAPOS2", Q16.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SAPOS2_Cmnts", C16.Text);
            cmd.Parameters.AddWithValue("@SAPOS3", Q17.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SAPOS3_Cmnts", C17.Text);
            cmd.Parameters.AddWithValue("@AuditResult", hfv_AuditRes.Value);
            cmd.Parameters.AddWithValue("@FCR", Q18.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@FCR_Cmnts", C18.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            Con.Close();
            maildetails();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Audit Saved and Mail sent Successfully');window.location ='21_VoiceLegend.aspx';", true);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("QALogin.aspx");
        }

        protected void tbId2_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select EmployeeFullName,EmployeeEmailID,TeamLeadName,TeamLeadEmailId,ReportingManager,ReportingManagerEmailId,TeamAlignment from tblHeadCount where EmployeeID=@EmployeeID", Con);
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
            string Mgr_mail = dtt.Rows[0]["ReportingManagerEmailId"].ToString();
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
            TextBox1.Text = Mgr_mail;
            TextBox1.ReadOnly = true;
            tbTeamName.Text = TeamName;
            tbTeamName.ReadOnly = true;
            Con.Close();

            //SqlCommand cmd2 = new SqlCommand("SELECT TOP 6 AuditScore,Month FROM [dbo].[FY21VoiceLegend] where EmployeeID=@EmployeeID ORDER BY EvaluationDate DESC", Con);
            //cmd2.Parameters.AddWithValue("@EmployeeID", tbId2.Text.Trim());
            //cmd2.Connection = Con;
            //Con.Open();
            //SqlDataReader rd = cmd2.ExecuteReader();
            //table.Append("<table border='1' style='text - align:center;margin-top:10px; '>");
            //table.Append("<tr><th>Month</th><th>Audit Score</th>");
            //table.Append("</tr>");

            //if (rd.HasRows)
            //{
            //    while (rd.Read())
            //    {
            //        table.Append("<tr>");
            //        table.Append("<td style='text-align:center;'>" + rd[1] + "</td>");
            //        table.Append("<td style='text-align:center;'>" + rd[0] + "%</tr>");
            //        table.Append("</tr>");
            //    }
            //}
            //table.Append("</table");
            //phPrevSco.Controls.Add(new Literal { Text = table.ToString() });
            //rd.Close();
            //Con.Close();
        }

        protected void FileDownload(object sender, EventArgs e)
        {
            Response.Redirect("~/Download/FY23 Voice Report.xlsx");
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



                mail.Subject = "Voice Audit | " + ddMonth.SelectedItem.Text + " | " + tbId3.Text;
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
            string case_id = "Case ID is : " + tbId6.Text + " and Call ID is : " + tbId7.Text;
            string body = "http://15.42.19.247:120/AuditSheetUserFY21Voice.aspx?case=" + tbId7.Text;
            string body0 = "<b style=" + "color:red" + "><i>Login Instructions :</i></b> To Login use your email ID as the Username and Employee Id as the Password";
            string body1 = "<b style=" + "color:red" + "><i>Note to the Engineer :</i></b> This Audit is open to discussion for the next 96 hours, there after the submitted score stands unchanged and audit status would change to <b><i>'Audited and Auto Accepted'<i/><b/>";
            string body3 = "<b style=" + "color:red" + "><i>Note to the Manager :</i></b> Please click on the below link to review the Engineer's Audit. To Login, use your email ID as the Username and Employee Id as the Password";
            string body4 = "http://15.42.19.247:120/AuditSheetMgrFY21Voice.aspx?case=" + tbId7.Text;
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

        protected void QADashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("QADashboardFY21VoiceLegend.aspx");
        }

        protected void btnCaseIdCheck_Click(object sender, EventArgs e)
        {
            Con.Open();
            SqlCommand cmd = new SqlCommand("select * from [dbo].[FY21VoiceLegend] where CaseID=@CaseId", Con);
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
            SqlCommand cmd = new SqlCommand("select * from [dbo].[FY21VoiceLegend] where CallID_SR_ID=@CallID_SR_ID", Con);
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
            Response.Redirect("AuditFeedbackFormVoice.aspx");
        }

        protected void SoMe_GuideLines_Click(object sender, EventArgs e)
        {
            //Page.ClientScript.RegisterStartupScript(
            //this.GetType(), "OpenWindow", "window.open('21_SoMeLegendGL.aspx','_newtab');", true); //Opens in a new Tab
            //Server.Transfer("21_VoiceLegendGL.aspx");
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
                ddProbDes.Items.Add("Break - Fix");
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
                ddProbDes.Items.Add("Tonner / Supplies Order");
                ddProbDes.Items.Add("Trade / SAPOS");
                ddProbDes.Items.Add("Tray Settings");
                ddProbDes.Items.Add("Warranty Update ");
                ddProbDes.Items.Add("Wireless Printing");
                ddProbDes.Focus();
            }
            else if (value == "2")
            {
                ddProbDes.Items.Clear();
                ddProbDes.Items.Insert(0, new ListItem("--Choose--", "-1"));
                ddProbDes.Items.Add("Personal Devices");
                ddProbDes.Items.Add("Voice and Video");
                ddProbDes.Focus();
            }
        }
    }
}