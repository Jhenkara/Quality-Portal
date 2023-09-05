<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExitInterview_Dashboard.aspx.cs" Inherits="Audit_Legends.ExitInterview_Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hiring Team Dashboard</title>
    <%--<link rel="shortcut icon" href="Images/HP logoblu.png"  />--%>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <link href="UserDashboard.css" rel="stylesheet" type="text/css" />
    <link href="css1/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous"/>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
    <form id="form1" runat="server">

    <div id="homelabel">
    <ul>
        <li><a href="Home.aspx">Home</a></li>
    </ul>
    </div>

    <div style="text-align:right">

    </div>
        <br />

    <div class="col-sm-6" style="margin-left:20px;">
        <asp:TextBox ID="searchbar" CssClass="form-check-inline" AutoCompleteType="Disabled" placeholder="Enter the Employee ID here" BorderStyle="Inset" runat="server" Height="25px" Width="400px"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />&nbsp;
    </div>
        <br />

    <div class="form-group ">
            <div class="col-sm-12">
                <asp:GridView ID="UserGrid" runat="server" AutoGenerateEditButton="false" CellSpacing="2" CssClass=" table table-bordered table-responsive rounded_corners" AutoGenerateColumns="false" Width="100%" HeaderStyle-BackColor="#3AC0F2"
                    HeaderStyle-ForeColor="White"  RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
                    RowStyle-ForeColor="#3A3A3A" PageSize="10" AllowPaging="true" OnPageIndexChanging="OnPaging"> 
                    <Columns>
                        <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
                          <asp:TemplateField HeaderText="Employee ID">
                            <ItemTemplate>
                                <asp:Label ID="lblemp" runat="server" Text='<%# Eval("EmployeeID")%>' ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                        <asp:BoundField DataField="EngineerSubmission" HeaderText="Submitted by Employee" />
                        <asp:BoundField DataField="HiringSubmission" HeaderText="Submitted by Hiring Team" />
                        <asp:BoundField DataField="ManagerSubmission" HeaderText="Submitted by Manager" />
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>                  
            </div>
        </div>
    </form>
</body>
</html>