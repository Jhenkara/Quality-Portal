<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LegendHW.aspx.cs" Inherits="Audit_Legends.LegendHW" %>

<!DOCTYPE html>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>Premium Hardware Legend</title>
    <link rel="shortcut icon" href="Images/HP logoblu.png"  />

        <!--Bootstrap CSS CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
        <link href="LegendHW.css" rel="stylesheet" type="text/css" />
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
        <h1><img src="Images/HP logoblu.png" style="width:98px;overflow:auto;float:initial;"/> Premium Hardware Legend </h1>
    </div>

    <div style="text-align:right;height:80px;">
        <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
        <asp:Button ID="QADashboard" CausesValidation="false" runat="server" Text="QA Dashboard" OnClick="QADashboard_Click"/>
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
                <th>
                    Product Line
                </th>
                <td>
                    <asp:DropDownList ID="ddProdLin" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Spectre" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Omen" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddProdLin" SetFocusOnError="true"></asp:RequiredFieldValidator>
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
                    <asp:TextBox ID="TextBox5" CssClass="form-control" AutoCompleteType="Disabled" AutoPostBack="true" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="TextBox5" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

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
                        <asp:ListItem Text="Bench" Value="0"></asp:ListItem>
                        <asp:ListItem Text="RCD" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Part Order" Value="2"></asp:ListItem>
                        <asp:ListItem Text="In-Home" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Exchange" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddCaseType" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th>
                    Phone Number
                </th>
                <td>
                    <asp:TextBox ID="tbId9" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="tbId8" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th>
                    Service Created
                </th>
                <td>
                    <asp:DropDownList ID="ddServCre" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator20" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddProdLin" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th>
                    Problem Description 
                </th>
                <td>
                    <asp:TextBox ID="tbId10" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="tbId9" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            

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
                        <asp:ListItem Text="Assigning the Case Back to the Queue" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Case not Assigned to Right Owner" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Delayed Response" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Denied Support / Escalation" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Fabrication Documentation" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Incorrect Documentation" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No Documentation" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Incorrect Closure" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Incorrect Email" Value="8"></asp:ListItem>
                        <asp:ListItem Text="Incorrect Part Shipped" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Incorrect Solution" Value="10"></asp:ListItem>
                        <asp:ListItem Text="No Case Log Found (NCLF)" Value="11"></asp:ListItem>
                        <asp:ListItem Text="No Quick Log Found" Value="12"></asp:ListItem>
                        <asp:ListItem Text="NPS Miss" Value="13"></asp:ListItem>
                        <asp:ListItem Text="Ownership" Value="14"></asp:ListItem>
                        <asp:ListItem Text="PCI" Value="15"></asp:ListItem>
                        <asp:ListItem Text="Post Sending Survey" Value="16"></asp:ListItem>
                        <asp:ListItem Text="Process Deviation" Value="17"></asp:ListItem>
                        <asp:ListItem Text="RPL Miss" Value="18"></asp:ListItem>
                        <asp:ListItem Text="Rude/Unprofessional/Vulgar/Sexual Comments" Value="19"></asp:ListItem>
                        <asp:ListItem Text="Survey Avoidance" Value="20"></asp:ListItem>
                        <asp:ListItem Text="Survey Solicitation" Value="21"></asp:ListItem>
                        <asp:ListItem Text="Updated incorrect Shipping Address in GN" Value="22"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="23"></asp:ListItem>
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

        </table>
    </div>
    <br />
    <br />


        <div class="col-sm-12" style="max-width:100%;text-align:center;margin-top:20px;float:left;font-size:medium;">
        <table id="table2" border="1">
            <thead>
                <tr style="text-align:center;background-color:cornflowerblue;color:white">
                    <th colspan="2">Parameters</th>

                    <th scope="col">Sub-Parameters</th>
                    
                    <th scope="col">Description</th>

                    <th scope="col">Scoring</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <th>A1</th>
                    <th rowspan="2" scope="rowgroup"> Process Policy Knowledge </th>
                    <td>Customer Related</td>
                    <td>KCI / Address Confirmation / Service disclaimer (Customer FYI)</td>
                    <td><asp:DropDownList ID="A01" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="10"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <th>A2</th>
                    <td>Business Critical</td>
                    <td>Service Disclaimers/ Accurate product and customer information  / Global Newton (Service type/Damage diagnostics/Notes)</td>
                    <td><asp:DropDownList ID="A02" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="10"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <th>B1</th>
                    <th rowspan="2" scope="rowgroup">Technical Knowledge</th>
                    <td>Effective Probing</td>
                    <td>Asked relavent questions to isolate the issue</td>
                    <td><asp:DropDownList ID="B01" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="" ></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="10"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <th>B2</th>
                    <td>Logical Approach and Troubleshooting</td>
                    <td>MCSL & Performed accurate troulbeshooting steps utilizing all HP resources (Wise, SNR, Part surfer etc)</td>
                    <td><asp:DropDownList ID="B02" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="10"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <th>C1</th>
                    <th>Ownership</th>
                    <td>Sense of Urgency</td>
                    <td>Demonstrate an urgency through call handling /Scheduling callback/Follow up to provide timely solution; Followed Hold process & utilized time efficiently</td>
                    <td><asp:DropDownList ID="C01" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="10"></asp:ListItem></asp:DropDownList></td>
                </tr>

                <tr>
                    <th>D1</th>
                    <th>Ease of Effort</th>
                    <td>Effortless Experience</td>
                    <td>Timely Escalation/ Effortless experience (Capture minimal information/Avoiding repetation of customer information)</td>
                    <td><asp:DropDownList ID="D01" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="10"></asp:ListItem></asp:DropDownList></td>
                </tr>

                <tr>
                    <th>E1</th>
                    <th rowspan="2" scope="rowgroup">Communication</th>
                    <td>Customer Handling skill</td>
                    <td>Professional approach; Issue Acknowledgment (Addressing  all concerns reported)</td>
                    <td><asp:DropDownList ID="E01" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="10"></asp:ListItem></asp:DropDownList></td>
                </tr>

                <tr>
                    <th>E2</th>
                    <td>Language</td>
                    <td>Imbibed Active listening, Paraphrase, Summarize & Assurance</td>
                    <td><asp:DropDownList ID="E02" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="10"></asp:ListItem></asp:DropDownList></td>
                </tr>

                <tr>
                    <th>F1</th>
                    <th rowspan="3" scope="rowgroup">Persona</th>
                    <td>Identified the right Persona</td>
                    <td>Analyse the conversation to recognize the traits of the customer</td>
                    <td><asp:DropDownList ID="F01" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="10"></asp:ListItem></asp:DropDownList></td>
                </tr>

                <tr>
                    <th>F2</th>
                    <td>Applied the right stroke</td>
                    <td>Interact with the customer in accordance with the traits showcased by the customer</td>
                    <td><asp:DropDownList ID="F02" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="10"></asp:ListItem></asp:DropDownList></td>
                </tr>

                <tr>
                    <th colspan="5" style="text-align:center;background-color:cornflowerblue;color:white">Tracking Questions</th>
                </tr>

                <%--Tracking Questions--%>

                <tr>
                    <th rowspan="7" scope="rowgroup"></th>
                    <th rowspan="7" scope="rowgroup">Tracking Questions</th>
                    <th>Stroke Application</th>
                    <td>Right Stroke Economy - Missed Opportunities</td>
                    <td><asp:TextBox ID="TextBox7" TextMode="MultiLine" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="40px" Width="240px"></asp:TextBox></td>
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
            for (var i = 0; i < 10; i++)
            {

                if ((i == 1))
                {
                    BC += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    SelectedValue += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    continue;
                    alert("Here");
                }
                else
                {
                    CC += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    SelectedValue += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    continue;
                    alert("Here2");
                }
            }
            Result = Number(Total) - SelectedValue;
            BusCrit = 10 - BC;
            CustCrit = 90 - CC;

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
