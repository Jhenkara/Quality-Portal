using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Audit_Legends
{
    public partial class Hiring_ManagerView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Visible = false;
            TextBox8.Visible = false;
        }

        protected void MgrDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("Hiring_ManagerDashboard.aspx");
        }

        protected void Download_Click(object sender, EventArgs e)
        {
            //Response.Redirect("~/Download/.xlsx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Home.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }
    }
}