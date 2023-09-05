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
    public partial class HygieneCheckEditQA : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        StringBuilder table = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {


            //Hiding details
            tbId1.Visible = false;
            tbId1a.Visible = false;
            TextBox3.Visible = false;
            TextBox2.Visible = false;
            TextBox1.Visible = false;


            if (Session["Username"] == null)
            { Response.Redirect("HygieneCheckQA.aspx"); }
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
            SqlCommand cmd = new SqlCommand("Select * from [dbo].[FY22HygieneCheckdb] where CaseID=@CaseID and QAMail=@Username", Con);
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

            tbId4.Text = dtt.Rows[0]["InteractionDate"].ToString();
            tbId4.ReadOnly = true;

            tbId5.Text = dtt.Rows[0]["EvaluationDate"].ToString();
            tbId5.ReadOnly = true;

            tbId6.Text = dtt.Rows[0]["CaseID"].ToString();
            tbId6.ReadOnly = true;

            tbId7.Text = dtt.Rows[0]["Interaction_ID"].ToString();
            tbId7.ReadOnly = true;

            tbId8.Text = dtt.Rows[0]["CSO"].ToString();
            tbId8.ReadOnly = true;

            ddValidity.SelectedItem.Text = dtt.Rows[0]["Validity"].ToString();

            ddHygType.SelectedItem.Text = dtt.Rows[0]["Hygiene_Type"].ToString();

            ddCusType.SelectedItem.Text = dtt.Rows[0]["Customer_Type"].ToString();

            ddDocumentation.SelectedItem.Text = dtt.Rows[0]["Documentation"].ToString();

            ddNonComp.SelectedItem.Text = dtt.Rows[0]["NonCompliance"].ToString();

            ddInvalidReason.SelectedItem.Text = dtt.Rows[0]["Invalid_Reason"].ToString();

            tbRCA.Text = dtt.Rows[0]["RCA"].ToString();

            tbAddComments.Text = dtt.Rows[0]["AdditionalComments"].ToString();

            Con.Close();

        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            Con.Open();
            SqlCommand cmd = Con.CreateCommand();

            string CommandText = "UPDATE [dbo].[FY22HygieneCheckdb] SET EmployeeID=@EmployeeID,Employee_Name=@Employee_Name,Employee_Mail=@Employee_Mail,TLName=@TLName,TLMail=@TLMail,Reporting_Manager=@Reporting_Manager,Reporting_Manager_Mail=@Reporting_Manager_Mail,TeamName=@TeamName,Month=@Month,InteractionDate=@InteractionDate,EvaluationDate=@EvaluationDate,CCMail=@CCMail,CaseID=@CaseID,Interaction_ID=@Interaction_ID,CSO=@CSO,Validity=@Validity,Hygiene_Type=@Hygiene_Type,Customer_Type=@Customer_Type,BusinessUnit=@BusinessUnit,Documentation=@Documentation,NonCompliance=@NonCompliance,Invalid_Reason=@Invalid_Reason,RCA=@RCA,AdditionalComments=@AdditionalComments,[AuditStatus]='Resolved' WHERE CaseID=@CaseID";
            cmd = new SqlCommand(CommandText, Con);
            cmd.Parameters.AddWithValue("@QAName", tbId1.Text);
            cmd.Parameters.AddWithValue("@QAMail", tbId1a.Text);
            cmd.Parameters.AddWithValue("@Employee_Mail", TextBox3.Text);
            cmd.Parameters.AddWithValue("@TLMail", TextBox2.Text);
            cmd.Parameters.AddWithValue("@Reporting_Manager_Mail", TextBox1.Text);
            cmd.Parameters.AddWithValue("@EmployeeID", tbId2.Text);
            cmd.Parameters.AddWithValue("@Employee_Name", tbId3.Text);
            cmd.Parameters.AddWithValue("@TLName", TextBox5.Text);
            cmd.Parameters.AddWithValue("@Reporting_Manager", TextBox6.Text);
            cmd.Parameters.AddWithValue("@TeamName", tbTeamName.Text);
            cmd.Parameters.AddWithValue("@Month", ddMonth.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@InteractionDate", tbId4.Text);
            cmd.Parameters.AddWithValue("@EvaluationDate", tbId5.Text);
            cmd.Parameters.AddWithValue("@CCMail", TextBox4.Text);
            cmd.Parameters.AddWithValue("@CaseID", tbId6.Text);
            cmd.Parameters.AddWithValue("@Interaction_ID", tbId7.Text);
            cmd.Parameters.AddWithValue("@CSO", tbId8.Text);
            cmd.Parameters.AddWithValue("@Validity", ddValidity.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Hygiene_Type", ddHygType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Customer_Type", ddCusType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@BusinessUnit", ddBU.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Documentation", ddDocumentation.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@NonCompliance", ddNonComp.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Invalid_Reason", ddInvalidReason.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@RCA", tbRCA.Text);
            cmd.Parameters.AddWithValue("@AdditionalComments", tbAddComments.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            Con.Close();
            if (ddValidity.SelectedItem.Text == "Invalid")
            {
                maildetails();
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Audit Updated Successfully');window.location ='QADashboardHygieneCheck.aspx';", true);
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

                mail.CC.Add(TextBox1.Text); //Adding Manager to CC
                foreach (string CCEmail in ccc)
                {
                    if (!string.IsNullOrWhiteSpace(CCEmail))
                    {
                        mail.CC.Add(new MailAddress(CCEmail)); //Adding Multiple CC email Id
                    }
                }



                mail.Subject = "Hygiene Check | " + ddMonth.SelectedItem.Text + " | " + tbId3.Text + " | " + ddHygType.SelectedItem.Text + " | " + tbId6.Text;
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
            string body2 = "A Hygiene Check has been has been conducted for the below mentioned Call ID.";
            string case_id = "Case ID is : " + tbId6.Text + ", Interaction ID is : " + tbId7.Text + " and Validity is : " + ddValidity.SelectedItem.Text;
            string body = "http://15.42.19.247:120/Hygiene_CheckUser.aspx?case=" + tbId6.Text;
            string body0 = "<b style=" + "color:red" + "><i>Login Instructions :</i></b> To Login use your email ID as the Username and Employee Id as the Password";
            string body1 = "<b style=" + "color:red" + "><i>Note to the Engineer :</i></b> This is open to discussion for the next 96 hours";
            //string body3 = "<b style=" + "color:red" + "><i>Note to the Manager :</i></b> Please click on the below link to review the Engineer's Audit. To Login, use your email ID as the Username and Employee Id as the Password";
            //string body4 = "http://15.42.19.247:120/Hygiene_CheckMgr.aspx?case=" + tbId6.Text;
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
            //sb.AppendLine("</tr>");

            //sb.AppendLine("<tr>");
            //sb.AppendLine("<th colspan=2><span style=\"font-family: 'Times New Roman'; text-align:center; font-size:25px; font-weight:bold\">  </span> </th>");
            //sb.AppendLine("</tr>");
            //sb.AppendLine("<tr>");
            //sb.AppendLine("<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp; " + body3 + " </td>");
            //sb.AppendLine("</tr>");
            //sb.AppendLine("<tr>");
            //sb.AppendLine("<th colspan=2><br> </th>");
            //sb.AppendLine("</tr>");

            //sb.AppendLine("<tr>");
            //sb.AppendLine("<th colspan=1><span style=\"font-family: 'Times New Roman'; text-align:center; font-size:25px; font-weight:bold\">  </span> </th>");
            //sb.AppendLine("</tr>");
            //sb.AppendLine("<tr>");
            //sb.AppendLine("<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp; " + body4 + "</td>");
            //sb.AppendLine("</tr>");
            //sb.AppendLine("<tr>");
            //sb.AppendLine("<th colspan=2><br> </th>");
            //sb.AppendLine("</tr>");

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

                mail.CC.Add(TextBox1.Text); //Adding Manager to CC
                foreach (string CCEmail in ccc)
                {
                    if (!string.IsNullOrWhiteSpace(CCEmail))
                    {
                        mail.CC.Add(new MailAddress(CCEmail)); //Adding Multiple CC email Id
                    }
                }



                mail.Subject = "Resolved Hygiene Check | " + ddMonth.SelectedItem.Text + " | " + tbId3.Text + " | " + ddHygType.SelectedItem.Text + " | " + tbId6.Text;
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
            string body2 = "A Hygiene Check has been has been conducted for the below mentioned Call ID.";
            string case_id = "Case ID is : " + tbId6.Text + ", Interaction ID is : " + tbId7.Text + " and Validity is : " + ddValidity.SelectedItem.Text;
            string body = "http://15.42.19.247:120/Hygiene_CheckUser.aspx?case=" + tbId6.Text;
            string body0 = "<b style=" + "color:red" + "><i>Login Instructions :</i></b> To Login use your email ID as the Username and Employee Id as the Password";
            string body1 = "<b style=" + "color:red" + "><i>Note to the Engineer :</i></b> This is open to discussion for the next 96 hours";
            //string body3 = "<b style=" + "color:red" + "><i>Note to the Manager :</i></b> Please click on the below link to review the Engineer's Audit. To Login, use your email ID as the Username and Employee Id as the Password";
            //string body4 = "http://15.42.19.247:120/Hygiene_CheckMgr.aspx?case=" + tbId6.Text;
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
            //sb.AppendLine("</tr>");

            //sb.AppendLine("<tr>");
            //sb.AppendLine("<th colspan=2><span style=\"font-family: 'Times New Roman'; text-align:center; font-size:25px; font-weight:bold\">  </span> </th>");
            //sb.AppendLine("</tr>");
            //sb.AppendLine("<tr>");
            //sb.AppendLine("<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp; " + body3 + " </td>");
            //sb.AppendLine("</tr>");
            //sb.AppendLine("<tr>");
            //sb.AppendLine("<th colspan=2><br> </th>");
            //sb.AppendLine("</tr>");

            //sb.AppendLine("<tr>");
            //sb.AppendLine("<th colspan=1><span style=\"font-family: 'Times New Roman'; text-align:center; font-size:25px; font-weight:bold\">  </span> </th>");
            //sb.AppendLine("</tr>");
            //sb.AppendLine("<tr>");
            //sb.AppendLine("<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp; " + body4 + "</td>");
            //sb.AppendLine("</tr>");
            //sb.AppendLine("<tr>");
            //sb.AppendLine("<th colspan=2><br> </th>");
            //sb.AppendLine("</tr>");

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
            Response.Redirect("HygieneCheckQA.aspx");
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

        }

        protected void QADashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("QADashboardHygieneCheck.aspx");
        }

        protected void btnCaseIdCheck_Click(object sender, EventArgs e)
        {
            Con.Open();
            SqlCommand cmd = new SqlCommand("select * from [dbo].[FY22HygieneCheckdb] where CaseID=@CaseId", Con);
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
            SqlCommand cmd = new SqlCommand("select * from [dbo].[FY22HygieneCheckdb] where Interaction_ID=@Interaction_ID", Con);
            cmd.Parameters.AddWithValue("@CallID_SR_ID", tbId7.Text);
            cmd.Connection = Con;
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                lblInteractionIdChk.Visible = true;
                lblInteractionIdChk.Text = "Call ID exists!!";
                lblInteractionIdChk.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblInteractionIdChk.Visible = true;
                lblInteractionIdChk.Text = "This is a new Call ID!!";
                lblInteractionIdChk.ForeColor = System.Drawing.Color.Green;
            }
        }

        protected void SoMe_GuideLines_Click(object sender, EventArgs e)
        {
            //Page.ClientScript.RegisterStartupScript(
            //this.GetType(), "OpenWindow", "window.open('21_SoMeLegendGL.aspx','_newtab');", true); //Opens in a new Tab
            //Server.Transfer("21_VoiceLegendGL.aspx");
        }

        protected void ddHygType_SelectedIndexChanged(object sender, EventArgs e)
        {
            var value = ddHygType.SelectedItem.Value;
            if (value == "0")
            {
                ddInvalidReason.Items.Clear();
                ddInvalidReason.Items.Add("--Choose--");
                ddInvalidReason.Items.Add("SO created for no reason");
                ddInvalidReason.Items.Add("Multiple SO created with dispatch done");
                ddInvalidReason.Items.Add("Multiple SO created with not dispatch done");
                ddInvalidReason.Items.Add("NA");
                ddInvalidReason.Focus();
                lblHygType.Text = ddHygType.SelectedItem.Text;
            }
            else if (value == "1")
            {
                ddInvalidReason.Items.Clear();
                ddInvalidReason.Items.Add("--Choose--");
                ddInvalidReason.Items.Add("Missing E-mail address");
                ddInvalidReason.Items.Add("Entered incorrectly");
                ddInvalidReason.Items.Add("Failed to verify");
                ddInvalidReason.Items.Add("Failed to phonetically verify");
                ddInvalidReason.Items.Add("Verified incorrectly");
                ddInvalidReason.Items.Add("Autogenerated email process");
                ddInvalidReason.Items.Add("NA");
                ddInvalidReason.Focus();
                lblHygType.Text = ddHygType.SelectedItem.Text;
            }
            else if (value == "2")
            {
                ddInvalidReason.Items.Clear();
                ddInvalidReason.Items.Add("--Choose--");
                ddInvalidReason.Items.Add("Incorrect closure");
                ddInvalidReason.Items.Add("Resolution Miss");
                ddInvalidReason.Items.Add("Incorrect TS");
                ddInvalidReason.Items.Add("Irregular/Missed Follow-up");
                ddInvalidReason.Items.Add("Incorrect Documentation");
                ddInvalidReason.Items.Add("Survey Not Sent");
                ddInvalidReason.Items.Add("NA");
                ddInvalidReason.Focus();
                lblHygType.Text = ddHygType.SelectedItem.Text;
            }
            else if (value == "3")
            {
                ddInvalidReason.Items.Clear();
                ddInvalidReason.Items.Add("--Choose--");
                ddInvalidReason.Items.Add("No Call Back done");
                ddInvalidReason.Items.Add("Documentation Complete");
                ddInvalidReason.Items.Add("Documentation Incomplete");
                ddInvalidReason.Items.Add("NA");
                ddInvalidReason.Focus();
                lblHygType.Text = ddHygType.SelectedItem.Text;
            }
            else if (value == "4")
            {
                ddInvalidReason.Items.Clear();
                ddInvalidReason.Items.Add("--Choose--");
                ddInvalidReason.Items.Add("Incorrect Resolution Code");
                ddInvalidReason.Items.Add("Resolution Miss");
                ddInvalidReason.Items.Add("Ownership");
                ddInvalidReason.Focus();
                lblHygType.Text = ddHygType.SelectedItem.Text;
            }
            else if (value == "5")
            {
                ddInvalidReason.Items.Clear();
                ddInvalidReason.Items.Add("NA");
                ddInvalidReason.Focus();
                lblHygType.Text = ddHygType.SelectedItem.Text;
            }
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Hygiene_Check.aspx");
        }

        protected void btnSendMail_Click(object sender, EventArgs e)
        {
            resend_maildetails();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Mail Resent Successfully');window.location ='QADashboardHygieneCheck.aspx';", true);
        }

        protected void FileDownload(object sender, EventArgs e)
        {
            Response.Redirect("~/Download/FY22 Hygiene Check Report.xlsx");
        }
    }
}