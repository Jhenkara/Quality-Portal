<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hiring_AttritionForm.aspx.cs" Inherits="Audit_Legends.Hiring_AttritionForm" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>Attrittion Form</title>
    <%--<link rel="shortcut icon" href="Images/HP logoblu.png"  />--%>

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
            
            .checkbox input{
                margin-left:50px;
            }
            .input{
                margin: auto; 
                /*setting margin to auto of the cheeckbox*/
                display: flex;/*Flex box property*/
            }
            </style>
</head>
<body>

    <script type="text/javascript">
        $(function () {
            $("#tbResignDate").datepicker(null);
            $("#tbLWD").datepicker(null);
            //$("#tbId3").datepicker(null);
        });
    </script>

    <form id="form1" runat="server">
        <%--Top Form--%>
    <div class="auto-style1" style="color:aliceblue;background-color:#4d4e4f;text-align:left;line-height:100px;width:100%">
        <%--<img src="hp_logo_black.jpeg" style="width:100px;overflow:auto;float:left"/>--%>
        <h1><%--<img src="Images/hp_logo_white.png" style="width:98px;overflow:auto;float:initial;"/>--%> Attrition Form </h1>
    </div>
    <div class="container-fluid" style="text-align:right;align-items:center;height:60px;width:95%;">
        <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
        <%--<asp:Button ID="MenuFeedback" CausesValidation="false" runat="server" Text="Feedback Form" OnClick="MenuFeedback_Click" CssClass="MenuButtons"/>
        <asp:Button ID="SoMe_GuideLines" CausesValidation="false" runat="server" Text="View Guidelines" CssClass="MenuButtons" OnClick="SoMe_GuideLines_Click" OnClientClick="SetTarget();return false;"/>
        <script type="text/javascript">
        function SetTarget() {
            window.open("21_VoiceLegendGL.aspx");
            
        }
    </script>
        <asp:Button ID="QADashboard" CausesValidation="false" runat="server" Text="QA Dashboard" CssClass="MenuButtons" OnClick="QADashboard_Click" />
        <asp:Button ID="Download" CausesValidation="false" runat="server" Text="Download" CssClass="MenuButtons" OnClick="FileDownload" />--%>
        <asp:Button ID="btnLogout" CausesValidation="false" runat="server" Text="Logout" CssClass="MenuButtons" OnClick="btnLogout_Click" />
    </div>

    <div id="Pane1">
        <div class="container-fluid" style="margin-top:5px;height:auto;width:95%;">
            <div class="card">
                <div class="card-body" style="background-color:white; box-shadow: 0px 0px 3px grey; border-radius:5px;">
                    <div class="row">
                        <div class="col-md-5" style="width:45%;">
                            <asp:HiddenField ID="hfv_MgrMail" runat="server" />
                            <asp:HiddenField ID="hfv_MgrName" runat="server" />
                            <p style="display: inline-block; font-family: 'HP Simplified'; font-size:large; text-decoration: underline; text-align:center; font-weight: bold"> </p>
                        <table id="table1">
                            
                            <tr>
                                <th>
                                    DOJ
                                </th>
                                <td class="auto-style9">
                                    <asp:TextBox ID="tbId1" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    HP Email Id
                                </th>
                                <td class="auto-style9">
                                    <asp:TextBox ID="tbId2" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    HP Employee ID  
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId3" CssClass="form-control input-xs" AutoPostBack="true" AutoCompleteType="Disabled" OnTextChanged="tbId3_TextChanged" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Employee Name 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId4" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>


                            <tr>
                                <th class="auto-style9">
                                    Manager Name  
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox5" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                                
                            <tr>
                                <th class="auto-style9">
                                    Job Level
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox1" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            
                            <tr>
                                <th class="auto-style9">
                                    Gender
                                </th>
                                <td>
                                    <asp:TextBox ID="tbGender" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    DOB 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId5" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Contact Number 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId6" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Emergency Contact number 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId7" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Personal Email ID
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId8" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Residential Address with Postal Code  
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId9" TextMode="MultiLine" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="55px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    City
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId10" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    State
                                </th>
                                    
                                <td>
                                    <asp:TextBox ID="TextBox2" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    My Vendor 
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox3" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Education Status 
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox4" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="col-md-5" style="width:50%;">

                            <p style="display: inline-block; font-family: 'HP Simplified'; font-size:large; text-decoration: underline;text-align:center; font-weight: bold"> </p>

                        <table id="table2">

                            <tr>
                                <th class="auto-style9">
                                    Region 
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddRegion" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="AMS" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="EMEA" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="INDIA" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="GA" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Global" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Support" Value="5"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Employee Resignation Date : 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbResignDate" CssClass="form-control input-xs" placeholder="Choose / type in 'MM/DD/YYYY' Format" AutoPostBack="true" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Last Working Date :
                                </th>
                                <td>
                                    <asp:TextBox ID="tbLWD" CssClass="form-control input-xs" placeholder="Choose / type in 'MM/DD/YYYY' Format" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Month :
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId14" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Tenurity :
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId15" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Notice period served?
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddExpCert" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Partial" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Attrition Type :
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddAttritionType" CssClass="form-control input-xs" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddAttritionType_SelectedIndexChanged">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Resignation" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Ops referback" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Training referback" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Absconding" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Contract Closure" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Emp ID Attrition" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="Training Attrition" Value="6"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Attrition Classification :
                                </th>
                                <td>
                                    <asp:TextBox ID="AttClassify" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Exit Reason :
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddExitReason" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Better opportunity" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Health issues" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Higher Studies" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Relocation" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Personal Obligation" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="Absconding" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="Work pressure" Value="7"></asp:ListItem>
                                        <asp:ListItem Text="Referback" Value="8"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     If Referback :
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddRB" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="SS Reject" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Tech Reject" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Performance" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Schedule Adhereance" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Behaviour issues" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="Compliance" Value="6"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Additional Comment : 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId17" CssClass="form-control input-xs" AutoPostBack="false" TextMode="MultiLine" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Can be rehired?
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddProcess" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <br />

                            <tr>
                                <th class="auto-style9">
                                     Asset recovery :
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddAssetRec" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Partial" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            
                        </table>
                        <br />
                    </div>


                    <br />
                    <br />
                    </div>
                </div>

                <div class="auto-style8" style="align-items:center;">
                        <br /><br />
                        <asp:Button ID="btnSubmit" CssClass="btnsub" runat="server" Text="Submit"/>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnRevoke" CssClass="btnsub" runat="server" Text="Revoke"/>
                </div>
            </div>
        </div>
        </div>
    </form>
    <p style="color:red;text-align:center;"> For any Technical assistance, contact Nikhil R (nikhil.r@hp.com)</p>
</body>
</html>
