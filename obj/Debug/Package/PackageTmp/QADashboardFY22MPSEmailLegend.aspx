<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QADashboardFY22MPSEmailLegend.aspx.cs" Inherits="Audit_Legends.QADashboardFY22MPSEmailLegend" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QA Dashboard</title>
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
            height: 140px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

    <div id="homelabel">
    <ul>
        <li><a href="Home.aspx">Home</a></li>
    </ul>
    </div>

    <div style="margin-bottom:20px;" class="auto-style1">
        <div class="card-body" style="background-color:white; box-shadow: 0px 0px 3px grey; border-radius:5px;margin-left:30px;height:auto;width:40%;float:left;">
            <div class="col-sm-6" style="width:50%;float:left;">
                <p style="display: inline-block; font-family: 'HP Simplified'; font-size:small; text-decoration: underline; font-weight: bold">Total Audits : </p>
                <asp:Label ID="TotalAudits" runat="server" Text="" Font-Bold="True" Font-Underline="True" Font-Size="Small"></asp:Label><br />
                <p style="display: inline-block; font-family: 'HP Simplified'; font-size:small; text-decoration: underline; font-weight: bold">Passed Audits : </p>
                <asp:Label ID="PassedAudits" runat="server" Text="" Font-Bold="True" Font-Underline="True" Font-Size="Small"></asp:Label><br />
                <p style="display: inline-block; font-family: 'HP Simplified'; font-size:small; text-decoration: underline; font-weight: bold">Failed Audits : </p>
                <asp:Label ID="FailedAudits" runat="server" Text="" Font-Bold="True" Font-Underline="True" Font-Size="Small"></asp:Label><br />
                <p style="display: inline-block; font-family: 'HP Simplified'; font-size:small; text-decoration: underline; font-weight: bold">Pass % : </p>
                <asp:Label ID="PassPer" runat="server" Text="" Font-Bold="True" Font-Underline="True" Font-Size="Small"></asp:Label>
            </div>
            <div class="col-sm-6" style="width:50%;float:right;text-align:left;">
                <p style="display: inline-block; font-family: 'HP Simplified'; font-size:small; text-decoration: underline; font-weight: bold">Count of Defects : </p>
                <asp:Label ID="DefectCount" runat="server" Text="" Font-Bold="True" Font-Underline="True" Font-Size="Small"></asp:Label><br />
                <p style="display: inline-block; font-family: 'HP Simplified'; font-size:small; text-decoration: underline; font-weight: bold">Defect % : </p>
                <asp:Label ID="DefectPer" runat="server" Text="" Font-Bold="True" Font-Underline="True" Font-Size="Small"></asp:Label><br />
                <p style="display: inline-block; font-family: 'HP Simplified'; font-size:small; text-decoration: underline; font-weight: bold">Average Audit % : </p>
                <asp:Label ID="AvgAuditScore" runat="server" Text="" Font-Bold="True" Font-Underline="True" Font-Size="Small"></asp:Label>
            </div>
        </div>

        <div style="text-align:right; margin-right:30px;float:right;width:50%" class="auto-style1">
            <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="MenuButtons" OnClick="btnLogout_Click" />
        </div>
            <br />
    </div>

    <div class="col-sm-6" style="margin-left:20px;">
        <asp:TextBox ID="searchbar" CssClass="form-check-inline" AutoCompleteType="Disabled" placeholder="Enter the Employee ID or the Case ID here" BorderStyle="Inset" runat="server" Height="25px" Width="400px"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />&nbsp;
        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
    </div>
        <br />

    <div class="form-group ">
            <div class="col-sm-12">
                <asp:GridView ID="UserGrid" runat="server" AutoGenerateEditButton="false" CellSpacing="2" CssClass=" table table-bordered table-responsive rounded_corners" AutoGenerateColumns="false" Width="100%" HeaderStyle-BackColor="#3AC0F2"
                    HeaderStyle-ForeColor="White"  RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
                    RowStyle-ForeColor="#3A3A3A" PageSize="10" AllowPaging="true" OnPageIndexChanging="OnPaging"> 
                    <Columns>
                        <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" />
                        <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" />
                          <asp:TemplateField HeaderText="Case ID">
                            <ItemTemplate>
                                <asp:Label ID="lblcase" runat="server" Text='<%# Eval("CaseID")%>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:BoundField DataField="CallDate" HeaderText="Call Date" />
                        <asp:BoundField DataField="EvaluationDate" HeaderText="EvaluationDate" />
                        <asp:BoundField DataField="QAName" HeaderText="QA Name" />
                        <asp:BoundField DataField="AuditStatus" HeaderText="Audit Status" />
                        <asp:BoundField DataField="AuditScore" HeaderText="Scores" />
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" Text="View / Edit" OnClick="btnEdit_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>                  
            </div>
        </div>

                <div class="form-group ">
            <div class="col-sm-12">
                <asp:GridView ID="TrendGrid" runat="server" AutoGenerateEditButton="false" CellSpacing="2" CssClass=" table table-bordered table-responsive rounded_corners" AutoGenerateColumns="false" Width="100%" HeaderStyle-BackColor="#3AC0F2"
                    HeaderStyle-ForeColor="White"  RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
                    RowStyle-ForeColor="#3A3A3A" PageSize="10" AllowPaging="true" OnPageIndexChanging="OnPaging" Font-Size="XX-Small"> 
                    <Columns>
                        <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" />
                        <asp:BoundField DataField="EvaluationDate" HeaderText="AuditDate" HeaderStyle-Width="100px" />
                        <asp:BoundField DataField="Opening" HeaderText="Opening" />
                        <asp:BoundField DataField="Probing" HeaderText="Probing" />
                        <asp:BoundField DataField="Troubleshooting" HeaderText="Troubleshooting" HeaderStyle-Width="50px" />
                        <asp:BoundField DataField="Sol_Res" HeaderText="Sol/Res" />
                        <asp:BoundField DataField="Behavioural" HeaderText="Behavioural" />
                        <asp:BoundField DataField="Communication" HeaderText="Communication" />
                        <asp:BoundField DataField="CallEtiquettes" HeaderText="Call Etiquettes" HeaderStyle-Width="80px" />
                        <asp:BoundField DataField="Setting_Expectation" HeaderText="Setting Expectation" HeaderStyle-Width="80px" />
                        <asp:BoundField DataField="CaseOwnership" HeaderText="Case Ownership" />
                        <asp:BoundField DataField="CaseHandling" HeaderText="Case Handling" />
                    </Columns>
                </asp:GridView>                  
            </div>
        </div>
    </form>
</body>
</html>
