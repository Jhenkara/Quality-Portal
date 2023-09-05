<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Audit_Legends.ChangePassword" %>

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

    <title>QA Login Page</title>
    <link rel="shortcut icon" href="Images/HP logoblu.png"  />
    <link href="ChangePassword.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <div id="homelabel">
    <ul>
        <li><a href="Home.aspx">Home</a></li>
    </ul>
    </div>

    <div class="panel-body" id="LoginDiv">
        <div class="row-center" >
            <a>
                <img src="Images/HP logoblu.png" height="120" width="120" />
            </a>
            <h1 class="navbar-brand pull-right" style="color:white;font-weight:bold;">  Password Reset</h1>
            <br />
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
                    <asp:Label ID="lblOldPassword" CssClass="textformat" runat="server" Text="Old Password"></asp:Label><span style="color:red">*</span>
                    <asp:TextBox ID="tbOldPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your Password" Font-Size="Large"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="validation" runat="server" ErrorMessage="required" ControlToValidate="tbOldPassword"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblPassword" CssClass="textformat" runat="server" Text="Enter New Password"></asp:Label><span style="color:red">*</span>
                    <asp:TextBox ID="tbPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your Password" Font-Size="Large"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="errPassword" CssClass="validation" runat="server" ErrorMessage="required" ControlToValidate="tbPassword"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblConfPassword" CssClass="textformat" runat="server" Text="Confirm New Password"></asp:Label><span style="color:red">*</span>
                    <asp:TextBox ID="tbConfPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your Password" Font-Size="Large"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" CssClass="validation" runat="server" ControlToValidate="tbConfPassword" ControlToCompare="tbPassword" ErrorMessage="Passwords Does not match"></asp:CompareValidator>
                    &nbsp;
                </div>
                <div>
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </div>

                <div class="form-group">
                    <asp:Button ID="btnLogin" runat="server" Text="Change Password" OnClick="btnLogin_Click" />
                    <br />
                </div>
            </div>
        </form>
    </div>
</body>
</html>
