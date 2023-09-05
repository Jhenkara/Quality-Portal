<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditSheetCDTQA.aspx.cs" Inherits="Audit_Legends.AuditSheetCDTQA" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>FY21 CDT Audit Form</title>
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
        <h1><img src="Images/hp_logo_white.png" style="width:98px;overflow:auto;float:initial;"/> FY21 CDT Audit Form </h1>
    </div>

    <div class="container-fluid" style="text-align:right;align-items:center;height:60px;width:95%;">
        <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
        <asp:Button ID="MenuFeedback" CausesValidation="false" runat="server" Text="Feedback Form" OnClick="MenuFeedback_Click" CssClass="MenuButtons"/>
<%--        <asp:Button ID="SoMe_GuideLines" CausesValidation="false" runat="server" Text="View Guidelines" CssClass="MenuButtons" OnClick="SoMe_GuideLines_Click" OnClientClick="SetTarget();return false;"/>--%>
        <script type="text/javascript">
        function SetTarget() {
            window.open("21_ADXLegendGL.aspx");
            
        }
    </script>
        <asp:Button ID="QADashboard" CausesValidation="false" runat="server" Text="QA Dashboard" CssClass="MenuButtons" OnClick="QADashboard_Click" />
        <asp:Button ID="Download" CausesValidation="false" runat="server" Text="Download" CssClass="MenuButtons" OnClick="FileDownload" />
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

                            <tr>
                                <%--<th>
                                    TL Mail
                                </th>--%>
                                <td class="auto-style9">
                                    <asp:TextBox ID="TextBox2" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <%--<th>
                                    Reporting Manager Mail
                                </th>--%>
                                <td class="auto-style9">
                                    <asp:TextBox ID="TextBox1" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
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
                                    <asp:TextBox ID="tbId2" CssClass="form-control input-xs" AutoPostBack="true" AutoCompleteType="Disabled" OnTextChanged="tbId2_TextChanged" BorderStyle="Inset" runat="server"></asp:TextBox>
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
                                    Month 
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddMonth" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server">
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
                                    <asp:TextBox ID="TextBox4" TextMode="MultiLine" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" placeholder="* For more than one email, seperate it with ';', else leave it blank." runat="server" Height="55px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Call Date 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId4" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
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
                                    <asp:TextBox ID="tbId6" CssClass="form-control input-xs" AutoCompleteType="Disabled" placeholder="In scenarios of No Case Log, type ‘NA’" BorderStyle="Inset" runat="server"></asp:TextBox>
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
                                <th class="auto-style9">
                                    Call Id/SR Id 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId7" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:Label ID="lblCallIdChk" Visible="false" runat="server"></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Call Duration
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddCallDuration" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                        <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                        <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                        <asp:ListItem Text="13" Value="13"></asp:ListItem>
                                        <asp:ListItem Text="14" Value="14"></asp:ListItem>
                                        <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                        <asp:ListItem Text="16" Value="16"></asp:ListItem>
                                        <asp:ListItem Text="17" Value="17"></asp:ListItem>
                                        <asp:ListItem Text="18" Value="18"></asp:ListItem>
                                        <asp:ListItem Text="19" Value="19"></asp:ListItem>
                                        <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                        <asp:ListItem Text="21" Value="21"></asp:ListItem>
                                        <asp:ListItem Text="22" Value="22"></asp:ListItem>
                                        <asp:ListItem Text="23" Value="23"></asp:ListItem>
                                        <asp:ListItem Text="24" Value="24"></asp:ListItem>
                                        <asp:ListItem Text="25" Value="25"></asp:ListItem>
                                        <asp:ListItem Text="26" Value="26"></asp:ListItem>
                                        <asp:ListItem Text="27" Value="27"></asp:ListItem>
                                        <asp:ListItem Text="28" Value="28"></asp:ListItem>
                                        <asp:ListItem Text="29" Value="29"></asp:ListItem>
                                        <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                        <asp:ListItem Text="31" Value="31"></asp:ListItem>
                                        <asp:ListItem Text="32" Value="32"></asp:ListItem>
                                        <asp:ListItem Text="33" Value="33"></asp:ListItem>
                                        <asp:ListItem Text="34" Value="34"></asp:ListItem>
                                        <asp:ListItem Text="35" Value="35"></asp:ListItem>
                                        <asp:ListItem Text="36" Value="36"></asp:ListItem>
                                        <asp:ListItem Text="37" Value="37"></asp:ListItem>
                                        <asp:ListItem Text="38" Value="38"></asp:ListItem>
                                        <asp:ListItem Text="39" Value="39"></asp:ListItem>
                                        <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                        <asp:ListItem Text="41" Value="41"></asp:ListItem>
                                        <asp:ListItem Text="42" Value="42"></asp:ListItem>
                                        <asp:ListItem Text="43" Value="43"></asp:ListItem>
                                        <asp:ListItem Text="44" Value="44"></asp:ListItem>
                                        <asp:ListItem Text="45" Value="45"></asp:ListItem>
                                        <asp:ListItem Text="46" Value="46"></asp:ListItem>
                                        <asp:ListItem Text="47" Value="47"></asp:ListItem>
                                        <asp:ListItem Text="48" Value="48"></asp:ListItem>
                                        <asp:ListItem Text="49" Value="49"></asp:ListItem>
                                        <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                        <asp:ListItem Text="51" Value="51"></asp:ListItem>
                                        <asp:ListItem Text="52" Value="52"></asp:ListItem>
                                        <asp:ListItem Text="53" Value="53"></asp:ListItem>
                                        <asp:ListItem Text="54" Value="54"></asp:ListItem>
                                        <asp:ListItem Text="55" Value="55"></asp:ListItem>
                                        <asp:ListItem Text="56" Value="56"></asp:ListItem>
                                        <asp:ListItem Text="57" Value="57"></asp:ListItem>
                                        <asp:ListItem Text="58" Value="58"></asp:ListItem>
                                        <asp:ListItem Text="59" Value="59"></asp:ListItem>
                                        <asp:ListItem Text="60" Value="60"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Case Type 
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddCaseType" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Printer Installation" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Commercial Asset - 6pm " Value="1"></asp:ListItem>
                                        <asp:ListItem Text="CNU - Customer not with Unit" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Technical Query - Product Specs" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Technical Query - Drivers issue" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Technical Query (Generic) " Value="5"></asp:ListItem>
                                        <asp:ListItem Text="Technical Query - Status calls / DOA Query / RCD Query" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="Technical Query - 3rd Party issues" Value="7"></asp:ListItem>
                                        <asp:ListItem Text="POP Query" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="SVC Address Query" Value="9"></asp:ListItem>
                                        <asp:ListItem Text="Onsite Delay" Value="10"></asp:ListItem>
                                        <asp:ListItem Text="SaPOS Query" Value="11"></asp:ListItem>
                                        <asp:ListItem Text="OOW - Software" Value="12"></asp:ListItem>
                                        <asp:ListItem Text="OOW - Hardware" Value="13"></asp:ListItem>
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

                            <%--<tr>
                                <th class="auto-style9" style="text-decoration:underline;">
                                    <br />
                                    Previous Scores 
                                </th> 
                            
                                <td>
                                    <div>
                                    <asp:PlaceHolder ID="phPrevSco" runat="server"></asp:PlaceHolder>
                                    </div>
                                </td>
                            </tr>--%>

                            <tr style="display:none;">
                                <th style="height:50px;text-align:left;font-size:larger;"> 
                                    <%--Customer Critical : --%>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                    <asp:Label id="CustCrit" runat="server" Visible="true"></asp:Label>
                                    <asp:HiddenField ID="hfv_CustCrit" Visible="true" runat="server" />
                                </th>
                            </tr>
                            <tr style="display:none;">
                                <th style="height:50px;text-align:left;font-size:larger;"> 
                                    <%--Business Critical :--%> 
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                    <asp:Label id="BusCrit" runat="server" Visible="true"></asp:Label>
                                    <asp:HiddenField ID="hfv_BusCrit" Visible="true" runat="server" />
                                </th>
                            </tr>
                            
                            <tr style="display:none;">
                                <th style="height:50px;text-align:left;font-size:larger;"> 
                                    <%--Non Compliance Score :--%> 
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                    <asp:Label id="NonCompScore" runat="server" Visible="true"></asp:Label>
                                    <asp:HiddenField ID="hfv_NCS" Visible="true" runat="server" />
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
                                        <td  colspan="3"></td>
                                    </tr>
                                    
                                    <tr>
                                        <td >Did the Agent open the call in a positive way with standard greeting?<br />
                                        </td>
                                        <td></td>
                                        <td><asp:DropDownList ID="Q01" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Missed" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>

                                        </td>
                                        <td>
                                            <asp:TextBox ID="C01" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Width="100%" Height="40px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Serial No / Case Number</th>
                                        <td  colspan="3"></td>
                                    </tr>

                                    <tr>
                                        <td>Did the Agent ask for the serial number/Case number and captured it accurately? </td>
                                        <td></td>
                                        <td><asp:DropDownList ID="Q02" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Missed" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C02" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr style="background-color:#1d5aab;color:white">
                                        <th colspan="5" scope="col" style="text-align:center;">Technical</th>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Probing</th>
                                        <td  colspan="3"></td>
                                    </tr>

                                    <tr>
                                        <td>
                                            Did the Agent probe with right questions to identify the issue?</td>
                                        <td>
                                        </td>
                                        <td><asp:DropDownList ID="Q03" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Missed" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C03" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Solution / Resolution</th>
                                        <td  colspan="3"></td>
                                    </tr>
                
                                    <tr>
                                        <td>Did the Agent provide right resolution/solution/transfer the call to the right queue?</td>
                                        <td>
                                        </td>
                                        <td><asp:DropDownList ID="Q04" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="HIP" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Incorrect Transfer" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Call Disconnect" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="Process Miss" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C04" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="30px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>


                                    <tr style="background-color:#1e5eb3;color:white">
                                        <th colspan="5" scope="col" style="text-align:center;">Soft Skills</th>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;"> Communication</th>
                                        <td  colspan="3"></td>
                                    </tr>

                                    <tr>
                                        <td>Was the Agent's communication satisfactory on the call?? <br />
                                            <asp:DropDownList ID="Q06" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Missed" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            Matching Customer Skill Level<br />
                                            Objection Handling<br />
                                            Professionalism<br />
                                            Educating Customer<br />
                                            Assurance<br />
                                            Tone of Voice<br />
                                            Courtesy<br />
                                            Empathy
                                        </td>
                                        <td><asp:DropDownList ID="Q06a" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q06b" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q06c" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q06d" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q06e" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q06f" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q06g" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q06h" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C06" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="60px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Time Management</th>
                                        <td  colspan="3"></td>
                                    </tr>

                                    <tr>
                                        <td>Did the Agent mange time efficiently? <br />
                                        </td>
                                        <td>
                                            Usage of Hold<br />
                                            Inappropriate usage of Mute<br />
                                            Transfer procedure<br />
                                            Call Control 
                                        </td>
                                        <td><asp:DropDownList ID="Q07" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Usage of Hold" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Inappropriate usage of Mute" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Transfer procedure" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="Call Control " Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C07" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="140px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr style="background-color:#1e62bd;color:white">
                                        <th colspan="5" scope="col" style="text-align:center;">Customer Excellence</th>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Setting Expectation</th>
                                        <td  colspan="3"></td>
                                    </tr>
                                    
                                    <tr>
                                        <td>Did the Agent set right expectations to the customer as per the situation?<br />
                                        </td>
                                        <td></td>
                                        <td><asp:DropDownList ID="Q05" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Missed" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C05" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="120px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;"> Case Ownership</th>
                                        <td  colspan="3"></td>
                                    </tr>

                                    <tr>
                                        <td>Did the Agent offer call back whenever applicable/ ownership/Expectations?<br />
                                        </td>
                                        <td>
                                            
                                        </td>
                                        <td><asp:DropDownList ID="Q09" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Missed" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C09" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="60px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr style="background-color:#1e62bd;color:white">
                                        <th colspan="5" scope="col" style="text-align:center;">Documentation</th>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Case Logging</th>
                                        <td  colspan="3"></td>
                                    </tr>

                                    <tr>
                                        <td>Did the Agent adhere to the Call Logging Process and Documented Conversation details accurately? </td>
                                        <td>
                                            Partial<br />
                                            Missed Case Creation<br />
                                            Missed QC<br />
                                            Fabrication<br />
                                            No Documentation<br />
                                            NA<br />
                                        </td>
                                        <td><asp:DropDownList ID="Q08" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Partial" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Missed Case Creation" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Missed QC" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="Fabrication" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="No Documentation" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="7"></asp:ListItem>
                                            </asp:DropDownList>
                                        
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C08" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="40px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Closing</th>
                                        <td  colspan="3"></td>
                                    </tr>

                                    <tr>
                                        <td>Did the Agent provide the Case ID and close the call  positively?</td>
                                        <td>
                                        </td>
                                        <td><asp:DropDownList ID="Q10" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Missed" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>

                                        </td>
                                        <td>
                                            <asp:TextBox ID="C10" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="80px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr style="background-color:white;color:red">
                                        <th colspan="5" scope="col" style="text-align:center;">Compliance</th>
                                    </tr>

                                    <tr>
                                        <td>Compliance Adhered?</td>
                                        <td>
                                        </td>
                                        <td><asp:DropDownList ID="ddNonComp" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="NCLF/Incomplete/Documentation" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Ownership" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Incomplete/Incorrect resolution" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="Rude/Unprofessional Behaviour" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="NPS/RPL" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="Wrong Email address" Value="7"></asp:ListItem>
                                            <asp:ListItem Text="Defect Closure" Value="8"></asp:ListItem>
                                            <asp:ListItem Text="Survey Solicitation" Value="9"></asp:ListItem>
                                            <asp:ListItem Text="Call Disconnect" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="PCI" Value="11"></asp:ListItem>
                                            <asp:ListItem Text="ACL" Value="12"></asp:ListItem>
                                        </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbNonComp" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="20px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            </div>
                        </div>
                    </div>
                        <div class="auto-style8" style="align-items:center;">
                        <br /><br />
                        <asp:Button ID="btnUpdate" CssClass="btnsub" runat="server" Text="Update and close" OnClick="btnUpdate_Click"/> &nbsp; &nbsp;
                        <asp:Button ID="btnExit" CssClass="btnsub" runat="server" Text="Back / Close" OnClick="btnExit_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>

   

    <script type="text/javascript">
        var Totalvalue = 0; Target = 125;
        

        function DropDownFilter() {

            var Total = 100;
            var SelectedValue = 0;
            var BC = 0,CC=0;
            var Result = 0;
            var FScore = 0;
            var BusCrit = 0, CustCrit = 0;
            var BCper = 0, CCper= 0;
            var Zero = 0, One = 1;

            var q1 = document.getElementById("Q01");
            var q2 = document.getElementById("Q02");
            var q3 = document.getElementById("Q03");
            var q4 = document.getElementById("Q04");
            var q5 = document.getElementById("Q05");
            var q6 = document.getElementById("Q06");
            var q6a = document.getElementById("Q06a");
            var q6b = document.getElementById("Q06b");
            var q6c = document.getElementById("Q06c");
            var q6d = document.getElementById("Q06d");
            var q6e = document.getElementById("Q06e");
            var q6f = document.getElementById("Q06f");
            var q6g = document.getElementById("Q06g");
            var q6h = document.getElementById("Q06h");
            var q7 = document.getElementById("Q07");
            var q8 = document.getElementById("Q08");
            var q9 = document.getElementById("Q09");
            var q10 = document.getElementById("Q10");
            var qNC = document.getElementById("ddNonComp");

            //-----------------------Dropdown Scoring----------------------
            if ((q1.options[q1.selectedIndex].text == 'Met') || (q1.options[q1.selectedIndex].text == 'NA')) {
                SelectedValue += Number(0);
            }
            else if ((q1.options[q1.selectedIndex].text == 'Missed')) {
                    SelectedValue += Number(5);
            }//Qstn 1
                
            if ((q2.options[q2.selectedIndex].text == 'Met') || (q2.options[q2.selectedIndex].text == 'NA') || (q2.options[q2.selectedIndex].text == '--Choose--'))
            {
                SelectedValue += Number(0);
                CC += Number(0);
            }
            else if (q2.options[q2.selectedIndex].text == 'Missed')
            {
                SelectedValue += Number(10);
                BC += Number(10);
            }//Qstn 2

            if ((q3.options[q3.selectedIndex].text == 'Met') || (q3.options[q3.selectedIndex].text == 'NA') || (q3.options[q3.selectedIndex].text == '--Choose--'))
            {
                SelectedValue += Number(0);
                CC += Number(0);
            }
            else if (q3.options[q3.selectedIndex].text == 'Missed')
            {
                SelectedValue += Number(10);
                BC += Number(10);
            }//Qstn 3
            

            if ((q4.options[q4.selectedIndex].text == 'Met') || (q4.options[q4.selectedIndex].text == '--Choose--')) {
                SelectedValue += Number(0);
                CC += Number(0);
            }
            else
            {
                SelectedValue += Number(150);
                CC += Number(150);
            }//Qstn 4

            if ((q5.options[q5.selectedIndex].text == 'Met') || (q5.options[q5.selectedIndex].text == 'NA') || (q5.options[q5.selectedIndex].text == '--Choose--'))
            {
                SelectedValue += Number(0);
                CC += Number(0);
            }
            else if (q5.options[q5.selectedIndex].text == 'Missed')
            {
                SelectedValue += Number(10);
                BC += Number(10);
            }//Qstn 5

            if ((q6.options[q6.selectedIndex].text == 'Met')) {
                SelectedValue += Number(0);
                document.getElementById('Q06a').disabled = true;
                document.getElementById('Q06b').disabled = true;
                document.getElementById('Q06c').disabled = true;
                document.getElementById('Q06d').disabled = true;
                document.getElementById('Q06e').disabled = true;
                document.getElementById('Q06f').disabled = true;
                document.getElementById('Q06g').disabled = true;
                document.getElementById('Q06h').disabled = true;
            }
            else if ((q6.options[q6.selectedIndex].text == 'Missed')) {
                document.getElementById('Q06a').disabled = false;
                document.getElementById('Q06b').disabled = false;
                document.getElementById('Q06c').disabled = false;
                document.getElementById('Q06d').disabled = false;
                document.getElementById('Q06e').disabled = false;
                document.getElementById('Q06f').disabled = false;
                document.getElementById('Q06g').disabled = false;
                document.getElementById('Q06h').disabled = false;
                if ((q6a.options[q6a.selectedIndex].text == 'Not Met') || (q6b.options[q6b.selectedIndex].text == 'Not Met') || (q6c.options[q6c.selectedIndex].text == 'Not Met') || (q6d.options[q6d.selectedIndex].text == 'Not Met') || (q6e.options[q6e.selectedIndex].text == 'Not Met') || (q6f.options[q6f.selectedIndex].text == 'Not Met') || (q6g.options[q6g.selectedIndex].text == 'Not Met') || (q6h.options[q6h.selectedIndex].text == 'Not Met')) {
                    SelectedValue += Number(10);
                    CC += Number(10);
                }
            }//Qstn 6
            
            if ((q7.options[q7.selectedIndex].text == 'Met') || (q7.options[q7.selectedIndex].text == '--Choose--')) {
                SelectedValue += Number(0);
                CC += Number(0);
            }
            else {
                    SelectedValue += Number(10);
                    CC += Number(10);
            }//Qstn 7

            
            if ((q8.options[q8.selectedIndex].text == 'Missed Case Creation') || (q8.options[q8.selectedIndex].text == 'Missed QC') || (q8.options[q8.selectedIndex].text == 'Fabrication') || (q8.options[q8.selectedIndex].text == 'No Documentation')) {
                SelectedValue += Number(10);
                CC += Number(10);
            }
            else if ((q8.options[q8.selectedIndex].text == 'Partial')){
                SelectedValue += Number(5);
                CC += Number(5);
            }//Qstn 8
            

            if ((q9.options[q9.selectedIndex].text == 'Met') || (q9.options[q9.selectedIndex].text == 'NA') || (q9.options[q9.selectedIndex].text == '--Choose--'))
            {
                SelectedValue += Number(0);
                CC += Number(0);
            }
            else if (q9.options[q9.selectedIndex].text == 'Missed')
            {
                SelectedValue += Number(10);
                BC += Number(10);
            }//Qstn 9

            if ((q10.options[q10.selectedIndex].text == 'Met') || (q10.options[q10.selectedIndex].text == 'NA') || (q10.options[q10.selectedIndex].text == '--Choose--'))
            {
                SelectedValue += Number(0);
                CC += Number(0);
            }
            else if (q10.options[q10.selectedIndex].text == 'Missed')
            {
                SelectedValue += Number(5);
                BC += Number(5);
            }//Qstn 10

            if ((qNC.options[qNC.selectedIndex].text == 'Yes') || (qNC.options[qNC.selectedIndex].text == 'NA') || (qNC.options[qNC.selectedIndex].text == '--Choose--')) {
                SelectedValue += Number(0);
                document.getElementById("hfv_NCS").value = Zero;
            }
            else {
                SelectedValue += Number(150);
                document.getElementById("hfv_NCS").value = One;
            }//Non Compliance

            //-------------------------------Calculations---------------------------
            Result = Number(Total) - SelectedValue;
            BusCrit = 20 - BC;
            CustCrit = 70 - CC;

            if (BusCrit != 0) { BCper = (BusCrit / 20) * 100; } else { BCper = 0;}
            if (CustCrit != 0) { CCper = (CustCrit / 70) * 100; } else { CCper = 0;}

           
            if (Result < 85) {
                document.getElementById("tbAuditRes").value = "Fail";
            }
            else { document.getElementById("tbAuditRes").value = "Pass"; }
            document.getElementById('<%= hfv_AuditRes.ClientID%>').value = document.getElementById("tbAuditRes").value;
       
            

            //alert(Result)

            if (Result < 0) {
                document.getElementById("TotalCompl").textContent = 0 + "%";
                document.getElementById("Compliance").value = 0;

                document.getElementById("CustCrit").textContent = 0 + "%";
                document.getElementById("hfv_CustCrit").value = 0;

                document.getElementById("BusCrit").textContent = 0 + "%";
                document.getElementById("hfv_BusCrit").value = 0;
            }

            else {
                document.getElementById("TotalCompl").textContent = Result.toFixed(2) + "%";
                document.getElementById("Compliance").value = Result.toFixed(2);
                
                //document.getElementById("BusCrit").textContent = BusCrit + "%";
                document.getElementById("hfv_BusCrit").value = BCper;

                //document.getElementById("CustCrit").textContent = CustCrit + "%";
                document.getElementById("hfv_CustCrit").value = CCper;
            }
        }
    </script>
    
</body>
</html>

