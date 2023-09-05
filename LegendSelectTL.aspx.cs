using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Audit_Legends
{
    public partial class LegendSelectTL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void selection1_Click(object sender, EventArgs e)
        {
            Response.Redirect("TL_Dashboard.aspx");
        }

        protected void selection2_Click(object sender, EventArgs e)
        {
            Response.Redirect("TL_DashboardHW.aspx");
        }

        protected void selection3_Click(object sender, EventArgs e)
        {
            Response.Redirect("TL_DashboardComm.aspx");
        }

        protected void selection4_Click(object sender, EventArgs e)
        {
            Response.Redirect("TL_DashboardSoMe.aspx");
        }

        protected void select5_Click(object sender, EventArgs e)
        {
            Response.Redirect("TL_DashboardForum.aspx");
        }

        protected void select6_Click(object sender, EventArgs e)
        {
            Response.Redirect("TL_DashboardCoreOps.aspx");
        }

        protected void select7_Click(object sender, EventArgs e)
        {
            Response.Redirect("TL_DashboardRioRancho.aspx");
        }

        protected void select8_Click(object sender, EventArgs e)
        {
            Response.Redirect("TL_DashboardRioRancho.aspx");
        }

        protected void select9_Click(object sender, EventArgs e)
        {
            Response.Redirect("TL_DashboardADX.aspx");
        }

        protected void select10_Click(object sender, EventArgs e)
        {
            Response.Redirect("TL_DashboardSF.aspx");
        }

        protected void select11_Click(object sender, EventArgs e)
        {
            Response.Redirect("TL_DashboardTOC.aspx");
        }
    }
}