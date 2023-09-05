<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfileDetailForm_Hiring.aspx.cs" Inherits="Audit_Legends.ProfileDetailForm_Hiring" %>

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
                                    <asp:TextBox ID="tbId3" CssClass="form-control input-xs" AutoCompleteType="Disabled" AutoPostBack="true" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                                
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
                                    <asp:RequiredFieldValidator InitialValue="-1" ID="RequiredFieldValidator27" runat="server" ErrorMessage="*" CssClass="form-control" Display="Dynamic" Font-Italic="true" Font-Size="Medium" ForeColor="Red" ControlToValidate="ddJobLevel"></asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Name 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId4" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
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
                                    <asp:TextBox ID="tbId5" CssClass="form-control input-xs" placeholder="Choose / type in 'MM/DD/YYYY' Format" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Contact Number 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId6" CssClass="form-control input-xs" placeholder="Enter 10 digit Mobile Number" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
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
                                    <asp:TextBox ID="tbId9" TextMode="MultiLine" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" placeholder="* Type you address here with Postal Code" runat="server" Height="55px"></asp:TextBox>
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
                                    <asp:TextBox ID="tbState" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Residential  Address - Latitude & Longitude (Google Map)
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId11" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Permanent Address with postal code 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId12" TextMode="MultiLine" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" placeholder="* Type you address here with Postal Code" runat="server" Height="55px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    My Vendor 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbVendor" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Education Status 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbEduStat" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
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
                                    <asp:TextBox ID="tbCertmark" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Highest Qualification
                                </th>
                                <td>
                                    <asp:TextBox ID="tbHighQual" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    College Name 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId13" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="45px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Previous Work Experience (in years)
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId14" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Designation in the previous Organisation 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId15" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Experience Certificates Available (Offer /Relieving Letter)
                                </th>
                                <td>
                                    <asp:TextBox ID="tbExpCert" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Last Organisation
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId16" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Market
                                </th>
                                <td>
                                    <asp:TextBox ID="tbMarket" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
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
                                     Role
                                </th>
                                <td>
                                    <asp:TextBox ID="tbRole" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Process
                                </th>
                                <td>
                                    <asp:TextBox ID="tbProcess" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
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
                                    <asp:TextBox ID="tbSSTrainers" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Technical Trainer Name
                                </th>
                                <td>
                                    <asp:TextBox ID="tbTechTrainers" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
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
                                    <asp:TextBox ID="tbMgr" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>

                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Manager's Email ID
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId21" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <br />
                            <br/>

                            <tr>
                                <th class="auto-style9">
                                     Government ID details<br />(Select the Govt IDs you have)
                                </th>
                                    
                                <td>
                                    <asp:TextBox ID="tbGovtID" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
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
                        <asp:Button ID="btnSubmit" CssClass="btnsub" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>
                </div>
            </div>
        </div>
        </div>
    </form>
    <p style="color:red;text-align:center;"> For any Technical assistance, contact Nikhil R (nikhil.r@hp.com)</p>
</body>
</html>
