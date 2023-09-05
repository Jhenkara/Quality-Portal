<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="21_CommercialLegend.aspx.cs" Inherits="Audit_Legends._21_CommercialLegend" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>FY21 Quality Legend</title>
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
        <h1><img src="Images/HP logoblu.png" style="width:98px;overflow:auto;float:initial;"/> FY21 Quality Legend </h1>
    </div>

    <div style="text-align:right;height:80px;">
        <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
        <asp:Button ID="MenuFeedback" CausesValidation="false" runat="server" Text="Feedback Form" OnClick="MenuFeedback_Click" />
        <asp:Button ID="QADashboard" CausesValidation="false" runat="server" Text="QA Dashboard" OnClick="QADashboard_Click" />
        <asp:Button ID="Download" CausesValidation="false" runat="server" Text="Download" OnClick="FileDownload" />
        <asp:Button ID="btnLogout" CausesValidation="false" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    </div>

    <div class="row " style="margin-left:20px;margin-top:20px;">
        <div class="col-sm-12">
            <asp:HiddenField ID="hfv_empmail" runat="server" />
            <asp:HiddenField ID="hfv_AuditRes" runat="server" />
        <table id="table1" style="float: left">
            <tr>
                <%--<th>
                    QA Name 
                </th>--%>
                <td>
                    <asp:TextBox ID="tbId1" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <%--<th>
                    QA Mail 
                </th>--%>
                <td>
                    <asp:TextBox ID="tbId1a" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <%--<tr>
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
            </tr>--%>

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
                    Business Unit 
                </th>
                <td>
                    <asp:DropDownList ID="ddBU" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="PC" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Print" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddBU" SetFocusOnError="true"></asp:RequiredFieldValidator>
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
                <%--<th>
                    Employee Mail
                </th>--%>
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
                    <asp:TextBox ID="tbTeamName" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
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

            

        </table>

        <table id="table3" style="float:left;margin-left:80px;margin-right:30px; position:center">
            <tr>
                <th style="width:300px;text-align:center">
                    Previous Scores :
                </th> 
            </tr>

            <tr>
                <td>
                    <asp:PlaceHolder ID="phPrevSco" runat="server"></asp:PlaceHolder>
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

        <table id="table4" style="float:left;margin-left:90px;position:center">

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

            <tr>
                <th>
                    Case Id 
                </th>
                <td>
                    <asp:TextBox ID="tbId6" CssClass="form-control" AutoCompleteType="Disabled" placeholder="In scenarios of No Case Log, type ‘NA’" AutoPostBack="true" BorderStyle="Inset" runat="server" Height="25px" Width="300px" OnTextChanged="btnCaseIdCheck_Click"></asp:TextBox>
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
                    <asp:TextBox ID="tbId7" CssClass="form-control" AutoCompleteType="Disabled" AutoPostBack="true" BorderStyle="Inset" runat="server" Height="25px" Width="300px" OnTextChanged="btnCallIDChk"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="tbId7" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblCallIdChk" Visible="false" runat="server"></asp:Label>
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
                        <asp:ListItem Text="Service / Bench" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Onsite" Value="2"></asp:ListItem>
                        <asp:ListItem Text="CSR" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Quick Call" Value="4"></asp:ListItem>
                        <asp:ListItem Text="No QC - Case" Value="4"></asp:ListItem>

                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddCaseType" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th>
                    Problem Description 
                </th>
                <td>
                    <asp:DropDownList ID="ddProbDes" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="---------------< PC >---------------" Value=""></asp:ListItem>
                        <asp:ListItem Text="Adapter" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Battery" Value="1"></asp:ListItem>
                        <asp:ListItem Text="BIOS" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Bundled Applications" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Display" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Dock Issues" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Driver Issue" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Hardware Related" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Info Call" Value="8"></asp:ListItem>
                        <asp:ListItem Text="Internet Connectivity" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Keyboard" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Mouse" Value="11"></asp:ListItem>
                        <asp:ListItem Text="No Boot" Value="12"></asp:ListItem>
                        <asp:ListItem Text="No Post" Value="13"></asp:ListItem>
                        <asp:ListItem Text="No Power" Value="14"></asp:ListItem>
                        <asp:ListItem Text="Operating System" Value="15"></asp:ListItem>
                        <asp:ListItem Text="Overheating Issues" Value="16"></asp:ListItem>
                        <asp:ListItem Text="Performance" Value="17"></asp:ListItem>
                        <asp:ListItem Text="Product Specifications" Value="18"></asp:ListItem>
                        <asp:ListItem Text="RAM" Value="19"></asp:ListItem>
                        <asp:ListItem Text="RCD" Value="20"></asp:ListItem>
                        <asp:ListItem Text="Sound Issue" Value="21"></asp:ListItem>
                        <asp:ListItem Text="Status Call" Value="22"></asp:ListItem>
                        <asp:ListItem Text="Storage" Value="23"></asp:ListItem>
                        <asp:ListItem Text="Third Party Apps" Value="24"></asp:ListItem>
                        <asp:ListItem Text="Touch Pad" Value="25"></asp:ListItem>
                        <asp:ListItem Text="USB" Value="26"></asp:ListItem>
                        <asp:ListItem Text="Warranty Update" Value="27"></asp:ListItem>
                        <asp:ListItem Text="---------------< Print >---------------" Value=""></asp:ListItem>
                        <asp:ListItem Text="3rd Party Application" Value="28"></asp:ListItem>
                        <asp:ListItem Text="ADF Issue" Value="29"></asp:ListItem>
                        <asp:ListItem Text="CPMD" Value="30"></asp:ListItem>
                        <asp:ListItem Text="Display/Touch screen Issue" Value="31"></asp:ListItem>
                        <asp:ListItem Text="Duplexer" Value="32"></asp:ListItem>
                        <asp:ListItem Text="Fax" Value="33"></asp:ListItem>
                        <asp:ListItem Text="HW issue" Value="34"></asp:ListItem>
                        <asp:ListItem Text="Info Call" Value="35"></asp:ListItem>
                        <asp:ListItem Text="Installation" Value="36"></asp:ListItem>
                        <asp:ListItem Text="Jobs in queue" Value="37"></asp:ListItem>
                        <asp:ListItem Text="Noise Issue" Value="38"></asp:ListItem>
                        <asp:ListItem Text="Paper Jam" Value="39"></asp:ListItem>
                        <asp:ListItem Text="Paper Pick" Value="40"></asp:ListItem>
                        <asp:ListItem Text="Power related" Value="41"></asp:ListItem>
                        <asp:ListItem Text="Print Quality" Value="42"></asp:ListItem>
                        <asp:ListItem Text="Printing" Value="43"></asp:ListItem>
                        <asp:ListItem Text="Product Specifications" Value="44"></asp:ListItem>
                        <asp:ListItem Text="Regionalization" Value="45"></asp:ListItem>
                        <asp:ListItem Text="Scanning" Value="46"></asp:ListItem>
                        <asp:ListItem Text="Slow Printing" Value="47"></asp:ListItem>
                        <asp:ListItem Text="Status Call" Value="48"></asp:ListItem>
                        <asp:ListItem Text="TC/PH/Ink" Value="49"></asp:ListItem>
                        <asp:ListItem Text="Trade/SPOS" Value="50"></asp:ListItem>
                        <asp:ListItem Text="Tray Settings" Value="51"></asp:ListItem>
                        <asp:ListItem Text="Warranty Update" Value="52"></asp:ListItem>
                        <asp:ListItem Text="Wireless Printing" Value="53"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddProbDes" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <th>
                    Audit Result
                </th>
                <td>
                    <asp:TextBox ID="tbAuditRes" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" Enabled="false" runat="server" Height="25px" Width="300px"></asp:TextBox>
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
                <tr style="background-color:cornflowerblue;color:white">
                    <th colspan="2" style="text-align:center;">Parameter</th>
                    
                    <th scope="col" style="text-align:center;">Checklist</th>

                    <th scope="col" style="text-align:center;">Scoring</th>

                    <th scope="col" style="text-align:center;">Comments</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <th rowspan="2" scope="rowgroup">Opening</th>
                    <td>Did the Engineer comprehend the customer's issue correctly, acknowledge the issue & assured to assist?</td>
                    <td>• <b>Met - </b>Active listenening, Verbal nods, confirmed that she/he was following the customer's conversation, Paraphrased appropriately to confirm the issue, and akcnowledged, Assured that we will solve or escalate to get the issue to get solved; to gain customer confidence<br />
                        • <b>Not Met - </b>Doesn’t fulfil;<br />
                        • <b>NA - </b>Information only call <br />
                    </td>
                    <td><asp:DropDownList ID="Q01" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Not Met" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="C01" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Did the Engineer use the available data/tools/resources to enhance customer experience?</td>
                    <td>• <b>Met - </b>Engineer makes appropriate usage of tools to improve Cust experience,  make it easy to collect S/N., data not recollected. <br />
                        • <b>Tool Usage - </b>Engineer to be marked down when there is a failure in using HP Tools to improve customer experience. Eg:  - Engineer failing to use the HP Part Surfer to find the correct part num. <br />
                        • <b>LMI - </b>When Engineer fails to use the Remote Access option whenever there was a need and opportunity. Using any third party remote access tool will also lead to marking down <br />
                        • <b>Serial Number - </b>Engineer fails to verify the S/N. Engineer fails to guide the Cust on how & from where to get the S/N <br />
                        • <b>Not Met - </b>Engineer fails to verify the details if there is an existing case and recollecting information when it is available shall be marked down <br />
                        • <b>NA - </b>No Opportunity for engineer to use tools / repeat call
                    </td>
                    <td><asp:DropDownList ID="Q02" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value="" ></asp:ListItem>
                        <asp:ListItem Text="Tool Usage" Value="5"></asp:ListItem>
                        <asp:ListItem Text="LMI" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Serial Number" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Not Met" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="C02" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th rowspan="4" scope="rowgroup">Technical</th>
                    <td>Did the Engineer probe with right questions to identify the issue?</td>
                    <td>• <b>Met - </b>Fullfills all the criteria. <br />
                        • <b>Not Met - </b>Complete probing was not done to isolate the issue or the required probing was not done at the right time (before starting the troubleshooting) <br />
                        • <b>Partial - </b>No or irrelevant probing was done by the Engineer or relevant questions were asked only after starting the troubleshooting steps. <br/>
                        • <b>NA - </b>Information only call <br />
                    </td>
                    <td><asp:DropDownList ID="Q03" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Not Met" Value="8"></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="4"></asp:ListItem>
                        <asp:ListItem Text="NA" Value=""></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="C03" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Did the Engineer use logical troubleshooting steps to resolve the issue ?</td>
                    <td>• <b>Met - </b>Fullfills all the criteria. <br />
                        • <b>Not Met - </b>Complete probing was not done to isolate the issue or the required probing was not done at the right time (before starting the troubleshooting) <br />
                        • <b>Partial - </b>No or irrelevant probing was done by the Engineer or relevant questions were asked only after starting the troubleshooting steps. <br />
                        • <b>NA - </b>Information only call <br />
                    </td>
                    <td><asp:DropDownList ID="Q04" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Not Met" Value="8"></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="4"></asp:ListItem>
                        <asp:ListItem Text="NA" Value=""></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="C04" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>First call resolution opportunity</td>
                    <td>• <b>Met - </b>Engineer has resolved & confirmed the issue resolution on the very first interaction - including dispatch cases <br />
                        • <b>FCR - Cu - </b>When Engineer could not confirm resolution on the first interaction due to any reason caused by Customer (Cust busy, request call back, Cust not by the unit etc..) <br />
                        • <b>FCR - Eng - </b>Engineer fails to provide the resolution in the first interaction when there was an opportunity <br />
                        • <b>FCR - HP - </b>When Engineer could not confirm resolution on the first interaction due to any reason related to HP. Eg. Process/Tool limitations etc. (POP validation, Tool downtime) <br />
                        • <b>NA - </b>There was no opportunity for Engineer to provide any resolution in the first interaction. For Eg - Customer is calling back (old case)
                    </td>
                    <td><asp:DropDownList ID="Q05" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="FCR - Cu" Value=""></asp:ListItem>
                        <asp:ListItem Text="FCR - Eng" Value=""></asp:ListItem>
                        <asp:ListItem Text="FCR - HP" Value=""></asp:ListItem>
                        <asp:ListItem Text="NA" Value=""></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="C05" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Did the Engineer provide right resolution/Information?</td>
                    <td>• <b>Completed - </b>Resolution provided for the issue is correct & complete <br />
                        • <b>Pending - </b>Resolution/information for the issue/query is pending (Further research required, waiting for sample from Cust, L2 Elevation etc…) <br />
                        • <b>Delayed - </b>Engineer has missed an opportunity that has delayed in providing complete information/ resolution (Engineer fails to dispatch the case on time etc..) <br />
                        • <b>Missed - </b>Engineer fails to provide complete resolution or correct information when there was an opportunity. Even 'FCR Miss -Engineer' will be a miss in Resolution
                    </td>
                    <td><asp:DropDownList ID="Q06" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Completed" Value=""></asp:ListItem>
                        <asp:ListItem Text="Pending" Value=""></asp:ListItem>
                        <asp:ListItem Text="Delayed" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Missed" Value="20"></asp:ListItem></asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="C06" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th rowspan="4" scope="rowgroup">Communicaton</th>
                    <td>Behavioural skill opportunity</td>
                    <td>• <b>Met - </b>When Engineer does not have any of the below behavioural opportunities under. <br />
                        • <b>MCSL - Matching Customer Skill Level - </b>Engineer fails to match Cust's skill level while interacting. For Eg - If Cust is not Tech savvy Engineer should avoid using jargon & explain in simple terms. Objective is to make customer feel comfortable <br />
                        • <b>Objection Handling - </b>Engineer fails to handle any objection from Cust in a professional manner. Engineer should not take Cust objection personally <br />
                        • <b>Unprofessionalism - </b>The Engineer displayed unprofessional behaviour by using sarcastic / abusive or confrontational language / rude / vulgar / sexual comments / slandering HP brand / products / speaking negative of competitors / co-workers. <br />
                        • <b>Educating Customer - </b>Engineer fails to educate customer whenever there was a opportunity. For Eg - Educating Cust while on remote on the T/S performed, providing correct numb/IVR options when there is a misroute or providing correct part number before sending Cust to Spare Part Team etc.. <br />
                        • <b>Acknowledgement - </b>Engineer did not acknowledge appropriately & adequately when needed on call.
                    </td>
                    <td><asp:DropDownList ID="Q07a" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="MCSL - Matching Customer Skill Level" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Objection Handling" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Unprofessionalism" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Educating Customer" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Acknowledgement" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                    <br />
                        <asp:DropDownList ID="Q07b" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="MCSL - Matching Customer Skill Level" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Objection Handling" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Unprofessionalism" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Educating Customer" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Acknowledgement" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                    <br />
                        <asp:DropDownList ID="Q07c" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="MCSL - Matching Customer Skill Level" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Objection Handling" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Unprofessionalism" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Educating Customer" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Acknowledgement" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                    <br />
                        <asp:DropDownList ID="Q07d" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="MCSL - Matching Customer Skill Level" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Objection Handling" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Unprofessionalism" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Educating Customer" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Acknowledgement" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                    <br />
                        <asp:DropDownList ID="Q07e" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="MCSL - Matching Customer Skill Level" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Objection Handling" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Unprofessionalism" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Educating Customer" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Acknowledgement" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                    <br />
                        <asp:DropDownList ID="Q07f" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="MCSL - Matching Customer Skill Level" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Objection Handling" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Unprofessionalism" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Educating Customer" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Acknowledgement" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="C07" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Communication related opportunities?</td>
                    <td>• <b>Met - </b>Engineer meets all the below requirements <br />
                        • <b>Communication Skills -  Hearing & Speaking Attributes - </b>Pronunciation/Accent - FLE speak with an accent that may hamper the customer's comprehension, and end up repeating information MTI- Mother tongue influence on the call <br />
                        • <b>Active Listening - </b>When there is a Timely verbal response to a statement or question ( Yes, ok, sure, alright…) followed by an intention to help/inform. Customer asked to repeat more than once <br />
                        • <b>Comprehension - </b>Engineer fails to understand what Cust is trying to express <br />
                        • <b>Rate of Speech - </b>When Rate of Speech being too high where the customer is unable to understand and ask the FLE to repeat / Too slow where the customer sounds bored. <br />
                        • <b>Tone of Voice - </b>When Tone of Voice is not professional while communicating with a customer | Sudden shift in Volume/pitch that may sound condescending to the customer | Polite & Positive Choice of words <br />
                        • <b>Language - </b>Clear & Correct Language and communication was not used. <br />
                        • <b>Sentence structure-Grammar - </b>Engineer did not speak in grammatically correct, simple & complete sentences on call.
                    </td>
                    <td><asp:DropDownList ID="Q08a" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Communication Skills -  Hearing & Speaking Attributes" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Active Listening" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Comprehension" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Rate of Speech" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Tone of Voice" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Language" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Sentence structure-Grammar" Value="9"></asp:ListItem>
                        </asp:DropDownList>
                    <br />
                        <asp:DropDownList ID="Q08b" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Communication Skills -  Hearing & Speaking Attributes" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Active Listening" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Comprehension" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Rate of Speech" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Tone of Voice" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Language" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Sentence structure-Grammar" Value="9"></asp:ListItem>
                        </asp:DropDownList>
                    <br />
                        <asp:DropDownList ID="Q08c" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Communication Skills -  Hearing & Speaking Attributes" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Active Listening" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Comprehension" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Rate of Speech" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Tone of Voice" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Language" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Sentence structure-Grammar" Value="9"></asp:ListItem>
                        </asp:DropDownList>
                    <br />
                        <asp:DropDownList ID="Q08d" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Communication Skills -  Hearing & Speaking Attributes" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Active Listening" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Comprehension" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Rate of Speech" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Tone of Voice" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Language" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Sentence structure-Grammar" Value="9"></asp:ListItem>
                        </asp:DropDownList>
                    <br />
                        <asp:DropDownList ID="Q08e" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Communication Skills -  Hearing & Speaking Attributes" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Active Listening" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Comprehension" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Rate of Speech" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Tone of Voice" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Language" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Sentence structure-Grammar" Value="9"></asp:ListItem>
                        </asp:DropDownList>
                    <br />
                        <asp:DropDownList ID="Q08f" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Communication Skills -  Hearing & Speaking Attributes" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Active Listening" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Comprehension" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Rate of Speech" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Tone of Voice" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Language" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Sentence structure-Grammar" Value="9"></asp:ListItem>
                        </asp:DropDownList>
                    <br />
                        <asp:DropDownList ID="Q08g" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Communication Skills -  Hearing & Speaking Attributes" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Active Listening" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Comprehension" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Rate of Speech" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Tone of Voice" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Language" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Sentence structure-Grammar" Value="9"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="C08" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Customer Obsession?</td>
                    <td>
                        • <b>Met - </b><br />
                        • <b>Rapport Building - </b>When Engineer fails to build a rapport with the Cust when there was an opportunity. For Eg - Cust is friendly and talkative, Engineer should use this opportunity to build a rapport and make Cust more comfortable - Based on the call and customer. <br />
                        • <b>Opening & Closing - </b>Opening: HP branding & Self identification not done. Call opening delayed for more than 5 seconds. Closing: Case # not given, further assistance not offered & closure script not given. If cm does not disconnect call : eng did not give 3 disclaimers before disconnecting call. <br />
                        • <b>Courtesy/Empathy - </b>Courtesy/Empathy - Ability to identify emotional needs of the customer, through verbal and Non-verbal cues | validating it with an appropriate response. Choice of words that display polite & courteousness towards the customer |Allowing the customer to take time & respond<br />
                        • <b>Assurance - </b>Engineer did not paraphrase the issue to ensure issue details were validated to DBD. Did not assure to assist where oppurtunity presented. <br />
                        • <b>Effortless experience - </b>Engineer failed to adapt to best practices on call to ensure customer's experiece on call was effortless. The Engineer allowed the customer to speak without interrupting.<br />
                        • <b>KCI - </b>Did not Educate the customer about issue causes, fixes given & data for future references.
                    </td>
                    <td><asp:DropDownList ID="Q09" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Rapport Building" Value="12"></asp:ListItem>
                        <asp:ListItem Text="Opening & Closing" Value="12"></asp:ListItem>
                        <asp:ListItem Text="Courtesy/Empathy" Value="12"></asp:ListItem>
                        <asp:ListItem Text="Assurance" Value="12"></asp:ListItem>
                        <asp:ListItem Text="Effortless experience" Value="12"></asp:ListItem>
                        <asp:ListItem Text="KCI" Value="12"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="C09" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Call Management</td>
                    <td>   
                        • <b>Hold & Mute - </b>"Engineer fails to follow any of the below:<br />&nbsp* Maximum 3 holds on a single call <br />&nbsp* Maximum 3 minutes on each hold <br />&nbsp* Not following the Hold & Mute script (Seeking Cust permission, reason for hold, return on time & thanking Cust on return)" <br />
                        • <b>Speed of Resolution - </b>Engineer performing illogical T/S  or Inability to guide Cust to perform T/S quickly which has impacted the overall time taken for T/S, wasted time unnecessarily  <br />
                        • <b>Delayed Response - </b>When Engineer fails to respond to Customer on time <br />
                        • <b>Call Control - </b>Cm has deviated from the call & Eng fails to take control of call.
                          Cust is more knowledgeable in terms of technical/process and takes control of the call. 
                    </td>
                    <td><asp:DropDownList ID="Q10" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Hold & Mute" Value=""></asp:ListItem>
                        <asp:ListItem Text="Speed of Resolution" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Delayed Response" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Call Control" Value="5"></asp:ListItem>
                        <asp:ListItem Text="WAH" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="C10" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th rowspan="1" scope="rowgroup">Documentation</th>
                    <td>Did the Engineer adhere to the call logging process (contact details & physical address / alternative contact) and documented conversation details accurately? </td>
                    <td>
                        • <b>Met - </b>Fullfills all the criteria.<br />
                        • <b>Partial - </b>Few details are missed but all the important details are captured. Incorrect / Incomplete templates was used in the case.<br />
                        • <b>Missed Case Creation - </b>Engineer failed to log a case or Quick Case was logged instead <br />
                        • <b>Missed QC - </b>Engineer missed to log QC for a scenario which required the same <br />
                        • <b>Fabrication - </b>Engineer fabricating the case documentation to suit the resolution <br />
                        • <b>No Documentation - </b>Engineer fails to document any information in the Case/QC notes <br />
                        • <b>No Inaccurate / Incomplete Contact Information - </b>Engineer missed capturing complete contact details to have a case logged / did not follow email verification process <br />
                    </td>
                    <td><asp:DropDownList ID="Q11" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="8"></asp:ListItem>
                        <asp:ListItem Text="Missed Case Creation" Value="150"></asp:ListItem>
                        <asp:ListItem Text="Missed QC" Value="8"></asp:ListItem>
                        <asp:ListItem Text="Fabrication" Value="150"></asp:ListItem>
                        <asp:ListItem Text="No Documentation" Value="150"></asp:ListItem>
                        <asp:ListItem Text="Incomplete Contact Information" Value="8"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="C11" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>

                </tr>

                <tr>
                    <th rowspan="2" scope="rowgroup">Customer Experience</th>
                    <td>Did the Engineer follow call back process and meet call back commitment?</td>
                    <td>
                        • <b>NA - </b>Engineer did not have any opportunity for call back <br />
                        • <b>Met - </b>When Engineer has collected the BTTR, offered call back whenever it was required, documented & called back (including call disconnect) <br />
                        • <b>Did not offer - </b>When Engineer fails to offer a call back when there was an opportunity; instead, asked Cust to call back <br />
                        • <b>CBC Not Set - </b>Engineer fails to log the call back commitment in CDAX <br />
                        • <b>CBC Not Met - </b>Engineer fails to meet 'CBC Set' or assurance given to customer. Leverage of +/- 1 hour is allowed <br />
                        • <b>BTTR Not Captured - </b>Engineer fails to capture or collect the best time to reach with customer <br />
                        • <b>Call Disconnect - </b>If Engineer fails to call back customer when there is a call disconnect
                    </td>
                    <td><asp:DropDownList ID="Q12" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="NA" Value=""></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Did not offer" Value="10"></asp:ListItem>
                        <asp:ListItem Text="CBC Not Set" Value="10"></asp:ListItem>
                        <asp:ListItem Text="CBC Not Met" Value="10"></asp:ListItem>
                        <asp:ListItem Text="BTTR Not Captured" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Call Disconnect" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="C12" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>

                </tr>

                <tr>
                    <td>Did the Engineer Show ownership/ escalate the call if required ?</td>
                    <td>
                        • <b>Met - </b>When Engineer has taken complete ownership of all aspects whenever there was an opportunity <br />
                        • <b>Did not set Expectations - </b>Engineer fails to set expectations whenever it was required. Eg - while arranging service,  long time required for research,  process requirements <br />
                        • <b>Incorrect Expectations - </b>Engineer fails to give the correct expectations whenever required. Eg - incorrect TAT given for repair, steps that customer needs to perform etc.. <br />
                        • <b>Missed TAT - </b>Delayed case dispatch / 2hrs TAT missed on Non Voice cases <br />
                        • <b>Escalation Process - </b>When Engineer fails to follow the escalation process whenever required. (L2 Elevation or when Engineer denies escalation/elevation when appropriate. )
                    </td>
                    <td><asp:DropDownList ID="Q13" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Did not set Expectations" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Incorrect Expectations" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Missed TAT" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Escalation Process" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="C13" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>

                </tr>

                <tr>
                    <th rowspan="3" scope="rowgroup">SAPOS</th>
                    <td>Did the engineer offer the right product/ Service?</td>
                    <td>
                        • <b>NA - </b>There was no opportunity to make sales offer <br />
                        • <b>Did not Offer - </b>Engineer fails to offer SPOS when there was an opportunity <br />
                        • <b>Offered - </b>Engineer makes an offer for SPOS <br />
                        • <b>Wrong Offer - </b>Eng makes an offer; however, not an appropriate product. Offer was made only to fulfil the parameter
                    </td>
                    <td><asp:DropDownList ID="Q14" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="NA" Value=""></asp:ListItem>
                        <asp:ListItem Text="Did not Offer" Value=""></asp:ListItem>
                        <asp:ListItem Text="Offered" Value=""></asp:ListItem>
                        <asp:ListItem Text="Wrong Offer" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="C14" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>

                </tr>

                <tr>
                    <td>Was the Sales pitch effective?</td>
                    <td>
                        • <b>Met </b>If pitch qualifies as a genuine attempt <br />
                        • <b>Not Met </b>If pitch does not qualify as a genuine attempt<br />
                        • <b>NA </b>There was no opportunity to make a sales offer.
                    </td>
                    <td><asp:DropDownList ID="Q15" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Not Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="NA" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="C15" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>

                </tr>

                <tr>
                    <td>Was the Sale offer logged accurately?</td>
                    <td>
                        • <b>NA - </b>There was no opportunity to create <br />
                        • <b>Met - </b>If Sales offer is created in CDAX <br />
                        • <b>Not Met - </b>If Sales offer is not created in CDAX.
                    </td>
                    <td><asp:DropDownList ID="Q16" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="NA" Value=""></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Not Met" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="C16" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>

                </tr>

                <tr>
                    <th rowspan="1" scope="rowgroup">Compliance</th>
                    <td>Non - Compliance?</td>
                    <td>
                        Refer Compendum <br />
                        
                    </td>
                    <td><asp:DropDownList ID="ddNonComp" runat="server" Height="25px" Width="150px">
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
                    </td>
                    <td>
                        <asp:TextBox ID="tbNonComp" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>

                </tr>

                <tr>
                    <th rowspan="1" scope="rowgroup">Tracking</th>
                    <td>Engineer provided 360 customer experience /DAB</td>
                    <td>
                        
                    </td>
                    <td><asp:DropDownList ID="Q18" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Not Met" Value=""></asp:ListItem>
                        <asp:ListItem Text="Class Issue Adherence missed" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="C18" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>

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
        var Totalvalue = 0; Target = 125;

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
            for (var i = 0; i < 24; i++) {

                if ((i == 1) || (i == 2) || (i == 3) || (i == 19) || (i == 20)) {
                    BC += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    SelectedValue += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    continue;
                    alert("Here");
                }
                else if ((i == 5) || (i == 6) || (i == 11) || (i == 12) || (i == 21) || (i == 22)) {
                    CC += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    SelectedValue += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    continue;
                    alert("Here2");
                }
                else {
                    SelectedValue += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    continue;
                    alert("Here2");
                }
            }
           
                Result = Number(Total) - SelectedValue;
                BusCrit = 50 - BC;
                CustCrit = 75 - CC;
       
            

            //alert(Result)

            if (Result < 0) {
                document.getElementById("TotalCompl").textContent = 0 + "%";
                document.getElementById("Compliance").value = 0;

                document.getElementById("CustCrit").textContent = 0 + "%";
                document.getElementById("hfv_CustCrit").value = 0;

                document.getElementById("BusCrit").textContent = 0 + "%";
                document.getElementById("hfv_BusCrit").value = 0;

                if (Result < 85) {
                    document.getElementById("tbAuditRes").value = "Fail";
                }
                else { document.getElementById("tbAuditRes").value = "Pass"; }
                document.getElementById('<%= hfv_AuditRes.ClientID%>').value = document.getElementById("tbAuditRes").value;
            }

            else {
                document.getElementById("TotalCompl").textContent = Result + "%";
                document.getElementById("Compliance").value = Result;

                document.getElementById("CustCrit").textContent = CustCrit + "%";
                document.getElementById("hfv_CustCrit").value = CustCrit;

                document.getElementById("BusCrit").textContent = BusCrit + "%";
                document.getElementById("hfv_BusCrit").value = BusCrit;

                if (Result < 85) {
                    document.getElementById("tbAuditRes").value = "Fail";
                }
                else { document.getElementById("tbAuditRes").value = "Pass"; }
                document.getElementById('<%= hfv_AuditRes.ClientID%>').value = document.getElementById("tbAuditRes").value;
            }
        }
   
    </script>
    
</body>
</html>
