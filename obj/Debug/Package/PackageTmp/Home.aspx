<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Audit_Legends.Home" %>

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

    <title>Home</title>
    <link rel="shortcut icon" href="Images/HP logoblu.png"  />
    <link href="Homepage.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div>
    <ul>
        <li><a href="#home">Home</a></li>
        <li class="dropdown">
            <a href="#" class="dropbtn">Quality Login</a>
                <div class="dropdown-content">
                    <a href="QALogin.aspx">Auditor Login</a>
                    <a href="AgentLogin.aspx">Engineer Login</a>
                    <%--<a href="TLLogin.aspx">Team Lead Login</a>--%>
                    <a href="MgrLogin.aspx">Manager Login</a>
                    <a href="OM_Login.aspx">OM / OL Login</a>
                    <a href="OL_Login.aspx">Director Login</a>
                    <a href="HygieneCheckQA.aspx">Hygiene Check (QA)</a>
                    <a href="HygieneCheckUser.aspx">Hygiene Check (User)</a>
                </div>
        </li>
                <p style="display:inline-block;font-size:xx-large; color:white;margin-right:100px; vertical-align:middle; line-height:70px; font-weight: bold">CCC Bangalore - Transaction Quality Audit Legend </p>

        <li class="dropdown">
            <a href="#" class="dropdown"> Hiring Login</a>
                <div class="dropdown-content">
                    <a href="ProfileDetailForm.aspx">Profile Creation</a>
                    <a href="Attrition_HiringLogin.aspx">Hiring Team Login</a>
                    <a href="Attrition_ManagerLogin.aspx">Manager Login</a>
                </div>
        </li>
    </ul>
    </div>
</body>
</html>