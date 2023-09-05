using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.Net.Mail;
using System.IO;

namespace Audit_Legends
{
    public partial class ExitInterview_Dashboard : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        SqlConnection Con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                bind_data();

            }
        }

        public void bind_data()
        {
            Con1.Open();

            SqlDataSource SqlDataSource1 = new SqlDataSource();
                SqlDataSource1.ID = "SqlDataSource1";
                this.Page.Controls.Add(SqlDataSource1);
                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
                SqlDataSource1.SelectCommand = "select EmployeeID,EmployeeName,EngineerSubmission,HiringSubmission,ManagerSubmission FROM [dbo].[tbExitInterviewForm]";
                UserGrid.DataSource = SqlDataSource1;
                UserGrid.DataBind();
            Con1.Close();

        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            UserGrid.PageIndex = e.NewPageIndex;
            bind_data();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            Label caseid = (Label)row.FindControl("lblemp");
            string cass = caseid.Text;
            Response.Redirect("EditExitForm.aspx?case=" + cass);

        }
        

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                Con1.Open();

                SqlDataSource SqlDataSource1 = new SqlDataSource();
                SqlDataSource1.ID = "SqlDataSource1";
                this.Page.Controls.Add(SqlDataSource1);
                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
                SqlDataSource1.SelectCommand = "select EmployeeID,EmployeeName,EngineerSubmission,HiringSubmission,ManagerSubmission FROM [dbo].[tbExitInterviewForm] where EmployeeID='" + searchbar.Text;
                UserGrid.DataSource = SqlDataSource1;
                UserGrid.DataBind();
                Con1.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Employee ID invalid!!');", true);
            }
        }
    }
}