using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Audit_Legends
{
    public partial class TypeSelect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void select1_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrainingType1.aspx");
        }

        protected void select2_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrainingType2.aspx");
        }

        protected void select3_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrainingType3.aspx");
        }

        protected void select4_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrainingType4.aspx");
        }
    }
}