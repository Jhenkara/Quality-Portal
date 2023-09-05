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
    public partial class AuditSheetTLForums : System.Web.UI.Page
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
            DateTime d2 = tbId11.Text != string.Empty ? Convert.ToDateTime(tbId11.Text) : DateTime.MinValue;
            TimeSpan tspan = d1 - d2;
            //tbId13.Text = tspan.TotalDays.ToString();
        }

        public void bind_data()
        {
            SqlCommand cmd = new SqlCommand("Select * from [dbo].[SoMeForum_Legend] where CaseID=@CaseID and Reporting_Manager=@Mgr_Name or Employee_Mail=@Username", Con);
            cmd.Parameters.AddWithValue("@CaseID", Request.QueryString["case"].ToString());
            cmd.Parameters.AddWithValue("@Username", Session["Username"]);
            cmd.Parameters.AddWithValue("@Mgr_Name", Request.QueryString["mgr"].ToString());
            cmd.Connection = Con;
            Con.Open();
            SqlDataAdapter daa = new SqlDataAdapter(cmd);

            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            tbId1.Text = dtt.Rows[0]["QAName"].ToString();
            tbId1.ReadOnly = true;

            tbId1a.Text = dtt.Rows[0]["QAMail"].ToString();
            tbId1a.ReadOnly = true;

            tbId2.Text = dtt.Rows[0]["CustomerType"].ToString();
            tbId2.ReadOnly = true;

            tbId3.Text = dtt.Rows[0]["Month"].ToString();
            tbId3.ReadOnly = true;

            tbId4.Text = dtt.Rows[0]["EmployeeID"].ToString();
            tbId4.ReadOnly = true;

            tbId5.Text = dtt.Rows[0]["Employee_Name"].ToString();
            tbId5.ReadOnly = true;

            tbId6.Text = dtt.Rows[0]["Employee_Mail"].ToString();
            tbId6.ReadOnly = true;

            tbId7.Text = dtt.Rows[0]["Reporting_Manager"].ToString();
            tbId7.ReadOnly = true;

            tbId8.Text = dtt.Rows[0]["TeamName"].ToString();
            tbId8.ReadOnly = true;

            tbId9.Text = dtt.Rows[0]["CCEmail"].ToString();
            tbId9.ReadOnly = true;

            tbId10.Text = dtt.Rows[0]["CaseDate"].ToString();
            tbId10.ReadOnly = true;

            tbId11.Text = dtt.Rows[0]["EvaluationDate"].ToString();
            tbId11.ReadOnly = true;

            tbId12.Text = dtt.Rows[0]["CaseID"].ToString();
            tbId12.ReadOnly = true;

            tbId13.Text = dtt.Rows[0]["CaseType"].ToString();
            tbId13.ReadOnly = true;

            tbId14.Text = dtt.Rows[0]["ProblemDescription"].ToString();
            tbId14.ReadOnly = true;

            tbId15.Text = dtt.Rows[0]["ProductLine"].ToString();
            tbId15.ReadOnly = true;

            tbId16.Text = dtt.Rows[0]["Prediction"].ToString();
            tbId16.ReadOnly = true;

            tbId17.Text = dtt.Rows[0]["NonCompliance"].ToString();
            tbId17.ReadOnly = true;

            tbId18.Text = dtt.Rows[0]["NonComplianceDetail"].ToString();
            tbId18.ReadOnly = true;

            TextBox1.Text = dtt.Rows[0]["WhatWentWell"].ToString();
            TextBox1.ReadOnly = true;

            TextBox2.Text = dtt.Rows[0]["Opportunities"].ToString();
            TextBox2.ReadOnly = true;

            TotalCompl.Text = dtt.Rows[0]["TotalCompliance"].ToString();

            CustCrit.Text = dtt.Rows[0]["CustCritical"].ToString();

            BusCrit.Text = dtt.Rows[0]["BusCritical"].ToString();

            //scoring

            ddv1.Text = dtt.Rows[0]["A1"].ToString();
            ddv1.ReadOnly = true;

            ddv2.Text = dtt.Rows[0]["A2"].ToString();
            ddv2.ReadOnly = true;

            ddv3.Text = dtt.Rows[0]["A3"].ToString();
            ddv3.ReadOnly = true;

            ddv4.Text = dtt.Rows[0]["A4"].ToString();
            ddv4.ReadOnly = true;

            ddv5.Text = dtt.Rows[0]["A5"].ToString();
            ddv5.ReadOnly = true;

            ddv6.Text = dtt.Rows[0]["B1"].ToString();
            ddv6.ReadOnly = true;

            ddv7.Text = dtt.Rows[0]["B2"].ToString();
            ddv7.ReadOnly = true;

            ddv8.Text = dtt.Rows[0]["C1"].ToString();
            ddv8.ReadOnly = true;

            ddv9.Text = dtt.Rows[0]["C2"].ToString();
            ddv9.ReadOnly = true;

            ddv10.Text = dtt.Rows[0]["C3"].ToString();
            ddv10.ReadOnly = true;

            ddv11.Text = dtt.Rows[0]["C4"].ToString();
            ddv11.ReadOnly = true;

            ddv12.Text = dtt.Rows[0]["C5"].ToString();
            ddv12.ReadOnly = true;

            ddv13.Text = dtt.Rows[0]["D1"].ToString();
            ddv13.ReadOnly = true;

            ddv14.Text = dtt.Rows[0]["D2"].ToString();
            ddv14.ReadOnly = true;

            ddv15.Text = dtt.Rows[0]["D3"].ToString();
            ddv15.ReadOnly = true;

            ddv16.Text = dtt.Rows[0]["E1"].ToString();
            ddv16.ReadOnly = true;

            ddv17.Text = dtt.Rows[0]["E2"].ToString();
            ddv17.ReadOnly = true;

            ddv18.Text = dtt.Rows[0]["E3"].ToString();
            ddv18.ReadOnly = true;

            ddv19.Text = dtt.Rows[0]["E4"].ToString();
            ddv19.ReadOnly = true;

            ddv20.Text = dtt.Rows[0]["F1"].ToString();
            ddv20.ReadOnly = true;

            Con.Close();

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("TLLogin.aspx");
        }
    }
}