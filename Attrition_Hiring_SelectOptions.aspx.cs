using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Audit_Legends
{
    public partial class Attrition_Hiring_SelectOptions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void New1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Hiring_ProfileCreationDashboard.aspx");
        }
    }
}