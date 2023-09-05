using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Audit_Legends
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        SqlConnection conN = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        SqlCommand com;
        byte up;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblmsg.Text = "";
            SqlDataAdapter da = new SqlDataAdapter("Select * from UserCredentials where Password ='" + tbOldPassword.Text + "'", conN);
            DataTable DT = new DataTable();
            da.Fill(DT);

            if (DT.Rows.Count == 0)
            {
                lblmsg.Text = "User not found / Invalid current password";
                lblmsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                da = new SqlDataAdapter("update UserCredentials set Password='" + tbPassword.Text + "' where Username='" + tbUsername.Text + "'", conN);
                da.Fill(DT);
                lblmsg.Text = "Password changed successfully";
                lblmsg.ForeColor = System.Drawing.Color.White;
            }
        }
    }
}