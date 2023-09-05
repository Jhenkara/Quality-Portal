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
    public partial class HWAuditSheetQA : System.Web.UI.Page
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
            Response.Redirect("QADashboardHW.aspx");
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
            SqlCommand cmd = new SqlCommand("Select * from [dbo].[Hardwarev2Legend] where Case_ID=@CaseID and QA_Mail=@Username", Con);
            cmd.Parameters.AddWithValue("@CaseID", Request.QueryString["case"].ToString());
            cmd.Parameters.AddWithValue("@Username", Session["Username"]);
            cmd.Connection = Con;
            Con.Open();
            SqlDataAdapter daa = new SqlDataAdapter(cmd);

            DataTable dtt = new DataTable();
            daa.Fill(dtt);

            ddCusType.SelectedItem.Text = dtt.Rows[0]["Customer_Type"].ToString();

            ddBU.SelectedItem.Text = dtt.Rows[0]["Business_Unit"].ToString();

            ddProdLin.SelectedItem.Text = dtt.Rows[0]["Product_Line"].ToString(); 

            ddMonth.SelectedItem.Text = dtt.Rows[0]["Month"].ToString();

            tbId2.Text = dtt.Rows[0]["Employee_ID"].ToString();

            tbId3.Text = dtt.Rows[0]["Employee_Name"].ToString();
            tbId3.ReadOnly = true;

            TextBox3.Text = dtt.Rows[0]["Employee_Mail"].ToString();
            TextBox3.ReadOnly = true;

            TextBox6.Text = dtt.Rows[0]["Reporting_Manager"].ToString();
            TextBox6.ReadOnly = true;

            ddTeamName.SelectedItem.Text = dtt.Rows[0]["Team_Name"].ToString();

            TextBox4.Text = dtt.Rows[0]["CC_Mail"].ToString();

            tbId4.Text = dtt.Rows[0]["Call_Date"].ToString();

            tbId5.Text = dtt.Rows[0]["Evaluation_Date"].ToString();
            tbId5.ReadOnly = true;

            tbId6.Text = dtt.Rows[0]["Case_ID"].ToString();
            tbId6.ReadOnly = true;

            TextBox5.Text = dtt.Rows[0]["CSO"].ToString();

            tbId7.Text = dtt.Rows[0]["Call_ID_SR_ID"].ToString();

            tbId8.Text = dtt.Rows[0]["Call_Duration"].ToString();

            ddCaseType.SelectedItem.Text = dtt.Rows[0]["Case_Type"].ToString();

            tbId9.Text = dtt.Rows[0]["Phone_Number"].ToString();

            ddServCre.SelectedItem.Text = dtt.Rows[0]["Service_Created"].ToString();

            tbId10.Text = dtt.Rows[0]["Problem_Description"].ToString();

            ddPersona.SelectedItem.Text = dtt.Rows[0]["Persona_Identified"].ToString();

            tbProfLvl.Text = dtt.Rows[0]["Proficiency_Level"].ToString();
            tbProfLvl.ReadOnly = true;

            ddPred.SelectedItem.Text = dtt.Rows[0]["Prediction"].ToString();

            ddNonComp.SelectedItem.Text = dtt.Rows[0]["Non_Compliance"].ToString();

            tbNonComp.Text = dtt.Rows[0]["Non_Compliance_Detail"].ToString();

            TextBox1.Text = dtt.Rows[0]["What_Went_Well"].ToString();

            TextBox2.Text = dtt.Rows[0]["Opportunities"].ToString();

            TotalCompl.Text = dtt.Rows[0]["Total_Compliance"].ToString();

            CustCrit.Text = dtt.Rows[0]["CustCritical"].ToString();

            BusCrit.Text = dtt.Rows[0]["BusCritical"].ToString();

            //scoring

            A01.SelectedItem.Text = dtt.Rows[0]["ProcessPolicyKnowledgeA1"].ToString();

            A02.SelectedItem.Text = dtt.Rows[0]["ProcessPolicyKnowledgeA2"].ToString();

            B01.SelectedItem.Text = dtt.Rows[0]["TechnicalKnowledgeB1"].ToString();

            B02.SelectedItem.Text = dtt.Rows[0]["TechnicalKnowledgeB2"].ToString();

            C01.SelectedItem.Text = dtt.Rows[0]["OwnershipC1"].ToString();

            D01.SelectedItem.Text = dtt.Rows[0]["EaseOfEffortD1"].ToString();

            E01.SelectedItem.Text = dtt.Rows[0]["CommunicationE1"].ToString();

            E02.SelectedItem.Text = dtt.Rows[0]["CommunicationE2"].ToString();

            F01.SelectedItem.Text = dtt.Rows[0]["PersonaF1"].ToString();

            F02.SelectedItem.Text = dtt.Rows[0]["PersonaF2"].ToString();

            //Tracking Qstns

            TextBox7.Text = dtt.Rows[0]["TraQue1_StrokeApp"].ToString();

            C13.SelectedItem.Text = dtt.Rows[0]["TraQue2_PCI_Compliance"].ToString();

            C14.SelectedItem.Text = dtt.Rows[0]["TraQue3"].ToString();

            C15.SelectedItem.Text = dtt.Rows[0]["TraQue4"].ToString();

            C16.SelectedItem.Text = dtt.Rows[0]["TraQue5"].ToString();

            C17.SelectedItem.Text = dtt.Rows[0]["TraQue6"].ToString();

            C18.SelectedItem.Text = dtt.Rows[0]["TraQue7"].ToString();

            Con.Close();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string Compl = Convert.ToString(TotalCompl.Text);

            Con.Open();
            SqlCommand cmd = Con.CreateCommand();

            string CommandText = "UPDATE [dbo].[HardwareV2Legend] SET Customer_Type=@Customer_Type,Business_Unit=@Business_Unit,Product_Line=@Product_Line,Month=@Month,Employee_ID=@Employee_ID,Employee_Name=@Employee_Name,Employee_Mail=@Employee_Mail,Reporting_Manager=@Reporting_Manager,Team_Name=@Team_Name,CC_Mail=@CC_Mail,Evaluation_Date=@Evaluation_Date,Call_Date=@Call_Date,CSO=@CSO,Call_ID_SR_ID=@Call_ID_SR_ID,Call_Duration=@Call_Duration,Case_Type=@Case_Type,Phone_Number=@Phone_Number,Service_Created=@Service_Created,Problem_Description=@Problem_Description,Persona_Identified=@Persona_Identified,Proficiency_Level=@Proficiency_Level,Prediction=@Prediction,Non_Compliance=@Non_Compliance,Non_Compliance_Detail=@Non_Compliance_Detail,Total_Compliance=@Total_Compliance,CustCritical=@CustCritical,BusCritical=@BusCritical,What_Went_Well=@What_Went_Well,Opportunities=@Opportunities,ProcessPolicyKnowledgeA1=@ProcessPolicyKnowledgeA1,ProcessPolicyKnowledgeA2=@ProcessPolicyKnowledgeA2,TechnicalKnowledgeB1=@TechnicalKnowledgeB1,TechnicalKnowledgeB2=@TechnicalKnowledgeB2,OwnershipC1=@OwnershipC1,EaseOfEffortD1=@EaseOfEffortD1,CommunicationE1=@CommunicationE1,CommunicationE2=@CommunicationE2,PersonaF1=@PersonaF1,PersonaF2=@PersonaF2,TraQue1_StrokeApp=@TraQue1_StrokeApp,TraQue2_PCI_Compliance=@TraQue2_PCI_Compliance,TraQue3=@TraQue3,TraQue4=@TraQue4,TraQue5=@TraQue5,TraQue6=@TraQue6,TraQue7=@TraQue7,[Audit_Status]='Audit Updated and Accepted by Agent' WHERE Case_ID=@Case_ID";
            cmd = new SqlCommand(CommandText, Con);
            cmd.Parameters.AddWithValue("@Customer_Type", ddCusType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Business_Unit", ddBU.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Month", ddMonth.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Employee_ID", tbId2.Text);
            cmd.Parameters.AddWithValue("@Employee_Name", tbId3.Text);
            cmd.Parameters.AddWithValue("@Employee_Mail", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Reporting_Manager", TextBox6.Text);
            cmd.Parameters.AddWithValue("@Team_Name", ddTeamName.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CC_Mail", TextBox4.Text);
            cmd.Parameters.AddWithValue("@Evaluation_Date", tbId5.Text);
            cmd.Parameters.AddWithValue("@Case_ID", tbId6.Text);
            cmd.Parameters.AddWithValue("@CSO", TextBox5.Text);
            cmd.Parameters.AddWithValue("@Call_Date", tbId4.Text);
            cmd.Parameters.AddWithValue("@Call_ID_SR_ID", tbId7.Text);
            cmd.Parameters.AddWithValue("@Call_Duration", tbId8.Text);
            cmd.Parameters.AddWithValue("@Case_Type", ddCaseType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Phone_Number", tbId9.Text);
            cmd.Parameters.AddWithValue("@Service_Created", ddServCre.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Problem_Description", tbId10.Text);
            cmd.Parameters.AddWithValue("@Product_Line", ddProdLin.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Persona_Identified", ddPersona.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Proficiency_Level", tbProfLvl.Text);
            cmd.Parameters.AddWithValue("@Prediction", ddPred.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Non_Compliance", ddNonComp.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Non_Compliance_Detail", tbNonComp.Text);
            cmd.Parameters.AddWithValue("@Total_Compliance", Compliance.Value);
            cmd.Parameters.AddWithValue("@CustCritical", hfv_CustCrit.Value);
            cmd.Parameters.AddWithValue("@BusCritical", hfv_BusCrit.Value);
            cmd.Parameters.AddWithValue("@What_Went_Well", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Opportunities", TextBox2.Text);
            cmd.Parameters.AddWithValue("@ProcessPolicyKnowledgeA1", A01.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ProcessPolicyKnowledgeA2", A02.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@TechnicalKnowledgeB1", B01.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@TechnicalKnowledgeB2", B02.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@OwnershipC1", C01.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@EaseOfEffortD1", D01.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CommunicationE1", E01.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CommunicationE2", E02.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@PersonaF1", F01.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@PersonaF2", F02.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@TraQue1_StrokeApp", TextBox7.Text);
            cmd.Parameters.AddWithValue("@TraQue2_PCI_Compliance", C13.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@TraQue3", C14.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@TraQue4", C15.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@TraQue5", C16.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@TraQue6", C17.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@TraQue7", C18.SelectedItem.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            Con.Close();
            //maildetails();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Audit Updated Successfully');window.location ='QADashboardHW.aspx';", true);
        }
    }
}