<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SoMeForumLegend.aspx.cs" Inherits="Audit_Legends.SoMeForumLegend" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>SoMe Forums Legend</title>
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
        <h1><img src="Images/HP logoblu.png" style="width:98px;overflow:auto;float:initial;"/> SoMe Forums Legend</h1>
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
                        <asp:ListItem Text="Facebook and Twitter" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Forums" Value="1"></asp:ListItem>
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
                    Case Date 
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
                    Case Type 
                </th>
                <td>
                    <asp:DropDownList ID="ddCaseType" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Remote" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Referred" Value="1"></asp:ListItem>
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
                        <asp:ListItem Text="Laptops" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Desktops" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Printers" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Docking Stations" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Tablets" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Accessories" Value="5"></asp:ListItem>
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

        <div class="col-sm-12" style="max-width:95%;text-align:center;margin-top:20px;float:left;font-size:medium;">
        <table id="table2" border="1">
            <thead>
                <tr style="text-align:center;background-color:cornflowerblue;color:white">
                    <th colspan="2";max-width:25%;>Parameter</th>
                    
                    <th scope="col">Checklist</th>

                    <th scope="col">Scoring</th>

                    <th scope="col">Comments</th>
                </tr>
            </thead>

            <tbody>

                <tr>
                    <td>A1</td>
                    <th rowspan="5" scope="rowgroup">Engagement & Etiquette</th>
                    <td>The agent greeted the customer with a pleasing and welcoming tone.</td>
                    <td><asp:DropDownList ID="A1" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="2.5"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox7" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A2</td>
                    <td>The agent maintained a professional and courteous interaction with the customer.</td>
                    <td><asp:DropDownList ID="A2" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox5" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A3</td>
                    <td>The agent attempted to personalize the reply where necessary, to build rapport with the customer.</td>
                    <td><asp:DropDownList ID="A3" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox8" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A4</td>
                    <td>The agent managed the direction of the interaction relative to the customer's inquiry and level of technical understanding.</td>
                    <td><asp:DropDownList ID="A4" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox9" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A5</td>
                    <td>The agent used canned responses/macros only where necessary so as to encourage a more humanized customer experience.</td>
                    <td><asp:DropDownList ID="A5" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="7.5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="12.5"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox10" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>B1</td>
                    <th rowspan="2" scope="rowgroup">Investigation</th>
                    <td>The agent asked probing questions to gather the necessary information required to clarify the inquiry and assist.</td>
                    <td><asp:DropDownList ID="B1" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox11" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>B2</td>
                    <td>The agent acknowledged and/or addressed each of the customer's questions or concerns as completely as appropriate.</td>
                    <td><asp:DropDownList ID="B2" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="10"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox12" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>C1</td>
                    <th rowspan="5" scope="rowgroup">Tools & Resources</th>
                    <td>The agent demonstrated proficient technical knowledge of the product or issue to make an accurate assessment/diagnosis of the inquiry.</td>
                    <td><asp:DropDownList ID="C1" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="Partial" Value="5"></asp:ListItem>
                        <asp:ListItem Text="No" Value="10"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox13" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>C2</td>
                    <td>The agent provided HP documents and/or utilities to assist in finding a resolution where appropriate (PSDr, Support Assistant etc..)</td>
                    <td><asp:DropDownList ID="C2" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value=""></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox14" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>C3</td>
                    <td>The agent added detailed troubleshooting steps that can support visitors in the future.</td>
                    <td><asp:DropDownList ID="C3" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value=""></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox15" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>C4</td>
                    <td>When providing troubleshooting steps from an external source, the agent was careful to provide a source that did not have any questionable/offensive content.</td>
                    <td><asp:DropDownList ID="C4" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="2.5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value=""></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox16" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>C5</td>
                    <td>The agent only referred the customer to phone support where necessary IE: It was the next course of action, it is the last step in a HP support document or all troubleshooting failed. </td>
                    <td><asp:DropDownList ID="C5" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value=""></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox17" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>D1</td>
                    <th rowspan="3" scope="rowgroup">Formatting</th>
                    <td>Proper use of @mention was used to address/tag the customer.</td>
                    <td><asp:DropDownList ID="D1" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="2.5"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox18" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>D2</td>
                    <td>The reply was written with proper spelling and grammar.</td>
                    <td><asp:DropDownList ID="D2" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox19" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>D3</td>
                    <td>The reply was composed of well written, properly formatted paragraphs and/or troubleshooting steps. </td>
                    <td><asp:DropDownList ID="D3" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox20" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>E1</td>
                    <th rowspan="4" scope="rowgroup">Follow-up & Closure</th>
                    <td>The agent set the expectation of next steps where appropriate.</td>
                    <td><asp:DropDownList ID="E1" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox21" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>E2</td>
                    <td>The agent encouraged the customer to report back on troubleshooting/findings where appropriate.</td>
                    <td><asp:DropDownList ID="E2" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox22" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>E3</td>
                    <td>The agent encouraged the customer to mark the interaction as an accepted solution and/or kudos to raise community awareness of service provided.</td>
                    <td><asp:DropDownList ID="E3" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox23" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>E4</td>
                    <td>Did the agent receive additional "thank you" messages for that answer/support? (compliments, thank yous, etc)</td>
                    <td><asp:DropDownList ID="E4" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="NA" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox24" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>F1</td>
                    <th scope="rowgroup">Customer Focus Detractor</th>
                    <td>The agent exceeds expectations when s/he uses the full scope of their resources and support guidelines as necessary, with a CAN DO attitude that facilitates the best possible chance to maintain or re-establish the customer's loyalty to HP.  This is demonstrated by:<br />
                        "The agent avoided speculating on what HP has planned in the future for products and services, during the interaction. The agent did not share any internal/confidential HP or CSC information."<br />
                            - Engaging in a professional and courteous interaction with the customer at all times.<br />
                            - Coming to a mutual understanding with the customer on questions or concerns.<br />
                            - Humanizing the customer experience to encourage two-way dialogue.</td>
                    <td><asp:DropDownList ID="F1" runat="server" Height="25px" Width="150px" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value=""></asp:ListItem>
                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="TextBox25" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Only use to copy, this box doesn't get submitted" BorderStyle="Inset" runat="server" Height="50px" Width="250px"></asp:TextBox>
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
        var Totalvalue = 0; Target = 100;

        //function DropDownFilter(current_id) {
        //    var e = current_id.id;
        //    var get = document.getElementById(e);
        //    var getvalue = get.options[get.selectedIndex].value;
        //    Totalvalue = parseFloat(Totalvalue) + parseFloat(getvalue);
        //    document.getElementById("TotalCompl").innerHTML = Target - Totalvalue + "%";
        //}

        function DropDownFilter() {

            var Total = 105;
            var SelectedValue = 0;
            var BC = 0,CC=0;
            var Result = 0;
            var BusCrit = 0, CustCrit = 0;
            //for (var i = 0; i < document.getElementById('table2').getElementsByTagName('select').length; i++) {
            for (var i = 0; i < 19; i++) {

                if ((i == 9 || (i == 10) || (i == 11) || (i == 17) || (i == 19))) {
                    BC += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    SelectedValue += Number(document.getElementById('table2').getElementsByTagName('select')[i].value);
                    continue;
                    alert("Here");
                }

                else if (i == 18) {
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
            BusCrit = 17.5 - BC;
            CustCrit = 82.5 - CC;

            //alert(Result)

            document.getElementById("TotalCompl").textContent = Result + "%";
            document.getElementById("Compliance").value = Result;

            document.getElementById("CustCrit").textContent = CustCrit + "%";
            document.getElementById("hfv_CustCrit").value = CustCrit;

            document.getElementById("BusCrit").textContent = BusCrit + "%";
            document.getElementById("hfv_BusCrit").value = BusCrit;

            <%--if (Result < 70) {
                document.getElementById("tbProfLvl").value = "Novice"; }
            else if (Result >= 70 && Result < 79) { document.getElementById("tbProfLvl").value = "Emerging"; }
            else if (Result >= 79 && Result < 89) { document.getElementById("tbProfLvl").value = "Effective"; }
            else if (Result >= 89 && Result < 99) { document.getElementById("tbProfLvl").value = "Advanced"; }
            else { document.getElementById("tbProfLvl").value = "Expert"; }
            document.getElementById('<%= hfv_ProfLevel.ClientID%>').value = document.getElementById("tbProfLvl").value;--%>
        }
   
    </script>
</body>
</html>
