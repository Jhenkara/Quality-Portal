using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Audit_Legends
{
    public partial class Hiring_ScoringSheet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            trOthers.Visible = false;
        }

        protected void ddJobLevel_SelectedIndexChanged(object sender, EventArgs e)
        {
            var val1 = ddJobLevel.SelectedItem.Value;
            if (val1 == "3")
            {
                trOthers.Visible = true;
                tbOthers.Focus();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }
    }
}