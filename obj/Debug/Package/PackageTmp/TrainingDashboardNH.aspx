<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrainingDashboardNH.aspx.cs" Inherits="Audit_Legends.TrainingDashboardNH" %>

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
</head>
<body>
    <form id="form1" runat="server">

    <div id="homelabel">
    <ul>
        <li><a href="Home.aspx">Home</a></li>
    </ul>
    </div>

    <div style="text-align:right">
        <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    </div>
        <br />

    <div class="col-sm-6" style="margin-left:20px;">
        <asp:TextBox ID="searchbar" CssClass="form-check-inline" AutoCompleteType="Disabled" placeholder="Enter the Batch Number here" BorderStyle="Inset" runat="server" Height="25px" Width="400px"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />&nbsp;
        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
    </div>
        <br />

    <div class="dropdown" style="margin-left:40px;">
        <asp:DropDownList ID="dd_batchno" DataTextField="Batch_No" runat="server" Height="25px" Width="300px"></asp:DropDownList>
        <asp:Button ID="btnBind" runat="server" Text="Fetch Data" OnClick="btnBind_Click" />
    </div>
        <br />

    <div class="form-group ">
            <div class="col-sm-12">
                <asp:GridView ID="UserGrid" runat="server" AutoGenerateEditButton="false" CellSpacing="2" CssClass=" table table-bordered table-responsive rounded_corners" AutoGenerateColumns="false" Width="100%" HeaderStyle-BackColor="#3AC0F2"
                    HeaderStyle-ForeColor="White"  RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White"
                    RowStyle-ForeColor="#3A3A3A" PageSize="10" AllowPaging="true" OnPageIndexChanging="OnPaging"> 
                    <Columns>
                        <asp:BoundField DataField="Batch_No" HeaderText="Batch No." />
                        <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" />
                        <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
                          <asp:TemplateField HeaderText="TrainingCount">
                            <ItemTemplate>
                                <asp:Label ID="count" runat="server" Text='<%# Eval("Training_Count")%>' ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                        <asp:BoundField DataField="SSTrainer" HeaderText="Softskill Trainer" />
                        <asp:BoundField DataField="TechTrainer" HeaderText="Technical Trainer" />
                        <asp:BoundField DataField="TrainingStartDate" HeaderText="Start Date" />
                        <asp:BoundField DataField="TrainingEndDate" HeaderText="End Date" />
                        <asp:BoundField DataField="ComBaselineScores" HeaderText="Comm Baseline Scores" />
                        <asp:BoundField DataField="TechBaselineScores" HeaderText="Tech Baseline Scores" />
                        <asp:BoundField DataField="TG1" HeaderText="TG1" />
                        <asp:BoundField DataField="TG2" HeaderText="TG2" />
                        <asp:BoundField DataField="TG3" HeaderText="TG3" />
                        <asp:BoundField DataField="PoshTraining" HeaderText="Posh Training" />
                        <asp:BoundField DataField="PCI_Compliance" HeaderText="PCI Compliance" />
                        <asp:BoundField DataField="GlobalTrade" HeaderText="Global Trade" />
                        <asp:BoundField DataField="CW_CodeOfConduct" HeaderText="CW Code of Conduct" />
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
