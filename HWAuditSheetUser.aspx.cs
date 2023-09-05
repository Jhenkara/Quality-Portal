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
    public partial class HWAuditSheetUser : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            tbDispDetails.Visible = false;
            btnDispute.Visible = false;
            rfvDispDetails.Visible = false;

            if (Session["Username"] == null)
            {
                Response.Redirect("AgentLogin.aspx");
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
            DateTime d2 = tbId13.Text != string.Empty ? Convert.ToDateTime(tbId13.Text) : DateTime.MinValue;
            TimeSpan tspan = d1 - d2;
            //tbId13.Text = tspan.TotalDays.ToString();
            if (tspan.Days > 3)
            {
                btnDisp.Visible = false;
                btnAccept.Visible = false;
            }
        }

        public void bind_data()
        {
            SqlCommand cmd = new SqlCommand("Select * from [dbo].[HardwareV2Legend] where Case_ID=@CaseID and Employee_Mail=@Username", Con);
            cmd.Parameters.AddWithValue("@CaseID", Request.QueryString["case"].ToString());
            cmd.Parameters.AddWithValue("@Username", Session["Username"]);
            cmd.Connection = Con;
            Con.Open();
            SqlDataAdapter daa = new SqlDataAdapter(cmd);

            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            tbId1.Text = dtt.Rows[0]["QA_Name"].ToString();
            tbId1.ReadOnly = true;

            tbId1a.Text = dtt.Rows[0]["QA_Mail"].ToString();
            tbId1a.ReadOnly = true;

            tbId2.Text = dtt.Rows[0]["Customer_Type"].ToString();
            tbId2.ReadOnly = true;

            tbId3.Text = dtt.Rows[0]["Business_Unit"].ToString();
            tbId3.ReadOnly = true;

            tbId4.Text = dtt.Rows[0]["Product_Line"].ToString();
            tbId4.ReadOnly = true;

            tbId5.Text = dtt.Rows[0]["Month"].ToString();
            tbId5.ReadOnly = true;

            tbId6.Text = dtt.Rows[0]["Employee_ID"].ToString();
            tbId6.ReadOnly = true;

            tbId7.Text = dtt.Rows[0]["Employee_Name"].ToString();
            tbId7.ReadOnly = true;

            tbId8.Text = dtt.Rows[0]["Employee_Mail"].ToString();
            tbId8.ReadOnly = true;

            tbId9.Text = dtt.Rows[0]["Reporting_Manager"].ToString();
            tbId9.ReadOnly = true;

            tbId10.Text = dtt.Rows[0]["Team_Name"].ToString();
            tbId10.ReadOnly = true;

            tbId11.Text = dtt.Rows[0]["CC_Mail"].ToString();
            tbId11.ReadOnly = true;

            tbId12.Text = dtt.Rows[0]["Call_Date"].ToString();
            tbId12.ReadOnly = true;

            tbId13.Text = dtt.Rows[0]["Evaluation_Date"].ToString();
            tbId13.ReadOnly = true;

            tbId14.Text = dtt.Rows[0]["Case_ID"].ToString();
            tbId14.ReadOnly = true;

            TextBox1.Text = dtt.Rows[0]["CSO"].ToString();
            TextBox1.ReadOnly = true;

            tbId15.Text = dtt.Rows[0]["What_Went_Well"].ToString();
            tbId15.ReadOnly = true;

            tbId16.Text = dtt.Rows[0]["Opportunities"].ToString();
            tbId16.ReadOnly = true;

            tbId17.Text = dtt.Rows[0]["Call_ID_SR_ID"].ToString();
            tbId17.ReadOnly = true;

            tbId18.Text = dtt.Rows[0]["Call_Duration"].ToString();
            tbId18.ReadOnly = true;

            tbId19.Text = dtt.Rows[0]["Case_Type"].ToString();
            tbId19.ReadOnly = true;

            tbId20.Text = dtt.Rows[0]["Phone_Number"].ToString();
            tbId20.ReadOnly = true;

            tbId21.Text = dtt.Rows[0]["Service_Created"].ToString();
            tbId21.ReadOnly = true;

            tbId22.Text = dtt.Rows[0]["Problem_Description"].ToString();
            tbId22.ReadOnly = true;

            tbId23.Text = dtt.Rows[0]["Persona_Identified"].ToString();
            tbId23.ReadOnly = true;

            tbId24.Text = dtt.Rows[0]["Proficiency_Level"].ToString();
            tbId24.ReadOnly = true;

            tbId25.Text = dtt.Rows[0]["Prediction"].ToString();
            tbId25.ReadOnly = true;

            tbId26.Text = dtt.Rows[0]["Non_Compliance"].ToString();
            tbId26.ReadOnly = true;

            tbId27.Text = dtt.Rows[0]["Non_Compliance_Detail"].ToString();
            tbId27.ReadOnly = true;

            TotalCompl.Text = dtt.Rows[0]["Total_Compliance"].ToString();

            CustCrit.Text = dtt.Rows[0]["CustCritical"].ToString();

            BusCrit.Text = dtt.Rows[0]["BusCritical"].ToString();

            //scoring

            ddv1.Text = dtt.Rows[0]["ProcessPolicyKnowledgeA1"].ToString();
            ddv1.ReadOnly = true;

            ddv2.Text = dtt.Rows[0]["ProcessPolicyKnowledgeA2"].ToString();
            ddv2.ReadOnly = true;

            ddv3.Text = dtt.Rows[0]["TechnicalKnowledgeB1"].ToString();
            ddv3.ReadOnly = true;

            ddv4.Text = dtt.Rows[0]["TechnicalKnowledgeB2"].ToString();
            ddv4.ReadOnly = true;

            ddv5.Text = dtt.Rows[0]["OwnershipC1"].ToString();
            ddv5.ReadOnly = true;

            ddv6.Text = dtt.Rows[0]["EaseOfEffortD1"].ToString();
            ddv6.ReadOnly = true;

            ddv7.Text = dtt.Rows[0]["CommunicationE1"].ToString();
            ddv7.ReadOnly = true;

            ddv8.Text = dtt.Rows[0]["CommunicationE2"].ToString();
            ddv8.ReadOnly = true;

            ddv9.Text = dtt.Rows[0]["PersonaF1"].ToString();
            ddv9.ReadOnly = true;

            ddv10.Text = dtt.Rows[0]["PersonaF2"].ToString();
            ddv10.ReadOnly = true;

            ddv13.Text = dtt.Rows[0]["TraQue1_StrokeApp"].ToString();
            ddv13.ReadOnly = true;

            ddv14.Text = dtt.Rows[0]["TraQue2_PCI_Compliance"].ToString();
            ddv14.ReadOnly = true;

            ddv15.Text = dtt.Rows[0]["TraQue3"].ToString();
            ddv15.ReadOnly = true;

            ddv16.Text = dtt.Rows[0]["TraQue4"].ToString();
            ddv16.ReadOnly = true;

            ddv17.Text = dtt.Rows[0]["TraQue5"].ToString();
            ddv17.ReadOnly = true;

            ddv18.Text = dtt.Rows[0]["TraQue6"].ToString();
            ddv18.ReadOnly = true;

            ddv19.Text = dtt.Rows[0]["TraQue7"].ToString();
            ddv19.ReadOnly = true;

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
            SqlCommand cmd = new SqlCommand("Update [dbo].[HardwareV2Legend] SET [Audit_Status]='Audited and Accepted by Agent' where Case_ID=@CaseID", Con);
            cmd.Parameters.AddWithValue("@CaseID", Request.QueryString["case"].ToString());
            cmd.ExecuteNonQuery();
            Con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Your Response has been Received successfully');window.location ='UserDashboardHW.aspx';", true);
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
                string[] ccc = tbId11.Text.Split(';');
                mail.CC.Add(cc);

                mail.CC.Add("michael@hp.com");

                foreach (string CCEmail in ccc)
                {
                    mail.CC.Add(new MailAddress(CCEmail)); //Adding Multiple CC email Id
                }

                mail.Subject = "Repair Audit | " + tbId7.Text + " - " + TotalCompl.Text + " | Dispute";
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
            string case_id = "Case ID is : " + tbId16.Text;
            string body = "http://15.42.19.247:120/QALogin.aspx";
            string body1 = "<b style=" + "color:red" + "><i>Dispute Details : </i></b>" + tbDispDetails.Text;
            string salutation1 = "Warm Regards,";
            string signature = tbId7.Text;


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
                SqlCommand cmd = new SqlCommand("Update [dbo].[HardwareV2Legend] SET [Audit_Status]='Audited and Disputed by Agent' where Case_ID=@CaseID", Con);
                cmd.Parameters.AddWithValue("@CaseID", Request.QueryString["case"].ToString());
                cmd.Connection = Con;
                cmd.ExecuteNonQuery();
                Con.Close();
                maildetails();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Your Response has been Received successfully');window.location ='UserDashboardHW.aspx';", true);
            }
        }
    }
}