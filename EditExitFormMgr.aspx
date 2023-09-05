<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditExitFormMgr.aspx.cs" Inherits="Audit_Legends.EditExitFormMgr" %>

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
            //$("#tbId2").datepicker(null);
            //$("#tbId3").datepicker(null);
            //$("#TextBox2").datepicker(null);
            $("#TextBox1").datepicker(null); 
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
                                <th class="auto-style9">
                                    EMP ID 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId1" CssClass="form-control input-xs" AutoCompleteType="Disabled" AutoPostBack="true" BorderStyle="Inset" runat="server"></asp:TextBox>
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
                                    <asp:TextBox ID="tbGender" CssClass="form-control input-xs" placeholder="* Specify if 'Others'" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    DOJ 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId2" CssClass="form-control input-xs" placeholder="Choose / type in 'MM/DD/YYYY' Format" AutoPostBack="true" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Resignation Date 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId3" CssClass="form-control input-xs" placeholder="Choose / type in 'MM/DD/YYYY' Format" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    LWD 
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox2" CssClass="form-control input-xs" placeholder="Choose / type in 'MM/DD/YYYY' Format" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
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
                                    <asp:TextBox ID="TextBox4" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
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
                                        <asp:ListItem Text="Better Opportunity" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Higher Studies" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Others" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    If Others 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId5" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Additional Comments 
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox5" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Highest Education
                                </th>
                                <td>
                                    <asp:DropDownList ID="DropDownList11" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Master of Design" Value="0"></asp:ListItem>
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
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Hometown (Place of Origin)
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox13" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
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
                                </td>
                            </tr>
                        </table>
                        </div>

                        <div class="col-md-5" style="width:33%;">

                            <p style="display: inline-block; font-family: 'HP Simplified'; font-size:large; text-decoration: underline;text-align:center; font-weight: bold"> Manager Comments </p>

                        <table id="table2">
                            <tr>
                                <th class="auto-style9">
                                    LWD 
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox1" CssClass="form-control input-xs" placeholder="Choose / type in 'MM/DD/YYYY' Format" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Should the Employee be rehired?
                                </th>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="DropDownList2"></asp:RequiredFieldValidator>

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
                    </div>
                        
                    <br />
                    <br />
                    </div>
                </div>

                <div class="auto-style8" style="align-items:center;">
                        <br /><br />
                        <asp:Button ID="btnSubmit" CssClass="btnsub" runat="server" Text="Update" OnClick="Submit_Button"/>
                </div>
            </div>
        </div>
        </div>
    </form>
</body>
</html>
