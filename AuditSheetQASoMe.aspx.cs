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
    public partial class AuditSheetQASoMe : System.Web.UI.Page
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
            Response.Redirect("QADashboardSoMe.aspx");
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
            SqlCommand cmd = new SqlCommand("Select * from [dbo].[SoMeFBTW_Legend] where CaseID=@CaseID and QAMail=@Username", Con);
            cmd.Parameters.AddWithValue("@CaseID", Request.QueryString["case"].ToString());
            cmd.Parameters.AddWithValue("@Username", Session["Username"]);
            cmd.Connection = Con;
            Con.Open();
            SqlDataAdapter daa = new SqlDataAdapter(cmd);

            DataTable dtt = new DataTable();
            daa.Fill(dtt);

            ddCusType.SelectedItem.Text = dtt.Rows[0]["CustomerType"].ToString();

            ddMonth.SelectedItem.Text = dtt.Rows[0]["Month"].ToString();

            tbId2.Text = dtt.Rows[0]["EmployeeID"].ToString();

            tbId3.Text = dtt.Rows[0]["Employee_Name"].ToString();
            tbId3.ReadOnly = true;

            TextBox3.Text = dtt.Rows[0]["Employee_Mail"].ToString();
            TextBox3.ReadOnly = true;

            TextBox6.Text = dtt.Rows[0]["Reporting_Manager"].ToString();
            TextBox6.ReadOnly = true;

            ddTeamName.SelectedItem.Text = dtt.Rows[0]["TeamName"].ToString();

            TextBox4.Text = dtt.Rows[0]["CCEmail"].ToString();

            tbId4.Text = dtt.Rows[0]["CaseDate"].ToString();

            tbId5.Text = dtt.Rows[0]["EvaluationDate"].ToString();
            tbId5.ReadOnly = true;

            tbId6.Text = dtt.Rows[0]["CaseID"].ToString();
            tbId6.ReadOnly = true;

            ddCaseType.SelectedItem.Text = dtt.Rows[0]["CaseType"].ToString();

            tbId9.Text = dtt.Rows[0]["ProblemDescription"].ToString();

            ddProdLin.SelectedItem.Text = dtt.Rows[0]["ProductLine"].ToString();

            ddPred.SelectedItem.Text = dtt.Rows[0]["Prediction"].ToString();

            ddNonComp.SelectedItem.Text = dtt.Rows[0]["NonCompliance"].ToString();

            tbNonComp.Text = dtt.Rows[0]["NonComplianceDetail"].ToString();

            TextBox1.Text = dtt.Rows[0]["WhatWentWell"].ToString();

            TextBox2.Text = dtt.Rows[0]["Opportunities"].ToString();

            TotalCompl.Text = dtt.Rows[0]["TotalCompliance"].ToString();

            CustCrit.Text = dtt.Rows[0]["CustCritical"].ToString();

            BusCrit.Text = dtt.Rows[0]["BusCritical"].ToString();

            //scoring

            A1.SelectedItem.Text = dtt.Rows[0]["A1"].ToString();

            A2.SelectedItem.Text = dtt.Rows[0]["A2"].ToString();

            A3.SelectedItem.Text = dtt.Rows[0]["A3"].ToString();

            A4.SelectedItem.Text = dtt.Rows[0]["A4"].ToString();

            B1.SelectedItem.Text = dtt.Rows[0]["B1"].ToString();

            B2.SelectedItem.Text = dtt.Rows[0]["B2"].ToString();

            B3.SelectedItem.Text = dtt.Rows[0]["B3"].ToString();

            C1.SelectedItem.Text = dtt.Rows[0]["C1"].ToString();

            C2.SelectedItem.Text = dtt.Rows[0]["C2"].ToString();

            C3.SelectedItem.Text = dtt.Rows[0]["C3"].ToString();

            C4.SelectedItem.Text = dtt.Rows[0]["C4"].ToString();

            D1.SelectedItem.Text = dtt.Rows[0]["D1"].ToString();

            D2.SelectedItem.Text = dtt.Rows[0]["D2"].ToString();

            D3.SelectedItem.Text = dtt.Rows[0]["D3"].ToString();

            E1.SelectedItem.Text = dtt.Rows[0]["E1"].ToString();

            E2.SelectedItem.Text = dtt.Rows[0]["E2"].ToString();

            E3.SelectedItem.Text = dtt.Rows[0]["E3"].ToString();

            F1.SelectedItem.Text = dtt.Rows[0]["F1"].ToString();

            Con.Close();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string Compl = Convert.ToString(TotalCompl.Text);

            Con.Open();
            SqlCommand cmd = Con.CreateCommand();

            string CommandText = "UPDATE [dbo].[SoMeFBTW_Legend] SET CustomerType=@CustomerType,Month=@Month,EmployeeID=@EmployeeID,Employee_Name=@Employee_Name,Employee_Mail=@Employee_Mail,Reporting_Manager=@Reporting_Manager,TeamName=@TeamName,CCEmail=@CCEmail,EvaluationDate=@EvaluationDate,CaseDate=@CaseDate,CaseType=@CaseType,ProblemDescription=@ProblemDescription,ProductLine=@ProductLine,Prediction=@Prediction,NonCompliance=@NonCompliance,NonComplianceDetail=@NonComplianceDetail,TotalCompliance=@TotalCompliance,CustCritical=@CustCritical,BusCritical=@BusCritical,WhatWentWell=@WhatWentWell,Opportunities=@Opportunities,A1=@A1,A2=@A2,A3=@A3,A4=@A4,B1=@B1,B2=@B2,B3=@B3,C1=@C1,C2=@C2,C3=@C3,C4=@C4,D1=@D1,D2=@D2,D3=@D3,E1=@E1,E2=@E2,E3=@E3,F1=@F1,[AuditStatus]='Audit Updated and Accepted by Agent' WHERE CaseID=@CaseID";
            cmd = new SqlCommand(CommandText, Con);
            cmd.Parameters.AddWithValue("@CustomerType", ddCusType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Month", ddMonth.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@EmployeeID", tbId2.Text);
            cmd.Parameters.AddWithValue("@Employee_Name", tbId3.Text);
            cmd.Parameters.AddWithValue("@Employee_Mail", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Reporting_Manager", TextBox6.Text);
            cmd.Parameters.AddWithValue("@TeamName", ddTeamName.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CCEmail", TextBox4.Text);
            cmd.Parameters.AddWithValue("@EvaluationDate", tbId5.Text);
            cmd.Parameters.AddWithValue("@CaseID", tbId6.Text);
            cmd.Parameters.AddWithValue("@CaseDate", tbId4.Text);
            cmd.Parameters.AddWithValue("@CaseType", ddCaseType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ProblemDescription", tbId9.Text);
            cmd.Parameters.AddWithValue("@ProductLine", ddProdLin.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Prediction", ddPred.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@NonCompliance", ddNonComp.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@NonComplianceDetail", tbNonComp.Text);
            cmd.Parameters.AddWithValue("@TotalCompliance", Compliance.Value);
            cmd.Parameters.AddWithValue("@CustCritical", hfv_CustCrit.Value);
            cmd.Parameters.AddWithValue("@BusCritical", hfv_BusCrit.Value);
            cmd.Parameters.AddWithValue("@WhatWentWell", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Opportunities", TextBox2.Text);
            cmd.Parameters.AddWithValue("@A1", A1.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@A2", A2.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@A3", A3.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@A4", A4.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@B1", B1.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@B2", B2.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@B3", B3.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@C1", C1.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@C2", C2.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@C3", C3.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@C4", C4.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@D1", D1.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@D2", D2.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@D3", D3.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@E1", E1.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@E2", E2.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@E3", E3.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@F1", F1.SelectedItem.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            Con.Close();
            //maildetails();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Audit Updated Successfully');window.location ='QADashboardSoMe.aspx';", true);
        }
    }
}