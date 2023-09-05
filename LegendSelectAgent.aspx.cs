using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Audit_Legends
{
    public partial class LegendSelectAgent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void selection1_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboard.aspx");
        }

        protected void selection2_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardHW.aspx");
        }

        protected void selection3_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardComm.aspx");
        }

        protected void selection4_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardSoMe.aspx");
        }

        protected void select5_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardForums.aspx");
        }

        protected void select6_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardCO.aspx");
        }

        protected void select7_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardRR.aspx");
        }

        protected void select8_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardCEM.aspx");
        }

        protected void select9_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardADX.aspx");
        }

        protected void select10_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardSF.aspx");
        }

        protected void select11_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardTOC.aspx");
        }

        protected void New2_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardFY21SoMe.aspx");
        }

        protected void New1_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardFY21Voice.aspx");
        }

        protected void New3_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardFY21ADX.aspx");
        }

        protected void New4_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardFY21Chat.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardFY21CDT.aspx");
        }

        protected void select12_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardFY21DOA.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardFY21SAPOS.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardFY22KCI.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardFY22TCO.aspx");
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardFY22OnsitePURRLegend.aspx");
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardFY22PDRA_RS_RC.aspx");
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardFY22Swivel.aspx");
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardFY22DaaS.aspx");
        }

        protected void Button14_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardFY22Omnichannel.aspx");
        }

        protected void Button15_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDashboardFY22MPSEmail.aspx");
        }
    }
}