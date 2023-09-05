<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditSheetSoMeQA.aspx.cs" Inherits="Audit_Legends.AuditSheetSoMeQA" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>FY21 SoMe Legend</title>
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
        <h1><img src="Images/hp_logo_white.png" style="width:98px;overflow:auto;float:initial;"/> FY21 SoMe Legend </h1>
    </div>

    <div class="container-fluid" style="text-align:right;align-items:center;height:60px;width:95%;">
        <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
        <asp:Button ID="MenuFeedback" CausesValidation="false" runat="server" Text="Feedback Form" OnClick="MenuFeedback_Click" CssClass="MenuButtons"/>
        <asp:Button ID="SoMe_GuideLines" CausesValidation="false" runat="server" Text="View Guidelines" CssClass="MenuButtons" OnClick="SoMe_GuideLines_Click" OnClientClick="SetTarget();return false;"/>
        <script type="text/javascript">
        function SetTarget() {
            window.open("21_SoMeLegendGL.aspx");
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
                                    <asp:TextBox ID="TextBox4" TextMode="MultiLine" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" placeholder="* For more than one email, seperate it with ';'" runat="server" Height="55px"></asp:TextBox>
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
                                    <asp:TextBox ID="tbId6" CssClass="form-control input-xs" AutoCompleteType="Disabled" placeholder="In scenarios of No Case Log, type ‘NA’" AutoPostBack="true" BorderStyle="Inset" runat="server" OnTextChanged="btnCaseIdCheck_Click"></asp:TextBox>
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
                                    <asp:TextBox ID="tbId7" CssClass="form-control input-xs" AutoCompleteType="Disabled" AutoPostBack="true" BorderStyle="Inset" runat="server" OnTextChanged="btnCallIDChk"></asp:TextBox>
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
                                    Audit Type 
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddAuditType" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="Regular Audit" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="QCP Audit" Value="0"></asp:ListItem>
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
                                <th class="auto-style9">
                                    Business Unit 
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddBU" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" AutoPostBack="true">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="PC" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Print" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Poly" Value="2"></asp:ListItem>
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
                                    Support Type 
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddST" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddBU_SelectedIndexChanged">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Omnichannel" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Khoros" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Amazon" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Youtube" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="HP Community" Value="4"></asp:ListItem>
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
                                    Language 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbLang" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
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
                                        <th scope="col" style="text-align:center;width:40%;">Parameter</th>

                                        <th scope="col" style="text-align:center;width:30%;">Sub Parameters</th>

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
                                        <td >Did the Engineer comprehend the customer's issue correctly, acknowledge the issue & assured to assist?<br />
                                            <asp:DropDownList ID="Q01" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td>
                                            Introduction<br />
                                            HP Branding<br />
                                            Paraphrasing<br />
                                            Assurance<br />
                                            KYC Info
                                        </td>
                                        <td><asp:DropDownList ID="Q01a" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q01b" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q01c" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q01d" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q01e" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C01" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Width="100%" Height="87px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Tool Usage</th>
                                    </tr>

                                    <tr>
                                        <td>Did the Engineer use the available data/tools/resources to enhance customer experience?<br />
                                            <asp:DropDownList ID="Q02" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            LMI - Live Lens<br />
                                            Serial Number<br />
                                            Entitement and PoP Validation<br />
                                            Class Issue<br />
                                            Ease of Effort<br />
                                            Contact Linking on Chats
                                        </td>
                                        <td><asp:DropDownList ID="Q02a" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1" ></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q02b" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1" ></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q02c" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1" ></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q02d" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1" ></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q02e" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1" ></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q02f" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1" ></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
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
                                        <td><asp:DropDownList ID="Q03" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Partial" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="4"></asp:ListItem>
                                            </asp:DropDownList>
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
                                        <td><asp:DropDownList ID="Q04" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Partial" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="4"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C04" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Solution / Resolution</th>
                                    </tr>
                
                                    <tr>
                                        <td>Did the Engineer provide right resolution/ Information?</td>
                                        <td>
                                        </td>
                                        <td><asp:DropDownList ID="Q05" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Completed" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Pending" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Delayed" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Missed" Value="4"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C05" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr style="background-color:#1e5eb3;color:white">
                                        <th colspan="5" scope="col" style="text-align:center;">Soft Skills</th>
                                    </tr>

                                    <tr>
                                        <td>Behavioural skill opportunity?<br />
                                            <asp:DropDownList ID="Q06" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td>
                                            Matching Customer Skill Level<br />
                                            Objection Handling<br />
                                            Attention to details<br />
                                            Educating Customer<br />
                                            Acknowledgement
                                        </td>
                                        <td><asp:DropDownList ID="Q06a" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q06b" runat="server" Height="20px" Width="150px" Font-Size="X-Small">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q06c" runat="server" Height="20px" Width="150px" Font-Size="X-Small">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q06d" runat="server" Height="20px" Width="150px" Font-Size="X-Small">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q06e" runat="server" Height="20px" Width="150px" Font-Size="X-Small">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C06" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Written Communication opportunity?<br />
                                            <asp:DropDownList ID="Q07" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td>
                                            Communication/ Language<br />
                                            Abbreviations, Jargons<br />
                                            Comprehension<br />
                                            Formatting<br />
                                        </td>
                                        <td><asp:DropDownList ID="Q07a" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q07b" runat="server" Height="20px" Width="150px" Font-Size="X-Small">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q07c" runat="server" Height="20px" Width="150px" Font-Size="X-Small">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q07d" runat="server" Height="20px" Width="150px" Font-Size="X-Small">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C07" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Customer Obsessed Behaviour?<br />
                                            <asp:DropDownList ID="Q08" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td>
                                            Structured Approach<br />
                                            Courtesy<br />
                                            Empathy<br />
                                            Rapport Building<br />
                                            Personalized Approach<br />
                                            Assurance
                                        </td>
                                        <td><asp:DropDownList ID="Q08a" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q08b" runat="server" Height="20px" Width="150px" Font-Size="X-Small">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q08c" runat="server" Height="20px" Width="150px" Font-Size="X-Small">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q08d" runat="server" Height="20px" Width="150px" Font-Size="X-Small">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q08e" runat="server" Height="20px" Width="150px" Font-Size="X-Small">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q08f" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C08" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Time Management<br /></td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="Q18" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Delayed Response" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Speed of Resolution" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Chat Control" Value="4"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C18" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr style="background-color:#1e62bd;color:white">
                                        <th colspan="5" scope="col" style="text-align:center;">Customer Excellence</th>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Case Follow Up</th>
                                    </tr>

                                    <tr>
                                        <td>Did the Engineer adhere to follow-up process?</td>
                                        <td>
                                        </td>
                                        <td><asp:DropDownList ID="Q09" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Snooze" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Follow Up" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="4"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C09" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Case Ownership</th>
                                    </tr>

                                    <tr>
                                        <td>Did the Engineer showcased ownership/ escalated the conversation if required?<br />
                                            <asp:DropDownList ID="Q10" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td>
                                            Expectation Setting<br />
                                            External Source<br />
                                            Escalation Process<br />
                                            Timely Response
                                        </td>
                                        <td><asp:DropDownList ID="Q10a" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q10b" runat="server" Height="20px" Width="150px" Font-Size="X-Small">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q10c" runat="server" Height="20px" Width="150px" Font-Size="X-Small">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        <br />
                                            <asp:DropDownList ID="Q10d" runat="server" Height="20px" Width="150px" Font-Size="X-Small">
                                            <asp:ListItem Enabled="true" text="Met" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C10" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr style="background-color:#2067c7;color:white">
                                        <th colspan="5" scope="col" style="text-align:center;">Documentation</th>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Case / Call Logging</th>
                                    </tr>

                                    <tr>
                                        <td>Did the Engineer adhere to the case logging process and documented conversation details accurately?</td>
                                        <td>
                                            Met<br />
                                            Documentation<br />
                                            Annotation<br />
                                            Case linking<br />
                                            Survey Link<br />
                                            Product & Contact Info
                                        </td>
                                        <td><asp:DropDownList ID="Q11" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Documentation" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Annotation" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Case linking" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="Survey Link" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="Product & Contact Info" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="7"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C11" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">Closing</th>
                                    </tr>

                                    <tr>
                                        <td>Did the Engineer summarize the interaction, offer additional assistance, & close it appropriately?</td>
                                        <td>
                                        </td>
                                        <td><asp:DropDownList ID="Q12" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Offer Additional assistance" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="HP Branding" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Incorrect Closure" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C12" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
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
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="NCLF" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Ownership" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Incomplete/Incorrect resolution" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="Rude/Unprofessional Behaviour" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="NPS/RPL" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="Wrong Email address" Value="7"></asp:ListItem>
                                            <asp:ListItem Text="Defect Closure" Value="8"></asp:ListItem>
                                            <asp:ListItem Text="Survey Solicitation" Value="9"></asp:ListItem>
                                            <asp:ListItem Text="Chat Disconnect - No follow up" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="PCI" Value="11"></asp:ListItem>
                                            <asp:ListItem Text="ACL" Value="12"></asp:ListItem>
                                            <asp:ListItem Text="Survey not sent" Value="13"></asp:ListItem>
                                            <asp:ListItem Text="Chat not linked to CDAX case" Value="14"></asp:ListItem>
                                            <asp:ListItem Text="Contact not created / linked on chat" Value="15"></asp:ListItem>
                                            <asp:ListItem Text="RTT disclaimer not given" Value="16"></asp:ListItem>
                                        </asp:DropDownList>
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
                                        <td><asp:DropDownList ID="Q13" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C13" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">SAPOS</th>
                                    </tr>

                                    <tr>
                                        <td>Did the engineer offer the right product/ Service?</td>
                                        <td>
                                            <asp:DropDownList ID="Q14a" runat="server" Height="20px" Width="100%" Font-Size="X-Small">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Impacting Scores" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Impacting Scores" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td><asp:DropDownList ID="Q14" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Did not Offer" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Offered" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Wrong Offer" Value="4"></asp:ListItem>
                                            </asp:DropDownList>

                                            <asp:DropDownList ID="Q14b" runat="server" Height="20px" Width="150px" Font-Size="X-Small">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Did not Offer" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Offered" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Wrong Offer" Value="4"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C14" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Was the Sales pitch effective?</td>
                                        <td>
                                        <td><asp:DropDownList ID="Q15" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C15" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>

                                    </tr>

                                    <tr>
                                        <td>Was the Sale offer logged accurately?</td>
                                        <td>
                                        </td>
                                        <td><asp:DropDownList ID="Q16" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Not Met" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C16" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;">First Call Resolution</th>
                                    </tr>

                                    <tr>
                                        <td>First conversation resolution/ Same day resolution opportunity</td>
                                        <td>
                                        </td>
                                        <td><asp:DropDownList ID="Q17" runat="server" Height="20px" Width="150px" Font-Size="X-Small" onchange="DropDownFilter(this);">
                                            <asp:ListItem Enabled="true" text="--Choose--" Value="0" ></asp:ListItem>
                                            <asp:ListItem Text="Met" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="FCR - Cu" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="FCR - Eng" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="FCR - HP" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="NA" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="C17" TextMode="MultiLine" AutoCompleteType="Disabled" placeholder="* Comments" runat="server" Height="50px" Width="250px"></asp:TextBox>
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
                        <asp:Button ID="btnExit" CssClass="btnsub" runat="server" Text="Back / Close" OnClick="btnExit_Click"/> &nbsp; &nbsp;
                        <asp:Button ID="btnSendMail" CssClass="btnsub" runat="server" Text="Resend Mail" OnClick="btnSendMail_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>

   

    <script type="text/javascript">
        var Totalvalue = 0; Target = 125;

        $(document).ready(function () {
            //$("#Q14").hide();
            //$("#Q14b").hide();
            $('#<%= Q14a.ClientID %>').change(function () {
                ItemSelected = $("#<%=Q14a.ClientID %> :selected").text();
                if (ItemSelected == "Impacting Scores")
                //.....................^.......
                {
                    $("#Q14").show();
                    //$("#Q14b").hide();
                }
                else {
                    $("#Q14b").show();
                    //$("#Q14").hide();
                }
            });
        });

        function DropDownFilter() {

            var Total = 100;
            var SelectedValue = 0;
            var BC = 0,CC=0;
            var Result = 0;
            var FScore = 0;
            var BusCrit = 0, CustCrit = 0;
            var BCper = 0, CCper = 0;
            var Zero = 0, One = 1;

            var q1 = document.getElementById("Q01");
            var q1a = document.getElementById("Q01a");
            var q1b = document.getElementById("Q01b");
            var q1c = document.getElementById("Q01c");
            var q1d = document.getElementById("Q01d");
            var q1e = document.getElementById("Q01e");
            var q2 = document.getElementById("Q02");
            var q2a = document.getElementById("Q02a");
            var q2b = document.getElementById("Q02b");
            var q2c = document.getElementById("Q02c");
            var q2d = document.getElementById("Q02d");
            var q2e = document.getElementById("Q02e");
            var q2f = document.getElementById("Q02f");
            var q3 = document.getElementById("Q03");
            var q4 = document.getElementById("Q04");
            var q5 = document.getElementById("Q05");
            var q6 = document.getElementById("Q06");
            var q6a = document.getElementById("Q06a");
            var q6b = document.getElementById("Q06b");
            var q6c = document.getElementById("Q06c");
            var q6d = document.getElementById("Q06d");
            var q6e = document.getElementById("Q06e");
            var q7 = document.getElementById("Q07");
            var q7a = document.getElementById("Q07a");
            var q7b = document.getElementById("Q07b");
            var q7c = document.getElementById("Q07c");
            var q7d = document.getElementById("Q07d");
            var q8 = document.getElementById("Q08");
            var q8a = document.getElementById("Q08a");
            var q8b = document.getElementById("Q08b");
            var q8c = document.getElementById("Q08c");
            var q8d = document.getElementById("Q08d");
            var q8e = document.getElementById("Q08e");
            var q8f = document.getElementById("Q08f");
            var q18 = document.getElementById("Q18");
            var q9 = document.getElementById("Q09");
            var q10 = document.getElementById("Q10");
            var q10a = document.getElementById("Q10a");
            var q10b = document.getElementById("Q10b");
            var q10c = document.getElementById("Q10c");
            var q10d = document.getElementById("Q10d");
            var q11 = document.getElementById("Q11");
            var q12 = document.getElementById("Q12");
            var qNC = document.getElementById("ddNonComp");

            //-----------------------Dropdown Scoring----------------------
            if ((q1.options[q1.selectedIndex].text == 'Met')) {
                SelectedValue += Number(0);
                document.getElementById('Q01a').disabled = true;
                document.getElementById('Q01b').disabled = true;
                document.getElementById('Q01c').disabled = true;
                document.getElementById('Q01d').disabled = true;
                document.getElementById('Q01e').disabled = true;
                document.getElementById('Q01a').options[q1a.selectedIndex].text = "Met";
                document.getElementById('Q01b').options[q1b.selectedIndex].text = "Met";
                document.getElementById('Q01c').options[q1c.selectedIndex].text = "Met";
                document.getElementById('Q01d').options[q1d.selectedIndex].text = "Met";
                document.getElementById('Q01e').options[q1e.selectedIndex].text = "Met";
            }
            else if ((q1.options[q1.selectedIndex].text == 'NA')) {
                SelectedValue += Number(0);
                document.getElementById('Q01a').disabled = true;
                document.getElementById('Q01b').disabled = true;
                document.getElementById('Q01c').disabled = true;
                document.getElementById('Q01d').disabled = true;
                document.getElementById('Q01e').disabled = true;
                document.getElementById('Q01a').options[q1a.selectedIndex].text = "NA";
                document.getElementById('Q01b').options[q1b.selectedIndex].text = "NA";
                document.getElementById('Q01c').options[q1c.selectedIndex].text = "NA";
                document.getElementById('Q01d').options[q1d.selectedIndex].text = "NA";
                document.getElementById('Q01e').options[q1e.selectedIndex].text = "NA";
            }
            else if ((q1.options[q1.selectedIndex].text == 'Not Met')) {
                document.getElementById('Q01a').disabled = false;
                document.getElementById('Q01b').disabled = false;
                document.getElementById('Q01c').disabled = false;
                document.getElementById('Q01d').disabled = false;
                document.getElementById('Q01e').disabled = false;
                if ((q1a.options[q1a.selectedIndex].text == 'Not Met') || (q1b.options[q1b.selectedIndex].text == 'Not Met') || (q1c.options[q1c.selectedIndex].text == 'Not Met') || (q1d.options[q1d.selectedIndex].text == 'Not Met') || (q1e.options[q1e.selectedIndex].text == 'Not Met')) {
                    SelectedValue += Number(5);
                }
            }//Qstn 1
                            
            if ((q2.options[q2.selectedIndex].text == 'Met')) {
                SelectedValue += Number(0);
                document.getElementById('Q02a').disabled = true;
                document.getElementById('Q02b').disabled = true;
                document.getElementById('Q02c').disabled = true;
                document.getElementById('Q02d').disabled = true;
                document.getElementById('Q02e').disabled = true;
                document.getElementById('Q02f').disabled = true;
                document.getElementById('Q02a').options[q2a.selectedIndex].text = "Met";
                document.getElementById('Q02b').options[q2b.selectedIndex].text = "Met";
                document.getElementById('Q02c').options[q2c.selectedIndex].text = "Met";
                document.getElementById('Q02d').options[q2d.selectedIndex].text = "Met";
                document.getElementById('Q02e').options[q2e.selectedIndex].text = "Met";
                document.getElementById('Q02f').options[q2f.selectedIndex].text = "Met";
            }
            else if ((q2.options[q2.selectedIndex].text == 'NA')) {
                SelectedValue += Number(0);
                document.getElementById('Q02a').disabled = true;
                document.getElementById('Q02b').disabled = true;
                document.getElementById('Q02c').disabled = true;
                document.getElementById('Q02d').disabled = true;
                document.getElementById('Q02e').disabled = true;
                document.getElementById('Q02f').disabled = true;
                document.getElementById('Q02a').options[q2a.selectedIndex].text = "NA";
                document.getElementById('Q02b').options[q2b.selectedIndex].text = "NA";
                document.getElementById('Q02c').options[q2c.selectedIndex].text = "NA";
                document.getElementById('Q02d').options[q2d.selectedIndex].text = "NA";
                document.getElementById('Q02e').options[q2e.selectedIndex].text = "NA";
                document.getElementById('Q02f').options[q2f.selectedIndex].text = "NA";
            }
            else if ((q2.options[q2.selectedIndex].text == 'Not Met')) {
                document.getElementById('Q02a').disabled = false;
                document.getElementById('Q02b').disabled = false;
                document.getElementById('Q02c').disabled = false;
                document.getElementById('Q02d').disabled = false;
                document.getElementById('Q02e').disabled = false;
                document.getElementById('Q02f').disabled = false;
                if ((q2a.options[q2a.selectedIndex].text == 'Not Met') || (q2b.options[q2b.selectedIndex].text == 'Not Met') || (q2c.options[q2c.selectedIndex].text == 'Not Met') || (q2d.options[q2d.selectedIndex].text == 'Not Met') || (q2e.options[q2e.selectedIndex].text == 'Not Met') || (q2f.options[q2f.selectedIndex].text == 'Not Met')) {
                    SelectedValue += Number(5);
                    BC += Number(5);
                }
            }//Qstn 2

            if (q3.options[q3.selectedIndex].text == 'Not Met') {
                SelectedValue += Number(8);
                CC += Number(8);
            }
            else if (q3.options[q3.selectedIndex].text == 'Partial')
            {
                SelectedValue += Number(4);
                CC += Number(4);
            }//Qstn 3

            if (q4.options[q4.selectedIndex].text == 'Not Met') {
                SelectedValue += Number(8);
                BC += Number(8);
            }
            else if (q4.options[q4.selectedIndex].text == 'Partial')
            {
                SelectedValue += Number(4);
                CC += Number(4);
            }//Qstn 4

            if (q5.options[q5.selectedIndex].text == 'Missed') {
                SelectedValue += Number(150);
                CC += Number(150);
            }
            else if (q5.options[q5.selectedIndex].text == 'Delayed')
            {
                SelectedValue += Number(10);
                CC += Number(10);
            }//Qstn 5

            if ((q6.options[q6.selectedIndex].text == 'Met')) {
                SelectedValue += Number(0);
                CC += Number(0);
                document.getElementById('Q06a').disabled = true;
                document.getElementById('Q06b').disabled = true;
                document.getElementById('Q06c').disabled = true;
                document.getElementById('Q06d').disabled = true;
                document.getElementById('Q06e').disabled = true;
                document.getElementById('Q06a').options[q6a.selectedIndex].text = "Met";
                document.getElementById('Q06b').options[q6b.selectedIndex].text = "Met";
                document.getElementById('Q06c').options[q6c.selectedIndex].text = "Met";
                document.getElementById('Q06d').options[q6d.selectedIndex].text = "Met";
                document.getElementById('Q06e').options[q6e.selectedIndex].text = "Met";
            }
            else if ((q6.options[q6.selectedIndex].text == 'NA')) {
                SelectedValue += Number(0);
                CC += Number(0);
                document.getElementById('Q06a').disabled = true;
                document.getElementById('Q06b').disabled = true;
                document.getElementById('Q06c').disabled = true;
                document.getElementById('Q06d').disabled = true;
                document.getElementById('Q06e').disabled = true;
                document.getElementById('Q06a').options[q6a.selectedIndex].text = "NA";
                document.getElementById('Q06b').options[q6b.selectedIndex].text = "NA";
                document.getElementById('Q06c').options[q6c.selectedIndex].text = "NA";
                document.getElementById('Q06d').options[q6d.selectedIndex].text = "NA";
                document.getElementById('Q06e').options[q6e.selectedIndex].text = "NA";
            }
            else if ((q6.options[q6.selectedIndex].text == 'Not Met')) {
                document.getElementById('Q06a').disabled = false;
                document.getElementById('Q06b').disabled = false;
                document.getElementById('Q06c').disabled = false;
                document.getElementById('Q06d').disabled = false;
                document.getElementById('Q06e').disabled = false;
                if ((q6a.options[q6a.selectedIndex].text == 'Not Met') || (q6b.options[q6b.selectedIndex].text == 'Not Met') || (q6c.options[q6c.selectedIndex].text == 'Not Met') || (q6d.options[q6d.selectedIndex].text == 'Not Met') || (q6e.options[q6e.selectedIndex].text == 'Not Met')) {
                    SelectedValue += Number(10);
                    CC += Number(10);
                }
            }//Qstn 6

            if ((q7.options[q7.selectedIndex].text == 'Met')) {
                SelectedValue += Number(0);
                CC += Number(0);
                document.getElementById('Q07a').disabled = true;
                document.getElementById('Q07b').disabled = true;
                document.getElementById('Q07c').disabled = true;
                document.getElementById('Q07d').disabled = true;
                document.getElementById('Q07a').options[q7a.selectedIndex].text = "Met";
                document.getElementById('Q07b').options[q7b.selectedIndex].text = "Met";
                document.getElementById('Q07c').options[q7c.selectedIndex].text = "Met";
                document.getElementById('Q07d').options[q7d.selectedIndex].text = "Met";
            }
            else if ((q7.options[q7.selectedIndex].text == 'NA')) {
                SelectedValue += Number(0);
                CC += Number(0);
                document.getElementById('Q07a').disabled = true;
                document.getElementById('Q07b').disabled = true;
                document.getElementById('Q07c').disabled = true;
                document.getElementById('Q07d').disabled = true;
                document.getElementById('Q07a').options[q7a.selectedIndex].text = "NA";
                document.getElementById('Q07b').options[q7b.selectedIndex].text = "NA";
                document.getElementById('Q07c').options[q7c.selectedIndex].text = "NA";
                document.getElementById('Q07d').options[q7d.selectedIndex].text = "NA";
            }
            else if ((q7.options[q7.selectedIndex].text == 'Not Met')) {
                document.getElementById('Q07a').disabled = false;
                document.getElementById('Q07b').disabled = false;
                document.getElementById('Q07c').disabled = false;
                document.getElementById('Q07d').disabled = false;
                if ((q7a.options[q7a.selectedIndex].text == 'Not Met') || (q7b.options[q7b.selectedIndex].text == 'Not Met') || (q7c.options[q7c.selectedIndex].text == 'Not Met') || (q7d.options[q7d.selectedIndex].text == 'Not Met')) {
                    SelectedValue += Number(10);
                    CC += Number(10);
                }
            }//Qstn 7

            if ((q8.options[q8.selectedIndex].text == 'Met')) {
                SelectedValue += Number(0);
                CC += Number(0);
                document.getElementById('Q08a').disabled = true;
                document.getElementById('Q08b').disabled = true;
                document.getElementById('Q08c').disabled = true;
                document.getElementById('Q08d').disabled = true;
                document.getElementById('Q08e').disabled = true;
                document.getElementById('Q08f').disabled = true;
                document.getElementById('Q08a').options[q8a.selectedIndex].text = "Met";
                document.getElementById('Q08b').options[q8b.selectedIndex].text = "Met";
                document.getElementById('Q08c').options[q8c.selectedIndex].text = "Met";
                document.getElementById('Q08d').options[q8d.selectedIndex].text = "Met";
                document.getElementById('Q08e').options[q8e.selectedIndex].text = "Met";
                document.getElementById('Q08f').options[q8f.selectedIndex].text = "Met";
            }
            else if ((q8.options[q8.selectedIndex].text == 'NA')) {
                SelectedValue += Number(0);
                CC += Number(0);
                document.getElementById('Q08a').disabled = true;
                document.getElementById('Q08b').disabled = true;
                document.getElementById('Q08c').disabled = true;
                document.getElementById('Q08d').disabled = true;
                document.getElementById('Q08e').disabled = true;
                document.getElementById('Q08f').disabled = true;
                document.getElementById('Q08a').options[q8a.selectedIndex].text = "NA";
                document.getElementById('Q08b').options[q8b.selectedIndex].text = "NA";
                document.getElementById('Q08c').options[q8c.selectedIndex].text = "NA";
                document.getElementById('Q08d').options[q8d.selectedIndex].text = "NA";
                document.getElementById('Q08e').options[q8e.selectedIndex].text = "NA";
                document.getElementById('Q08f').options[q8f.selectedIndex].text = "NA";
            }
            else if ((q8.options[q8.selectedIndex].text == 'Not Met')) {
                document.getElementById('Q08a').disabled = false;
                document.getElementById('Q08b').disabled = false;
                document.getElementById('Q08c').disabled = false;
                document.getElementById('Q08d').disabled = false;
                document.getElementById('Q08e').disabled = false;
                document.getElementById('Q08f').disabled = false;
                if ((q8a.options[q8a.selectedIndex].text == 'Not Met') || (q8b.options[q8b.selectedIndex].text == 'Not Met') || (q8c.options[q8c.selectedIndex].text == 'Not Met') || (q8d.options[q8d.selectedIndex].text == 'Not Met') || (q8e.options[q8e.selectedIndex].text == 'Not Met') || (q8f.options[q8f.selectedIndex].text == 'Not Met')) {
                    SelectedValue += Number(10);
                    CC += Number(10);
                }
            }//Qstn 8

            if ((q18.options[q18.selectedIndex].text == 'Delayed Response') || (q18.options[q18.selectedIndex].text == 'Speed of Resolution') || (q18.options[q18.selectedIndex].text == 'Chat Control')) {
                SelectedValue += Number(5);
                CC += Number(5);
            }//Qstn 18

            if ((q9.options[q9.selectedIndex].text == 'Met') || (q9.options[q9.selectedIndex].text == 'NA')) {
                SelectedValue += Number(0);
                CC += Number(0);
            }
            else if((q9.options[q9.selectedIndex].text == 'Snooze') || (q9.options[q9.selectedIndex].text == 'Follow Up')){
                SelectedValue += Number(5);
                CC += Number(5);
            }
            //Qstn 9

            if ((q10.options[q10.selectedIndex].text == 'Met')) {
                SelectedValue += Number(0);
                CC += Number(0);
                document.getElementById('Q10a').disabled = true;
                document.getElementById('Q10b').disabled = true;
                document.getElementById('Q10c').disabled = true;
                document.getElementById('Q10d').disabled = true;
                document.getElementById('Q10a').options[q10a.selectedIndex].text = "Met";
                document.getElementById('Q10b').options[q10b.selectedIndex].text = "Met";
                document.getElementById('Q10c').options[q10c.selectedIndex].text = "Met";
                document.getElementById('Q10d').options[q10d.selectedIndex].text = "Met";
            }
            else if ((q10.options[q10.selectedIndex].text == 'NA')) {
                SelectedValue += Number(0);
                CC += Number(0);
                document.getElementById('Q10a').disabled = true;
                document.getElementById('Q10b').disabled = true;
                document.getElementById('Q10c').disabled = true;
                document.getElementById('Q10d').disabled = true;
                document.getElementById('Q10a').options[q10a.selectedIndex].text = "NA";
                document.getElementById('Q10b').options[q10b.selectedIndex].text = "NA";
                document.getElementById('Q10c').options[q10c.selectedIndex].text = "NA";
                document.getElementById('Q10d').options[q10d.selectedIndex].text = "NA";
            }
            else if ((q10.options[q10.selectedIndex].text == 'Not Met')) {
                document.getElementById('Q10a').disabled = false;
                document.getElementById('Q10b').disabled = false;
                document.getElementById('Q10c').disabled = false;
                document.getElementById('Q10d').disabled = false;
                if ((q10a.options[q10a.selectedIndex].text == 'Not Met') || (q10b.options[q10b.selectedIndex].text == 'Not Met') || (q10c.options[q10c.selectedIndex].text == 'Not Met') || (q10d.options[q10d.selectedIndex].text == 'Not Met')) {
                    SelectedValue += Number(10);
                    CC += Number(10);
                }                
            }//Qstn 10

            if ((q11.options[q11.selectedIndex].text == 'Documentation') || (q11.options[q11.selectedIndex].text == 'Case linking') || (q11.options[q11.selectedIndex].text == 'Product & Contact Info')) {
                SelectedValue += Number(8);
                BC += Number(8);
            }
            else if ((q11.options[q11.selectedIndex].text == 'Annotation'))
            {
                SelectedValue += Number(5);
                CC += Number(5);
            }
            else if ((q11.options[q11.selectedIndex].text == 'Survey Link'))
            {
                SelectedValue += Number(10);
                CC += Number(10);
            }//Qstn 11

            if ((q12.options[q12.selectedIndex].text == 'Offer Additional assistance') || (q12.options[q12.selectedIndex].text == 'HP Branding') || (q12.options[q12.selectedIndex].text == 'Incorrect Closure')) {
                SelectedValue += Number(4);
                CC += Number(4);
            }//Qstn 12

            if ((qNC.options[qNC.selectedIndex].text == 'Met') || (qNC.options[qNC.selectedIndex].text == '--Choose--')) {
                SelectedValue += Number(0);
                document.getElementById("hfv_NCS").value = Zero;
            }
            else {
                SelectedValue += Number(150);
                document.getElementById("hfv_NCS").value = One;
            }//Non Compliance

            //-------------------------------Calculations---------------------------
            Result = Number(Total) - SelectedValue;
            BusCrit = 23 - BC;
            CustCrit = 68 - CC;

            if (BusCrit != 0) { BCper = (BusCrit / 23) * 100; } else { BCper = 0;}
            if (CustCrit != 0) { CCper = (CustCrit / 68) * 100; } else { CCper = 0;}

            var e = document.getElementById("Q14");
            var SelText = e.options[e.selectedIndex].text;

            if ((SelText == 'Did not Offer') || (SelText == 'Wrong Offer')) {
                //FScore = 0.05 * Result;
                //Result = Result - FScore;
                Result = Result - 5;
            }

            else {
                Result = Result - FScore;
            }

            var audittype = document.getElementById("ddAuditType").value;

            if (audittype == "-1") {
                if (Result < 85) {
                    document.getElementById("tbAuditRes").value = "Fail";
                }
                else { document.getElementById("tbAuditRes").value = "Pass"; }
            }
            else if (audittype == "0")
            {
                if (Result < 70) {
                    document.getElementById("tbAuditRes").value = "Fail";
                }
                else { document.getElementById("tbAuditRes").value = "Pass"; }
            }
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

