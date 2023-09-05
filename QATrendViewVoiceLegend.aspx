<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QATrendViewVoiceLegend.aspx.cs" Inherits="Audit_Legends.QATrendViewVoiceLegend" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QA Audit Trends</title>
    <link rel="shortcut icon" href="Images/HP logoblu.png"  />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <link href="UserDashboard.css" rel="stylesheet" type="text/css" />
    <link href="css1/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous"/>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <style type="text/css">
        .auto-style1 {
            height: 110px;
        }
    </style>
    
</head>
<body>
    <script type="text/javascript">
        $(function () {
            $("#tbFromDate").datepicker(null);
            $("#tbToDate").datepicker(null);
        });
    </script>

    <form id="form1" runat="server">

    <div id="homelabel">
    <ul>
        <li><a href="Home.aspx">Home</a></li>
    </ul>
    </div>

    <div style="text-align:right; margin-right:30px;float:right;width:50%" class="auto-style1">
            <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
            <asp:Button ID="btnTrend" runat="server" Text="Audit Trend" CssClass="MenuButtons" OnClick="btnTrend_Click" />
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="MenuButtons" OnClick="btnLogout_Click" />
        </div>
            <br />
    
    <div style="margin-left:30px;font-weight:bold;">
        <asp:RadioButtonList ID="rbType" RepeatDirection="Horizontal" AutoPostBack="true" runat="server" OnSelectedIndexChanged="rbType_SelectedIndexChanged">
            <asp:ListItem Text="Engineer and Month Wise" Value="0" Style="margin-right:30px;"></asp:ListItem>
            <asp:ListItem Text="Parameter Wise" Value="1" Style="margin-right:30px;"></asp:ListItem>
            <%--<asp:ListItem Text="Month Wise" Value="2" Style="margin-right:30px;"></asp:ListItem>--%>
        </asp:RadioButtonList>
    </div>

        <div  class="col-md-5" style="margin-left:30px;">
            <asp:HiddenField ID="hfv_empmail" runat="server" />
            <table id="tab1" runat="server">
                
                <tr>
                    <th style="width:230px;">
                        Select Team Name :
                    </th>
                    <td style="width:200px;">
                        <asp:DropDownList ID="ddTeamSelect" CausesValidation="false" DataTextField="TeamName" AppendDataBoundItems="true" CssClass="form-control input-xs" runat="server"></asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <th style="width:230px;">
                        Select Employee :
                    </th>
                    <td style="width:200px;">
                        <asp:DropDownList ID="ddEmpSelect" CausesValidation="false" DataTextField="Employee_Name" AppendDataBoundItems="true" CssClass="form-control input-xs" runat="server" Width="200px"></asp:DropDownList>
                    </td>
                </tr>

                <%--<tr>
                    <th style="width:200px;">
                        Select Month :
                    </th>
                    <td>
                        <asp:DropDownList ID="ddMonthSelect" CausesValidation="false" DataTextField="Month" AppendDataBoundItems="true" CssClass="form-control input-xs" runat="server"></asp:DropDownList>
                    </td>
                </tr>--%>

                <tr>
                    <th style="width:230px;">
                        Select Date Range :
                    </th>
                    <td style="width:200px;">
                        From<asp:TextBox ID="tbFromDate" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="30px" Width="120px"></asp:TextBox>
                    </td>
                    <td style="width:200px;">
                        To<asp:TextBox ID="tbToDate" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="30px" Width="120px"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <table id="tab2" runat="server">
                <tr>
                    <th style="width:230px;">
                        Select Parameter :
                    </th>
                    <td style="width:200px;">
                        <asp:DropDownList ID="ddParamSelect" CausesValidation="false" AppendDataBoundItems="false" CssClass="form-control input-xs" runat="server" Width="200px">
                            <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>    
            </table>

                <br />
                <asp:Button ID="FetchData" runat="server" Text="Fetch Data" CssClass="MenuButtons" OnClick="FetchData_Click" />  
                <asp:Button ID="DLData" runat="server"  Text="Export to Excel" CssClass="MenuButtons" OnClick="DLData_Click" />
            <br />
            <br />
        </div>

        <div class="form-group ">
            <div class="col-sm-12">
                
                <asp:Label Text="Past Audit Trend" Font-Bold="true" Font-Underline="true" runat="server"> </asp:Label>
                <asp:GridView ID="TrendGrid" runat="server" AutoGenerateEditButton="false" CellPadding="3" CellSpacing="2" GridLines="Vertical" CssClass=" table table-bordered table-responsive rounded_corners" AutoGenerateColumns="true"  HeaderStyle-BackColor="#3AC0F2"
                    HeaderStyle-ForeColor="White"  RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" ItemStyle-Font-Names="HP Simplified" 
                    RowStyle-ForeColor="#3A3A3A" PageSize="10" AllowPaging="true" OnPageIndexChanging="OnPaging" Font-Size="XX-Small"> 
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <PagerStyle HorizontalAlign="Center"  />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />  
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />  
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />  
                    <SortedDescendingHeaderStyle BackColor="#000065" /> 
                </asp:GridView>                  
            </div>
        </div>
    </form>
</body>
</html>
