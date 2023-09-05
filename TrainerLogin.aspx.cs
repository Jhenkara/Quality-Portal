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
    public partial class TrainerLogin : System.Web.UI.Page
    {
        SqlConnection conN = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            errMsgLogin.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            conN.Open();

            SqlCommand cmd = conN.CreateCommand();
            string query = "SELECT COUNT(1) FROM UserCredentials where Username=@Username and Password=@Password and Roles='TR'";
            cmd = new SqlCommand(query, conN);
            cmd.Parameters.AddWithValue("@Username", tbUsername.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", tbPassword.Text.Trim());
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            if (count == 1)
            {
                Session["Username"] = tbUsername.Text.Trim();
                Response.Redirect("TypeSelect.aspx");
            }
            else
            {
                errMsgLogin.Visible = true;
            }
        }
    }
}