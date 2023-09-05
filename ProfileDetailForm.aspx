<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfileDetailForm.aspx.cs" Inherits="Audit_Legends.ProfileDetailForm" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>Profile Creation</title>
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
            $("#tbId1").datepicker(null);
            $("#tbId5").datepicker(null);
            //$("#tbId3").datepicker(null);
        });
    </script>

    <form id="form1" runat="server">
        <%--Top Form--%>
    <div class="auto-style1" style="color:aliceblue;background-color:#4d4e4f;text-align:left;line-height:100px;width:100%">
        <%--<img src="hp_logo_black.jpeg" style="width:100px;overflow:auto;float:left"/>--%>
        <h1><%--<img src="Images/hp_logo_white.png" style="width:98px;overflow:auto;float:initial;"/>--%> Profile Creation </h1>
    </div>

    <div id="Pane1">
        <div class="container-fluid" style="margin-top:5px;height:auto;width:95%;">
            <div class="card">
                <div class="card-body" style="background-color:white; box-shadow: 0px 0px 3px grey; border-radius:5px;">
                    <div class="row">
                        <div class="col-md-5" style="width:45%;">
                            <p style="display: inline-block; font-family: 'HP Simplified'; font-size:large; text-decoration: underline; text-align:center; font-weight: bold"> </p>
                        <table id="table1">

                            <tr>
                                <th>
                                    Date of Submission
                                </th>
                                <td class="auto-style9">
                                     <asp:TextBox ID="tbId0" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" Enabled="false" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            
                            <tr>
                                <th>
                                    DOJ
                                </th>
                                <td class="auto-style9">
                                    <asp:TextBox ID="tbId1" CssClass="form-control input-xs" placeholder="Choose / type in 'MM/DD/YYYY' Format" AutoPostBack="true" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="tbId1" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    HP Email Id
                                </th>
                                <td class="auto-style9">
                                    <asp:TextBox ID="tbId2" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tbId2" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    HP Employee ID  
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId3" CssClass="form-control input-xs" AutoCompleteType="Disabled" AutoPostBack="true" BorderStyle="Inset" runat="server" OnTextChanged="btnEmpIDCheck_Click"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="tbId3" runat="server" ErrorMessage="* Must be exactly 8 Digits" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Smaller" ForeColor="Red" SetFocusOnError="true" ValidationExpression="^[0-9]{8}$"></asp:RegularExpressionValidator>
                                    <asp:Label ID="lblEmpIDChk" Visible="false" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <%--    
                            <tr>
                                <th class="auto-style9">
                                    Job Level
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddJobLevel" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="L0" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="L0A" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="L1" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="L1A" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="L1.5" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="L1.5A" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="L2" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="L2A" Value="7"></asp:ListItem>
                                        <asp:ListItem Text="Support" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="Other" Value="9"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>--%>

                            <tr>
                                <th class="auto-style9">
                                    Name 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId4" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tbId4" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            

                            <tr>
                                <th class="auto-style9">
                                    Gender
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddGender" CssClass="form-control input-xs" runat="server" AutoPostBack="true">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Male" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Trans-Gender" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Binary Employee" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator27" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddGender"></asp:RequiredFieldValidator>
<%--                                    <asp:TextBox ID="tbGender" CssClass="form-control input-xs" placeholder="* Specify if 'Others'" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>--%>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    DOB 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId5" CssClass="form-control input-xs" placeholder="Choose / type in 'MM/DD/YYYY' Format" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="tbId5" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Contact Number 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId6" CssClass="form-control input-xs" placeholder="Enter 10 digit Mobile Number" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="tbId6" runat="server" ErrorMessage="* Must be exactly 10 Digits" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Smaller" ForeColor="Red" SetFocusOnError="true" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>

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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="tbId8" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Residential Address with Postal Code  
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId9" TextMode="MultiLine" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" placeholder="* Type you address here with Postal Code" runat="server" Height="55px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="tbId9" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    City
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId10" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="tbId10" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    State
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddState" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Andhra Pradesh" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Arunachal Pradesh" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Assam" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Bihar" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Chhattisgarh" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Goa" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="Gujarat" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="Haryana" Value="7"></asp:ListItem>
                                        <asp:ListItem Text="Himachal Pradesh" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="Jharkhand" Value="9"></asp:ListItem>
                                        <asp:ListItem Text="Karnataka" Value="10"></asp:ListItem>
                                        <asp:ListItem Text="Kerala" Value="11"></asp:ListItem>
                                        <asp:ListItem Text="Madhya Pradesh" Value="12"></asp:ListItem>
                                        <asp:ListItem Text="Maharashtra" Value="13"></asp:ListItem>
                                        <asp:ListItem Text="Manipur" Value="14"></asp:ListItem>
                                        <asp:ListItem Text="Meghalaya" Value="15"></asp:ListItem>
                                        <asp:ListItem Text="Mizoram" Value="16"></asp:ListItem>
                                        <asp:ListItem Text="Nagaland" Value="17"></asp:ListItem>
                                        <asp:ListItem Text="Odisha" Value="18"></asp:ListItem>
                                        <asp:ListItem Text="Punjab" Value="19"></asp:ListItem>
                                        <asp:ListItem Text="Rajasthan" Value="20"></asp:ListItem>
                                        <asp:ListItem Text="Sikkim" Value="21"></asp:ListItem>
                                        <asp:ListItem Text="Tamil Nadu" Value="22"></asp:ListItem>
                                        <asp:ListItem Text="Telangana" Value="23"></asp:ListItem>
                                        <asp:ListItem Text="Tripura" Value="24"></asp:ListItem>
                                        <asp:ListItem Text="Uttar Pradesh" Value="25"></asp:ListItem>
                                        <asp:ListItem Text="Uttarakhand" Value="26"></asp:ListItem>
                                        <asp:ListItem Text="West Bengal" Value="27"></asp:ListItem>
                                        <asp:ListItem Text="Andaman and Nicobar Islands" Value="28"></asp:ListItem>
                                        <asp:ListItem Text="Chandigarh" Value="29"></asp:ListItem>
                                        <asp:ListItem Text="Dadra and Nagar Haveli and Daman and Diu" Value="30"></asp:ListItem>
                                        <asp:ListItem Text="Delhi" Value="31"></asp:ListItem>
                                        <asp:ListItem Text="Jammu and Kashmir" Value="32"></asp:ListItem>
                                        <asp:ListItem Text="Ladakh" Value="33"></asp:ListItem>
                                        <asp:ListItem Text="Lakshadweep" Value="34"></asp:ListItem>
                                        <asp:ListItem Text="Puducherry" Value="35"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator8" ControlToValidate="ddState" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Residential  Address -  Latitude & Longitude (Google Map)
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId11" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="tbId11" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Permanent Address with postal code 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId12" TextMode="MultiLine" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" placeholder="* Type you address here with Postal Code" runat="server" Height="55px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="tbId12" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    My Vendor 
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddVendor" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="MPHASIS LIMITED" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="QUESS CORP LTD" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="JOULESTOWATTS BUSINESS SOLUTIONS" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="FIDELIS CORPORATE SOLUTIONS" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="ETEAM INFOSERVICES PVT LTD" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator11" ControlToValidate="ddVendor" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Education Status 
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddEduStat" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Graduate" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Non Graduate" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator12" ControlToValidate="ddEduStat" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="col-md-5" style="width:50%;">

                            <p style="display: inline-block; font-family: 'HP Simplified'; font-size:large; text-decoration: underline;text-align:center; font-weight: bold"> </p>

                        <table id="table2">

                            <tr>
                                <th class="auto-style9">
                                    Do you have all relevant education certificates /Marksheets ? 
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddCertMark" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator13" ControlToValidate="ddCertMark" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Highest Qualification
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddHighQual" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Under Graduate" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="D.Pharma" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="BCS" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="M. Tech (Research)" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="ITI" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="MMS" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="B.A-LLM" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="B.A-LLB" Value="7"></asp:ListItem>
                                        <asp:ListItem Text="B.Des." Value="8"></asp:ListItem>
                                        <asp:ListItem Text="B.Tech M.Tech (Dual)" Value="9"></asp:ListItem>
                                        <asp:ListItem Text="M.S (Research)" Value="10"></asp:ListItem>
                                        <asp:ListItem Text="M.Tech (Integrated)" Value="11"></asp:ListItem>
                                        <asp:ListItem Text="MSW" Value="12"></asp:ListItem>
                                        <asp:ListItem Text="BBM" Value="13"></asp:ListItem>
                                        <asp:ListItem Text="BBA" Value="14"></asp:ListItem>
                                        <asp:ListItem Text="M.Des" Value="15"></asp:ListItem>
                                        <asp:ListItem Text="PGDM" Value="16"></asp:ListItem>
                                        <asp:ListItem Text="M. Sc (Tech)" Value="17"></asp:ListItem>
                                        <asp:ListItem Text="M. Sc (Hons) & B.E (Hons)" Value="18"></asp:ListItem>
                                        <asp:ListItem Text="12th" Value="19"></asp:ListItem>
                                        <asp:ListItem Text="10th" Value="20"></asp:ListItem>
                                        <asp:ListItem Text="Dual Degree" Value="21"></asp:ListItem>
                                        <asp:ListItem Text="Others" Value="22"></asp:ListItem>
                                        <asp:ListItem Text="ML/LLM" Value="23"></asp:ListItem>
                                        <asp:ListItem Text="M Pharma" Value="24"></asp:ListItem>
                                        <asp:ListItem Text="B Ed." Value="25"></asp:ListItem>
                                        <asp:ListItem Text="AMIETE" Value="26"></asp:ListItem>
                                        <asp:ListItem Text="PGDCA" Value="27"></asp:ListItem>
                                        <asp:ListItem Text="PGDBM" Value="28"></asp:ListItem>
                                        <asp:ListItem Text="L.L.B." Value="29"></asp:ListItem>
                                        <asp:ListItem Text="Bachelor" Value="30"></asp:ListItem>
                                        <asp:ListItem Text="Masters" Value="31"></asp:ListItem>
                                        <asp:ListItem Text="MCM" Value="32"></asp:ListItem>
                                        <asp:ListItem Text="B Arch" Value="33"></asp:ListItem>
                                        <asp:ListItem Text="ADSQM" Value="34"></asp:ListItem>
                                        <asp:ListItem Text="PGDPM" Value="35"></asp:ListItem>
                                        <asp:ListItem Text="C.S" Value="36"></asp:ListItem>
                                        <asp:ListItem Text="PGDIT" Value="37"></asp:ListItem>
                                        <asp:ListItem Text="M.S." Value="38"></asp:ListItem>
                                        <asp:ListItem Text="MBBS" Value="39"></asp:ListItem>
                                        <asp:ListItem Text="M Phil." Value="40"></asp:ListItem>
                                        <asp:ListItem Text="Diploma" Value="41"></asp:ListItem>
                                        <asp:ListItem Text="MA" Value="42"></asp:ListItem>
                                        <asp:ListItem Text="BA" Value="43"></asp:ListItem>
                                        <asp:ListItem Text="M Com" Value="44"></asp:ListItem>
                                        <asp:ListItem Text="BCA" Value="45"></asp:ListItem>
                                        <asp:ListItem Text="MCA" Value="46"></asp:ListItem>
                                        <asp:ListItem Text="Ph.D" Value="47"></asp:ListItem>
                                        <asp:ListItem Text="M.E." Value="48"></asp:ListItem>
                                        <asp:ListItem Text="B.B.A." Value="49"></asp:ListItem>
                                        <asp:ListItem Text="M.B.A." Value="50"></asp:ListItem>
                                        <asp:ListItem Text="CFA" Value="51"></asp:ListItem>
                                        <asp:ListItem Text="ICWA" Value="52"></asp:ListItem>
                                        <asp:ListItem Text="C.A." Value="53"></asp:ListItem>
                                        <asp:ListItem Text="B.Pharma" Value="54"></asp:ListItem>
                                        <asp:ListItem Text="B.Com." Value="55"></asp:ListItem>
                                        <asp:ListItem Text="B. Sc." Value="56"></asp:ListItem>
                                        <asp:ListItem Text="M.Sc." Value="57"></asp:ListItem>
                                        <asp:ListItem Text="M. Tech" Value="58"></asp:ListItem>
                                        <asp:ListItem Text="B.Tech" Value="59"></asp:ListItem>
                                        <asp:ListItem Text="B.E." Value="60"></asp:ListItem>
                                        <asp:ListItem Text="Master of Design" Value="61"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator14" ControlToValidate="ddHighQual" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    College Name 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId13" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="45px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="tbId13" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Previous Work Experience (in years)
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId14" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ControlToValidate="tbId14" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Designation in the previous Organisation 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId15" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="tbId15" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Experience Certificates Available (Offer /Relieving Letter)
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddExpCert" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator18" ControlToValidate="ddExpCert" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Last Organisation
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId16" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ControlToValidate="tbId16" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Market
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddMarket" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="AMS" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="India" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="GA" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="EMEA" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Support" Value="5"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator20" ControlToValidate="ddMarket" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Business Unit
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddBU" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Commercial PC" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Commercial Print" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Consumer PC" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Consumer Print" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Support Function" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="PC and Print Support" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="Customer Support" Value="7"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator21" ControlToValidate="ddBU" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Role
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddRole" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Technical" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Non-Technical" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Support" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator22" ControlToValidate="ddRole" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Process
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddProcess" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Text="Voice" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Chat / Email / SoMe" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Support" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Partial Voice / Non-Voice" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator23" ControlToValidate="ddProcess" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <br />

                            <tr>
                                <th class="auto-style9" style="text-decoration:underline;font-size:large">
                                     Trainer Details
                                </th>
                                <td>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Soft Skill Trainer Name
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddSSTrainers" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Ashvi Peter Paul, Francis" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Adrian Yates, Glen" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Ananda, Bhuvan" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Balakumar, Jeevan" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="CHINTALAPUDI, RUPA VIDWAJA" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="Jaiswal, Alka Parasnath " Value="6"></asp:ListItem>
                                        <asp:ListItem Text="Joslin, Jospen" Value="7"></asp:ListItem>
                                        <asp:ListItem Text="Karunakaran, Dhinakaran" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="Mohapatra, Avijeet" Value="9"></asp:ListItem>
                                        <asp:ListItem Text="Paul, Gavin" Value="10"></asp:ListItem>
                                        <asp:ListItem Text="Sabrina Maria H" Value="11"></asp:ListItem>
                                        <asp:ListItem Text="Satyamurty, Shilpa" Value="12"></asp:ListItem>
                                        <asp:ListItem Text="Seshadri, Sunitha" Value="13"></asp:ListItem>
                                        <asp:ListItem Text="Sinha, Ankita" Value="14"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Technical Trainer Name
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddTechTrainers" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Abraham, Anoop Varughese" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Dorai Raj, Arun Kumar" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="K U, Harshitha" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Kamath, Naresh" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="KUMARI, KOMAL" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="Lewis, Sandesh Johnson" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="M, MUKUL" Value="7"></asp:ListItem>
                                        <asp:ListItem Text="Mendonca, Nikhil" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="Mukherjee, Shreya" Value="9"></asp:ListItem>
                                        <asp:ListItem Text="Nair, Arun Kumar" Value="10"></asp:ListItem>
                                        <asp:ListItem Text="R, Hariharan" Value="11"></asp:ListItem>
                                        <asp:ListItem Text="Roni Rajan George" Value="12"></asp:ListItem>
                                        <asp:ListItem Text="Surendran, Sudhy V" Value="13"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Training Batch Number
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId20" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Manager's Name
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddMgr" CssClass="form-control input-xs" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" ControlToValidate="ddMgr" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Manager's Email ID
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId21" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" ControlToValidate="tbId21" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <br />
                            <br/>

                            <tr>
                                <th class="auto-style9">
                                     Government ID details<br />(Select the Govt IDs you have)
                                </th>
                                    
                                <td></td>
                            </tr>

                            <asp:CheckBoxList ID="cbGovtID" Visible="true" CssClass="checkbox form-control ui-checkboxradio-label" Width="525px" RepeatDirection="Horizontal" RepeatColumns="3" runat="server" CellPadding="50" CellSpacing="100">
                                        <asp:ListItem Text="Pan Card" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Adhaar Card" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Passport" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Driver's License" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Voter ID" Value="5"></asp:ListItem>
                            </asp:CheckBoxList>

                            
                        </table>
                        <br />
                    </div>


                    <br />
                    <br />
                    </div>
                </div>

                <div class="auto-style8" style="align-items:center;">
                        <br /><br />
                        <asp:Button ID="btnSubmit" CssClass="btnsub" runat="server" Text="Submit" OnClick="Submit_Button"/>
                </div>
            </div>
        </div>
        </div>
    </form>
    <p style="color:red;text-align:center;"> For any Technical assistance, contact Nikhil R (nikhil.r@hp.com)</p>
</body>
</html>
