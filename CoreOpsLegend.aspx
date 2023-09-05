<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CoreOpsLegend.aspx.cs" Inherits="Audit_Legends.CoreOpsLegend" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>Mobility Legend</title>
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
        <h1><img src="Images/HP logoblu.png" style="width:98px;overflow:auto;float:initial;"/> Mobility Legend</h1>
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
                        <asp:ListItem Text="Chromebook" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Sprocket" Value="5"></asp:ListItem>
                        <asp:ListItem Text="RCD" Value="6"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddBU" SetFocusOnError="true"></asp:RequiredFieldValidator>
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
                        <asp:ListItem Text="Offsite Solution" Value="5"></asp:ListItem>
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
                        <asp:ListItem Text="Commercial Chromebook" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Consumer Chromebook" Value="1"></asp:ListItem>
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

            <%--<tr>
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
            </tr>--%>
                
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
                    <th colspan="2">Parameter</th>
                    
                    <th scope="col">Checklist</th>

                    <th scope="col">Scoring</th>

                    <th scope="col">Comments</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <th rowspan="2" scope="rowgroup">Ease of Effort</th>
                    <td>Effortless Experience</td>
                    <td>Gathered information effortlessly (Customer/unit info/Case History)<br />
                        Address all customer’s issues/collecting irrelevant customer’s information/sharing all relevant information
                    </td>
                    <td><asp:DropDownList ID="C01" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="10"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox7" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Effective CRM utilization	</td>
                    <td>Raised request accordingly (ARM/POP/SWOP/Escalate/Follow-up/Create a Call-back event), Accurate selection of Symptom codes, Attach WISE docs used</td>
                    <td><asp:DropDownList ID="C02" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="" ></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="2.5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox5" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th rowspan="2" scope="rowgroup">Speed of Resolution</th>
                    <td>FCR</td>
                    <td>Perform all relevant steps pertaining to issue resolution
                            - If the issue cannot be fixed on that call and requires multiple interactions – NA<br />
                            - If any step that could lead to issue resolution is missed – NO<br />
                            - If all possible actions/Troubleshooting Steps are taken and issue is resolved – YES
                    </td>
                    <td><asp:DropDownList ID="C03" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value=""></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox8" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Demonstrate a sense of Urgency</td>
                    <td>Procrastination or Inordinate Delay</td>
                    <td><asp:DropDownList ID="C04" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="10"></asp:ListItem></asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox9" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th rowspan="2" scope="rowgroup">Tech Ability</th>
                    <td>Effective probing</td>
                    <td>Asked the logical questions & did the Engineer check previous case history (If Any)</td>
                    <td><asp:DropDownList ID="C05" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="10"></asp:ListItem>
                        <asp:ListItem Text="NA" Value=""></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox10" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Logical approach and trouble shooting steps</td>
                    <td>Engineer was aware of the Product and Utilized HP Support options effectively (LMI/Support Website/YouTube)</td>
                    <td><asp:DropDownList ID="C06" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="7.5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="15"></asp:ListItem>
                        <asp:ListItem Text="NA" Value=""></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox11" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th rowspan="2" scope="rowgroup">Communication</th>
                    <td>Customer Handling skills</td>
                    <td>Active Listening/Attentiveness/Keep customers informed-Educate actions taken (Order Placing/Service TAT/Part Backlogs/ Shipping Process/Delays)/ Offering call-back when required (Ownership)/Assurance/ Acknowledgement/ Positive Positioning Tone (Impacts customer experience)/Willingness to assist/Denied escalation/Sarcastic/Inappropriate responses Pronunciation/Spelling-Punctuation, Grammar, Choice of words, Sentence Construction, Upper Case letter used (3 Error Threshold or Customer Impact)</td>
                    <td><asp:DropDownList ID="C07" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="10"></asp:ListItem></asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox12" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Positive Language</td>
                    <td>Using positive words and positive attitude in language</td>
                    <td><asp:DropDownList ID="C08" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="10"></asp:ListItem></asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox13" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th rowspan="2" scope="rowgroup">Professionalism</th>
                    <td>Dereliction of Duty</td>
                    <td>Adherence of Hold & Mute Policy/Call-back schedule adherence/Use of native language/Speaking without placing customer on hold or mute</td>
                    <td><asp:DropDownList ID="C09" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="2.5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem></asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox14" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Compliance</td>
                    <td>100% documentation on call/chat/email customer interaction (if Outlook is used) , Capturing relevant information to create case (Email Address/Shipping Address/Contact Number/Unit Details), Adhering to Resolution /Closure Code guideline, Sarcastic behaviour, Abusive/Confrontational language, Rude/Vulgar/Sexual Comments, Slandering HP brand/Products/Speaking negative of competitors/Co-workers, Survey solicitation, Disclaimers during LMI</td>
                    <td><asp:DropDownList ID="C10" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial 5%" Value="15"></asp:ListItem>
                        <asp:ListItem Text="Partial 10%" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Partial 15%" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="20"></asp:ListItem></asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox15" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th colspan="5" style="text-align:center;background-color:cornflowerblue;color:white">Tracking Questions</th>
                </tr>

                <%--Tracking Questions--%>

                <tr>
                    <th rowspan="8" scope="rowgroup">Tracking Questions</th>
                    <th>Did the Engineer provide a Waiver after consulting a Supervisor?</th>
                    <td></td>
                    <td><asp:DropDownList ID="C11" runat="server" Height="25px" Width="150px" >
                        <asp:ListItem Enabled="true" text="NA" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <th>Did the Engineer follow the Case Documentation Template?</th>
                    <td></td>
                    <td><asp:DropDownList ID="C12" runat="server" Height="25px" Width="150px" >
                        <asp:ListItem Enabled="true" text="NA" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <th>PCI - Compliance</th>
                    <td>The Engineer adhered to PCI guidelines (Pause and Play Recording)</td>
                    <td><asp:DropDownList ID="C13" runat="server" Height="25px" Width="150px" >
                        <asp:ListItem Enabled="true" text="NA" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <th>Was there an opportunity for Pitch for Sales?</th>
                    <td></td>
                    <td><asp:DropDownList ID="C14" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" text="NA" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <th>Was Sales pitch effective?</th>
                    <td></td>
                    <td><asp:DropDownList ID="C15" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" text="NA" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <th>Was a Sales Offer created in CDAX?</th>
                    <td></td>
                        <td><asp:DropDownList ID="C16" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" Text="NA" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                
                <tr>
                    <th>Did the engineer request customer for picture (Picture of serial number of the part) to identify there is no fraudulent activity?</th>
                    <td></td>
                        <td><asp:DropDownList ID="C17" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" Text="NA" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr> 

                <tr>
                    <th>Remote session - Did the engineer use any 3rd party software to take remote access?</th>
                    <td></td>
                        <td><asp:DropDownList ID="C18" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" Text="NA" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
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
            for (var i = 0; i < 10; i++) {

                if ((i == 1) || (i == 9)) {
                    BC += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    SelectedValue += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    continue;
                    alert("Here");
                }
                else {
                    CC += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    SelectedValue += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    continue;
                    alert("Here2");
                }
            }
            Result = Number(Total) - SelectedValue;
            BusCrit = 25 - BC;
            CustCrit = 75 - CC;

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

