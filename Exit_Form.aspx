<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exit_Form.aspx.cs" Inherits="Audit_Legends.Exit_Form" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>Exit Interview Form</title>
    <%--<link rel="shortcut icon" href="Images/HP logoblu.png"  />--%>

        <!--Bootstrap CSS CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
        <link href="Exit_Form.css" rel="stylesheet" type="text/css" />
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
            $("#tbId2").datepicker(null);
            $("#tbId3").datepicker(null);
            $("#TextBox2").datepicker(null);
            $("#TextBox9").datepicker(null); 
        });
    </script>

    <form id="form1" runat="server">
        <%--Top Form--%>
    <div class="auto-style1" style="color:aliceblue;background-color:#4d4e4f;text-align:left;line-height:100px;width:100%">
        <%--<img src="hp_logo_black.jpeg" style="width:100px;overflow:auto;float:left"/>--%>
        <h1><%--<img src="Images/hp_logo_white.png" style="width:98px;overflow:auto;float:initial;"/>--%> Exit Interview Form </h1>
    </div>

    <div id="Pane1">
        <div class="container-fluid" style="margin-top:5px;height:auto;width:95%;">
            <div class="card">
                <div class="card-body" style="background-color:white; box-shadow: 0px 0px 3px grey; border-radius:5px;">
                    <div class="row">
                        <div class="col-md-3" style="width:33%;">
                            <p style="display: inline-block; font-family: 'HP Simplified'; font-size:large; text-decoration: underline; text-align:center; font-weight: bold">Personal Details </p>
                        <table id="table1">
                            
                            <tr>
                                <%--<th>
                                    Employee Mail
                                </th>--%>
                                <td class="auto-style9">
                                    <asp:TextBox ID="TextBox1" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <%--<th>
                                    Reporting Manager Mail
                                </th>--%>
                                <td class="auto-style9">
                                    <asp:TextBox ID="TextBox8" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    EMP ID 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId1" CssClass="form-control input-xs" AutoCompleteType="Disabled" AutoPostBack="true" BorderStyle="Inset" runat="server" OnTextChanged="tbId1_TextChanged"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="tbId1" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true" ValidationExpression="^[0-9]{8}$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                                
                            <tr>
                                <th class="auto-style9">
                                    Name 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId1a" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Phone No
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox3" CssClass="form-control input-xs" placeholder="Enter 10 digit Mobile Number" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBox3" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="true" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ControlToValidate="TextBox3" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Gender
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddGender" CssClass="form-control input-xs" runat="server" OnSelectedIndexChanged="ddGender_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Male" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Others" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator27" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddGender"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="tbGender" CssClass="form-control input-xs" placeholder="* Specify if 'Others'" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    DOJ 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId2" CssClass="form-control input-xs" placeholder="Choose / type in 'MM/DD/YYYY' Format" AutoPostBack="true" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="tbId2"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Resignation Date 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId3" CssClass="form-control input-xs" placeholder="Choose / type in 'MM/DD/YYYY' Format" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="tbId3"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Region Name
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox6" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Manager Name 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbMgrName" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Primary Employer
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddPrimEmpl" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="MPHASIS LIMITED" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="QUESS CORP LTD" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="JOULESTOWATTS BUSINESS" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="FIDELIS CORPORATE SOLUTIONS" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="ETEAM INFOSERVICES PVT LTD" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddPrimEmpl"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Reasons For Leaving 
                                </th>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Personal Obligation" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Health Issues" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Better Career Opportunity" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Better Salary Package" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Higher Studies" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Work Environment" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="Work Pressure" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="Permanent Role" Value="7"></asp:ListItem>
                                        <asp:ListItem Text="Others" Value="8"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    If Others 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId5" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="tbId5"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Additional Comments 
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox4" CssClass="form-control input-xs" AutoCompleteType="Disabled" placeholder="*Reasons for leaving" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Highest Education
                                </th>
                                <td>
                                    <asp:DropDownList ID="DropDownList11" CssClass="form-control input-xs" runat="server">
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
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="DropDownList11"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Hometown (Place of Origin)
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox13" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="TextBox13"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    State
                                </th>
                                <td>
                                    <asp:DropDownList ID="DropDownList12" CssClass="form-control input-xs" runat="server">
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
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="DropDownList12"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                        </div>

                        <div class="col-md-5" style="width:33%;">

                            <p style="display: inline-block; font-family: 'HP Simplified'; font-size:large; text-decoration: underline;text-align:center; font-weight: bold"> Opportunities & Suggestions for Client (HP) </p>

                        <table id="table2">
                            <tr>
                                <th class="auto-style9">
                                    What makes HP a good place of work? 
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox5" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    What recommendation would you have for making HP a better place to work? 
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox7" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="TextBox7"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Would you recommend HP to your friends & family?
                                </th>
                                <td>
                                    <asp:DropDownList ID="DropDownList4" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="DropDownList4"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Would you like to rejoin HP?
                                </th>
                                <td>
                                    <asp:DropDownList ID="DropDownList3" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="DropDownList3"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    If No, Why? 
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox10" CssClass="form-control input-xs" AutoPostBack="true" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                        <br />


                            <%--<p style="display: inline-block; font-family: 'HP Simplified'; font-size:large; text-decoration: underline; text-align:center; font-weight: bold"> Discussion Summary by Hiring Team </p>

                        <table id="table3">
                            <tr>
                                <th class="auto-style9" style="width:360px;">
                                    Comments 
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox8" CssClass="form-control input-xs" AutoPostBack="true" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Date 
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox9" CssClass="form-control input-xs" AutoPostBack="true" placeholder="Choose / type in 'MM/DD/YYYY' Format" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Attrition Type 
                                </th>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Voluntary" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Involuntary" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                        </table>--%>
                        </div>

                        <div class="col-md-4" style="width:33%;">

                            <p style="display: inline-block; font-family: 'HP Simplified'; font-size:large; text-decoration: underline;text-align:center; font-weight: bold"> Client (HP) & Parent Company </p>

                        <table id="table4">
                            <tr>
                                <th class="auto-style9">
                                    Was your current role aligned to your career goals?
                                </th>
                                <td>
                                    <asp:DropDownList ID="DropDownList5" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator17" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="DropDownList5"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Supervisors effectively resolved complaints and problems in the Team
                                </th>
                                <td>
                                    <asp:DropDownList ID="DropDownList6" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator18" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="DropDownList6"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Were you satisfied with the learning opportunities in your Client Company?
                                </th>
                                <td>
                                    <asp:DropDownList ID="DropDownList7" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator19" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="DropDownList7"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    HP has fair & frequent ways to recognize high performers
                                </th>
                                <td>
                                    <asp:DropDownList ID="DropDownList8" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="NA" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="No Comments" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator20" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="DropDownList8"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Were you satisfied with the employee engagement activities conducted at HP ?
                                </th>
                                <td>
                                    <asp:DropDownList ID="DropDownList9" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="NA" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="No Comments" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator21" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="DropDownList9"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Comment 
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox11" TextMode="MultiLine" CssClass="form-control input-xs" AutoCompleteType="Disabled" placeholder="*Overall Comments" BorderStyle="Inset" runat="server" Height="50px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="TextBox11"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                            
                        <br />

                        <%--<p style="display: inline-block; font-family: 'HP Simplified'; font-size:large; text-decoration: underline;text-align:center; font-weight: bold"> New Organization </p>

                        <table id="table5">
                            <tr>
                                <th class="auto-style9">
                                    What makes the new job more attractive than your current position?
                                </th>
                                <td>
                                    <asp:DropDownList ID="DropDownList10" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Salary" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Domain" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Direct Employment" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Work Location" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Work Pressure" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="No Comments" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="NA" Value="6"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Name of the New Organisation 
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox12" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Salary Offered
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox1" CssClass="form-control input-xs" PLACEHOLDER="* In Annual Salary" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            
                            <tr>
                                <th class="auto-style9">
                                    Desgnation offered
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox14" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>--%>
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
</body>
</html>

