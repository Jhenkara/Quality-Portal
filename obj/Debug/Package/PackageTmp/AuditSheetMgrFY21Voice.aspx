<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditSheetMgrFY21Voice.aspx.cs" Inherits="Audit_Legends.AuditSheetMgrFY21Voice" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>FY21 Voice Audit Form</title>
    <link rel="shortcut icon" href="Images/HP logoblu.png"  />

        <!--Bootstrap CSS CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
        <link href="PersonaVoiceLegend.css" rel="stylesheet" type="text/css" />
         <!-- Font Awesome JS -->
        <%--<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>--%>
<%--        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>--%>
        <script type="text/javascript" src="AuditFormVoiceLegendComm.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <style type="text/css">
            .ScoresClass{
                height:50px;
                text-align:left;
                font-size:larger;
                font-weight:bold;
            }
            
            .auto-style8 {
                text-align: center;
                width: 99%;
                height: 135px;
            }
            .auto-style9 {
                font-family:'HP Simplified Light';
                font-size: 13px;
                font-weight:bold;
                float:left;
                margin-right:5px;
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
    <div class="auto-style1" style="color:aliceblue;background-color:#4d4e4f;text-align:left;line-height:100px;width:100%">
        <%--<img src="hp_logo_black.jpeg" style="width:100px;overflow:auto;float:left"/>--%>
        <h1><img src="Images/hp_logo_white.png" style="width:98px;overflow:auto;float:initial;"/> FY21 Voice Audit Form </h1>
    </div>

    <div class="container-fluid" style="text-align:right;align-items:center;height:60px;width:95%;">
        <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnLogout" CausesValidation="false" runat="server" Text="Logout" CssClass="MenuButtons" OnClick="btnLogout_Click" />
    </div>

    <div id="Pane1">
        <div class="container-fluid" style="margin-top:5px;height:auto;width:95%;">
            <div class="card">
                <div class="card-body" style="background-color:white; box-shadow: 0px 0px 3px grey; border-radius:5px;">
                    <div class="row">
                        <div class="col-md-3"">
                            <asp:HiddenField ID="hfv_empmail" runat="server" />
                            <asp:HiddenField ID="hfv_AuditRes" runat="server" />
                            <div style="background-color:white;">
                            <p style="display: inline-block; font-family: 'HP Simplified'; font-size:large; text-decoration: underline; font-weight: bold">Final Score : </p>
                                <asp:Label id="TotalCompl" runat="server" CssClass="ScoresClass"> </asp:Label>
                                    <asp:HiddenField ID="Compliance" runat="server" />
                            </div>
                        <table id="table1">
                            <tr>
                                <%--<th>
                                    QA Name 
                                </th>--%>
                                <td class="auto-style9">
                                    <asp:TextBox ID="tbId1" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <%--<th>
                                    QA Mail 
                                </th>--%>
                                <td class="auto-style9">
                                    <asp:TextBox ID="tbId1a" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <%--<th>
                                    Employee Mail
                                </th>--%>
                                <td class="auto-style9">
                                    <asp:TextBox ID="TextBox3" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
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
                                <th class="auto-style9">
                                    Employee ID 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId2" CssClass="form-control input-xs" AutoPostBack="true" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Employee Name 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId3" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Business Unit 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbBU" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Month 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbMonth" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Team Lead Name
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox5" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Reporting Manager
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox6" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Team Name 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbTeamName" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    CC Email
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox4" TextMode="MultiLine" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" placeholder="*" runat="server" Height="55px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Call Date 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId4" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="tbId4" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Evaluation Date 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId5" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" Enabled="false" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Case Id 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId6" CssClass="form-control input-xs" AutoCompleteType="Disabled" placeholder="In scenarios of No Case Log, type ‘NA’" AutoPostBack="true" BorderStyle="Inset" runat="server"></asp:TextBox>
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
                                <th class="auto-style9">
                                    Call Id/SR Id 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId7" CssClass="form-control input-xs" AutoCompleteType="Disabled" AutoPostBack="true" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Call Duration
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId8" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Audit Type 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbAuditType" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Case Type 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbCaseType" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Call Type 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbCallType" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Problem Description 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbProbDes" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Audit Result
                                </th>
                                <td>
                                    <asp:TextBox ID="tbAuditRes" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" Enabled="false" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Attachment
                                </th>
                                <td>
                                    <asp:FileUpload ID="FileUploadControl" ToolTip="Browse" runat="server" Height="27px" Width="130px" />
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    
                                </th> 
                            
                                <td>
                                    <div>
                                    
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9" style="text-decoration:underline;">
                                    <br />
                                    Previous Scores 
                                </th> 
                            
                                <td>
                                    <div>
                                    <asp:PlaceHolder ID="phPrevSco" runat="server"></asp:PlaceHolder>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th style="height:50px;text-align:left;font-size:larger;visibility:hidden"> 
                                    <%--Customer Critical : --%>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                    <asp:Label id="CustCrit" runat="server" Visible="false"></asp:Label>
                                    <asp:HiddenField ID="hfv_CustCrit" Visible="false" runat="server" />
                                </th>
                            </tr>
                            <tr>
                                <th style="height:50px;text-align:left;font-size:larger;visibility:hidden"> 
                                    <%--Business Critical :--%> 
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                    <asp:Label id="BusCrit" runat="server" Visible="false"></asp:Label>
                                    <asp:HiddenField ID="hfv_BusCrit" Visible="false" runat="server" />
                                </th>
                            </tr>
                        </table>

                        
                    </div>
                    <br />
                    <br />


                    <div class="col-md-9" style="margin-top:10px;">
                        <div class="row">
                            <div class="col-md-12">
                            <table id="table2" border="1" >
                                <thead>
                                    <tr style="background-color:dimgray;color:white">
                                        <th scope="col" style="text-align:center;width:50%;">Parameter</th>

                                        <th scope="col" style="text-align:center;width:20%;">Sub Parameters</th>

                                        <th scope="col" style="text-align:center;width:10%;">Scoring</th>

                                        <th scope="col" style="text-align:center;">Comments</th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <tr style="background-color:#1c56a3;color:white">
                                        <th colspan="5" scope="col" style="text-align:center;">Process</th>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Opening</th>
                                    </tr>
                                    <tr>
                                        <td >Did the Engineer comprehend the customer's issue correctly, acknowledge the issue & assured to assist?</td>
                                        <td>
                                            Introduction<br />
                                            HP Branding<br />
                                            Paraphrasing<br />
                                            Assurance
                                        </td>
                                        <td><asp:TextBox ID="Q01a" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q01b" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                        
                                            <asp:TextBox ID="Q01c" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q01d" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C01" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Width="100%" Height="87px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Tool Usage</th>
                                    </tr>

                                    <tr>
                                        <td>Did the Engineer use the available data/tools/resources to enhance customer experience?</td>
                                        <td>
                                            LMI - Live Lens<br />
                                            Serial Number<br />
                                            Entitlement or PoP Validation<br />
                                            PIN<br />
                                            Class Issue / WISE Usage<br />
                                            CTI<br />
                                            Did the agent relate to case?<br />
                                            Ease of Effort<br />
                                            PRE tool<br />
                                            Predefix
                                        </td>
                                        <td><asp:TextBox ID="Q02a" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q02b" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q02c" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q02d" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q02e" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q02f" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q02g" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q02h" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q02i" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q02j" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C02" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="89px" Width="100%"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr style="background-color:#1d5aab;color:white">
                                        <th colspan="5" scope="col" style="text-align:center;">Technical</th>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Probing</th>
                                    </tr>

                                    <tr>
                                        <td>Did the Engineer probe with right questions to identify the issue?</td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Q03" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C03" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Troubleshooting</th>
                                    </tr>

                                    <tr>
                                        <td>Did the Engineer logically troubleshoot the issue to reach the desired solution?</td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Q04" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C04" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Solution / Resolution</th>
                                    </tr>
                
                                    <tr>
                                        <td>Did the Engineer provide right resolution/Information?</td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Q05" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C05" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr style="background-color:#1e5eb3;color:white">
                                        <th colspan="5" scope="col" style="text-align:center;">Soft Skills</th>
                                    </tr>

                                    <tr>
                                        <td>Behavioural skill opportunity</td>
                                        <td>
                                            Matching Customer Skill Level<br />
                                            Objection Handling<br />
                                            Attention to details / Active Listening<br />
                                            Educating Customer<br />
                                            Acknowledgement
                                        </td>
                                        <td><asp:TextBox ID="Q06a" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q06b" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q06c" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q06d" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q06e" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                        <td>
                                            <asp:TextBox ID="C06" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Communication opportunity?</td>
                                        <td>
                                            Comprehension<br />
                                            Rate of Speech<br />
                                            Tone of Voice<br />
                                            Language / Accent
                                        </td>
                                        <td><asp:TextBox ID="Q07a" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q07b" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q07c" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q07d" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                        </td>
                                        <td>
                                            <asp:TextBox ID="C07" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Customer Obsessed Behaviour?</td>
                                        <td>
                                            Rapport Building<br />
                                            Assurance<br />
                                            Professionalism<br />
                                            Courtesy<br />
                                            Empathy
                                        </td>
                                        <td><asp:TextBox ID="Q08a" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q08b" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q08c" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q08d" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q08e" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                        </td>
                                        <td>
                                            <asp:TextBox ID="C08" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Time Management</td>
                                        <td>
                                            Hold, Mute and Dead air<br />
                                            Speed of Resolution <br />
                                            Call Control
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Q09" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C09" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>


                                    <tr style="background-color:#1e62bd;color:white">
                                        <th colspan="5" scope="col" style="text-align:center;">Customer Excellence</th>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Callback</th>
                                    </tr>

                                    <tr>
                                        <td>Did the Engineer follow call back process and meet call back commitment? </td>
                                        <td>
                                            Did not Offer<br />
                                            CBC (callback commitment) Not Set<br />
                                            CBC (callback commitment) Not Met<br />
                                            BTTR (Best time to reach) Not Captured<br />
                                            Call Disconnect<br />
                                            Email Follow-Up
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Q12" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                        
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C12" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Ownership</th>
                                    </tr>

                                    <tr>
                                        <td>Did the Engineer showcased ownership/ escalated the call if required? </td>
                                        <td>
                                            Expectation Setting / KCI<br />
                                            External source / RDT India<br />
                                            Escalation Process
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Q13a" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q13b" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q13c" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                        </td>
                                        <td>
                                            <asp:TextBox ID="C13" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    
                                    <tr style="background-color:#1e62bd;color:white">
                                        <th colspan="5" scope="col" style="text-align:center;">Documentation</th>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Case Logging</th>
                                    </tr>

                                    <tr>
                                        <td>Did the Engineer document conversation details accurately? </td>
                                        <td>
                                            Met<br />
                                            Partial<br />
                                            Missed Case Creation<br />
                                            Missed QC<br />
                                            Fabrication<br />
                                            No Documentation<br />
                                            Inaccurate/Incomplete Contact Info
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Q10" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                        </td>
                                        <td>
                                            <asp:TextBox ID="C10" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Closing</th>
                                    </tr>

                                    <tr>
                                        <td>Did the Engineer summarize the interaction, offer additional assistance, & close it appropriately? </td>
                                        <td>
                                            Met<br />
                                            Offer Additional assistance<br />
                                            HP Branding<br />
                                            NA
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Q11" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C11" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr style="background-color:white;color:red">
                                        <th colspan="5" scope="col" style="text-align:center;">Compliance</th>
                                    </tr>

                                    <tr>
                                        <td>Compliance Adhered?</td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="NonComptb" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbNonComp" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr style="background-color:dimgray;color:white">
                                        <th colspan="5" scope="col" style="text-align:center;">Tracking Questions</th>
                                    </tr>

                                    <tr>
                                        <td>Engineer provided WOW experience /DAB</td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Q14" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C14" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">SAPOS</th>
                                    </tr>

                                    <tr>
                                        <td>Did the engineer offer the right product/ Service?</td>
                                        <td>
                                            <asp:TextBox ID="Q15a" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Q15" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="Q15b" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C15" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Was the Sales pitch effective?</td>
                                        <td>
                                        <td>
                                            <asp:TextBox ID="Q16" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C16" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>

                                    </tr>

                                    <tr>
                                        <td>Was the Sale offer logged accurately?</td>
                                        <td>
                                        </td>
                                        <td>
                                           <asp:TextBox ID="Q17" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C17" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">First Call Resolution</th>
                                    </tr>

                                    <tr>
                                        <td>First conversation resolution/ Same day resolution opportunity</td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Q18" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C18" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>

                                    </tr>
                                </tbody>
                            </table>
                            </div>
                        </div>
                    <div class="text-sm-center" style="align-items:center;width:100%;">
                    <br /><br />
                    <asp:Button ID="btnAccept" CssClass="SubmitButtons" runat="server" Text="Accept" onclick="Accept_Button" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnDisp" CssClass="SubmitButtons" runat="server" Text="Dispute" onclick="Dispute_Button" />
                    </div>
        
                    <div class="text-sm-center" style="align-items:center;width:100%;">
                    <br />
                        <asp:TextBox ID="tbDispDetails" TextMode="MultiLine" CssClass="form-control-sm" AutoCompleteType="Disabled" placeholder="* What is the Dispute on?" BorderStyle="Inset" runat="server" Height="160px" Width="320px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvDispDetails" runat="server" CssClass="validation" ErrorMessage="* Please provide details" ControlToValidate="tbDispDetails" SetFocusOnError="true" Display="Dynamic" Font-Italic="true" Font-Size="Small" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Button ID="btnDispute" CssClass="SubmitButtons" runat="server" Text="Submit" OnClick="DisputeOptions" />
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>
        </div>
    </div>
    </form>
</body>
</html>
