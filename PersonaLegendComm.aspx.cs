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
    public partial class PersonaLegendComm : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            var dateAsString = DateTime.Now.ToString("MM/dd/yyyy");
            tbId5.Text = dateAsString;

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
            string Compl = Convert.ToString(TotalCompl.Text);

            Con.Open();
            SqlCommand cmd = Con.CreateCommand();

            string CommandText = "INSERT INTO [dbo].[AuditLegendComm](QAName,QAMail,CustomerType,BusinessUnit,DeliveryType,Month,EmployeeID,Employee_Name,Employee_Mail,Reporting_Manager,TeamName,StakeHolderEmail,EvaluationDate,CaseID,CSO,CallDate,CallID_SR_ID,CallDuration,CaseType,ProblemDescription,ProductLine,PersonaIdentified,ProficiencyLevel,Prediction,NonCompliance,NonComplianceDetail,TotalCompliance,CustCritical,BusCritical,Highlights,Opportunities,EffortlessExp,EffectiveCRMUtil,FCR,DemonstrateUrgency,EffProbing,LogAppr_TrblShtnStp,CustHndlnSkls,PosLang,Attitude,Compliance,TraQue1_StrokeApp,TraQue2_PCI_Compliance,TraQue3,TraQue4,TraQue5,TraQue6,TraQue7) values " +
                "(@QAName,@QAMail,@CustomerType,@BusinessUnit,@DeliveryType,@Month,@EmployeeID,@Employee_Name,@Employee_Mail,@Reporting_Manager,@TeamName,@StakeHolderEmail,@EvaluationDate,@CaseID,@CSO,@CallDate,@CallID_SR_ID,@CallDuration,@CaseType,@ProblemDescription,@ProductLine,@PersonaIdentified,@ProficiencyLevel,@Prediction,@NonCompliance,@NonComplianceDetail,@TotalCompliance,@CustCritical,@BusCritical,@Highlights,@Opportunities,@EffortlessExp,@EffectiveCRMUtil,@FCR,@DemonstrateUrgency,@EffProbing,@LogAppr_TrblShtnStp,@CustHndlnSkls,@PosLang,@Attitude,@Compliance,@TraQue1_StrokeApp,@TraQue2_PCI_Compliance,@TraQue3,@TraQue4,@TraQue5,@TraQue6,@TraQue7)";
            cmd = new SqlCommand(CommandText, Con);
            cmd.Parameters.AddWithValue("@QAName", tbId1.Text);
            cmd.Parameters.AddWithValue("@QAMail", tbId1a.Text);
            cmd.Parameters.AddWithValue("@CustomerType", ddCusType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@BusinessUnit", ddBU.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@DeliveryType", ddDeliType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Month", ddMonth.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@EmployeeID", tbId2.Text);
            cmd.Parameters.AddWithValue("@Employee_Name", tbId3.Text);
            cmd.Parameters.AddWithValue("@Employee_Mail", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Reporting_Manager", TextBox6.Text);
            cmd.Parameters.AddWithValue("@TeamName", ddTeamName.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@StakeHolderEmail", TextBox4.Text);
            cmd.Parameters.AddWithValue("@EvaluationDate", tbId5.Text);
            cmd.Parameters.AddWithValue("@CaseID", tbId6.Text);
            cmd.Parameters.AddWithValue("@CSO", TextBox7.Text);
            cmd.Parameters.AddWithValue("@CallDate", tbId4.Text);
            cmd.Parameters.AddWithValue("@CallID_SR_ID", tbId7.Text);
            cmd.Parameters.AddWithValue("@CallDuration", tbId8.Text);
            cmd.Parameters.AddWithValue("@CaseType", ddCaseType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ProblemDescription", tbId9.Text);
            cmd.Parameters.AddWithValue("@ProductLine", ddProdLin.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@PersonaIdentified", ddPersona.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ProficiencyLevel", hfv_ProfLevel.Value);
            cmd.Parameters.AddWithValue("@Prediction", ddPred.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@NonCompliance", ddNonComp.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@NonComplianceDetail", tbNonComp.Text);
            cmd.Parameters.AddWithValue("@TotalCompliance", Compliance.Value);
            cmd.Parameters.AddWithValue("@CustCritical", hfv_CustCrit.Value);
            cmd.Parameters.AddWithValue("@BusCritical", hfv_BusCrit.Value);
            cmd.Parameters.AddWithValue("@Highlights", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Opportunities", TextBox2.Text);
            cmd.Parameters.AddWithValue("@EffortlessExp", C01.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@EffectiveCRMUtil", C02.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@FCR", C03.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@DemonstrateUrgency", C04.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@EffProbing", C05.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@LogAppr_TrblShtnStp", C06.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CustHndlnSkls", C07.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@PosLang", C08.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Attitude", C09.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Compliance", C10.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@IdentifiedRightPersona", C11.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@AppliedRightStrokeEconomy", C12.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@TraQue1_StrokeApp", TextBox5.Text);
            cmd.Parameters.AddWithValue("@TraQue2_PCI_Compliance", C13.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@TraQue3", C14.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@TraQue4", C15.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@TraQue5", C16.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@TraQue6", C17.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@TraQue7", C18.SelectedItem.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            Con.Close();
            maildetails();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Audit Saved and Mail sent Successfully');window.location ='PersonaLegendComm.aspx';", true);
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

        protected void FileDownload(object sender, EventArgs e)
        {
            Response.Redirect("~/Download/CommercialLegendReport.xlsx");
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

                if (FileUploadControl.HasFile)
                {
                    string fileName = Path.GetFileName(FileUploadControl.PostedFile.FileName);
                    Attachment myAttachment = new Attachment(FileUploadControl.FileContent, fileName);
                    mail.Attachments.Add(myAttachment);
                }

                //SqlCommand cmd = new SqlCommand("SELECT Filename, Extension, Document from [dbo].[AttachmentFile] where Filename = '" + tbId6.Text + "'", Con);
                //Con.Open();
                //using (SqlDataReader sdr = cmd.ExecuteReader())
                //{
                //    //Get attachment Data
                //    sdr.Read();
                //    bytes = (byte[])sdr["Document"];
                //    fileName = sdr["Filename"].ToString();

                //    //This works if files are stored in folder instead of the below code
                //    //Attachment resume = new Attachment(Server.MapPath(VirtualPathUtility.ToAbsolute("~/images/cv/" + fileName)));

                //    //Attach Data as Email Attachment
                //    MemoryStream pdf = new MemoryStream(bytes);
                //    Attachment data = new Attachment(pdf, fileName);
                //    mail.Attachments.Add(data);
                //}
                //Con.Close();

                foreach (string CCEmail in ccc)
                {
                    mail.CC.Add(new MailAddress(CCEmail)); //Adding Multiple CC email Id
                }

                mail.Subject = "Commercial Audit | " + tbId3.Text + " - " + Compliance.Value;
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
            string body2 = "An Audit has been conducted for the below mentioned Case ID. You can find your audit sheet to review by logging in to the following URL and provide a response.";
            string case_id = "Case ID is : " + tbId6.Text;
            string body = "http://15.42.19.247:120/AgentLogin.aspx";
            string body0 = "<b style=" + "color:red" + "><i>Login Instructions :</i></b> To Login use your email ID as the Username and Employee Id as the Password";
            string body1 = "<b style=" + "color:red" + "><i>Note to the Engineer :</i></b> This Audit is open to discussion for the next 96 hours, there after the submitted score stands unchanged and audit status would change to <b><i>'Audited and Auto Accepted'<i/><b/>";
            string body3 = "<b style=" + "color:red" + "><i>Note to the Team Leads :</i></b> Please click on the below link to review the Engineer's Audit. To Login, use your email ID as the Username and Employee Id as the Password";
            string body4 = "http://15.42.19.247:120/TLLogin.aspx";
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
            //string cc = "shaziya.sadaf@hp.com";

            string password = "bid.sun-21";
            string subject = sb.ToString();
            body = sb.ToString();

            bool status = SendEmail(to, from, password, subject, string.Format(body), cc);
            return true;
        }

        protected void QADashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("QADashboardComm.aspx");
        }

        protected void btnCaseIdCheck_Click(object sender, EventArgs e)
        {
            Con.Open();
            SqlCommand cmd = new SqlCommand("select * from [dbo].[AuditLegendComm] where CaseID=@CaseId", Con);
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
    }
}