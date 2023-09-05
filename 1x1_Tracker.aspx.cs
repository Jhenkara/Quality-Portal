using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Audit_Legends
{
    public partial class _1x1_Tracker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dateAsString = DateTime.Now.ToString("MM/dd/yyyy");
            tbDateCreated.Text = dateAsString;

            tbEID.Visible = false;
            tbEName.Visible = false;
            tbEMail.Visible = false;
            tbDateCreated.Visible = false;
        }
    }
}