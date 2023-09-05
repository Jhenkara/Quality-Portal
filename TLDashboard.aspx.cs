using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;

namespace Audit_Legends
{
    public partial class TLDashboard : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("MgrLogin.aspx");
            }
            else
            {

                if (!IsPostBack)
                {
                    string QA = "select distinct QAName from AuditLegend";
                    SqlDataAdapter adpt = new SqlDataAdapter(QA, Con);
                    DataTable dt = new DataTable();
                    adpt.Fill(dt);
                    DropDownList1.DataSource = dt;
                    DropDownList1.DataBind();
                    DropDownList1.DataTextField = "QAName";
                    DropDownList1.DataBind();
                    DropDownList1.Items.Insert(0, new ListItem("--Select--", "0"));
                    //DropDownList1.Items.Add(new ListItem("- Select -", "-1"));
                    DropDownList5.DataSource = dt;
                    DropDownList5.DataBind();
                    DropDownList5.DataTextField = "QAName";
                    DropDownList5.DataBind();
                    DropDownList5.Items.Insert(0, new ListItem("--Select--", "0"));
                }

                //if (!IsPostBack)
                //{
                //    string mgr = "select distinct Reporting_Manager from AuditLegend";
                //    SqlDataAdapter adpt = new SqlDataAdapter(mgr, Con);
                //    DataTable dt = new DataTable();
                //    adpt.Fill(dt);
                //    DropDownList2.DataSource = dt;
                //    DropDownList2.DataBind();
                //    DropDownList2.DataTextField = "Reporting_Manager";
                //    DropDownList2.Items.Insert(0, new ListItem("--Select--"));
                //    DropDownList2.DataBind();
                //}

                if (!IsPostBack)
                {
                    string Mon = "select distinct Month from AuditLegend";
                    SqlDataAdapter adpt = new SqlDataAdapter(Mon, Con);
                    DataTable dt = new DataTable();
                    adpt.Fill(dt);
                    DropDownList3.DataSource = dt;
                    DropDownList3.DataBind();
                    DropDownList3.DataTextField = "Month";
                    DropDownList3.DataBind();
                    DropDownList3.Items.Insert(0, new ListItem("--Select--", "0"));
                    DropDownList6.DataSource = dt;
                    DropDownList6.DataBind();
                    DropDownList6.DataTextField = "Month";
                    DropDownList6.DataBind();
                    DropDownList6.Items.Insert(0, new ListItem("--Select--", "0"));
                }

                if (!IsPostBack)
                {
                    string Case = "select distinct CaseType from AuditLegend";
                    SqlDataAdapter adpt = new SqlDataAdapter(Case, Con);
                    DataTable dt = new DataTable();
                    adpt.Fill(dt);
                    DropDownList4.DataSource = dt;
                    DropDownList4.DataBind();
                    DropDownList4.DataTextField = "CaseType";
                    DropDownList4.DataBind();
                    DropDownList4.Items.Insert(0, new ListItem("--Select--", "0"));
                    DropDownList7.DataSource = dt;
                    DropDownList7.DataBind();
                    DropDownList7.DataTextField = "CaseType";
                    DropDownList7.DataBind();
                    DropDownList7.Items.Insert(0, new ListItem("--Select--", "0"));
                }


            }
        }

        private void GetChart1Data()
        {
            if (DropDownList1.SelectedItem.Text != "--Select--" && DropDownList3.SelectedItem.Text != "--Select--" && DropDownList4.SelectedItem.Text != "--Select--")
            {
                SqlCommand cmd = new SqlCommand("select Employee_Name,avg(TotalCompliance) as [Total Compliance] from AuditLegend where QAName='" + DropDownList1.SelectedItem.Text + "' and Month='" + DropDownList3.SelectedItem.Text + "' and CaseType='" + DropDownList4.SelectedItem.Text + "' group by Employee_Name", Con);
                cmd.Connection = Con;
                Con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                Graph1.DataBindTable(dr, "Employee_Name");
            }
            else if (DropDownList1.SelectedItem.Text == "--Select--" && DropDownList3.SelectedItem.Text != "--Select--" && DropDownList4.SelectedItem.Text != "--Select--")
            {
                SqlCommand cmd = new SqlCommand("select Employee_Name,avg(TotalCompliance) as [Total Compliance] from AuditLegend where Month='" + DropDownList3.SelectedItem.Text + "' and CaseType='" + DropDownList4.SelectedItem.Text + "' group by Employee_Name", Con);
                cmd.Connection = Con;
                Con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                Graph1.DataBindTable(dr, "Employee_Name");
            }

            else if (DropDownList1.SelectedItem.Text != "--Select--" && DropDownList3.SelectedItem.Text == "--Select--" && DropDownList4.SelectedItem.Text != "--Select--")
            {
                SqlCommand cmd = new SqlCommand("select Employee_Name,avg(TotalCompliance) as [Total Compliance] from AuditLegend where QAName='" + DropDownList1.SelectedItem.Text + "' and CaseType='" + DropDownList4.SelectedItem.Text + "' group by Employee_Name", Con);
                cmd.Connection = Con;
                Con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                Graph1.DataBindTable(dr, "Employee_Name");
            }

            else if (DropDownList1.SelectedItem.Text != "--Select--" && DropDownList3.SelectedItem.Text != "--Select--" && DropDownList4.SelectedItem.Text == "--Select--")
            {
                SqlCommand cmd = new SqlCommand("select Employee_Name,avg(TotalCompliance) as [Total Compliance] from AuditLegend where QAName='" + DropDownList1.SelectedItem.Text + "' and Month='" + DropDownList3.SelectedItem.Text + "' group by Employee_Name", Con);
                cmd.Connection = Con;
                Con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                Graph1.DataBindTable(dr, "Employee_Name");
            }

            else if (DropDownList1.SelectedItem.Text != "--Select--" && DropDownList3.SelectedItem.Text == "--Select--" && DropDownList4.SelectedItem.Text == "--Select--")
            {
                SqlCommand cmd = new SqlCommand("select Employee_Name,avg(TotalCompliance) as [Total Compliance] from AuditLegend where QAName='" + DropDownList1.SelectedItem.Text + "' group by Employee_Name", Con);
                cmd.Connection = Con;
                Con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                Graph1.DataBindTable(dr, "Employee_Name");
            }

            else if (DropDownList1.SelectedItem.Text == "--Select--" && DropDownList3.SelectedItem.Text != "--Select--" && DropDownList4.SelectedItem.Text == "--Select--")
            {
                SqlCommand cmd = new SqlCommand("select Employee_Name,avg(TotalCompliance) as [Total Compliance] from AuditLegend where Month='" + DropDownList3.SelectedItem.Text + "' group by Employee_Name", Con);
                cmd.Connection = Con;
                Con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                Graph1.DataBindTable(dr, "Employee_Name");
            }

            else if (DropDownList1.SelectedItem.Text == "--Select--" && DropDownList3.SelectedItem.Text == "--Select--" && DropDownList4.SelectedItem.Text != "--Select--")
            {
                SqlCommand cmd = new SqlCommand("select Employee_Name,avg(TotalCompliance) as [Total Compliance] from AuditLegend where CaseType='" + DropDownList4.SelectedItem.Text + "' group by Employee_Name", Con);
                cmd.Connection = Con;
                Con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                Graph1.DataBindTable(dr, "Employee_Name");
            }

            //Graph1.ChartAreas[0].AxisX.MinorTickMark.Enabled = true;
            Graph1.Series[0].IsValueShownAsLabel = true;
            Graph1.ChartAreas[0].AxisX.Interval = 1;
            Graph1.ChartAreas[0].AxisY.Maximum = 100;
            Graph1.ChartAreas[0].AxisX.IsLabelAutoFit = true;
            Graph1.ChartAreas[0].AxisX.LabelStyle.IsEndLabelVisible = true;
            Graph1.ChartAreas[0].AxisX.LabelStyle.Font = new System.Drawing.Font("HP Simplified", 8f);
            Graph1.Series[0].Label= "#VALY{#}";
            //Graph1.ChartAreas[0].AxisY.LabelStyle.Format = "P0";
            //Chart1.Series[0].Label = "#VALY";
            //Chart1.Series[0].BorderWidth = 3;

        }

        private void GetChart2Data()
        {
            SqlCommand cmd = new SqlCommand("select Month,avg(TotalCompliance) as [Total Compliance],avg(CustCritical) as [Customer Critical],avg(BusCritical) as [Business Critical] from AuditLegend where QAName='" + DropDownList5.SelectedItem.Text + "' and Month='" + DropDownList6.SelectedItem.Text + "' and CaseType='" + DropDownList7.SelectedItem.Text + "' group by Month", Con);
            cmd.Connection = Con;
            Con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            Graph2.DataBindTable(dr, "Month");
            //Graph1.ChartAreas[0].AxisX.MinorTickMark.Enabled = true;
            Legend leg = new Legend();
            Graph2.Legends.Add(leg);
            Graph2.Series[0].IsValueShownAsLabel = true;
            Graph2.Series[1].IsValueShownAsLabel = true;
            Graph2.Series[2].IsValueShownAsLabel = true;
            Graph2.ChartAreas[0].AxisX.Interval = 1;
            Graph2.ChartAreas[0].AxisY.Maximum = 100;
            Graph2.ChartAreas[0].AxisX.IsLabelAutoFit = true;
            Graph2.ChartAreas[0].AxisX.LabelStyle.IsEndLabelVisible = true;
            Graph2.ChartAreas[0].AxisX.LabelStyle.Font = new System.Drawing.Font("HP Simplified", 8f);
            Graph2.Series[0].Label = "#VALY{#}";
            Graph2.Focus();
            //Graph1.ChartAreas[0].AxisY.LabelStyle.Format = "P0";
            //Chart1.Series[0].Label = "#VALY";
            //Chart1.Series[0].BorderWidth = 3;

        }

        private void GetChartType()
        {
            foreach(int chartType in Enum.GetValues(typeof(SeriesChartType)))
            {
                ListItem li = new ListItem(Enum.GetName(typeof(SeriesChartType), chartType), chartType.ToString());
                DropDownList1.Items.Add(li);
            }
        }

        protected void Chart1_Function(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Graph1.Series.Clear();
                GetChart1Data();
                Graph1.Focus();
            }
        }

        protected void Chart2_Function(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Graph2.Series.Clear();
                GetChart2Data();
            }
        }
    }
}