<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="21_ADXLegendGL.aspx.cs" Inherits="Audit_Legends._21_ADXLegendGL" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>FY21 ADX Legend Guidelines</title>
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
        <h1><img src="Images/HP logoblu.png" style="width:98px;overflow:auto;float:initial;"/> FY21 ADX Legend Guidelines </h1>
    </div>

    <div style="text-align:right;height:80px;">
        <asp:Label ID="lblUserDetails" runat="server" ForeColor="White"></asp:Label>
        <asp:Button ID="btnLogout" CausesValidation="false" runat="server" Text="Logout" CssClass="MenuButtons" OnClick="btnLogout_Click" />
    </div>

    <div class="row" style="margin-left:100px;margin-top:20px;">
     


        <div class="col-sm-12" style="max-width:90%;text-align:center;margin-left:50px;margin-top:20px;margin-right:100px;font-size:medium;">
            
        <table id="table2" border="1"  style="background-color:white;align-items:center">
            <thead>
                <tr style="background-color:cornflowerblue;color:white">
                    <th scope="col" style="text-align:center;max-width:30%">Parameter</th>
                    
                    <th scope="col" class="gdlines" style="text-align:center;">Checklist</th>
                </tr>
            </thead>

            <tbody>

                <tr style="background-color:darkblue;color:white">
                    <th colspan="2" scope="col" style="text-align:center;">Process</th>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Opening</th>
                </tr>
                <tr>
                    <td >Did the engineer process/ action the case within the given time frame and acknowledged the customer’s issue?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer acknowledged and actioned the case well within the time frame.<br />
                        • <b>TAT Missed - </b>Engineer missed out on actioning the case within the agreed SLA of 2hrs. No relevant activity on case (engineer just adds some notes to meet TAT)<br />
                        • <b>Acknowledgement - </b> First email to customer needs to have acknowledgement about the case issue description instead of directly jumping to Probing – Troubleshooting. When case is assigned after cut off for dispatch, an acknowledgement email would have to be sent explaining to customer ownership of the case
                    </td>
                </tr>

                <tr style="background-color:darkblue;color:white">
                    <th colspan="2" scope="col" style="text-align:center;">Technical</th>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Probing</th>
                </tr>

                <tr>
                    <td>Did the Engineer probe with right questions to identify the issue?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer probed appropriately based on the Tools & Resources such as - WISE, Part surfer, SNR, E-Tracking/ BOE Score, Serial Number & Subassembly Tracker, My PIM, My PRS, available Softpacks, Advisories, SDI, Internally created information/ solution reference system, UEFI Diagnostics usage, Error code capture.<br />
                        • <b>Not Met - </b>Engineer missed out on probing as required to isolate the issue before starting with the troubleshooting (Structured approach). <br />
                        • <b>Partial - </b>Irrelevant / Incomplete probing was done by the Engineer. <br/>
                        • <b>NA - </b>No scope for probing. Customer had provided all the required details/ documents/ error code/ Failure ID etc.<br />
                    </td>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Troubleshooting</th>
                </tr>

                <tr>
                    <td>Did the Engineer logically troubleshoot the issue to reach the desired solution?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer used Tools such as - WISE, Part surfer, SNR, E-Tracking/ BOE Score, Serial Number & Subassembly Tracker, My PIM, My PRS, available Softpacks, Scripts, Advisories, SDI, Internally created information/ solution reference system, Designated seniors (Mentors, EMT, 2LS), UEFI Diagnostics Usage, Error code capture and  Other Tools, such as - LMI Live Lens, Consult Mentor/ Senior resources. <br />
                        • <b>Not Met - </b>Relevant troubleshooting steps were not provided to the customer which resulted in incomplete solution (missing out on possible First Case Resolution) or resulting in recurrence of the issue.<br />
                        • <b>Partial - </b>Irrelevant/ Incomplete troubleshooting was done by the Engineer. <br />
                        • <b>NA - </b>No scope for troubleshooting.  <br />
                    </td>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Solution / Resolution</th>
                </tr>
                
                <tr>
                    <td>Did the Engineer provide right resolution/ Information?</td>
                    <td class="gdlines">
                        • <b>Completed - </b>Resolution provided for the issue is correct & complete. <br />
                        • <b>Pending - </b>Resolution/ information for the issue/ query is pending (Further research required, waiting for sample from customer, L2 Elevation etc…) <br />
                        • <b>Delayed - </b>Engineer has delayed in providing complete information/ resolution (Fails to dispatch the case on SBD (Same Business Day), L2 Elevation, etc..)<br />
                        • <b>Missed - </b>Engineer missed to provide correct/ complete information, Part order, troubleshooting with the customer. 
                    </td>
                </tr>

                
                <tr style="background-color:darkblue;color:white">
                    <th colspan="2" scope="col" style="text-align:center;">Soft Skills</th>
                </tr>

                <tr>
                    <td>Behavioural skill opportunity</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer was professional during the interaction, acknowledged customer & educated wherever needed.<br />
                        • <b>MCSL - Matching Customer Skill Level - </b>Engineer needs to match customer’s skill level while interacting. For E.g. - If the customer is not tech savvy, Engineer should avoid using jargon & explain in simple terms. Objective is to make customer feel comfortable. <br />
                        • <b>Objection Handling - </b>Engineer needs to pay attention to what is being said and acknowledge the objection and provide alternate options. Engineer should not take customer’s objection personally. <br />
                        • <b>Professionalism - </b>Engineer should avoid displaying unprofessional behaviour with sarcastic/ abusive or confrontational language/ rude/ vulgar/ sexual comments/ slandering HP brand/ products/ speaking negative of competitors/ co-workers. Engineer needs to be respectful in his/her conversation with the customer. <br />
                        • <b>Courtesy/Empathy - </b>Engineer needs to showcase politeness in the attitude and behaviour towards customers. Engineer needs to make an attempt to empathize with the customer. Must understand what customer is feeling and see things from customer’s point of view. <br />
                        • <b>Educating Customer - </b>Engineer needs to educate the customer whenever there is an opportunity, unless the customer mentions that he does not need to know or does not have the time. Once the root cause is established, inform the customer about the cause of the issue. Detail the probable logical troubleshooting steps so that the customer is aware of what is being done. Seek customer’s agreement to proceed. <br />
                        • <b>Acknowledgement - </b>Engineer needs to acknowledge appropriately & adequately when needed during the conversation.<br />
                        • <b>NA - </b>NA - There was no opportunity for the said sub-parameter.
                    </td>
                </tr>

                <tr>
                    <td>Communication opportunity on email</td>
                    <td class="gdlines">
                        • <b>Met- </b>Engineer communicated with the customer in a grammatically correct language and tone of interaction and avoided usage of  jargons and abbreviations.  <br />
                        • <b>Usage of Preferred Language - </b>Engineers are advised to check the preferred language set by the customer on the 'Contact Card'. Do not use English when customer has other language preferred (Non-English Speaking Countries) Eg: Customer of Netherlands/ Belgium have Dutch, set as preferred language, use the relevant template in preferred language for response.<br />
                        • <b>Sentence structure/Grammar - </b>Engineers needs to communicate in a clear and correct Language. The written communication should be grammatically correct and should contain simple & complete sentences.  <br />
                        • <b>Attention to Details - </b>Engineer needs to respond to the customer with relevant details. Ensure to write clearly and have a structured approach.<br />
                        • <b>NA - </b>NA - There was no opportunity for the said sub-parameter.

                    </td>
                </tr>

                <tr>
                    <td>Communication opportunity on call</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer communicated with the customer in a grammatically correct language, tone of voice and rate of speech<br />
                        • <b>MTI (Mother tongue influence) - </b>Engineer needs to speak in a clear accent with correct pronunciation while avoiding mother tongue influence (MTI). This will help customer comprehend the information and avoid any repetitions from Engineer’s end. <br />
                        • <b>RoS(Rate of Speech)  - </b>Engineer needs to have a controlled rate of speech. A faster rate of speech will be difficult for the customers to understand and a slower, might cause boredom. <br />
                        • <b>Sentence structure/Grammar/ Language - </b>Engineer needs to communicate in a clear and correct Language. The written communication should be grammatically correct and should contain simple & complete sentences. <br />
                        • <b>Comprehension - </b>Engineer must understand what the customer is trying to say and respond in a way that customer is able to understand as well. <br />
                        • <b>Tone of Voice  - </b>Engineer needs to maintain a positive tone throughout the conversation. Should use polite and positive choice of words.<br />
                        • <b>Active Listening  - </b>Engineer needs to attentively listen while customer is speaking, paraphrase and reflect on what is being said. Do not interrupt or cut the flow.<br />
                        • <b>Disclaimer  - </b>Engineer needs to provide appropriate disclaimers wherever required. Ex. Backing up the data while shipping the PC for a repair, Retaining the printer accessories (cartridges & power cord) during printer replacement, while taking remote access on LMI/Live lens sessions, outbound call recording disclaimers etc.<br />
                        • <b>NA - </b>NA - There was no opportunity for the said sub-parameter.
                    </td>
                </tr>

                <tr style="background-color:darkblue;color:white">
                    <th colspan="2" scope="col" style="text-align:center;">Customer Excellence</th>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Setting Expectation</th>
                </tr>

                <tr>
                    <td>Did the Engineer set right expectations?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer fulfilled the criteria of setting the right expectations wherever needed. <br />
                        • <b>Did not set Expectations - </b>Engineer failed to set expectations whenever it was required. For e.g. - Defective part needs to be returned to HP, Data back-up when unit is collected for repair, Shipment of monitor , Docking station, printers - customer is to retain the consumable parts (cables/ cartridge, etc.)<br />
                        • <b>Incorrect Expectations - </b>Engineer failed to set the correct expectations whenever required. For e.g. -  incorrect TAT given for repair etc.. <br />
                        • <b>KCI - </b>Engineer needs to keep the customer informed about every move/ action/ effort taken during the course of case management/ interaction. If incorrect/ incomplete information, part order, troubleshooting is shared with the customer, the engineer needs to inform customer about the misses (if any) & assure the customer on the additional corrective actions taken towards solution.<br />
                        • <b>RDT India - </b>Failed to follow updated RDT process guidelines (India)
                    </td>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Case Ownership</th>
                </tr>

                <tr>
                    <td>Did the Engineer showcase ownership?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer took complete accountability & ownership of the customer’s issue until resolution is provided, appropriately escalated when required & followed-up on time as agreed with the customer. Also, providing all the customer requested information and additional information which was discussed during the proceedings of the case. Such as phone number, address, email address, website links, product details for the referred party. Service center address, phone number. Pickup & drop off location details with phone number if available.<br />
                        • <b>Delayed follow-up callback / emails - </b>Engineer failed to callback the customer as committed or the Emails from customer are not checked and actioned on time. <br />
                        • <b>Serial# history - </b>Serial# history/ Customer history should be checked as it might lead to duplication of services/ multiple engineers contacting customer<br />
                        • <b>Escalation Process - </b>Involving relevant team for the situation' eg. Part intervention when back ordered (MatEx); 2LS for repeated failure, CRT for Complaints<br />
                        • <b>Tools Usage - </b>LMI - Live Lens - Engineer needs to use the Remote Access option whenever there is a need and opportunity, guidelines need to be followed as defined.
Serial Number -  Engineer needs to guide the customer on how & from where to get the serial number and verify the same. 
Entitlement and PoP Validation - Correct entitlement is selected by checking for additional carepacks OTC changes to be made as per process (ex. 05D for ADP coverage). Unnecessary OTC changes to not be made 
Ensure CDAX tool usage is done correctly (ex. Trade template should be under sales offer, Invoice for warranty update should be attached under the asset etc.) 
PIN - Not validating PIN on Priority / Support1 / Service partner /Names Accounts call & updating the same in the PIN field in the case. 
Class Issue / WISE Usage - Engineer needs to adhere to the WISE advisories for Class Issues defined as per the process. 
Defined Article is followed but not attached under the Knowledge & Attachment section on the case (Article number is documented in the case notes) 
Ease of Effort - Engineer needs to check the customer’s contact details or history & verify the information rather than asking customer to provide it (Applicable only if there is an existing customer account). Avoid repeating the troubleshooting steps on a repeat interaction. 
Engineer must adapt to best practices on case to ensure customer's experience is effortless.
                    </td>
                </tr>

                <tr style="background-color:darkblue;color:white">
                    <th colspan="2" scope="col" style="text-align:center;">Documentation</th>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Case Handling</th>
                </tr>

                <tr>
                    <td>Did the Engineer document conversation details accurately? </td>
                    <td class="gdlines"> 
                        • <b>Met - </b>Engineer has fulfilled all the criteria. 
                        • <b>Fabrication - </b>Engineer has fabricated the case documentation to suit the resolution<br />
                        • <b>No Documentation - </b>Engineer failed to document any information in the Case<br />
                        • <b>Partial - </b>Engineer failed to document complete notes/information on the case<br />
                        • <b>Usage of Relevant templates - </b>Engineers needs to adhere to and use relevant templates on case-to-case basis. E.g. - WO Template, GN Template, Trade Template, CRT template, Elevations template, etc.
                    </td>
                </tr>

                <tr style="background-color:white;color:red">
                    <th colspan="2" scope="col" style="text-align:center;">Compliance</th>
                </tr>

                <tr>
                    <td>Compliance Adhered?</td>
                    <td class="gdlines">
                        • <b>Yes - </b>Audit is compliant to the process.

If there is any compliance issue, the audit would be considered as failed, and the score would change to 0%. <br />
                        • <b>No</b>NCLF (No Case Log Found)/ Incomplete/ Documentation <br />
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

                <tr style="background-color:dimgray;color:white">
                    <th colspan="2" scope="col" style="text-align:center;">Tracking Questions</th>
                </tr>

                <tr>
                    <td>Engineer provided WOW experience /DAB</td>
                    <td class="gdlines">
                        • <b>Met- </b>The Absolute Best Email/ Call. Provided exceptional support and showcased customer obsessed behavior. <br />
                        • <b>NA - </b>Missed out on exhibiting customer obsessed behavior. 
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