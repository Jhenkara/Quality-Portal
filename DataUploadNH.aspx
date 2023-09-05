<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataUploadNH.aspx.cs" Inherits="Audit_Legends.DataUploadNH" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>New Hire Data Upload</title>
    <link rel="shortcut icon" href="Images/HP logoblu.png"  />

        <!--Bootstrap CSS CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
        <link href="PersonaVoiceLegend.css" rel="stylesheet" type="text/css" />
        <!-- Font Awesome JS -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
        <script type="text/javascript" src="AuditFormVoiceLegendComm.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <style type="text/css">
            .auto-style1 {
                width: 100%;
            }
        </style>
</head>
<body>

    <script type="text/javascript">
        $(function () {
            $("#tbId4").datepicker(null);
        });
    </script>

    <form id="form1" runat="server">
        <%--Top Form--%>
    <div class="auto-style1" style="color:aliceblue;background-color:black;text-align:left;line-height:100px;width:100%">
        <%--<img src="hp_logo_black.jpeg" style="width:100px;overflow:auto;float:left"/>--%>
        <h1><img src="Images/HP logoblu.png" style="width:98px;overflow:auto;float:initial;"/> New Hire Data Upload </h1>
    </div>

    <div style="text-align:right;height:80px;">
        <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
        <asp:Button ID="Download" CausesValidation="false" runat="server" Text="Download" OnClick="FileDownload" />
        <asp:Button ID="btnLogout" CausesValidation="false" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    </div>
        <div>
            <table id="table1" style="float:left;margin-left:40px;position:center">
                <tr>
                    <th>
                        Trainer Name 
                    </th>
                    <td>
                        <asp:TextBox ID="tbId1" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th>
                        Trainer Mail 
                    </th>
                    <td>
                        <asp:TextBox ID="tbId1a" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th>
                        Batch No. 
                    </th>
                    <td>
                        <asp:TextBox ID="tbId2" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th>
                        Attachment
                    </th>
                    <td>
                        <asp:FileUpload ID="FileUploadControl" ToolTip="Browse" runat="server" Height="30px" Width="300px" />
                    </td>
                </tr>

                <tr>
                    <th>
                        
                    </th>
                    <td>
                        <div class="text-sm-center" style="align-items:center;width:100%;">
                        <br /><br />
                        <asp:Button ID="btnSubmit" CssClass="btnsub" runat="server" Text="Send" OnClick="btnSend_Click"/>
                        </div>
                    </td>
                </tr>
        </table>
        </div>
        <div>
            <table id="table2" style="float:left;margin-left:40px;position:center">
                <tr>
                    <th>
                        Trainer Name :
                    </th>
                    <td>
                        <asp:TextBox ID="tbId3" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th>
                        Trainer Mail :
                    </th>
                    <td>
                        <asp:TextBox ID="tbId4" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th>
                        Batch No :
                    </th>
                    <td>
                        <asp:TextBox ID="tbId5" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th>
                        Topics Covered :
                    </th>
                    <td>
                        <asp:TextBox ID="tbId6" TextMode="MultiLine" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="80px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th>
                        Recipients : 
                    </th>
                    <td>
                        <asp:TextBox ID="tbId7" TextMode="MultiLine" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="80px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th>
                        CC_Mails : 
                    </th>
                    <td>
                        <asp:TextBox ID="tbId8" TextMode="MultiLine" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="80px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th>
                        
                    </th>
                    <td>
                        <div class="text-sm-center" style="align-items:center;width:100%;">
                        <br /><br />
                        <asp:Button ID="btnSubmit1" CssClass="btnsub" runat="server" Text="Save" OnClick="btnSubmit1_Click"/>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
