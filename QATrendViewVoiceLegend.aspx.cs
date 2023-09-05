using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.Net.Mail;
using System.IO;

namespace Audit_Legends
{
    public partial class QATrendViewVoiceLegend : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        string SelectedItem;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            { Response.Redirect("QALogin.aspx"); }
            else
            {
                SqlCommand cmd = new SqlCommand("Select EmployeeFullName,ReportingManager from tblHeadCount where EmployeeEmailID=@EmailAddress", Con);
                cmd.Parameters.AddWithValue("@EmailAddress", Session["Username"]);
                cmd.Connection = Con;
                Con.Open();
                SqlDataAdapter daa = new SqlDataAdapter(cmd);

                DataTable dtt = new DataTable();
                daa.Fill(dtt);
                string emp_name = dtt.Rows[0]["EmployeeFullName"].ToString();
                hfv_empmail.Value = emp_name;
                Con.Close();
            }

            if (!IsPostBack)
            {
                tab1.Visible = false;
                tab2.Visible = false;

                SqlCommand cmd = new SqlCommand("SELECT DISTINCT Employee_Name from FY21VoiceLegend where QAMail='" + Session["Username"] + "'", Con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ddEmpSelect.DataSource = dt;
                ddEmpSelect.Items.Insert(0, new ListItem("---Choose---", "-1"));
                ddEmpSelect.Items.Insert(1, new ListItem("%", "0"));
                ddEmpSelect.DataBind();

                //SqlCommand cmd1 = new SqlCommand("SELECT DISTINCT Month from FY21VoiceLegend where QAMail='" + Session["Username"] + "'", Con);
                //SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
                //DataTable dt1 = new DataTable();
                //sda1.Fill(dt1);
                //ddMonthSelect.DataSource = dt1;
                //ddMonthSelect.Items.Insert(0, new ListItem("---Choose---", "-1"));
                //ddMonthSelect.Items.Insert(1, new ListItem("%", "0"));
                //ddMonthSelect.DataBind();

                SqlCommand cmd2 = new SqlCommand("SELECT DISTINCT TeamName from FY21VoiceLegend where QAMail='" + Session["Username"] + "'", Con);
                SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);
                DataTable dt2 = new DataTable();
                sda2.Fill(dt2);
                ddTeamSelect.DataSource = dt2;
                ddTeamSelect.Items.Insert(0, new ListItem("---Choose---", "-1"));
                ddTeamSelect.Items.Insert(1, new ListItem("%", "0"));
                ddTeamSelect.DataBind();
            }
        }

        public void fetchdetails()
        {
            
        }

        protected void btnTrend_Click(object sender, EventArgs e)
        {
            Response.Redirect("QATrendViewVoiceLegend.aspx");
        }

        protected void Method1()
        {
            //SqlDataSource SqlDataSource2 = new SqlDataSource();
            //SqlDataSource2.ID = "SqlDataSource2";
            //this.Page.Controls.Add(SqlDataSource2);
            //SqlDataSource2.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CString"].ConnectionString;
            //SqlDataSource2.SelectCommand = "Select EvaluationDate,Opening,Opening1,Opening2,Opening3,Opening4,ToolUsage,ToolUsage1,ToolUsage2,ToolUsage3,ToolUsage4,ToolUsage5,ToolUsage6,Probing,Troubleshooting,Sol_Res,Behavioural,Behavioural1,Behavioural2,Behavioural3,Behavioural4,Behavioural5,Communication,Communication1,Communication2,Communication3,Communication4,CustObsdBehav,CustObsdBehav1,CustObsdBehav2,CustObsdBehav3,CustObsdBehav4,CustObsdBehav5,Time_Manage,Callback,CaseOwnership,CaseOwnership1,CaseOwnership2,CaseOwnership3,Case_Call_Logging,Closing from FY21VoiceLegend where QAName='" + hfv_empmail.Value + "' and Employee_Name like '" + ddEmpSelect.SelectedItem.Text + "' and Month like '" + ddMonthSelect.SelectedItem.Text + "' order by AuditCount desc";
            //TrendGrid.ControlStyle.Font.Size = 50;
            //TrendGrid.DataSource = SqlDataSource2;
            //TrendGrid.DataBind();

            SqlDataAdapter da1 = new SqlDataAdapter("Select Employee_Name,EvaluationDate,Opening,Opening1 as [Introduction],Opening2 as [HP Branding],Opening3 as [Paraphrasing],Opening4 as [Assurance],ToolUsage,ToolUsage1 as [LMI - Live Lens],ToolUsage2 as [Serial Number],ToolUsage3 as [Entitlement or PoP Validation],ToolUsage4 as [PIN],ToolUsage5 as [Class Issue / WISE Usage],ToolUsage6 as [Ease of Effort],Probing,Troubleshooting,Sol_Res,Behavioural,Behavioural1 as [Matching Customer Skill Level],Behavioural2 as [Objection Handling],Behavioural3 as [Attention to details / Active Listening],Behavioural4 as [Educating Customer],Behavioural5 as [Acknowledgement],Communication,Communication1 as [Comprehension],Communication2 as [Rate of Speech],Communication3 as [Tone of Voice],Communication4 as [Language / Accent],CustObsdBehav,CustObsdBehav1 as [Rapport Building],CustObsdBehav2 as [Assurance],CustObsdBehav3 as [Professionalism],CustObsdBehav4 as [Courtesy],CustObsdBehav5 as [Empathy],Time_Manage,Callback,CaseOwnership,CaseOwnership1 as [Expectation Setting / KCI],CaseOwnership2 as [External Source],CaseOwnership3 as [Escalation Process],Case_Call_Logging,Closing,NonCompliance from FY21VoiceLegend where QAName='" + hfv_empmail.Value + "' and Employee_Name like '" + ddEmpSelect.SelectedItem.Text + "' and EvaluationDate between '" + tbFromDate.Text + "' and '" + tbToDate.Text + "' order by AuditCount desc", Con);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            TrendGrid.DataSource = ds1;
            TrendGrid.DataBind();
        }

        protected void Method2()
        {
            if(ddParamSelect.SelectedItem.Text == "Opening")
            {
                SqlDataAdapter da2 = new SqlDataAdapter("Select Employee_Name,EvaluationDate,Opening,Opening1 as [Introduction],Opening2 as [HP Branding],Opening3 as [Paraphrasing],Opening4 as [Assurance] from FY21VoiceLegend where QAName='" + hfv_empmail.Value + "' and Employee_Name like '" + ddEmpSelect.SelectedItem.Text + "' and EvaluationDate between '" + tbFromDate.Text + "' and '" + tbToDate.Text + "' order by AuditCount desc", Con);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2);
                TrendGrid.DataSource = ds2;
                TrendGrid.DataBind();
            }

            else if(ddParamSelect.SelectedItem.Text == "Tool Usage")
            {
                SqlDataAdapter da2 = new SqlDataAdapter("Select Employee_Name,EvaluationDate,ToolUsage,ToolUsage1 as [LMI - Live Lens],ToolUsage2 as [Serial Number],ToolUsage3 as [Entitlement or PoP Validation],ToolUsage4 as [PIN],ToolUsage5 as [Class Issue / WISE Usage],ToolUsage6 as [Ease of Effort] from FY21VoiceLegend where QAName='" + hfv_empmail.Value + "' and Employee_Name like '" + ddEmpSelect.SelectedItem.Text + "' and EvaluationDate between '" + tbFromDate.Text + "' and '" + tbToDate.Text + "' order by AuditCount desc", Con);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2);
                TrendGrid.DataSource = ds2;
                TrendGrid.DataBind();
            }

            else if (ddParamSelect.SelectedItem.Text == "Behavioural")
            {
                SqlDataAdapter da2 = new SqlDataAdapter("Select Employee_Name,EvaluationDate,Behavioural,Behavioural1 as [Matching Customer Skill Level],Behavioural2 as [Objection Handling],Behavioural3 as [Attention to details / Active Listening],Behavioural4 as [Educating Customer],Behavioural5 as [Acknowledgement] from FY21VoiceLegend where QAName='" + hfv_empmail.Value + "' and Employee_Name like '" + ddEmpSelect.SelectedItem.Text + "' and EvaluationDate between '" + tbFromDate.Text + "' and '" + tbToDate.Text + "' order by AuditCount desc", Con);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2);
                TrendGrid.DataSource = ds2;
                TrendGrid.DataBind();
            }

            else if (ddParamSelect.SelectedItem.Text == "Communication")
            {
                SqlDataAdapter da2 = new SqlDataAdapter("Select Employee_Name,EvaluationDate,Communication,Communication1 as [Comprehension],Communication2 as [Rate of Speech],Communication3 as [Tone of Voice],Communication4 as [Language / Accent] from FY21VoiceLegend where QAName='" + hfv_empmail.Value + "' and Employee_Name like '" + ddEmpSelect.SelectedItem.Text + "' and EvaluationDate between '" + tbFromDate.Text + "' and '" + tbToDate.Text + "' order by AuditCount desc", Con);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2);
                TrendGrid.DataSource = ds2;
                TrendGrid.DataBind();
            }

            else if (ddParamSelect.SelectedItem.Text == "Customer Obsessed Behaviour")
            {
                SqlDataAdapter da2 = new SqlDataAdapter("Select Employee_Name,EvaluationDate,CustObsdBehav,CustObsdBehav1 as [Rapport Building],CustObsdBehav2 as [Assurance],CustObsdBehav3 as [Professionalism],CustObsdBehav4 as [Courtesy],CustObsdBehav5 as [Empathy] from FY21VoiceLegend where QAName='" + hfv_empmail.Value + "' and Employee_Name like '" + ddEmpSelect.SelectedItem.Text + "' and EvaluationDate between '" + tbFromDate.Text + "' and '" + tbToDate.Text + "' order by AuditCount desc", Con);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2);
                TrendGrid.DataSource = ds2;
                TrendGrid.DataBind();
            }

            else if (ddParamSelect.SelectedItem.Text == "Case Ownership")
            {
                SqlDataAdapter da2 = new SqlDataAdapter("Select Employee_Name,EvaluationDate,CaseOwnership,CaseOwnership1 as [Expectation Setting / KCI],CaseOwnership2 as [External Source],CaseOwnership3 as [Escalation Process] from FY21VoiceLegend where QAName='" + hfv_empmail.Value + "' and Employee_Name like '" + ddEmpSelect.SelectedItem.Text + "' and EvaluationDate between '" + tbFromDate.Text + "' and '" + tbToDate.Text + "' order by AuditCount desc", Con);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2);
                TrendGrid.DataSource = ds2;
                TrendGrid.DataBind();
            }

            else
            {
                SqlDataAdapter da2 = new SqlDataAdapter("Select Employee_Name,EvaluationDate," + ddParamSelect.SelectedItem.Value + " from FY21VoiceLegend where QAName='" + hfv_empmail.Value + "' and Employee_Name like '" + ddEmpSelect.SelectedItem.Text + "' and EvaluationDate between '" + tbFromDate.Text + "' and '" + tbToDate.Text + "' order by AuditCount desc", Con);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2);
                TrendGrid.DataSource = ds2;
                TrendGrid.DataBind();
            }
        }

        protected void Method3()
        {

            
        }

        protected void FetchData_Click(object sender, EventArgs e)
        {
            SelectedItem = rbType.SelectedItem.Text;
            if (SelectedItem == "Engineer and Month Wise")
            {
                Method1();
            }

            else if (SelectedItem == "Parameter Wise")
            {
                Method2();
            }
        }



        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            TrendGrid.PageIndex = e.NewPageIndex;
            SelectedItem = rbType.SelectedItem.Text;
            if (SelectedItem == "Engineer and Month Wise")
            {
                Method1();
            }

            else if (SelectedItem == "Parameter Wise")
            {
                Method2();
            }
        }

        protected void DLData_Click(object sender, EventArgs e)
        {
            SelectedItem = rbType.SelectedItem.Text;
            if (SelectedItem == "Engineer and Month Wise")
            {
                TrendGrid.AllowPaging = false;
                Method1();
                if (TrendGrid.Visible)
                {
                    Response.ClearContent();
                    Response.Buffer = true;
                    Response.AddHeader("content-disposition", "attachment; filename=AuditTrend.xls");
                    Response.ContentType = "application/excel";
                    StringWriter sWriter = new StringWriter();
                    HtmlTextWriter hTextWriter = new HtmlTextWriter(sWriter);

                    TrendGrid.HeaderRow.Style.Add("background-color", "#FFFFFF");

                    foreach (TableCell tableCell in TrendGrid.HeaderRow.Cells)
                    {
                        tableCell.Style["background-color"] = "#2447f2";
                    }

                    foreach (GridViewRow gridViewRow in TrendGrid.Rows)
                    {
                        gridViewRow.BackColor = System.Drawing.Color.White;
                        foreach(TableCell gridviewrowtablecell in gridViewRow.Cells)
                        {
                            gridviewrowtablecell.Style["background - color"] = "#FFFFFF";
                        }
                    }

                    TrendGrid.RenderControl(hTextWriter);
                    Response.Write(sWriter.ToString());
                    Response.End();
                    return;
                }
                TrendGrid.AllowPaging = true;
            }

            else if (SelectedItem == "Parameter Wise")
            {
                TrendGrid.AllowPaging = false;
                Method2();
                if (TrendGrid.Visible)
                {
                    Response.ClearContent();
                    Response.Buffer = true;
                    Response.AddHeader("content-disposition", "attachment; filename=AuditTrend.xls");
                    Response.ContentType = "application/excel";
                    StringWriter sWriter = new StringWriter();
                    HtmlTextWriter hTextWriter = new HtmlTextWriter(sWriter);

                    TrendGrid.HeaderRow.Style.Add("background-color", "#FFFFFF");

                    foreach (TableCell tableCell in TrendGrid.HeaderRow.Cells)
                    {
                        tableCell.Style["background-color"] = "#2447f2";
                    }

                    foreach (GridViewRow gridViewRow in TrendGrid.Rows)
                    {
                        gridViewRow.BackColor = System.Drawing.Color.White;
                        foreach (TableCell gridviewrowtablecell in gridViewRow.Cells)
                        {
                            gridviewrowtablecell.Style["background - color"] = "#FFFFFF";
                        }
                    }

                    TrendGrid.RenderControl(hTextWriter);
                    Response.Write(sWriter.ToString());
                    Response.End();
                    return;
                }
                TrendGrid.AllowPaging = true;
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("QALogin.aspx");
        }

        protected void rbType_SelectedIndexChanged(object sender, EventArgs e)
        {
            SelectedItem = rbType.SelectedItem.Text;
            if (SelectedItem == "Engineer and Month Wise")
            {
                tab1.Visible = true;
                tab2.Visible = false;
            }

            else if (SelectedItem == "Parameter Wise")
            {
                tab1.Visible = true;
                tab2.Visible = true;
                ddParamSelect.Items.Clear();
                var opening = new ListItem("Opening", "Opening");
                opening.Attributes.Add("style", "font-weight: bold");
                ddParamSelect.Items.Add(opening);
                ddParamSelect.Items.Add(new ListItem("  Introduction", "Opening1"));
                ddParamSelect.Items.Add(new ListItem("  HP Branding", "Opening2"));
                ddParamSelect.Items.Add(new ListItem("  Paraphrasing", "Opening3"));
                ddParamSelect.Items.Add(new ListItem("  Assurance", "Opening4"));
                var toolusage = new ListItem("Tool Usage", "ToolUsage");
                toolusage.Attributes.Add("style", "font-weight: bold");
                ddParamSelect.Items.Add(toolusage);
                ddParamSelect.Items.Add(new ListItem("  LMI - Live Lens", "ToolUsage1"));
                ddParamSelect.Items.Add(new ListItem("  Serial Number", "ToolUsage2"));
                ddParamSelect.Items.Add(new ListItem("  Entitlement or PoP Validation", "ToolUsage3"));
                ddParamSelect.Items.Add(new ListItem("  PIN", "ToolUsage4"));
                ddParamSelect.Items.Add(new ListItem("  Class Issue / WISE Usage", "ToolUsage5"));
                ddParamSelect.Items.Add(new ListItem("  Ease of Effort", "ToolUsage6"));
                var probing = new ListItem("Probing", "Probing");
                probing.Attributes.Add("style", "font-weight: bold");
                ddParamSelect.Items.Add(probing);
                var troubleshooting = new ListItem("Troubleshooting", "Troubleshooting");
                troubleshooting.Attributes.Add("style", "font-weight: bold");
                ddParamSelect.Items.Add(troubleshooting);
                var Solres = new ListItem("Solution / Resolution", "Sol_Res");
                Solres.Attributes.Add("style", "font-weight: bold");
                ddParamSelect.Items.Add(Solres);
                var Behaviour = new ListItem("Behavioural", "Behavioural");
                Behaviour.Attributes.Add("style", "font-weight: bold");
                ddParamSelect.Items.Add(Behaviour);
                ddParamSelect.Items.Add(new ListItem("Matching Customer Skill Level", "Behavioural1"));
                ddParamSelect.Items.Add(new ListItem("Objection Handling", "Behavioural2"));
                ddParamSelect.Items.Add(new ListItem("Attention to details / Active Listening", "Behavioural3"));
                ddParamSelect.Items.Add(new ListItem("Educating Customer", "Behavioural4"));
                ddParamSelect.Items.Add(new ListItem("Acknowledgement", "Behavioural5"));
                var Communication = new ListItem("Communication", "Communication");
                Communication.Attributes.Add("style", "font-weight: bold");
                ddParamSelect.Items.Add(Communication);
                ddParamSelect.Items.Add(new ListItem("Comprehension", "Communication1"));
                ddParamSelect.Items.Add(new ListItem("Rate of Speech", "Communication2"));
                ddParamSelect.Items.Add(new ListItem("Tone of Voice", "Communication3"));
                ddParamSelect.Items.Add(new ListItem("Language / Accent", "Communication4"));
                var CustObsdBehav = new ListItem("Customer Obsessed Behaviour", "CustObsdBehav");
                CustObsdBehav.Attributes.Add("style", "font-weight: bold");
                ddParamSelect.Items.Add(CustObsdBehav);
                ddParamSelect.Items.Add(new ListItem("Rapport Building", "CustObsdBehav1"));
                ddParamSelect.Items.Add(new ListItem("Assurance", "CustObsdBehav2"));
                ddParamSelect.Items.Add(new ListItem("Professionalism", "CustObsdBehav3"));
                ddParamSelect.Items.Add(new ListItem("Courtesy", "CustObsdBehav4"));
                ddParamSelect.Items.Add(new ListItem("Empathy", "CustObsdBehav5"));
                var Time_Manage = new ListItem("Time Management", "Time_Manage");
                Time_Manage.Attributes.Add("style", "font-weight: bold");
                ddParamSelect.Items.Add(Time_Manage);
                var Callback = new ListItem("Callback", "Callback");
                Callback.Attributes.Add("style", "font-weight: bold");
                ddParamSelect.Items.Add(Callback);
                var CaseOwnership = new ListItem("Case Ownership", "CaseOwnership");
                CaseOwnership.Attributes.Add("style", "font-weight: bold");
                ddParamSelect.Items.Add(CaseOwnership);
                ddParamSelect.Items.Add(new ListItem("Expectation Setting / KCI", "CaseOwnership1"));
                ddParamSelect.Items.Add(new ListItem("External Source", "CaseOwnership2"));
                ddParamSelect.Items.Add(new ListItem("Escalation Process", "CaseOwnership3"));
                var Case_Call_Logging = new ListItem("Case/Call Logging", "Case_Call_Logging");
                Case_Call_Logging.Attributes.Add("style", "font-weight: bold");
                ddParamSelect.Items.Add(Case_Call_Logging);
                var Closing = new ListItem("Closing", "Closing");
                Closing.Attributes.Add("style", "font-weight: bold");
                ddParamSelect.Items.Add(Closing);
            }
        }
    }
}