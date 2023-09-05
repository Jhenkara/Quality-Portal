<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TLDashboardSoMe.aspx.cs" Inherits="Audit_Legends.TLDashboardSoMe" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <!--Bootstrap CSS CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />


    <title>Dashboard</title>
    <link rel="shortcut icon" href="Images/HP logoblu.png"  />
    <link href="TLDashboard.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <div id="homebar">
    <ul>
        <li><a href="Home.aspx">Home</a></li>
    </ul>
    </div>

    <form id="form1" runat="server">
    <div>
        <table id="Table1" style="border:1px solid black;font-family:Arial;margin-left:30px;">
            <tr><br />
                <td>
                    <b>QA Name:</b>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">

                    </asp:DropDownList>
                </td>
            </tr>

            <%--<tr><br />
                <td>
                    <b>Reporting Manager:</b>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        
                    </asp:DropDownList>
                </td>
            </tr>--%>

            <tr><br />
                <td>
                    <b>Month:</b>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList3" runat="server">
                        
                    </asp:DropDownList>
                </td>
            </tr>

            <tr><br />
                <td>
                    <b>Case Type:</b>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList4" runat="server">
                        
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>
                <asp:Button ID="Button1" runat="server" Text="Apply Filters" OnClick="Chart1_Function"/>
                </td>
            </tr>
            
            <tr>
                <td colspan="2">
                    <asp:Chart ID="Graph1" runat="server" Width="1450px" height="500px" EnableViewState="True" ImageType="Jpeg" Palette="None">
                        <Titles>
                            <asp:Title Text="Compliance vs Employees" Font="Georgia, 16.2pt, style=Bold"></asp:Title>
                        </Titles>
                        <series>
                            <asp:Series Name="Series1" ChartArea="ChartArea1" IsValueShownAsLabel="true" BorderColor="Black" BorderWidth="2" Color="OrangeRed" Font="Georgia, 16.2pt, style=Bold" Label="#VAL{N0}" LabelFormat="" MarkerStyle="Square">
                            </asp:Series>
                        </series>
                        <chartareas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisX Title="Employees" TitleFont="18" >
                                    <MajorGrid Enabled="False" />
                                </AxisX>
                                <AxisY Title="Total Compliance (%)" TitleFont="18">
                                    <MajorGrid LineColor="DarkGray" LineDashStyle="Dot"  />
                                </AxisY>
                            </asp:ChartArea>
                        </chartareas>
                    </asp:Chart>
                </td>
            </tr>
        </table>
    </div>

        <br /><br /><br />

    <div>
        <table id="Table2" style="border:1px solid black;font-family:Arial;margin-left:30px;">
            <tr>
                <td><br />
                    <b>QA Name:</b>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList5" runat="server">
                        
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td><br />
                    <b>Month:</b>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList6" runat="server">
                        
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td><br />
                    <b>Case Type:</b>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList7" runat="server">
                        
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>
                <asp:Button ID="Button2" runat="server" Text="Apply Filters" OnClick="Chart2_Function"/>
                </td>
            </tr>
            
            <tr>
                <td colspan="2">
                    <asp:Chart ID="Graph2" runat="server" Width="1450px" height="500px" EnableViewState="True" ImageType="Jpeg" Palette="None">
                        <Legends>
                            <asp:Legend Alignment="Center" Docking="Top" IsDockedInsideChartArea="False" Name="Legend1">
                            </asp:Legend>
                        </Legends>
                        <Titles>
                            <asp:Title Text="Customer and Business Critical %" Font="Georgia, 16.2pt, style=Bold"></asp:Title>
                        </Titles>
                        <series>
                            <asp:Series Name="Series2" ChartArea="ChartArea2" IsValueShownAsLabel="true" BorderColor="Black" BorderWidth="2" Color="OrangeRed" Font="Georgia, 16.2pt, style=Bold" Label="#VAL{N0}" LabelFormat="" MarkerStyle="Square" Legend="Legend1">
                            </asp:Series>
                        </series>
                        <chartareas>
                            <asp:ChartArea Name="ChartArea2">
                                <AxisX Title="Employees" TitleFont="18" >
                                    <MajorGrid Enabled="False" />
                                </AxisX>
                                <AxisY Title="Total Compliance (%)" TitleFont="18">
                                    <MajorGrid LineColor="DarkGray" LineDashStyle="Dot"  />
                                </AxisY>
                            </asp:ChartArea>
                        </chartareas>
                    </asp:Chart>
                </td>
            </tr>
        </table>
    </div>

        <br /><br /><br />

    <%--<div>
        <table id="Table2" style="border:1px solid black;font-family:Arial;margin-left:30px;">
            <tr>
                <td><br />
                    <b>QA Name:</b>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td><br />
                    <b>Month:</b>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList8" runat="server">
                        
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td><br />
                    <b>Case Type:</b>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList9" runat="server">
                        
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>
                <asp:Button ID="Button3" runat="server" Text="Apply Filters" OnClick="Chart2_Function"/>
                </td>
            </tr>
            
            <tr>
                <td colspan="2">
                    <asp:Chart ID="Chart1" runat="server" Width="1450px" height="500px" EnableViewState="True" ImageType="Jpeg" Palette="None">
                        <Legends>
                            <asp:Legend Alignment="Center" Docking="Top" IsDockedInsideChartArea="False" Name="Legend1">
                            </asp:Legend>
                        </Legends>
                        <Titles>
                            <asp:Title Text="Compliance vs Employees" Font="Georgia, 16.2pt, style=Bold"></asp:Title>
                        </Titles>
                        <series>
                            <asp:Series Name="Series2" ChartArea="ChartArea2" IsValueShownAsLabel="true" BorderColor="Black" BorderWidth="2" Color="OrangeRed" Font="Georgia, 16.2pt, style=Bold" Label="#VAL{N0}" LabelFormat="" MarkerStyle="Square" Legend="Legend1">
                            </asp:Series>
                        </series>
                        <chartareas>
                            <asp:ChartArea Name="ChartArea2">
                                <AxisX Title="Employees" TitleFont="18" >
                                    <MajorGrid Enabled="False" />
                                </AxisX>
                                <AxisY Title="Total Compliance (%)" TitleFont="18">
                                    <MajorGrid LineColor="DarkGray" LineDashStyle="Dot"  />
                                </AxisY>
                            </asp:ChartArea>
                        </chartareas>
                    </asp:Chart>
                </td>
            </tr>
        </table>
    </div>--%>
    </form>
</body>
</html>
