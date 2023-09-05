<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditSheetTLCEM.aspx.cs" Inherits="Audit_Legends.AuditSheetTLCEM" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>CEM Legend</title>
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
        <h1><img src="HP-blue.png" style="width:98px;overflow:auto;float:initial;"/> CEM Legend </h1>
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
                    Persona Idetified as :
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
                    <th colspan="2">Criteria</th>
                    
                    <th scope="col">Checklist</th>

                    <th scope="col">Scoring</th>
                </tr>
            </thead>

            <tbody>

                <tr style="text-align:center;background-color:darkgray;color:white">
                    <th>A</th>
                    <th colspan="3" style="text-align:center">Customer Affecting critical </th>
                </tr>

                <tr>
                    <td>A1</td>
                    <th>Initial Contact</th>
                    <td>Proper Introduction and answered the call in the first 5 secs | CM properly introduced themselves | Handshake email sent | CM made initial engagement within 4 hours of complaint assignment</td>
                    <td>
                        <asp:TextBox ID="ddv1" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A2</td>
                    <th>Empathy</th>
                    <td>Built rapport with the CU, treat interaction as unique situation | Shows empathy and acknowledges the customers situation. Transmit sincerity. Use positive phrases to deescalate; let customers vent. </td>
                    <td>
                        <asp:TextBox ID="ddv2" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A3</td>
                    <th>Positive Position</th>
                    <td>Positive position HP as a company, HP products and other departments/agents | Positive position solution being offered</td>
                    <td>
                        <asp:TextBox ID="ddv3" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A4</td>
                    <th>Professionalism</th>
                    <td>Any noticeable lack of contact center professionalism directly impacting customer and issue resolution | Keep professional attitude on regards other department and agents | CM did not use internal jargon unknown by the CU or provide Customer with internal processes | Commanding or argumentative language/ attitude such as sarcasm, being negative or condescending towards the CU | Do not engage in heated fights | Lack of Courtesy, Overt Rudeness</td>
                    <td>
                        <asp:TextBox ID="ddv4" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A5</td>
                    <th>Ownership</th>
                    <td>Lack of interest to solve issue | Case Manager takes possession of the end to end case | Summarize the events of the conversation | Providing the customer with next necessary actions/steps</td>
                    <td>
                        <asp:TextBox ID="ddv5" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A6</td>
                    <th>Proper Communication skills</th>
                    <td>Proper call and/or email processes(Hold, Dead air, mute) | Active Listening | CM used correct approach and call flow based on escalation type | Effective Case/ Call handling | Proper language and grammar in CU communication either phone or email (etiquette/professionalism). CM personalized email templates with complaint information where required</td>
                    <td>
                        <asp:TextBox ID="ddv6" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A7</td>
                    <th>Resolution TAT</th>
                    <td>Followed TAT stablished by business for complaint resolution. No unnecessary delays to offer solution or execute agreements</td>
                    <td>
                        <asp:TextBox ID="ddv7" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A8</td>
                    <th>Keeping CU informed</th>
                    <td>CM must ensure CU is aware of complaint status at all times. Set expectations during every interaction, set next follow up time based on Customer's need and urgency and get agreement from CU for next follow up date and time. If Follow up is not being set via phone, CM must notify CU of future callbacks & upcoming emails via email and/or voicemail to set proper expectations. All scheduled/promised follow up must be completed  and documented accordingly in the CB scheduler. |  Includes but not limited to CM providing their contact information (Verbally/email).</td>
                    <td>
                        <asp:TextBox ID="ddv8" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>A9</td>
                    <th>Issue Resolution</th>
                    <td>Reasonable solution given based on customer needs, HP guidelines, procedures and document exceptions. CM explained disclaimers and steps of solution being provided.</td>
                    <td>
                        <asp:TextBox ID="ddv9" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr style="text-align:center;background-color:darkgray;color:white">
                    <th>B</th>
                    <th colspan="3" style="text-align:center">Business Affecting Critical</th>
                </tr>

                <tr>
                    <td>B1</td>
                    <th>Executive Escalations</th>
                    <td>Best attempt to avoid Executive escalations - Follow escalation path and engage ECM if necessary. Denied to escalate to higher authority. Is CM proactively escalating at risk scenarios, potential escapes, etc…</td>
                    <td>
                        <asp:TextBox ID="ddv10" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>B2</td>
                    <th>Ability to identify issue for resolution</th>
                    <td>Gather symptoms, perform due case research, ask tactful probing questions | Use available tools and resources and demonstrate product knowledge | Offer second opinion or send the CPL for review , if applicable.</td>
                    <td>
                        <asp:TextBox ID="ddv11" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>B3</td>
                    <th>Proper Customer Verification </th>
                    <td>Confirm customer data, name, email, phone, address and Case/Complaint #* and performs any necessary updates in system</td>
                    <td>
                        <asp:TextBox ID="ddv12" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>B4</td>
                    <th>Negotiation Skills</th>
                    <td>CM followed before I do this have I tried this matrix | Negotiate with the customer to accept a solution | Did the Case Manager attempt to negotiate for customer's demands?Did the CM apply creative thinking and searched for a solution based on the Customer's unique situation |  Offer the primary solution, but also a secondary solution in case primary solution is not accepted. Negotiate with the customer to convince them of accept the primary solution but, if necessary, check the case with management for a second opinion</td>
                    <td>
                        <asp:TextBox ID="ddv13" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>B5</td>
                    <th>Closure</th>
                    <td>Confirmed with CU before complaint closure and how to manage future contacts | Asked the customer if there are any other questions or concerns | Followed correct closure process (closed any pending activities in CDAX/Newton) | Thanked the customer for their time, being a HP customer, etc</td>
                    <td>
                        <asp:TextBox ID="ddv14" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>B6</td>
                    <th>Complaint Documentation</th>
                    <td>Enter complete ,correct complaint notes using the appropriate format | Justification documented properly including What & Why | Correct information for Order Processors/Approvers * | Include all required information for order to be processed; Attachments, approvals, etc.…* | Correctly populate required complaint fields such as Complaint Analysis, Complaint Solution and template if necessary | Detailed and chronological order of events | Any offers made to cu in detail and acceptance made by CU to the offers. *</td>
                    <td>
                        <asp:TextBox ID="ddv15" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <%--Tracking Questions--%>

                <tr>
                    <th colspan="5" style="text-align:center;background-color:cornflowerblue;color:white">Tracking Questions</th>
                </tr>

                <tr style="text-align:center;background-color:darkorange;color:white">
                    <th>C</th>
                    <th colspan="3" style="text-align:center">Compliance Critical</th>
                </tr>

                <tr>
                    <td>C1</td>
                    <th>RPL/NPS</th>
                    <td>Only process that affects HP Global trade </td>
                    <td>
                        <asp:TextBox ID="ddv16" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>C2</td>
                    <th>Integrity at HP</th>
                    <td>Any evidence that interaction is affected by complete lack of Professionalism and does not reflect HP Values according to the Behavior Continuum.  Survey Avoidance or manipulation. Evident misuse of customer personal, company information for personal gain (Credit Card fraud -Any security risk for customer)</td>
                    <td>
                        <asp:TextBox ID="ddv17" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr style="text-align:center;background-color:darkorange;color:white">
                    <th>D</th>
                    <th colspan="3" style="text-align:center">Problem Solution Informative</th>
                </tr>

                <tr>
                    <td>D1</td>
                    <th>Escalation Accuracy</th>
                    <td>~</td>
                    <td>
                        <asp:TextBox ID="ddv18" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr style="text-align:center;background-color:darkorange;color:white">
                    <th>E</th>
                    <th colspan="3" style="text-align:center">Issue Resolution</th>
                </tr>

                <tr>
                    <td>E1</td>
                    <th>Issue Resolved</th>
                    <td>~</td>
                    <td>
                        <asp:TextBox ID="ddv19" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                    </td>
                </tr>                
            </tbody>
        </table>
    </div>
    </div>
    </form>   
</body>
</html>
