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
    public partial class HWAuditSheetTL : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Username"] == null)
            {
                Response.Redirect("TLLogin.aspx");
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
                string mgr_name = dtt.Rows[0]["ReportingManager"].ToString();
                lblUserDetails.Text = "Hello " + emp_name;
                Con.Close();
                bind_data();
            }

            DateTime d1 = DateTime.Now;
            DateTime d2 = tbId13.Text != string.Empty ? Convert.ToDateTime(tbId13.Text) : DateTime.MinValue;
            TimeSpan tspan = d1 - d2;
            //tbId13.Text = tspan.TotalDays.ToString();
        }

        public void bind_data()
        {
            SqlCommand cmd = new SqlCommand("Select * from [dbo].[HardwareV2Legend] where Case_ID=@CaseID and Reporting_Manager=@Mgr_Name or Employee_Mail=@Username", Con);
            cmd.Parameters.AddWithValue("@CaseID", Request.QueryString["case"].ToString());
            cmd.Parameters.AddWithValue("@Username", Session["Username"]);
            cmd.Parameters.AddWithValue("@Mgr_Name", Request.QueryString["mgr"].ToString());
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
            Response.Redirect("TLLogin.aspx");
        }
    }
}