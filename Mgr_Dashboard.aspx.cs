
// using System;
//  using System.Collections;
//  using System.Configuration;
//  using System.Data;
//  using System.Web;
//  using System.Web.Security;
//  using System.Web.UI;
//  using System.Web.UI.HtmlControls;
//  using System.Web.UI.WebControls;
//  using System.Web.UI.WebControls.WebParts;
//  using System.Data.SqlClient;

//// Use the FusionCharts.Charts namespace to be able to use classes and methods required to // create charts.
//using FusionCharts.Charts;

//using System.Text;
//using System.Data.Odbc;
//using System.Data.OleDb;

//namespace Audit_Legends
//{
//    public partial class Mgr_Dashboard : System.Web.UI.Page
//    {
//        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            {
//                // Create the xmlData StringBuilder object to store the data fetched
//                //from the database as a string.
//                StringBuilder xmlData = new StringBuilder();

//                // Initialize the chart-level attributes and append them to the
//                //xmlData StringBuilder object.

//                xmlData.Append("<chart caption='Factory Output report' subCaption='By Quantity' showBorder='1' formatNumberScale='0' rotatelabels='1' showvalues='0'>");

//                // Initialize the &lt;categories&gt; element.
//                xmlData.AppendFormat("<categories>");

//                // Every date between January 01, 2003 and January 20, 2003 is entered thrice
//                // in the datepro field in the FactoryDB database.

//                // The dates will be shown as category labels on the x-axis of the chart.

//                // Because we need to show each date only once, use the select query
//                // with the distinct keyword to fetch only one instance of each date from the database.

//                // Store the output of the select query in the factoryQuery string variable.

//                string factoryQuery = "select distinct format(datepro,'dd/mm/yyyy') as dd from factory_output";

//                // Establish the database connection.
//                DbConn oRs = new DbConn(factoryQuery);

//                // Iterate through the data in the factoryQuery variable and add the dates as

//                // labels to the &lt;category&gt; element.

//                // Append this data to the xmlData object.
//                while (oRs.ReadData.Read())
//                {
//                    xmlData.AppendFormat("<category label='{0}'/>", oRs.ReadData["dd"].ToString());
//                }

//                //Close the database connection.
//                oRs.ReadData.Close();

//                //Close the &lt;catgories&gt; element.
//                xmlData.AppendFormat("</categories>");

//                //Fetch all details for the three factories from the Factory_Master table
//                // and store the result in the factoryquery2 variable.

//                string factoryquery2 = "select * from factory_master";

//                //Establish the database connection..
//                DbConn oRs1 = new DbConn(factoryquery2);

//                // Iterate through the results in the factoryquery2 variable to fetch the
//                // factory name and factory id.

//                while (oRs1.ReadData.Read())
//                {
//                    // Append the factory name as the value for the seriesName attribute.
//                    xmlData.AppendFormat("<dataset seriesName='{0}'>", oRs1.ReadData["factoryname"].ToString());

//                    // Based on the factory id, fetch the quantity produced by each factory on each day
//                    // from the factory_output table.

//                    // Store the results in the factoryquery3 string object.

//                    string factoryquery3 = "select quantity from factory_output where factoryid=" + oRs1.ReadData["factoryid"].ToString();

//                    //Establish the database connection.
//                    DbConn oRs2 = new DbConn(factoryquery3);

//                    // Iterate through the results in the factoryquery3 object and fetch the quantity details
//                    // for each factory.

//                    // Append the quantity details as the the value for the &lt;set&gt; element.

//                    while (oRs2.ReadData.Read())
//                    {
//                        xmlData.AppendFormat("<set value='{0}'/>", oRs2.ReadData[0].ToString());
//                    }

//                    // Close the database connection.
//                    oRs2.ReadData.Close();

//                    // Close the &lt;dataset&gt; element.
//                    xmlData.AppendFormat("</dataset>");
//                }

//                // Close the database connection.
//                oRs1.ReadData.Close();

//                // Close the &lt;chart&gt; element.
//                xmlData.AppendFormat("</chart>");

//                // Initialize the chart.
//                Chart factoryOutput = new Chart("msline", "myChart", "600", "350", "xml", xmlData.ToString());

//                // Render the chart.
//                Literal1.Text = factoryOutput.Render();
//            }
//        }
//    }
//}