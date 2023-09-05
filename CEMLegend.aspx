<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CEMLegend.aspx.cs" Inherits="Audit_Legends.CEMLegend" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>CEM Legend</title>
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
        <h1><img src="Images/HP logoblu.png" style="width:98px;overflow:auto;float:initial;"/> CEM Legend</h1>
    </div>

    <div style="text-align:right;height:80px;">
        <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
        <asp:Button ID="QADashboard" CausesValidation="false" runat="server" Text="QA Dashboard" OnClick="QADashboard_Click" />
        <asp:Button ID="Download" CausesValidation="false" runat="server" Text="Download" OnClick="FileDownload" />
        <asp:Button ID="btnLogout" CausesValidation="false" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    </div>

    <div class="row " style="margin-left:20px;margin-top:20px;">
        <div class="col-sm-12">
            <asp:HiddenField ID="hfv_empmail" runat="server" />
            <asp:HiddenField ID="hfv_ProfLevel" runat="server" />
        <table id="table1" style="float: left">
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
                    Customer Type
                </th>
                <td>
                    <asp:DropDownList ID="ddCusType" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Commercial" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Consumer" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddCusType" SetFocusOnError="true"></asp:RequiredFieldValidator>

                </td>
            </tr>

            <tr>
                <th>
                    Business Unit 
                </th>
                <td>
                    <asp:DropDownList ID="ddBU" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="PC" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Print" Value="1"></asp:ListItem>
                        <asp:ListItem Text="CSC" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Mobility" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddBU" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th class="auto-style9">
                    Business Segment 
                </th>
                <td>
                    <asp:DropDownList ID="ddBS" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Consumer" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Commercial" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Combined" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator20" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddBS" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th>
                    Delivery Type 
                </th>
                <td>
                    <asp:DropDownList ID="ddDeliType" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Voice" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Chat" Value="1"></asp:ListItem>
                        <asp:ListItem Text="SCM" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Partner" Value="3"></asp:ListItem>
                        <asp:ListItem Text="RD" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddDeliType" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th>
                    Month 
                </th>
                <td>
                    <asp:DropDownList ID="ddMonth" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Jan" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Feb" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Mar" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Apr" Value="3"></asp:ListItem>
                        <asp:ListItem Text="May" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Jun" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Jul" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Aug" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Sep" Value="8"></asp:ListItem>
                        <asp:ListItem Text="Oct" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Nov" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Dec" Value="11"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddMonth" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th>
                    Employee ID 
                </th>
                <td>
                    <asp:TextBox ID="tbId2" CssClass="form-control" AutoPostBack="true" AutoCompleteType="Disabled" OnTextChanged="tbId2_TextChanged" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
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
                    Reporting Manager
                </th>
                <td>
                    <asp:TextBox ID="TextBox6" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Team Name 
                </th>
                <td>
                    <asp:DropDownList ID="ddTeamName" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="PS ADX" Value="0"></asp:ListItem>
                        <asp:ListItem Text="PS Chat" Value="1"></asp:ListItem>
                        <asp:ListItem Text="PS FL Voice" Value="2"></asp:ListItem>
                        <asp:ListItem Text="PS RD/DSO" Value="3"></asp:ListItem>
                        <asp:ListItem Text="PS Athens" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Social Media" Value="5"></asp:ListItem>
                        <asp:ListItem Text="CEM" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Premium Voice" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Premium Chat" Value="8"></asp:ListItem>
                        <asp:ListItem Text="RCD" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Universal Core Ops" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Mobility" Value="11"></asp:ListItem>
                        <asp:ListItem Text="ISB" Value="12"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator18" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddTeamName" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th>
                    CC Email
                </th>
                <td>
                    <asp:TextBox ID="TextBox4" TextMode="MultiLine" CssClass="form-control" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" placeholder="* For more than one email, seperate it with ';'" runat="server" Height="80px" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="vCCMail" runat="server" ErrorMessage="* CC Mail ID required!!" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="TextBox4" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th>
                    Call Date 
                </th>
                <td>
                    <asp:TextBox ID="tbId4" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="tbId4" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th>
                    Evaluation Date : 
                </th>
                <td>
                    <asp:TextBox ID="tbId5" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" Enabled="false" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>
        </table>

        <table id="table3" style="float:left;margin-left:40px;position:center">
            <tr>
                <th style="width:300px;text-align:center">
                    What went Well :
                </th>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox1" TextMode="MultiLine" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="160px" Width="320px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="TextBox1" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th style="width:300px;text-align:center">
                    Opportunities
                </th>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox2" TextMode="MultiLine" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="160px" Width="320px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="TextBox2" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th style="height:50px;text-align:left;font-size:larger;"> 
                    Total Compliance : 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:Label id="TotalCompl" runat="server"></asp:Label>
                    <asp:HiddenField ID="Compliance" runat="server" />
                </th>
                <th style="height:50px;text-align:left;font-size:larger;">
                    
                </th>
            </tr>

            <tr>
                <th style="height:50px;text-align:left;font-size:larger;"> 
                    Customer Critical : 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:Label id="CustCrit" runat="server"></asp:Label>
                    <asp:HiddenField ID="hfv_CustCrit" runat="server" />
                </th>
                <th style="height:50px;text-align:left;font-size:larger;">
                    
                </th>
            </tr>

            <tr>
                <th style="height:50px;text-align:left;font-size:larger;"> 
                    Business Critical : 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:Label id="BusCrit" runat="server"></asp:Label>
                    <asp:HiddenField ID="hfv_BusCrit" runat="server" />
                </th>
                <th style="height:50px;text-align:left;font-size:larger;">
                    
                </th>
            </tr>
        </table>

        <table id="table4" style="float:left;margin-left:30px;position:center">

            <tr>
                <th>
                    Case Id 
                </th>
                <td>
                    <asp:TextBox ID="tbId6" CssClass="form-control" AutoCompleteType="Disabled" AutoPostBack="true" BorderStyle="Inset" runat="server" Height="25px" Width="300px" OnTextChanged="btnCaseIdCheck_Click"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="tbId6" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblCaseChk" Visible="false" runat="server"></asp:Label>
                </td>
            </tr>

            <tr>
                <th>
                    CSO 
                </th>
                <td>
                    <asp:TextBox ID="TextBox5" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="tbId7" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <%--<tr>
                <td>
                    <asp:Button ID="btnCaseIdCheck" runat="server" Text="Check if Case Id Exists" OnClick="btnCaseIdCheck_Click" />
                </td>
                <td>
                    <asp:Label ID="lblCaseChk" Visible="false" runat="server"></asp:Label>
                </td>
            </tr>--%>

            <tr>
                <th>
                    Call Id/SR Id 
                </th>
                <td>
                    <asp:TextBox ID="tbId7" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="tbId7" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th>
                    Call Duration
                </th>
                <td>
                    <asp:TextBox ID="tbId8" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="tbId8" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th>
                    Case Type 
                </th>
                <td>
                    <asp:DropDownList ID="ddCaseType" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Remote" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Service Centre" Value="1"></asp:ListItem>
                        <asp:ListItem Text="On Site" Value="2"></asp:ListItem>
                        <asp:ListItem Text="CSR" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Quick Log" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddCaseType" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th>
                    Problem Description 
                </th>
                <td>
                    <asp:TextBox ID="tbId9" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="tbId9" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th>
                    Product Line
                </th>
                <td>
                    <asp:DropDownList ID="ddProdLin" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Omen" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Spectre" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Envy" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Pavilion" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Stream" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddProdLin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <%--<tr>
                <th>
                    Audit No.
                </th>
                <td>
                    <asp:TextBox ID="tbId10" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>--%>

            <tr>
                <th>
                    Persona Idetified as 
                </th>
                <td>
                    <asp:DropDownList ID="ddPersona" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Beginner Ben - ENPT" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Seasoned Sam - ISTJ" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Leisure Liam - ISTP" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Focused Fred - ISTJ" Value="3"></asp:ListItem>
                        <asp:ListItem Text="At Home Hanna - ENFP" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Upgrade Ursala - ENFJ" Value="5"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddPersona" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>
                
            <tr>
                <th>
                    Proficiency Level
                </th>
                <td>
                    <asp:TextBox ID="tbProfLvl" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" Enabled="false" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Prediction
                </th>
                <td>
                    <asp:DropDownList ID="ddPred" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Promoter" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Passive" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Detractor" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator16" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddPred" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th>
                    Non-Compliance
                </th>
                <td>
                    <asp:DropDownList ID="ddNonComp" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="NCLF/Incomplete/Documentation" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Ownership" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Incomplete/Incorrect resolution" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Rude/Unprofessional Behaviour" Value="3"></asp:ListItem>
                        <asp:ListItem Text="NPS/RPL" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Wrong Email address" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Defect Closure" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Survey Solicitation" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Call Disconnect" Value="8"></asp:ListItem>
                        <asp:ListItem Text="PCI" Value="9"></asp:ListItem>
                        <asp:ListItem Text="ACL" Value="10"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="11"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator17" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddNonComp" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th>
                    Non-Compliance<br />
                    Detail
                </th>
                <td>
                    <asp:TextBox ID="tbNonComp" TextMode="MultiLine" CssClass="form-control" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" placeholder="If not applicable, type'NA'" runat="server" Height="60px" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="tbNonComp" SetFocusOnError="true"></asp:RequiredFieldValidator>
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

            <%--<tr style="text-align:left">
                <th>
                    
                </th>
                <td>
                    <asp:Button runat="server" id="UploadButton" text="Upload" OnClick="UploadButton_Click" Height="30px" Width="80px" />
                    <asp:Label runat="server" ID="StatusLabel" Text="Upload status" Height="30px" Width="215px"/>
                </td>
            </tr>--%>

        </table>
    </div>
    <br />
    <br />

        <div class="col-sm-12" style="max-width:90%;text-align:center;margin-top:20px;float:left;font-size:medium;">
        <table id="table2" border="1">
            <thead>
                <tr style="text-align:center;background-color:cornflowerblue;color:white">
                    <th colspan="2">Criteria</th>
                    
                    <th scope="col">Checklist</th>

                    <th scope="col">Scoring</th>

                    <th scope="col">Comments</th>
                </tr>
            </thead>

            <tbody>

                <tr style="text-align:center;background-color:darkgray;color:white">
                    <th>A</th>
                    <th colspan="3" style="text-align:center">Customer Affecting critical </th>
                </tr>

                <tr>
                    <td>A1</td>
                    <th>Initial Contact</th>
                    <td>Proper Introduction and answered the call in the first 5 secs | CM properly introduced themselves | Handshake email sent | CM made initial engagement within 4 hours of complaint assignment</td>
                    <td><asp:DropDownList ID="A01" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="3"></asp:ListItem>
                        <asp:ListItem Text="No" Value="6"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox7" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A2</td>
                    <th>Empathy</th>
                    <td>Built rapport with the CU, treat interaction as unique situation | Shows empathy and acknowledges the customers situation. Transmit sincerity. Use positive phrases to deescalate; let customers vent. </td>
                    <td><asp:DropDownList ID="A02" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="4"></asp:ListItem>
                        <asp:ListItem Text="No" Value="8"></asp:ListItem></asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox8" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A3</td>
                    <th>Positive Position</th>
                    <td>Positive position HP as a company, HP products and other departments/agents | Positive position solution being offered</td>
                    <td><asp:DropDownList ID="A03" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="3"></asp:ListItem>
                        <asp:ListItem Text="No" Value="6"></asp:ListItem></asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox9" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A4</td>
                    <th>Professionalism</th>
                    <td>Any noticeable lack of contact center professionalism directly impacting customer and issue resolution | Keep professional attitude on regards other department and agents | CM did not use internal jargon unknown by the CU or provide Customer with internal processes | Commanding or argumentative language/ attitude such as sarcasm, being negative or condescending towards the CU | Do not engage in heated fights | Lack of Courtesy, Overt Rudeness</td>
                    <td><asp:DropDownList ID="A04" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="4"></asp:ListItem>
                        <asp:ListItem Text="No" Value="8"></asp:ListItem></asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox10" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A5</td>
                    <th>Ownership</th>
                    <td>Lack of interest to solve issue | Case Manager takes possession of the end to end case | Summarize the events of the conversation | Providing the customer with next necessary actions/steps</td>
                    <td><asp:DropDownList ID="A05" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="4"></asp:ListItem>
                        <asp:ListItem Text="No" Value="8"></asp:ListItem></asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox11" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A6</td>
                    <th>Proper Communication skills</th>
                    <td>Proper call and/or email processes(Hold, Dead air, mute) | Active Listening | CM used correct approach and call flow based on escalation type | Effective Case/ Call handling | Proper language and grammar in CU communication either phone or email (etiquette/professionalism). CM personalized email templates with complaint information where required</td>
                    <td><asp:DropDownList ID="A06" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="4"></asp:ListItem>
                        <asp:ListItem Text="No" Value="8"></asp:ListItem></asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox12" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A7</td>
                    <th>Resolution TAT</th>
                    <td>Followed TAT stablished by business for complaint resolution. No unnecessary delays to offer solution or execute agreements</td>
                    <td><asp:DropDownList ID="A07" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="4"></asp:ListItem>
                        <asp:ListItem Text="No" Value="8"></asp:ListItem></asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox13" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A8</td>
                    <th>Keeping CU informed</th>
                    <td>CM must ensure CU is aware of complaint status at all times. Set expectations during every interaction, set next follow up time based on Customer's need and urgency and get agreement from CU for next follow up date and time. If Follow up is not being set via phone, CM must notify CU of future callbacks & upcoming emails via email and/or voicemail to set proper expectations. All scheduled/promised follow up must be completed  and documented accordingly in the CB scheduler. |  Includes but not limited to CM providing their contact information (Verbally/email).</td>
                    <td><asp:DropDownList ID="A08" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="10"></asp:ListItem></asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox14" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A9</td>
                    <th>Issue Resolution</th>
                    <td>Reasonable solution given based on customer needs, HP guidelines, procedures and document exceptions. CM explained disclaimers and steps of solution being provided.</td>
                    <td><asp:DropDownList ID="A09" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="4"></asp:ListItem>
                        <asp:ListItem Text="No" Value="8"></asp:ListItem></asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox15" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr style="text-align:center;background-color:darkgray;color:white">
                    <th>B</th>
                    <th colspan="3" style="text-align:center">Business Affecting Critical</th>
                </tr>

                <tr>
                    <td>B1</td>
                    <th>Executive Escalations</th>
                    <td>Best attempt to avoid Executive escalations - Follow escalation path and engage ECM if necessary. Denied to escalate to higher authority. Is CM proactively escalating at risk scenarios, potential escapes, etc…</td>
                    <td><asp:DropDownList ID="B01" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="2"></asp:ListItem>
                        <asp:ListItem Text="No" Value="4"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox16" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>B2</td>
                    <th>Ability to identify issue for resolution</th>
                    <td>Gather symptoms, perform due case research, ask tactful probing questions | Use available tools and resources and demonstrate product knowledge | Offer second opinion or send the CPL for review , if applicable.</td>
                    <td><asp:DropDownList ID="B02" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="2"></asp:ListItem>
                        <asp:ListItem Text="No" Value="4"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox17" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>B3</td>
                    <th>Proper Customer Verification </th>
                    <td>Confirm customer data, name, email, phone, address and Case/Complaint #* and performs any necessary updates in system</td>
                    <td><asp:DropDownList ID="B03" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="2"></asp:ListItem>
                        <asp:ListItem Text="No" Value="4"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox18" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>B4</td>
                    <th>Negotiation Skills</th>
                    <td>CM followed before I do this have I tried this matrix | Negotiate with the customer to accept a solution | Did the Case Manager attempt to negotiate for customer's demands?Did the CM apply creative thinking and searched for a solution based on the Customer's unique situation |  Offer the primary solution, but also a secondary solution in case primary solution is not accepted. Negotiate with the customer to convince them of accept the primary solution but, if necessary, check the case with management for a second opinion</td>
                    <td><asp:DropDownList ID="B04" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="3"></asp:ListItem>
                        <asp:ListItem Text="No" Value="6"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox19" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>B5</td>
                    <th>Closure</th>
                    <td>Confirmed with CU before complaint closure and how to manage future contacts | Asked the customer if there are any other questions or concerns | Followed correct closure process (closed any pending activities in CDAX/Newton) | Thanked the customer for their time, being a HP customer, etc</td>
                    <td><asp:DropDownList ID="B05" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="3"></asp:ListItem>
                        <asp:ListItem Text="No" Value="6"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox20" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>B6</td>
                    <th>Complaint Documentation</th>
                    <td>Enter complete ,correct complaint notes using the appropriate format | Justification documented properly including What & Why | Correct information for Order Processors/Approvers * | Include all required information for order to be processed; Attachments, approvals, etc.…* | Correctly populate required complaint fields such as Complaint Analysis, Complaint Solution and template if necessary | Detailed and chronological order of events | Any offers made to cu in detail and acceptance made by CU to the offers. *</td>
                    <td><asp:DropDownList ID="B06" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="3"></asp:ListItem>
                        <asp:ListItem Text="No" Value="6"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox21" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <%--Tracking Questions--%>

                <tr>
                    <th colspan="5" style="text-align:center;background-color:cornflowerblue;color:white">Tracking Questions</th>
                </tr>

                <tr style="text-align:center;background-color:darkorange;color:white">
                    <th>C</th>
                    <th colspan="3" style="text-align:center">Compliance Critical</th>
                </tr>

                <tr>
                    <td>C1</td>
                    <th>RPL/NPS</th>
                    <td>Only process that affects HP Global trade </td>
                    <td><asp:DropDownList ID="C01" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <td>C2</td>
                    <th>Integrity at HP</th>
                    <td>Any evidence that interaction is affected by complete lack of Professionalism and does not reflect HP Values according to the Behavior Continuum.  Survey Avoidance or manipulation. Evident misuse of customer personal, company information for personal gain (Credit Card fraud -Any security risk for customer)</td>
                    <td><asp:DropDownList ID="C02" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="" ></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr style="text-align:center;background-color:darkorange;color:white">
                    <th>D</th>
                    <th colspan="3" style="text-align:center">Problem Solution Informative</th>
                </tr>

                <tr>
                    <td>D1</td>
                    <th>Escalation Accuracy</th>
                    <td>~</td>
                    <td><asp:DropDownList ID="D01" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="" ></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr style="text-align:center;background-color:darkorange;color:white">
                    <th>E</th>
                    <th colspan="3" style="text-align:center">Issue Resolution</th>
                </tr>

                <tr>
                    <td>E1</td>
                    <th>Issue Resolved</th>
                    <td>~</td>
                    <td><asp:DropDownList ID="E01" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="" ></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>                
            </tbody>
        </table>
    </div>
        <div class="text-sm-center" style="align-items:center;width:100%;">
        <br /><br />
        <asp:Button ID="btnSubmit" CssClass="btnsub" runat="server" Text="Submit" onclick="Submit_Button"/>
        </div>
    </div>
    </form>

        <script type="text/javascript">
        var Totalvalue = 0; Target = 100;

        //function DropDownFilter(current_id) {
        //    var e = current_id.id;
        //    var get = document.getElementById(e);
        //    var getvalue = get.options[get.selectedIndex].value;
        //    Totalvalue = parseFloat(Totalvalue) + parseFloat(getvalue);
        //    document.getElementById("TotalCompl").innerHTML = Target - Totalvalue + "%";
        //}

        function DropDownFilter() {

            var Total = 100;
            var SelectedValue = 0;
            var BC = 0,CC=0;
            var Result = 0;
            var BusCrit = 0, CustCrit = 0;
            //for (var i = 0; i < document.getElementById('table2').getElementsByTagName('select').length; i++) {
            for (var i = 0; i < 15; i++) {

                if (i <=8) {
                    CC += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    SelectedValue += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    continue;
                    alert("Here");
                }
                else {
                    BC += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    SelectedValue += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    continue;
                    alert("Here2");
                }
            }
            Result = Number(Total) - SelectedValue;
            BusCrit = 30 - BC;
            CustCrit = 70 - CC;

            //alert(Result)

            document.getElementById("TotalCompl").textContent = Result + "%";
            document.getElementById("Compliance").value = Result;

            document.getElementById("CustCrit").textContent = CustCrit + "%";
            document.getElementById("hfv_CustCrit").value = CustCrit;

            document.getElementById("BusCrit").textContent = BusCrit + "%";
            document.getElementById("hfv_BusCrit").value = BusCrit;

            if (Result < 70) {
                document.getElementById("tbProfLvl").value = "Novice"; }
            else if (Result >= 70 && Result < 79) { document.getElementById("tbProfLvl").value = "Emerging"; }
            else if (Result >= 79 && Result < 89) { document.getElementById("tbProfLvl").value = "Effective"; }
            else if (Result >= 89 && Result < 99) { document.getElementById("tbProfLvl").value = "Advanced"; }
            else { document.getElementById("tbProfLvl").value = "Expert"; }
            document.getElementById('<%= hfv_ProfLevel.ClientID%>').value = document.getElementById("tbProfLvl").value;
        }
   
    </script>
    
</body>
</html>