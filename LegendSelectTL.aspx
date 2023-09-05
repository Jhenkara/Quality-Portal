<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LegendSelectTL.aspx.cs" Inherits="Audit_Legends.LegendSelectTL" %>

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

    <title>Legend Selection</title>
    <link rel="shortcut icon" href="Images/HP logoblu.png"  />
    <link href="LegendSelectMgr.css" rel="stylesheet" type="text/css" />

</head>
<body>

    <div id="homelabel">
    <ul>
        <li><a href="Home.aspx">Home</a></li>
    </ul>
    </div>

    <form id="form1" runat="server">
    <div class="col-sm-12">
    <div class="col-sm-4" style="margin-top:100px;width:33%;float:left;">
        <asp:Button ID="select1" CssClass="SelectButtons" runat="server" Text="Premium Consumer Legend" OnClick="selection1_Click" /><br /><br /><br />
        <asp:Button ID="select2" CssClass="SelectButtons" runat="server" Text="Commercial Legend" OnClick="selection3_Click"/><br /><br /><br />
        <asp:Button ID="select6" CssClass="SelectButtons" runat="server" Text="Mobility Legend" OnClick="select6_Click"/><br /><br /><br />
        <asp:Button ID="select9" CssClass="SelectButtons" runat="server" Text="ADX Commercial Legend" OnClick="select9_Click"/><br /><br /><br />
    </div>
    <div class="col-sm-8" style="margin-top:100px;width:33%;float:left;">
        <asp:Button ID="select4" CssClass="SelectButtons" runat="server" Text="SoMe Facebook Twitter Legend" OnClick="selection4_Click" /><br /><br /><br />
        <asp:Button ID="select5" CssClass="SelectButtons" runat="server" Text="SoMe Forums Legend" OnClick="select5_Click"/><br /><br /><br />
    </div>
    <div class="col-sm-12" style="margin-top:100px;width:33%;float:right;">
        <%--<asp:Button ID="select3" CssClass="SelectButtons" runat="server" Text="Premium Hardware Legend" OnClick="selection2_Click" /><br /><br /><br />  --%>  
        <asp:Button ID="select7" CssClass="SelectButtons" runat="server" Text="Rio Rancho Legend" OnClick="select7_Click"/><br /><br /><br />        
        <asp:Button ID="select8" CssClass="SelectButtons" runat="server" Text="CEM Legend" OnClick="select8_Click"/><br /><br /><br />        
        <asp:Button ID="select10" CssClass="SelectButtons" runat="server" Text="Smart Friend Legend" OnClick="select10_Click"/><br /><br /><br />
        <asp:Button ID="select11" CssClass="SelectButtons" runat="server" Text="TOC Legend" OnClick="select11_Click"/><br /><br /><br />
    </div>
    </div>
    </form>
</body>
</html>
