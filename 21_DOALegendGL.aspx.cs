﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Audit_Legends
{
    public partial class _21_DOALegendGL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogout_Click1(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("QALogin.aspx");
        }
    }
}