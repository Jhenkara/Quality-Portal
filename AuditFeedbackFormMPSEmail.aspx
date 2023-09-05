<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditFeedbackFormMPSEmail.aspx.cs" Inherits="Audit_Legends.AuditFeedbackFormMPSEmail" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>Email PSCC MPS Audit Feedback Form</title>
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
        <h1><img src="Images/HP logoblu.png" style="width:98px;overflow:auto;float:initial;"/> Email PSCC MPS Audit Feedback Form </h1>
    </div>

    <div style="text-align:right;height:80px;">
        <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnLogout" CausesValidation="false" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    </div>
        <div>
            <table id="table1" style="float:left;margin-left:40px;position:center">

            <tr>
                <th>
                    QA Name 
                </th>
                <td>
                    <asp:TextBox ID="tbId1" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    QA Mail 
                </th>
                <td>
                    <asp:TextBox ID="tbId1a" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Enter a Case Id to send Feedback
                </th>

                <td>
                    <asp:TextBox ID="CallId" TextMode="MultiLine" AutoPostBack="true" placeholder="* Enter a valid Case ID here" OnTextChanged="btnFeedBk_Click" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="50px" Width="300px"></asp:TextBox>
                    <%--<br />
                    <asp:Button ID="btnFeedBk" Text="Search" runat="server" />--%>
                </td>
            </tr>

            
            <tr>
                <th>
                    Employee ID 
                </th>
                <td>
                    <asp:TextBox ID="tbId2" CssClass="form-control" AutoPostBack="true" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Employee Name 
                </th>
                <td>
                    <asp:TextBox ID="tbId3" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Employee Mail
                </th>
                <td>
                    <asp:TextBox ID="TextBox3" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    CC Email
                </th>
                <td>
                    <asp:TextBox ID="TextBox4" TextMode="MultiLine" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" placeholder="* For more than one email, seperate it with ';', else leave it blank." runat="server" Height="100px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Attachment
                </th>
                <td>
                    <asp:FileUpload ID="FileUploadControl" ToolTip="Browse" runat="server" Height="27px" Width="130px" />
                </td>
             </tr>

            <tr>
                <th>
                    Feedback :
                </th>
                <td>
                    <asp:TextBox ID="Feedback" TextMode="MultiLine" CssClass="form-control-sm" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="160px" Width="300px"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvFeedbk" runat="server" ErrorMessage="* Cannot be blank" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="Feedback" SetFocusOnError="true"></asp:RequiredFieldValidator><br />
                    <asp:Button ID="btnSendFeedbk" runat="server" Text="Send" OnClick="btnSendFeedbk_Click"  />
                </td>
            </tr>
            </table>
        </div>
        <%--<div>
            <table id="table2" style="float:left;margin-left:40px;position:center">
                

                <tr>
                    <th>
                        
                    </th>
                    <td>
                        <div class="text-sm-center" style="align-items:center;width:100%;">
                        <br /><br />
                        <asp:Button ID="btnSubmit1" CssClass="btnsub" runat="server" Text="Send" OnClick="btnSendFeedbk_Click"/>
                        </div>
                    </td>
                </tr>
            </table>
        </div>--%>
    </form>
</body>
</html>
