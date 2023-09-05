<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditSheetQA_TOC.aspx.cs" Inherits="Audit_Legends.AuditSheetQA_TOC" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>TOC Legend</title>
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
        <h1><img src="Images/HP logoblu.png" style="width:98px;overflow:auto;float:initial;"/> TOC Legend </h1>
    </div>

    <div style="text-align:right;height:80px;">
        <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
        <asp:Button ID="MenuFeedback" CausesValidation="false" runat="server" Text="Feedback Form" OnClick="MenuFeedback_Click" CssClass="MenuButtons"/>
        <asp:Button ID="SoMe_GuideLines" CausesValidation="false" runat="server" Text="View Guidelines" target="_blank" CssClass="MenuButtons" OnClientClick="SetTarget();return false;" />
        <script type="text/javascript">
        function SetTarget() {
            window.open("TOC_LegendGL.aspx");        }
    </script>
        <asp:Button ID="QADashboard" CssClass="MenuButtons" CausesValidation="false" runat="server" Text="QA Dashboard" OnClick="QADashboard_Click" />
        <asp:Button ID="btnLogout" CssClass="MenuButtons" CausesValidation="false" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    </div>

    <div class="row " style="margin-left:20px;margin-top:20px;">
        <div class="col-sm-12">
            <asp:HiddenField ID="hfv_empmail" runat="server" />
            <asp:HiddenField ID="hfv_ProfLevel" runat="server" />
        <table id="table1" style="float: left">

            <tr>
                <%--<th>
                    TL Mail
                </th>--%>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox13" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <%--<th>
                    Reporting Manager Mail
                </th>--%>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox14" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                </td>
            </tr>

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

                </td>
            </tr>

            <tr>
                <th class="auto-style9">
                    Business Unit 
                </th>
                <td>
                    <asp:DropDownList ID="ddBU" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddBU_SelectedIndexChanged">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="PC" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Print" Value="1"></asp:ListItem>
                    </asp:DropDownList>
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
                </td>
            </tr>

            <tr>
                <th class="auto-style9">
                    Problem Description 
                </th>
                <td>
                    <asp:DropDownList ID="ddProbDes" CssClass="form-control input-xs" runat="server">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <th>
                    Delivery Type 
                </th>
                <td>
                    <asp:DropDownList ID="ddDeliType" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="TOC" Value="0"></asp:ListItem>
                        <asp:ListItem Text="DVT" Value="0"></asp:ListItem>
                    </asp:DropDownList>
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
                    Team Lead Name
                </th>
                <td>
                    <asp:TextBox ID="TextBox15" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Reporting Manager Name
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
                        <asp:ListItem Text="PS TOC" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Print TOC" Value="1"></asp:ListItem>
                        <asp:ListItem Text="DVT" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <th>
                    CC Email
                </th>
                <td>
                    <asp:TextBox ID="TextBox4" TextMode="MultiLine" CssClass="form-control" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" placeholder="* For more than one email, seperate it with ';'" runat="server" Height="80px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Call Date 
                </th>
                <td>
                    <asp:TextBox ID="tbId4" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
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
                </td>
            </tr>

            <tr>
                <th style="height:50px;text-align:left;font-size:larger;"> 
                    Total Score : 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:Label id="TotalCompl" runat="server"></asp:Label>
                    <asp:HiddenField ID="Compliance" runat="server" />
                </th>
                <th style="height:50px;text-align:left;font-size:larger;">
                    
                </th>
            </tr>

            <tr>
                <th style="height:50px;text-align:left;font-size:larger;"> 
                    
                    <asp:HiddenField ID="hfv_CustCrit" runat="server" />
                </th>
                <th style="height:50px;text-align:left;font-size:larger;">
                    
                </th>
            </tr>

            <tr>
                <th style="height:50px;text-align:left;font-size:larger;"> 
                    
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
                    <asp:TextBox ID="tbId6" CssClass="form-control" AutoCompleteType="Disabled" AutoPostBack="true" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
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

            <%--<tr>
                <th>
                    Call Id/SR Id 
                </th>
                <td>
                    <asp:TextBox ID="tbId7" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="tbId7" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>--%>

            <%--<tr>
                <th>
                    Call Duration
                </th>
                <td>
                    <asp:TextBox ID="tbId8" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="tbId8" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>--%>

            <tr>
                <th>
                    Case Type 
                </th>
                <td>
                    <asp:DropDownList ID="ddCaseType" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Case Log / Update" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Remote" Value="1"></asp:ListItem>
                        <asp:ListItem Text="CSR" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Onsite" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Bench / Offsite / WUR" Value="4"></asp:ListItem>
                        <asp:ListItem Text="NCLF" Value="5"></asp:ListItem>
                        <asp:ListItem Text="QC" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Trade Quote" Value="7"></asp:ListItem>
                        <asp:ListItem Text="DOA" Value="8"></asp:ListItem>
                        <asp:ListItem Text="QCP" Value="9"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <th>
                    Product Line
                </th>
                <td>
                    <asp:DropDownList ID="ddProdLin" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="RPOS" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Workstation" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Thin Clients" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Lasterjet" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Officejet" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Pagewide" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Designjet" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Notebook" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Desktop" Value="8"></asp:ListItem>
                        <asp:ListItem Text="Replicator" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Thunderbolt" Value="10"></asp:ListItem>
                        <asp:ListItem Text="AIO" Value="11"></asp:ListItem>
                        <asp:ListItem Text="Monitor" Value="12"></asp:ListItem>
                        <asp:ListItem Text="Accessories" Value="13"></asp:ListItem>
                    </asp:DropDownList>
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

            <%--<tr>
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
            </tr>--%>

            <tr>
                <th>
                    Non-Compliance
                </th>
                <td>
                    <asp:DropDownList ID="ddNonComp" runat="server" Height="25px" Width="300px"  onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value="0"></asp:ListItem>
                        <asp:ListItem Text="NCLF/Incomplete/Documentation" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Ownership" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Incomplete/Incorrect resolution" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Rude/Unprofessional Behaviour" Value="4"></asp:ListItem>
                        <asp:ListItem Text="NPS/RPL" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Wrong Email address" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Defect Closure" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Survey Solicitation" Value="8"></asp:ListItem>
                        <asp:ListItem Text="Call Disconnect" Value="9"></asp:ListItem>
                        <asp:ListItem Text="PCI" Value="10"></asp:ListItem>
                        <asp:ListItem Text="ACL" Value="11"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="12"></asp:ListItem>
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
        

        <div class="col-sm-12" style="max-width:95%;text-align:center;margin-top:20px;float:left;font-size:medium;">
        <table id="table2" border="1">
            <thead>
                <tr style="text-align:center;background-color:cornflowerblue;color:white">
                    
                    <th scope="col">Parameter</th>

                    <th scope="col">Scoring</th>

                    <th scope="col">Comments</th>
                </tr>
            </thead>

        <tbody>
                <tr>
                    <td>TAT 30 minutes / CCTAT (Met / Not Met)
                    </td>
                    <td><asp:DropDownList ID="C01" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Not Met" Value="15"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="Cm01" TextMode="MultiLine" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>UEFI Adherence (Updated / Not Updated)</td>
                    <td><asp:DropDownList ID="C02" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Updated" Value="" ></asp:ListItem>
                        <asp:ListItem Text="Not Updated" Value="10"></asp:ListItem>
                        <asp:ListItem Text="NA" Value=""></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="Cm02" TextMode="MultiLine" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Logical TS / Diagnosis Accuracy
                    </td>
                    <td><asp:DropDownList ID="C03" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Complete" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="8"></asp:ListItem>
                        <asp:ListItem Text="Not Met" Value="15"></asp:ListItem>
                        <asp:ListItem Text="NA" Value=""></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="Cm03" TextMode="MultiLine" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Case Approved / Rejected / Modify</td>
                    <td><asp:DropDownList ID="C04" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Valid" Value=""></asp:ListItem>
                        <asp:ListItem Text="Invalid" Value="15"></asp:ListItem>                       
                        <asp:ListItem Text="NA" Value=""></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="Cm04" TextMode="MultiLine" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Parts Accuracy (Yes / No)</td>
                    <td><asp:DropDownList ID="C05" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="15"></asp:ListItem>                       
                        <asp:ListItem Text="NA" Value=""></asp:ListItem></asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="Cm05" TextMode="MultiLine" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>WISE usage/entitlement (Met / Not Met)</td>
                    <td><asp:DropDownList ID="C06" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Not Met" Value="15"></asp:ListItem>                       
                        <asp:ListItem Text="NA" Value=""></asp:ListItem></asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="Cm06" TextMode="MultiLine" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>PRE Tool (Met / Not Met) - RS</td>
                    <td><asp:DropDownList ID="C07" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Not Met" Value="15"></asp:ListItem>                       
                        <asp:ListItem Text="NA" Value=""></asp:ListItem></asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="Cm07" TextMode="MultiLine" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <%--<tr>
                    <th colspan="5" style="text-align:center;background-color:cornflowerblue;color:white">Tracking Questions</th>
                </tr>--%>

                <%--Tracking Questions--%>

                <%--<tr>
                    <th>QA Rating **** </th>
                    <td><asp:DropDownList ID="C09" runat="server" Height="25px" Width="150px" >
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Delight" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Expected" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Basic" Value="2"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <th>Compliance ? </th>
                    <td><asp:DropDownList ID="C10" runat="server" Height="25px" Width="150px" >
                        <asp:ListItem Enabled="true" text="NA" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="High" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Very High" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Critical" Value="2"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <th>FCR</th>
                    <td><asp:DropDownList ID="C11" runat="server" Height="25px" Width="150px" >
                        <asp:ListItem Enabled="true" text="NA" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                
                <tr>
                    <th>Did the engineer request customer for picture (Picture of serial number of the part) to identify there is no fraudulent activity?</th>
                        <td><asp:DropDownList ID="C12" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" Text="NA" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr> 

                <tr>
                    <th>Remote session - Did the engineer use any 3rd party software to take remote access?</th>
                        <td><asp:DropDownList ID="C13" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" Text="NA" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>--%>
            </tbody>
        </table>
                    </div>
                        <div class="auto-style8" style="align-items:center;">
                        <br /><br />
                        <asp:Button ID="btnUpdate" CssClass="btnsub" runat="server" Text="Update and close" OnClick="btnUpdate_Click"/> &nbsp; &nbsp;
                        <asp:Button ID="btnExit" CssClass="btnsub" runat="server" Text="Back / Close" OnClick="btnExit_Click"/>&nbsp; &nbsp;
                        <asp:Button ID="btnSendMail" CssClass="btnsub" runat="server" Text="Resend Mail" OnClick="btnSendMail_Click"/>
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
            for (var i = 0; i < 7; i++) {

                if ((i == 1) || (i == 3) || (i == 5)) {
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
            BusCrit = 40 - BC;
            CustCrit = 60 - CC;

            //alert(Result)

            if (((document.getElementById("ddNonComp").value) == "0") || ((document.getElementById("ddNonComp").value) == "12")) {
                document.getElementById("TotalCompl").textContent = Result + "%";
                document.getElementById("Compliance").value = Result;
                
                document.getElementById("hfv_CustCrit").value = CustCrit;
                
                document.getElementById("hfv_BusCrit").value = BusCrit;
            }
            else {
                document.getElementById("TotalCompl").textContent = 0 + "%";
                document.getElementById("Compliance").value = 0;
                
                document.getElementById("hfv_CustCrit").value = 0;
                
                document.getElementById("hfv_BusCrit").value = 0;
            }

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

