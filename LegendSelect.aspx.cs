using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Audit_Legends
{
    public partial class LegendSelect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void selection1_Click(object sender, EventArgs e)
        {
            Response.Redirect("PersonaVoiceLegend.aspx");
        }

        protected void selection2_Click(object sender, EventArgs e)
        {
            Response.Redirect("LegendHW.aspx");
        }

        protected void selection3_Click(object sender, EventArgs e)
        {
            Response.Redirect("PersonaLegendComm.aspx");
        }

        protected void selection4_Click(object sender, EventArgs e)
        {
            Response.Redirect("SoMeFbTwLegend.aspx");
        }

        protected void select5_Click(object sender, EventArgs e)
        {
            Response.Redirect("SoMeForumLegend.aspx");
        }

        protected void select6_Click(object sender, EventArgs e)
        {
            Response.Redirect("CoreOpsLegend.aspx");
        }

        protected void select7_Click(object sender, EventArgs e)
        {
            Response.Redirect("RioRanchoLegend.aspx");
        }

        protected void select8_Click(object sender, EventArgs e)
        {
            Response.Redirect("CEMLegend.aspx");
        }

        protected void select9_Click(object sender, EventArgs e)
        {
            Response.Redirect("ADXLegend.aspx");
        }

        protected void select10_Click(object sender, EventArgs e)
        {
            Response.Redirect("SmartFriendLegend.aspx");
        }

        protected void select11_Click(object sender, EventArgs e)
        {
            Response.Redirect("TOC_Legend.aspx");
        }

        protected void New1_Click(object sender, EventArgs e)
        {
            Response.Redirect("21_VoiceLegend.aspx");
        }

        protected void New2_Click(object sender, EventArgs e)
        {
            Response.Redirect("21_SoMeLegend.aspx");
        }

        protected void New3_Click(object sender, EventArgs e)
        {
            Response.Redirect("21_ADXLegend.aspx");
        }

        protected void New4_Click(object sender, EventArgs e)
        {
            Response.Redirect("21_ChatLegend.aspx");
        }

        protected void New5_Click(object sender, EventArgs e)
        {
            Response.Redirect("21_CDTLegend.aspx");
        }

        protected void New6_Click(object sender, EventArgs e)
        {
            Response.Redirect("21_SAPOSLegend.aspx");
        }

        protected void select12_Click(object sender, EventArgs e)
        {
            Response.Redirect("21_DOALegend.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("22_TCOLegend.aspx");
        }

        protected void Button3_Click1(object sender, EventArgs e)
        {
            Response.Redirect("22_KCI_2Legend.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("22_OnsiteAndPURRLegend.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("22_PDRA_RS_RC_Legend.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("22_Swivel_DaasLegend.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("22_DaaSLegend.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("22_Omnichannel_Legend.aspx");
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("22_Email_PSCC_MPS_Legend.aspx");
        }
    }
}