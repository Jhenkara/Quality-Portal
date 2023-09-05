<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attrition_ManagerLogin.aspx.cs" Inherits="Audit_Legends.Attrition_ManagerLogin" %>

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

    <title>Manager Login Page</title>
    <link rel="shortcut icon" href="Images/HP logoblu.png"  />
    <link href="MgrLogin.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <div id="homelabel">
    <ul>
        <li><a href="Home.aspx">Home</a></li>
        <p style="display: inline-block; font-size:28px; color:white; text-align:center; vertical-align:middle; line-height:70px; font-weight: bold">CCC Bangalore - Transaction Quality Audit Legend </p>
    </ul>
    </div>

    <div class="panel-body" id="LoginDiv">
        <div class="row-center" >
            &nbsp;
            <a>
                <img src="Images/HP logoblack.png" height="90" width="90" />
            </a>&nbsp;
            <h1 class="navbar-brand pull-right" style="color:white;font-weight:bold;font-size:22px;">  Manager Login</h1>
            <br /><br />
        </div>
        <form runat="server" >
            <div class="form-horizontal">
                <div class="form-group">
                    <asp:Label ID="lblUsername" CssClass="textformat" runat="server" Text="Username"></asp:Label><span style="color:red">*</span>
                    <asp:TextBox ID="tbUsername" AutoCompleteType="Disabled" runat="server" CssClass="form-control" placeholder="sally.smith@hp.com" Font-Size="Large"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="errUserLogin" CssClass="validation" runat="server" ErrorMessage="required" ControlToValidate="tbUsername"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="errmail" CssClass="validation" runat="server" ErrorMessage="Incorrect format for Email Id" Display="Dynamic" ControlToValidate="tbUsername" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblPassword" CssClass="textformat" runat="server" Text="Password"></asp:Label><span style="color:red">*</span>
                    <asp:TextBox ID="tbPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your Password" Font-Size="Large"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="errPassword" CssClass="validation" runat="server" ErrorMessage="required" ControlToValidate="tbPassword"></asp:RequiredFieldValidator>
                </div>

                <div>
                    <a href="ChangePassword.aspx">Forgot Password?</a>
                </div>
                <br />

                <div class="form-group">
                    <asp:Button ID="btnLogin" runat="server" Text="Log In" OnClick="btnLogin_Click" />
                    <br />
                    <asp:Label ID="errMsgLogin" runat="server" Text=" * Incorrect User Credentials" CssClass="validation"></asp:Label>
                </div>
            </div>
        </form>
    </div>
        <p style="color:white;text-align:center;"> For any Technical assistance, contact Nikhil R (nikhil.r@hp.com)</p>
</body>
</html>
