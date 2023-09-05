<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LegendSelectAgent.aspx.cs" Inherits="Audit_Legends.LegendSelectAgent" %>

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
    <link href="LegendSelectAgent.css" rel="stylesheet" type="text/css" />

</head>
<body>

    <div id="homelabel">
    <ul>
        <li><a href="Home.aspx">Home</a></li>
    </ul>
    </div>

    <form id="form1" runat="server">

    <div class="col-sm-12">
    <div class="col-sm-12" style="margin-top:100px;width:100%;float:left;">
        <asp:Button ID="Button1" CssClass="SelectButtonsNew" runat="server" Text="Voice Legend" OnClick="New1_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" CssClass="SelectButtonsNew" runat="server" Text="Chat Legend" OnClick="New4_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button3" CssClass="SelectButtonsNew" runat="server" Text="SoMe Legend" OnClick="New2_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button6" CssClass="SelectButtonsNew" runat="server" Text="ADX Legend" OnClick="New3_Click"/><br /><br /><br />

        <%--<asp:Button ID="Button4" CssClass="SelectButtons" runat="server" Text="SoMe Facebook Twitter Legend" OnClick="selection4_Click" /><br /><br /><br />
        <asp:Button ID="Button5" CssClass="SelectButtons" runat="server" Text="SoMe Forums Legend" OnClick="select5_Click"/><br /><br /><br />--%>
        <asp:Button ID="Button12" CssClass="SelectButtons" runat="server" Text="Swivel DaaS Legend" OnClick="Button12_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button13" CssClass="SelectButtons" runat="server" Text="India and APJ DaaS Legend" OnClick="Button13_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button7" CssClass="SelectButtons" runat="server" Text="Rio Rancho Legend" OnClick="select7_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="select11" CssClass="SelectButtons" runat="server" Text="TOC / DVT Legend" OnClick="select11_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="select8" CssClass="SelectButtons" runat="server" Text="CEM Legend" OnClick="select8_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="select12" CssClass="SelectButtons" runat="server" Text="DOA Legend" OnClick="select12_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button8" CssClass="SelectButtons" runat="server" Text="CDT/KCI (GA) Legend" OnClick="Button8_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button4" CssClass="SelectButtons" runat="server" Text="KCI Legend" OnClick="Button4_Click"/><br /><br /><br />
        <asp:Button ID="Button9" CssClass="SelectButtons" runat="server" Text="SAPOS Legend" OnClick="Button9_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button5" CssClass="SelectButtons" runat="server" Text="TCO / Outbound Legend" OnClick="Button5_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button10" CssClass="SelectButtons" runat="server" Text="RA Onsite & PURR" OnClick="Button10_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button11" CssClass="SelectButtons" runat="server" Text="PDRA RS RC" OnClick="Button11_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button14" CssClass="SelectButtons" runat="server" Text="Omnichannel Email Solvup CMD" OnClick="Button14_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button15" CssClass="SelectButtons" runat="server" Text="MPS Email PSCC" OnClick="Button15_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
    
    </div>
    </form>
</body>
</html>
