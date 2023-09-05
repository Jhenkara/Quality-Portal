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
    public partial class AuditSheetQA_ADX : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
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
            Response.Redirect("QADashboardADX.aspx");
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
            SqlCommand cmd = new SqlCommand("Select * from ADXLegend where CaseID=@CaseID and QAMail=@Username", Con);
            cmd.Parameters.AddWithValue("@CaseID", Request.QueryString["case"].ToString());
            cmd.Parameters.AddWithValue("@Username", Session["Username"]);
            cmd.Connection = Con;
            Con.Open();
            SqlDataAdapter daa = new SqlDataAdapter(cmd);

            DataTable dtt = new DataTable();
            daa.Fill(dtt);

            ddCusType.SelectedItem.Text = dtt.Rows[0]["CustomerType"].ToString();

            ddBU.SelectedItem.Text = dtt.Rows[0]["BusinessUnit"].ToString();

            ddDeliType.SelectedItem.Text = dtt.Rows[0]["DeliveryType"].ToString();

            ddMonth.SelectedItem.Text = dtt.Rows[0]["Month"].ToString();

            tbId2.Text = dtt.Rows[0]["EmployeeID"].ToString();

            tbId3.Text = dtt.Rows[0]["Employee_Name"].ToString();
            tbId3.ReadOnly = true;

            TextBox3.Text = dtt.Rows[0]["Employee_Mail"].ToString();
            TextBox3.ReadOnly = true;

            TextBox6.Text = dtt.Rows[0]["Reporting_Manager"].ToString();
            TextBox6.ReadOnly = true;

            ddTeamName.SelectedItem.Text = dtt.Rows[0]["TeamName"].ToString();

            TextBox4.Text = dtt.Rows[0]["CCMail"].ToString();

            tbId4.Text = dtt.Rows[0]["CallDate"].ToString();

            tbId5.Text = dtt.Rows[0]["EvaluationDate"].ToString();
            tbId5.ReadOnly = true;

            tbId6.Text = dtt.Rows[0]["CaseID"].ToString();
            tbId6.ReadOnly = true;

            tbId7.Text = dtt.Rows[0]["CallID_SR_ID"].ToString();

            tbId8.Text = dtt.Rows[0]["CallDuration"].ToString();

            ddCaseType.SelectedItem.Text = dtt.Rows[0]["CaseType"].ToString();

            tbId9.Text = dtt.Rows[0]["ProblemDescription"].ToString();

            ddProdLin.SelectedItem.Text = dtt.Rows[0]["ProductLine"].ToString();

            ddPersona.SelectedItem.Text = dtt.Rows[0]["PersonaIdentified"].ToString();

            tbProfLvl.Text = dtt.Rows[0]["ProficiencyLevel"].ToString();
            tbProfLvl.ReadOnly = true;

            ddPred.SelectedItem.Text = dtt.Rows[0]["Prediction"].ToString();

            ddNonComp.SelectedItem.Text = dtt.Rows[0]["NonCompliance"].ToString();

            tbNonComp.Text = dtt.Rows[0]["NonComplianceDetail"].ToString();

            TextBox1.Text = dtt.Rows[0]["WhatWentWell"].ToString();

            TextBox2.Text = dtt.Rows[0]["Opportunities"].ToString();

            TotalCompl.Text = dtt.Rows[0]["TotalCompliance"].ToString();

            CustCrit.Text = dtt.Rows[0]["CustCritical"].ToString();

            BusCrit.Text = dtt.Rows[0]["BusCritical"].ToString();

            //scoring

            C01.SelectedItem.Text = dtt.Rows[0]["C01"].ToString();

            C02.SelectedItem.Text = dtt.Rows[0]["C02"].ToString();

            C03.SelectedItem.Text = dtt.Rows[0]["C03"].ToString();

            C04.SelectedItem.Text = dtt.Rows[0]["C04"].ToString();

            C05.SelectedItem.Text = dtt.Rows[0]["C05"].ToString();

            C06.SelectedItem.Text = dtt.Rows[0]["C06"].ToString();

            C07.SelectedItem.Text = dtt.Rows[0]["C07"].ToString();

            C08.SelectedItem.Text = dtt.Rows[0]["C08"].ToString();

            C09.SelectedItem.Text = dtt.Rows[0]["Tra_Que1"].ToString();

            C10.SelectedItem.Text = dtt.Rows[0]["Tra_Que2"].ToString();

            C11.SelectedItem.Text = dtt.Rows[0]["Tra_Que3"].ToString();

            C12.SelectedItem.Text = dtt.Rows[0]["Tra_Que4"].ToString();

            C13.SelectedItem.Text = dtt.Rows[0]["Tra_Que5"].ToString();

            Con.Close();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string Compl = Convert.ToString(TotalCompl.Text);

            Con.Open();
            SqlCommand cmd = Con.CreateCommand();

            string CommandText = "UPDATE [dbo].[ADXLegend] SET CustomerType=@CustomerType,BusinessUnit=@BusinessUnit,DeliveryType=@DeliveryType,Month=@Month,EmployeeID=@EmployeeID,Employee_Name=@Employee_Name,Employee_Mail=@Employee_Mail,Reporting_Manager=@Reporting_Manager,TeamName=@TeamName,CCMail=@CCMail,EvaluationDate=@EvaluationDate,CallDate=@CallDate,CallID_SR_ID=@CallID_SR_ID,CallDuration=@CallDuration,CaseType=@CaseType,ProblemDescription=@ProblemDescription,ProductLine=@ProductLine,PersonaIdentified=@PersonaIdentified,ProficiencyLevel=@ProficiencyLevel,Prediction=@Prediction,NonCompliance=@NonCompliance,NonComplianceDetail=@NonComplianceDetail,TotalCompliance=@TotalCompliance,CustCritical=@CustCritical,BusCritical=@BusCritical,WhatWentWell=@WhatWentWell,Opportunities=@Opportunities,C01=@C01,C02=@C02,C03=@C03,C04=@C04,C05=@C05,C06=@C06,C07=@C07,C08=@C08,Tra_Que1=@Tra_Que1,Tra_Que2=@Tra_Que2,Tra_Que3=@Tra_Que3,Tra_Que4=@Tra_Que4,Tra_Que5=@Tra_Que5,[AuditStatus]='Audit Updated and Accepted by Agent' WHERE CaseID=@CaseID";
            cmd = new SqlCommand(CommandText, Con);
            cmd.Parameters.AddWithValue("@CustomerType", ddCusType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@BusinessUnit", ddBU.SelectedItem.Text);
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
            cmd.Parameters.AddWithValue("@CallID_SR_ID", tbId7.Text);
            cmd.Parameters.AddWithValue("@CallDuration", tbId8.Text);
            cmd.Parameters.AddWithValue("@CaseType", ddCaseType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ProblemDescription", tbId9.Text);
            cmd.Parameters.AddWithValue("@ProductLine", ddProdLin.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@PersonaIdentified", ddPersona.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ProficiencyLevel", tbProfLvl.Text);
            cmd.Parameters.AddWithValue("@Prediction", ddPred.SelectedItem.Text);
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
            cmd.Parameters.AddWithValue("@C08", C08.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Tra_Que1", C09.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Tra_Que2", C10.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Tra_Que3", C11.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Tra_Que4", C12.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Tra_Que5", C13.SelectedItem.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            Con.Close();
            //maildetails();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Audit Updated Successfully');window.location ='QADashboardADX.aspx';", true);
        }
    }
}