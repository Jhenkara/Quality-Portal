<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditFormChatLegendComm.aspx.cs" Inherits="Audit_Legends.AuditFormChatLegendComm" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >

    <title>Home</title>

        <!--Bootstrap CSS CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <link href="AuditFormChatLegendComm.css" rel="stylesheet" type="text/css" />
         <!-- Font Awesome JS -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
        <style type="text/css">
            .auto-style1 {
                width: 100%;
            }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <%--Top Form--%>
    <div class="auto-style1">
        <h1 style="color:aliceblue;background-color:black;text-align:center"> Premium Chat Legend Audit Form </h1>
    </div>

    <div class="row" style="margin-left:20px;margin-top:20px;">
        <div class="col-sm-10">
        <table id="table1" style="float: left">
            <tr>
                <th>
                    Transaction #: 
                </th>
                <td>
                    <asp:TextBox ID="ChatLegendId1" CssClass="form-control" AutoCompleteType="Disabled" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    C-Dax Case #: 
                </th>
                <td>
                    <asp:TextBox ID="ChatLegendId2" CssClass="form-control" AutoCompleteType="Disabled" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Audit No: 
                </th>
                <td>
                    <asp:TextBox ID="ChatLegendId3" CssClass="form-control" AutoCompleteType="Disabled" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Chat Date:
                </th>
                <td>
                    <asp:TextBox ID="ChatLegendId4" CssClass="form-control" AutoCompleteType="Disabled" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Evaluation Date: 
                </th>
                <td>
                    <asp:TextBox ID="ChatLegendId5" CssClass="form-control" AutoCompleteType="Disabled" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Engineer ID: 
                </th>
                <td>
                    <asp:TextBox ID="ChatLegendId6" CssClass="form-control" AutoCompleteType="Disabled" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Compliance Score % 
                </th>
                <td>
                    <asp:TextBox ID="ChatLegendId7" CssClass="form-control" AutoCompleteType="Disabled" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Engineer Name 
                </th>
                <td>
                    <asp:TextBox ID="ChatLegendId8" CssClass="form-control" AutoCompleteType="Disabled" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />

    <div class="col-sm-12" style="text-align:center;margin-top:20px;float:left;font-size:small;">

            <%--Bottom table--%>
            <table border="1">
                <tr>
                    <th colspan="3">Competencies</th>
                    <th>Metrics</th>
                    <th>Score</th>
                    <th>Severity</th>
                    <th>Max Score</th>
                    <th>Agent Score</th>
                </tr>

                <tr>
                    <th style="background-color:cornflowerblue;width:20px;">A</th>
                    <th colspan="4" style="background-color:cornflowerblue">Customer Care and Personal Skills</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>

                <tr>
                    <th rowspan="4" style="background-color:darkslategrey">1</th>
                    <th rowspan="4" style="background-color:darkslategrey">Tone and Language</th>
                    <th>"The agent communicates in a clear and professional manner. Expresses thoughts in a confident manner."</th>
                    <td> </td>
                    <td> </td>
                    <td> </td>
                    <td> </td>
                    <td> </td>
                </tr>

                <tr>
                    <th>Did the agent communicate clearly with the customer?</th>
                    <th>Communication Skills</th>
                    <td><asp:DropDownList ID="a11" runat="server">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="1"></asp:ListItem></asp:DropDownList></td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
