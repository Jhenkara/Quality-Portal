using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Audit_Legends
{
    public partial class LegendSelectMgr : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void selection1_Click(object sender, EventArgs e)
        {
            Response.Redirect("TLDashboard.aspx");
        }

        protected void selection2_Click(object sender, EventArgs e)
        {
            Response.Redirect("TLDashboardHW.aspx");
        }

        protected void selection3_Click(object sender, EventArgs e)
        {
            Response.Redirect("TLDashboardComm.aspx");
        }

        protected void selection4_Click(object sender, EventArgs e)
        {
            Response.Redirect("TLDashboardSoMe.aspx");
        }

        protected void select5_Click(object sender, EventArgs e)
        {
            Response.Redirect("TLDashboardForum.aspx");
        }

        protected void select6_Click(object sender, EventArgs e)
        {
            Response.Redirect("TLDashboardCoreOps.aspx");
        }

        protected void select7_Click(object sender, EventArgs e)
        {
            Response.Redirect("TLDashboardRioRancho.aspx");
        }

        protected void select8_Click(object sender, EventArgs e)
        {
            //Response.Redirect("TLDashboardRioRancho.aspx");
        }

        protected void select9_Click(object sender, EventArgs e)
        {
            //Response.Redirect("TLDashboardADX.aspx");
        }

        protected void New1_Click(object sender, EventArgs e)
        {
            Response.Redirect("MgrDashboardVoice.aspx");
        }

        protected void New2_Click(object sender, EventArgs e)
        {
            Response.Redirect("MgrDashboardSoMe.aspx");
        }

        protected void New3_Click(object sender, EventArgs e)
        {
            Response.Redirect("MgrDashboardADX.aspx");
        }

        protected void New4_Click(object sender, EventArgs e)
        {
            Response.Redirect("MgrDashboardChat.aspx");
        }

        protected void New5_Click(object sender, EventArgs e)
        {
            Response.Redirect("MgrDashboardCDT.aspx");
        }

        protected void select12_Click(object sender, EventArgs e)
        {
            Response.Redirect("MgrDashboardDOA.aspx");
        }

        protected void New6_Click(object sender, EventArgs e)
        {
            Response.Redirect("MgrDashboardSAPOS.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("MgrDashboardKCI.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("MgrDashboardTCO.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("MgrDashboardOnsitePURR.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("MgrDashboardPDRA_RS_RC.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("MgrDashboardSwivel.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("MgrDashboardDaaS.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("MgrDashboardOmnichannel.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("MgrDashboardMPSEmail.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("MgrDashboardTOC.aspx");
        }
    }
}