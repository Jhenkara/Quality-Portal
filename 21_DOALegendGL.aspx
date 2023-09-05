<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="21_DOALegendGL.aspx.cs" Inherits="Audit_Legends._21_DOALegendGL" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>DOA Legend Guidelines</title>
    <link rel="shortcut icon" href="Images/HP logoblu.png"  />

        <!--Bootstrap CSS CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
        <link href="PersonaVoiceLegend.css" rel="stylesheet" type="text/css" />
         <!-- Font Awesome JS -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
        <script type="text/javascript" src="AuditFormVoiceLegendComm.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <style type="text/css">
            .auto-style1 {
                width: 100%;
            }
            .auto-style2 {
                margin-left: 698px;
            }
        </style>
</head>
<body style="background-image:url('images/guidelines.jpg');">

    <script type="text/javascript">
        $(function () {
            $("#tbId4").datepicker(null);
        });
    </script>

    <form id="form1" runat="server">
        <%--Top Form--%>
    <div class="auto-style1" style="color:aliceblue;background-color:black;text-align:left;line-height:100px;max-width:100%">
        <%--<img src="hp_logo_black.jpeg" style="width:100px;overflow:auto;float:left"/>--%>
        <h1><img src="Images/HP logoblu.png" style="width:98px;overflow:auto;float:initial;"/> DOA Legend Guidelines </h1>
    </div>

    <div style="text-align:right;height:80px;">
        <asp:Label ID="lblUserDetails" runat="server" ForeColor="White"></asp:Label>
        <asp:Button ID="btnLogout" CausesValidation="false" runat="server" Text="Logout" CssClass="MenuButtons" OnClick="btnLogout_Click1" />
    </div>

    <div class="row" style="margin-left:100px;margin-top:20px;">
     


        <div class="col-sm-12" style="max-width:90%;text-align:center;margin-left:50px;margin-top:20px;margin-right:100px;font-size:medium;">
            
        <table id="table2" border="1"  style="background-color:white;align-items:center">
            <thead>
                <tr style="background-color:cornflowerblue;color:white">
                    <th scope="col" style="text-align:center;max-width:30%">Parameter</th>
                    
                    <th scope="col" class="gdlines" style="text-align:center;">Checklist</th>
                    
                    <th scope="col" class="gdlines" style="text-align:center;">Guidelines</th>
                </tr>
            </thead>

            <tbody>

                <tr>
                    <td >Did the Engineer go through the case summary before actioning  the case ?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer has studied and understood the case summary before contacting customers / actioning the case<br />
                        • <b>Not Met - </b>Engineer has not studied and understood the case summary before contacting customer / actioning the case
                    </td>
                    <td>
                        Engineer needs to introduce himself/ herself by name/ pseudo name within 5 seconds of call opening.
                    </td>
                </tr>

                <tr>
                    <td>Was the case actioned within  TAT/ SL ?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer acknowledged and actioned the case well within the time frame.<br />
                        • <b>Not Met - </b>Engineer missed out on actioning the case within the agreed SLA. No relevant activity on case (engineer just adds some notes to meet TAT)
                    </td>
                    <td>
                        Engineer needs to use the right HP Branding while opening the Call.
                    </td>
                </tr>

                <tr>
                    <td>Was the case actioned appropriately ?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Resolution provided for the case is correct & complete.<br />
                        • <b>Not Met - </b>Engineer missed to action the case correctly  / provide correct resolution
                    </td>
                    <td>
                        Engineer needs to acknowledge his/ her understanding of the issue.  
                    </td>
                </tr>

                <tr>
                    <td>Has the case been documented / logged correctly ?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Case documentation was complete, accurate and updated on the share if required<br />
                        • <b>Not Met - </b>Engineer fails to update and document all relevant information in the case and share point
                    </td>
                    <td>
                        Engineer needs to pay attention to every detail, recognize customer's emotions, act promptly and reassure the customer on reaching a positive outcome.
                    </td>
                </tr>
                
                <tr>
                    <td>Did the Engineer follow the correct call Opening and closing procedure ?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer used the correct opening / closing script with right HP Branding. Acknowldedge and confirm the the issue based on customer's conversation<br />
                        • <b>Not Met - </b>Engineer missed out on the above parameter
                    </td>
                    <td>
                        Engineer needs to use the Remote Access option whenever there is a need and opportunity. Using any third-party remote access tool will lead to a mark-down.
                    </td>
                </tr>

                <tr>
                    <td>Was the language & communication satisfactory on the e-mail / WhatsApp / call?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer communicated with the customer in a grammatically correct language and tone of interaction and avoided usage of jargons and abbreviations. Engineers needs to communicate in a clear and correct Language. The written communication should be grammatically correct and should contain simple & complete sentences.<br />
                        • <b>Not Met - </b>Engineer failed to follow any of the above guidelines
                    </td>
                    <td>
                        Engineer needs to guide the customer on how & from where to get the serial number and verify the same. 
                    </td>
                </tr>

                <tr>
                    <td>Did Eng follow-up with customer to confirm the resolution / address and contact details ?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Follow-up call has been done as required and resolution confirmation done with customer. 
Engineer collected all the required information, offered call back whenever required, documented & called back the customer (including call disconnect).<br />
                        • <b>Not Met - </b>Engineer failed to follow any of the above guidelines
                    </td>
                    <td>
                        Correct entitlement is selected by checking for additional carepacks OTC changes to be made as per process (ex. 05D for ADP coverage) Ensure CDAX tool usage is done correctly (ex. Trade template should be under sales offer, Invoice for warranty update should be attached under the asset etc.)
                    </td>
                </tr>

                <tr>
                    <td>Was Last activity met on the case?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Case was actioned / followed / updated within 4 business days, if applicable<br />
                        • <b>Rapport Building - </b>Engineer failed to follow any of the above guidelines
                    </td>
                    <td>
                        Not validating PIN on Priority / Support1 / Service partner /Named Accounts call & updating the same in the PIN field in the case.
                    </td>
                </tr>
                <tr style="background-color:white;color:red">
                    <th colspan="3" scope="col" style="text-align:center;">Compliance</th>
                </tr>

                <tr>
                    <td>Compliance Adhered?</td>
                    <td class="gdlines">
                        • <b>Yes - </b>Audit is compliant to the process.

If there is any compliance issue, the audit would be considered as failed, and the score would change to 0%.  <br />
                        • <b>No</b> NCLF (No Case Log Found)/ Incomplete/ Documentation <br />
Ownership<br />
Incomplete/ Incorrect resolution<br />
Rude/ Unprofessional behavior<br />
NPS (Non-Proliferation Screening)/ RPL (Restricted Party List)<br />
Wrong email address<br />
Defect closure<br />
Survey solicitation<br />
Call disconnect<br />
PCI (Payment Card Industry)<br />
ACL (Australian Consumer Law)<br />

                    </td>
                </tr>
            </tbody>
        </table>
            <br /><br /><br />
    </div>
    </div>
    </form>    
</body>
</html>

