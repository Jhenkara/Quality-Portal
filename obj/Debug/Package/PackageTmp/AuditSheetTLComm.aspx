<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditSheetTLComm.aspx.cs" Inherits="Audit_Legends.AuditSheetTLComm" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title> Commercial Legend</title>
    <link rel="shortcut icon" href="Images/HP logoblu.png"  />

        <!--Bootstrap CSS CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
        <link href="AuditSheetUser.css" rel="stylesheet" type="text/css" />
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

    <%--<script type="text/javascript">
        $(function () {
            $("#tbId4").datepicker(null);
        });
    </script>--%>

    <form id="form1" runat="server">
        <%--Top Form--%>
    <div class="auto-style1" style="color:aliceblue;background-color:black;text-align:left;line-height:100px;">
        <%--<img src="hp_logo_black.jpeg" style="width:100px;overflow:auto;float:left"/>--%>
        <h1><img src="HP-blue.png" style="width:98px;overflow:auto;float:initial;"/> Commercial Legend</h1>
    </div>

    <div style="text-align:right">
        <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    </div>

    <div class="row" style="margin-left:20px;margin-top:20px;">
        <div class="col-sm-10">
            <asp:HiddenField ID="hfv_empmail" runat="server" />
            <asp:HiddenField ID="hfv_todayDate" runat="server" />
            <asp:HiddenField ID="DateDiff" runat="server" />
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
                    <asp:TextBox ID="tbId2" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Business Unit 
                </th>
                <td>
                    <asp:TextBox ID="tbId3" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Delivery Type 
                </th>
                <td>
                    <asp:TextBox ID="tbId4" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Month 
                </th>
                <td>
                    <asp:TextBox ID="tbId5" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Employee ID 
                </th>
                <td>
                    <asp:TextBox ID="tbId6" CssClass="form-control" AutoPostBack="true" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Employee Name 
                </th>
                <td>
                    <asp:TextBox ID="tbId7" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Employee Mail
                </th>
                <td>
                    <asp:TextBox ID="tbId8" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Reporting Manager
                </th>
                <td>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Team Name
                </th>
                <td>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    CC Email
                </th>
                <td>
                    <asp:TextBox ID="tbId9" TextMode="MultiLine" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" placeholder="* For more than one email, seperate it with ';'" runat="server" Height="80px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Call Date 
                </th>
                <td>
                    <asp:TextBox ID="tbId10" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Evaluation Date : 
                </th>
                <td>
                    <asp:TextBox ID="tbId11" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" Enabled="false" runat="server" Height="25px" Width="300px"></asp:TextBox>
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
                    <asp:TextBox ID="tbId22" TextMode="MultiLine" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="160px" Width="320px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th style="width:300px;text-align:center">
                    Opportunities
                </th>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="tbId23" TextMode="MultiLine" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="160px" Width="320px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th style="height:50px;text-align:left;font-size:larger;"> 
                    Total Compliance :
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label id="TotalCompl" runat="server"></asp:Label>
                    <asp:HiddenField ID="Compliance" runat="server" />
                </th>
            </tr>

            <tr>
                <th style="height:50px;text-align:left;font-size:larger;"> 
                    Customer Critical : 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:Label id="CustCrit" runat="server"></asp:Label>
                    <asp:HiddenField ID="hfv_CustCrit" runat="server" />
                </th>
            </tr>

            <tr>
                <th style="height:50px;text-align:left;font-size:larger;"> 
                    Business Critical : 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:Label id="BusCrit" runat="server"></asp:Label>
                    <asp:HiddenField ID="hfv_BusCrit" runat="server" />
                </th>
            </tr>
        </table>
        
        <table id="table4" style="float:left;margin-left:30px;position:center">
            <tr>
                <th>
                    Case Id 
                </th>
                <td>
                    <asp:TextBox ID="tbId12" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    CSO
                </th>
                <td>
                    <asp:TextBox ID="TextBox3" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Call Id/SR Id 
                </th>
                <td>
                    <asp:TextBox ID="tbId13" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Call Duration
                </th>
                <td>
                    <asp:TextBox ID="tbId14" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Case Type 
                </th>
                <td>
                    <asp:TextBox ID="tbId15" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Problem Description 
                </th>
                <td>
                    <asp:TextBox ID="tbId16" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Product Line
                </th>
                <td>
                    <asp:TextBox ID="tbId17" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <%--<tr>
                <th>
                    Audit No.
                </th>
                <td>
                    <asp:TextBox ID="tbId18" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>--%>

            <tr>
                <th>
                    CXI Idetified as :
                </th>
                <td>
                    <asp:TextBox ID="tbId19" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>
                
            <tr>
                <th>
                    Proficiency Level
                </th>
                <td>
                    <asp:TextBox ID="tbId20" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Prediction
                </th>
                <td>
                    <asp:TextBox ID="tbId21" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Non-Compliance
                </th>
                <td>
                    <asp:TextBox ID="tbId24" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Non-Compliance<br />
                    Detail
                </th>
                <td>
                    <asp:TextBox ID="tbId25" TextMode="MultiLine" CssClass="form-control" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" placeholder="" runat="server" Height="60px" Width="300px"></asp:TextBox>
                </td>
            </tr>
        </table>

        
    </div>
    <br />
    <br />


        <div class="col-sm-12" style="max-width:90%;text-align:center;margin-top:20px;float:left;font-size:medium;">
        <table id="table2" border="1">
            <thead>
                <tr style="text-align:center;background-color:cornflowerblue;color:white">
                    <th colspan="2">Parameter</th>
                    
                    <th scope="col">Checklist</th>

                    <th scope="col">Scoring</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <th rowspan="2" scope="rowgroup">Ease of Effort</th>
                    <td>Effortless Experience</td>
                    <td>Gathered information effortlessly (Customer/unit info/Case History)<br />
                        Address all customer’s issues/collecting irrelevant customer’s information/sharing all relevant information
                    </td>
                    <td><asp:TextBox ID="ddv1" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Effective CRM utilization	</td>
                    <td>Raised request accordingly (ARM/POP/SWOP/Escalate/Follow-up/Create a Call-back event), Accurate selection of Symptom codes, Attach WISE docs used</td>
                    <td><asp:TextBox ID="ddv2" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr>

                <tr>
                    <th rowspan="2" scope="rowgroup">Speed of Resolution</th>
                    <td>FCR</td>
                    <td>Perform all relevant steps pertaining to issue resolution
                            - If the issue cannot be fixed on that call and requires multiple interactions – NA<br />
                            - If any step that could lead to issue resolution is missed – NO<br />
                            - If all possible actions/Troubleshooting Steps are taken and issue is resolved – YES
                    </td>
                    <td><asp:TextBox ID="ddv3" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Demonstrate a sense of Urgency</td>
                    <td>Procrastination or Inordinate Delay</td>
                    <td><asp:TextBox ID="ddv4" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr>

                <tr>
                    <th rowspan="2" scope="rowgroup">Tech Ability</th>
                    <td>Effective probing</td>
                    <td>Asked the logical questions</td>
                    <td><asp:TextBox ID="ddv5" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Logical approach and trouble shooting steps</td>
                    <td>Engineer was aware of the Product and Utilized HP Support options effectively (LMI/Support Website/YouTube)</td>
                    <td><asp:TextBox ID="ddv6" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr>

                <tr>
                    <th rowspan="2" scope="rowgroup">Communication</th>
                    <td>Customer Handling skills</td>
                    <td>Active Listening/Attentiveness/Keep customers informed-Educate actions taken (Order Placing/Service TAT/Part Backlogs/ Shipping Process/Delays)/ Offering call-back when required (Ownership)/Assurance/ Acknowledgement/ Positive Positioning Tone (Impacts customer experience)/Willingness to assist/Denied escalation/Sarcastic/Inappropriate responses Pronunciation/Spelling-Punctuation, Grammar, Choice of words, Sentence Construction, Upper Case letter used (3 Error Threshold or Customer Impact)</td>
                    <td><asp:TextBox ID="ddv7" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Positive Language</td>
                    <td>Using positive words and positive attitude in language</td>
                    <td><asp:TextBox ID="ddv8" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr>

                <tr>
                    <th rowspan="2" scope="rowgroup">Professionalism</th>
                    <td>Dereliction of Duty</td>
                    <td>Adherence of Hold & Mute Policy/Call-back schedule adherence/Use of native language/Speaking without placing customer on hold or mute</td>
                    <td><asp:TextBox ID="ddv9" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Compliance</td>
                    <td>100% documentation on call/chat/email customer interaction (if Outlook is used) , Capturing relevant information to create case (Email Address/Shipping Address/Contact Number/Unit Details), Adhering to Resolution /Closure Code guideline, Sarcastic behaviour, Abusive/Confrontational language, Rude/Vulgar/Sexual Comments, Slandering HP brand/Products/Speaking negative of competitors/Co-workers, Survey solicitation, Disclaimers during LMI</td>
                    <td><asp:TextBox ID="ddv10" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr>

<%--                <tr>
                    <th rowspan="2" scope="rowgroup">CXI</th>
                    <td>Did the engineer identify the correct Persona and applied the right stroke? </td>
                    <td></td>
                    <td><asp:TextBox ID="ddv11" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Did the engineer access the customer experience and portray Perceptual Flexibility techniques?</td>
                    <td>•	If the engineer identified the customers state and related to the customer in such a way that we create a relational and physical context for communicating and dialoguing that provides a sense of safety, validity, care and respect – Yes<br />•	If the engineer missed on identifying either the customers state or did not pay attention to the key elements in the person’s communication – No </td>
                    <td><asp:TextBox ID="ddv12" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr>--%>

                <tr>
                    <th colspan="5" style="text-align:center;background-color:cornflowerblue;color:white">Tracking Questions</th>
                </tr>

                <%--Tracking Questions--%>

                <tr>
                    <th rowspan="7" scope="rowgroup">Tracking Questions</th>
                    <th>Stroke Application</th>
                    <td>Right Stroke Economy - Missed Opportunities</td>
                    <td><asp:TextBox ID="ddv13" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr>

                <tr>
                    <th>PCI - Compliance</th>
                    <td>The Engineer adhered to PCI guidelines (Pause and Play Recording)</td>
                    <td><asp:TextBox ID="ddv14" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr>

                <tr>
                    <th>Was there an opportunity for Pitch for Sales?</th>
                    <td></td>
                    <td><asp:TextBox ID="ddv15" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr>

                <tr>
                    <th>Was Sales pitch effective?</th>
                    <td></td>
                    <td><asp:TextBox ID="ddv16" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr>

                <tr>
                    <th>Was a Sales Offer created in CDAX?</th>
                    <td></td>
                    <td><asp:TextBox ID="ddv17" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr>
                
                <tr>
                    <th>Did the engineer request customer for picture (Picture of serial number of the part) to identify there is no fraudulent activity?</th>
                    <td></td>
                    <td><asp:TextBox ID="ddv18" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr> 

                <tr>
                    <th>Remote session - Did the engineer use any 3rd party software to take remote access?</th>
                    <td></td>
                    <td><asp:TextBox ID="ddv19" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox></td>
                </tr> 
            </tbody>
        </table>
    </div>
    </div>
    </form>

    
</body>
</html>
