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
    public partial class Exit_Form : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        SqlConnection Con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString); 
        protected void Page_Load(object sender, EventArgs e)
        {
            tbGender.Visible = false;
            TextBox1.Visible = false;
            TextBox8.Visible = false;
        }

        protected void ddGender_SelectedIndexChanged(object sender, EventArgs e)
        {
            var value = ddGender.SelectedItem.Value;
            if (value == "2")
            {
                tbGender.Visible = true;
                tbGender.Focus();
            }
        }

        protected void tbId1_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select EmployeeFullName,EmployeeEmailID,TeamLeadName,TeamLeadEmailId,ReportingManager,ReportingManagerEmailId,TeamAlignment,Region from tblHeadCount where EmployeeID=@EmployeeID", Con);
            cmd.Parameters.AddWithValue("@EmployeeID", tbId1.Text.Trim());
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
            string Region = dtt.Rows[0]["Region"].ToString();
            tbId1a.Text = empl_name;
            tbId1a.ReadOnly = true;
            tbMgrName.Text = Mgr_name;
            tbMgrName.ReadOnly = true;
            TextBox6.Text = Region;
            TextBox6.ReadOnly = true;
            TextBox1.Text = empl_mail;
            TextBox8.Text = Mgr_mail;
            Con.Close();
        }

        protected void Submit_Button(object sender, EventArgs args)
        {
            Con1.Open();
            SqlCommand cmd = Con1.CreateCommand();

            string CommandText = "INSERT INTO [dbo].[tbExitInterviewForm](EmployeeID,EmployeeName,PhoneNo,Gender,GenderOptions,DOJ,ResignationDate,Region,ManagerName,PrimaryEmployer,ReasonsForLeaving,ReasonsForLeavingOthers,AdditionalComments,HighestEducation,Hometown,State,OpportunitiesNSuggestions1,OpportunitiesNSuggestions2,OpportunitiesNSuggestions3,OpportunitiesNSuggestions4,OpportunitiesNSuggestions5,ClientNParentCompany1,ClientNParentCompany2,ClientNParentCompany3,ClientNParentCompany4,ClientNParentCompany5,ClientNParentCompany6,HiringSubmission,EngineerSubmission,ManagerSubmission) values " +
                "(@EmployeeID,@EmployeeName,@PhoneNo,@Gender,@GenderOptions,@DOJ,@ResignationDate,@Region,@ManagerName,@PrimaryEmployer,@ReasonsForLeaving,@ReasonsForLeavingOthers,@AdditionalComments,@HighestEducation,@Hometown,@State,@OpportunitiesNSuggestions1,@OpportunitiesNSuggestions2,@OpportunitiesNSuggestions3,@OpportunitiesNSuggestions4,@OpportunitiesNSuggestions5,@ClientNParentCompany1,@ClientNParentCompany2,@ClientNParentCompany3,@ClientNParentCompany4,@ClientNParentCompany5,@ClientNParentCompany6,'No','Yes','No')";
            cmd = new SqlCommand(CommandText, Con1);
            cmd.Parameters.AddWithValue("@EmployeeID", tbId1.Text);
            cmd.Parameters.AddWithValue("@EmployeeName", tbId1a.Text);
            cmd.Parameters.AddWithValue("@PhoneNo", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Gender", ddGender.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@GenderOptions", tbGender.Text);
            cmd.Parameters.AddWithValue("@DOJ", tbId2.Text);
            cmd.Parameters.AddWithValue("@ResignationDate", tbId3.Text);
            cmd.Parameters.AddWithValue("@Region", TextBox6.Text);
            cmd.Parameters.AddWithValue("@ManagerName", tbMgrName.Text);
            cmd.Parameters.AddWithValue("@PrimaryEmployer", ddPrimEmpl.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ReasonsForLeaving", DropDownList1.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ReasonsForLeavingOthers", tbId5.Text);
            cmd.Parameters.AddWithValue("@AdditionalComments", TextBox4.Text);
            cmd.Parameters.AddWithValue("@HighestEducation", DropDownList11.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Hometown", TextBox13.Text);
            cmd.Parameters.AddWithValue("@State", DropDownList12.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@OpportunitiesNSuggestions1", TextBox5.Text);
            cmd.Parameters.AddWithValue("@OpportunitiesNSuggestions2", TextBox7.Text);
            cmd.Parameters.AddWithValue("@OpportunitiesNSuggestions3", DropDownList4.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@OpportunitiesNSuggestions4", DropDownList3.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@OpportunitiesNSuggestions5", TextBox10.Text);
            cmd.Parameters.AddWithValue("@ClientNParentCompany1", DropDownList5.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ClientNParentCompany2", DropDownList6.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ClientNParentCompany3", DropDownList7.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ClientNParentCompany4", DropDownList8.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ClientNParentCompany5", DropDownList9.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ClientNParentCompany6", TextBox11.Text);

            SqlDataReader dr = cmd.ExecuteReader();
            Con.Close();
            maildetails();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Response Recorded');window.location ='Exit_Form.aspx';", true);
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
                mail.CC.Add(cc);
                mail.CC.Add(TextBox8.Text);
                

                mail.Subject = "Exit Interview Feedback";
                mail.Body = body;
                mail.IsBodyHtml = true;
                SmtpServer.Port = Convert.ToInt32(ConfigurationManager.AppSettings["smtpPort"]);
                SmtpServer.UseDefaultCredentials = false;
                string QAName = TextBox1.Text;
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
            string body2 = "This is to notify that " + tbId1a.Text + " ( " + tbId1.Text + " ) has expressed their intention to leave the organization and has completed the Exit Interview feedback.";
            string case_id = "Mentioned below is the link to submit <b>Manager feedback</b>. Please read the question carefully and provide a well-thought out response.";
            string body = "http://15.42.19.247:120/EditExitFormMgr.aspx?case=" + tbId1.Text;
            string body3 = "Hiring team, please click on the below link to submit your feedback:";
            string body4 = "http://15.42.19.247:120/EditExitForm.aspx?case=" + tbId1.Text;
            string body0 = "All information is confidential. It will not be associated with your name in any way, or placed in your employee file.";
            string salutation1 = "Thank you.";
            string signature = "HP Hiring Team";


            StringBuilder sb = new StringBuilder();
            sb.AppendLine("<div style=\"  width:1100px;  padding-left:5px;border:1px solid; \" >");
            sb.AppendLine("<table width=1100px style=table-layout:fixed;  >");
            sb.AppendLine("<tr>");
            sb.AppendLine("<th colspan=2><span style=\"font-family: 'Times New Roman'; text-align:center; font-size:25px; font-weight:bold\">  </span> </th>");
            sb.AppendLine("</tr>");

            sb.AppendLine("<tr>");
            sb.AppendLine("<th style=\"font-family: 'Verdana'; text-align:left; font-size:14px;font-weight:200; \"><b style='font-family:Times New Roman, sans-serif;color:Black'> </b>Hi Team</th>");
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
            sb.AppendLine("<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp; " + body0 + " </td>");
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
            string QAName = TextBox1.Text;
            string from = QAName;
            string to = "paroma.kumar@hp.com";
            string cc = TextBox1.Text;
            //string cc = "shaziya.sadaf@hp.com";

            string password = "bid.sun-21";
            string subject = sb.ToString();
            body = sb.ToString();

            bool status = SendEmail(to, from, password, subject, string.Format(body), cc);
            return true;
        }
    }
}