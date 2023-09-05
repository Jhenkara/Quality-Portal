<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="21_SoMeLegendGL.aspx.cs" Inherits="Audit_Legends._21_SoMeLegendGL" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>FY21 SoMe Legend Guidelines</title>
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
        <h1><img src="Images/HP logoblu.png" style="width:98px;overflow:auto;float:initial;"/> FY21 SoMe Legend Guidelines </h1>
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
                    <th colspan="2" scope="col" style="text-align:center;">Opening</th>
                </tr>
                <tr>
                    <td >Did the Engineer comprehend the customer's issue correctly, acknowledge the issue & assured to assist?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer used the correct opening script with right HP Branding as defined in WISE. 
Comprehended & paraphrased/ acknowledged the issue. Confirmed that he/ she followed the customer's conversation. 
Script: “Welcome to HP Support. My name is 'Tony’. I will be your technical support specialist, today”
<br />
                        • <b>Introduction - </b>Engineer needs to introduce himself/ herself by name/ pseudo name.<br />
                        • <b>HP Branding - </b>Engineer needs to use the right HP Branding while opening the Call.<br />
                        • <b>Paraphrasing - </b>Engineer needs to acknowledge his/ her understanding of the issue.<br />
                        • <b>Assurance - </b>Engineer needs to pay attention to every detail, recognize customer's emotions, act promptly and reassure the customer on reaching a positive outcome.<br />
                        • <b>KYC Info - </b>Engineer needs to confirm the below details on every fresh chat (not required on repeat chat/chats were customer comes for an update):<br /> &nbsp;&nbsp;&nbsp; Sl. No./Product details: <br />
&nbsp;&nbsp;&nbsp;Contact number:<br />
&nbsp;&nbsp;&nbsp;Alternative number:<br />
&nbsp;&nbsp;&nbsp;Email ID:<br />
&nbsp;&nbsp;&nbsp;Country:<br />

                    </td>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Tool Usage</th>
                </tr>

                <tr>
                    <td>Did the Engineer use the available data/tools/resources to enhance customer experience?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer made appropriate use of tools to improve customer experience, made it easy to collect serial number, avoided repetitive questions to gather information.<br />
                        • <b>LMI - Live Lens - </b>Engineer needs to use the Remote Access option whenever there is a need and opportunity. Using any third-party remote access tool will lead to a mark-down.<br />
                        • <b>Serial Number - </b>Engineer needs to guide the customer on how & from where to get the serial number and verify the same. <br />
                        • <b>Entitement and PoP Validation - </b>Correct entitlement is selected by checking for additional Care pack. OTC changes to be made as per process (ex. 05D for ADP coverage) Ensure CDAX tool usage is done correctly (ex. Trade template should be under sales offer, Invoice for warranty update should be attached under the asset etc.). Follow the defined process for OTC changes (ex. Trade cases: 01-T OTC is changed by trade team and not CC) <br />
                        • <b>Class Issue - </b>Engineer needs to adhere to the WISE advisories for Class Issues defined as per the process.<br />
                        • <b>Ease of Effort - </b>Engineer needs to check the customer’s contact details or history & verify the information rather than asking customer to provide it (Applicable only if there is an existing customer account). Avoid repeating the troubleshooting steps on a repeat interaction. Engineer must adapt to best practices on call to ensure customer's experience is effortless.<br />
                        • <b>Contact Linking on Chats - </b>Engineer must create contact card with necessary and link the conversation to that contact card. • NA - Applicable for chats where above parameters are not applicable.
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
                        • <b>Partial - </b>Irrelevant/ Incomplete probing was done by the Engineer.<br/>
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
                        • <b>Partial - </b>Irrelevant/ Incomplete troubleshooting was done by the Engineer.<br />
                        • <b>NA - </b>No scope for troubleshooting. <br />
                    </td>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Solution / Resolution</th>
                </tr>
                
                <tr>
                    <td>Did the Engineer provide right resolution/ Information?</td>
                    <td class="gdlines">
                        • <b>Completed - </b>Resolution provided for the issue is correct & complete. <br />
                        • <b>Pending - </b>Resolution/ information for the issue/ query is pending (Further research required, waiting for sample from customer, L2 Elevation etc…)<br />
                        • <b>Delayed - </b>Engineer has delayed in providing complete information/ resolution (Fails to dispatch the case on SBD (Same Business Day), L2 Elevation, etc..)<br />
                        • <b>Missed - </b>Engineer missed to provide correct/ complete information, Part order, troubleshooting with the customer.
                    </td>
                </tr>

                <tr style="background-color:darkblue;color:white">
                    <th colspan="2" scope="col" style="text-align:center;">Soft Skills</th>
                </tr>

                <tr>
                    <td>Behavioural skill opportunity?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer was professional during the interaction, acknowledged customer & educated wherever needed.<br />
                        • <b>MCSL - Matching Customer Skill Level - </b>Engineer needs to match customer’s skill level while interacting. 
For E.g. - If the customer is not tech savvy, Engineer should avoid using jargon & explain in simple terms. Objective is to make customer feel comfortable. <br />
                        • <b>Objection Handling - </b>Engineer needs to pay attention to what is being said and acknowledge the objection and provide alternate options. Engineer should not take customer’s objection personally.<br />
                        • <b>Attention to details - </b>Engineer needs to pay attention to every detail, recognize customer's emotions, act  promptly and reassure the customer on reaching a positive outcome. Engineer needs to respond to the customer with relevant details. Ensure to write clearly and have a structured approach. For non-English customers, ensuring the support is provided in the customer’s preferred language.<br />
                        • <b>Educating Customer - </b>Engineer needs to educate the customer whenever there is an opportunity, unless the customer mentions that he does not need to know or does not have the time. Once the root cause is established, inform the customer about the cause of the issue. Detail the probable logical troubleshooting steps so that the customer is aware of what is being done. Seek customer’s agreement to proceed.<br />
                        • <b>Acknowledgement - </b>Engineer needs to acknowledge appropriately & adequately when needed during the conversation.<br />
                        • <b>NA - </b>NA - There was no opportunity for the said sub-parameter.
                    </td>
                </tr>

                <tr>
                    <td>Written Communication opportunity?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer communicated with the customer in a grammatically correct language and tone of interaction, avoided usage of  jargons and abbreviations. <br />
                        • <b>Communication/ Language - </b>Engineers needs to communicate in a clear and correct Language. The written communication should be grammatically correct and should contain simple & complete sentences. <br />
                        • <b>Abbreviations, Jargons - </b>Engineer should avoid the usage of short forms, for e.g. - u, ur, etc.… or Jargons such as BIOS, UEFI, EWS, etc…<br />
                        • <b>Comprehension - </b>Engineer must understand what the customer is trying to explain and respond in a way that customer is able to understand as well. <br />
                        • <b>Formatting - </b>Engineer must properly construct paragraphs and/or troubleshooting with step-by-step instructions. For Twitter, HP Support Community, Facebook public posts, engineers need to use the correct 'tagging' or use '@' to address the customer. Should not use strong language and keep your sentences precise<br />
                        • <b>NA - </b>NA - There was no opportunity for the said sub-parameter.
                        </td>
                </tr>

                <tr>
                    <td>Customer Obsessed Behaviour?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer displayed a structured approach while communicating with the customer that included courtesy, empathy and assurance. <br />
                        • <b>Structured Approach - </b>The Engineer needs to follow a structure (Opening + Middle + Closure) while replying to the customer.<br />
                        • <b>Courtesy - </b>Engineer needs to showcase politeness in their attitude and behaviour towards customers. <br />
                        • <b>Empathy - </b>Engineer needs to make an attempt to empathize with the customer. Must understand what customer is feeling and see things from their point of view.<br />
                        • <b>Rapport building - </b>Engineer needs to build rapport with the customer whenever there is an opportunity. For E.g. – Customer is friendly and talkative, Engineer should use this opportunity to build a rapport and make customer more comfortable. Engineer must pay attention to every detail, recognize customer's emotions, act promptly and reassure the customer on reaching a positive outcome.<br />
                        • <b>Personalized Approach - </b>Engineer needs to build rapport, avoid scripted language and keep the conversation interactive. Address the customer by her/his First Name [As per Customer's discretion]<br />
                        • <b>Assurance - </b>Engineer must provide a positive declaration intended to give confidence to the customer about the resolution. <br />
                        • <b>NA - </b>NA - There was no opportunity for the said sub-parameter.
                    </td>
                </tr>

                <tr style="background-color:darkblue;color:white">
                    <th colspan="2" scope="col" style="text-align:center;">Customer Excellence</th>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Case Follow Up</th>
                </tr>

                <tr>
                    <td>Did the Engineer adhere to follow-up process?</td>
                    <td class="gdlines">   
                        • <b>Met - </b>Engineer has done necessary follow-ups<br />
                        • <b>Snooze - </b>Engineer did not follow the snooze process as per the process guidelines.<br />
                        • <b>Follow up - </b>Engineer has failed to do regular follow up.<br />
                        • <b>NA - </b>Engineer did not have any opportunity for follow-up
                    </td>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Case Ownership</th>
                </tr>

                <tr>
                    <td>Did the Engineer showcased ownership/ escalated the conversation if required?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer took complete responsibility of the issue in providing end to end resolution. Set the right expectations, kept the customer informed about the proceedings on the case and escalated the issue wherever applicable. <br />
                        • <b>Expecatation Setting - </b>Engineer needs to set right expectations whenever it is required. E.g. - While arranging service, long time required for research, process requirements, defective part needs to be returned to HP, Data back-up when unit is collected for a repair, etc. <br />
                        • <b>External Source - </b>Engineer should not share a third-party link with the customer. Cite your sources. All links and information should be from HP or from HP partners such as Microsoft, Intel, Apple etc. Don’t share inappropriate materials or links to customer’s E-mail or to their Social Media account etc.<br />
                        • <b>Escalation Process - </b>Engineer needs to follow the escalation/ elevation process wherever applicable. <br />
                        • <b>Timely Response - </b>Engineer must respond to the customer within the SLA.
                    </td>
                </tr>

                <tr style="background-color:darkblue;color:white">
                    <th colspan="2" scope="col" style="text-align:center;">Process</th>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Case / Call Logging</th>
                </tr>

                <tr>
                    <td>Did the Engineer adhere to the case logging process and documented conversation details accurately?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer fulfilled all the criteria. <br />
                        • <b>Documentation - </b>Engineer needs to ensure all the important details are captured; correct/ complete templates are used. The CDAX case is closed with the right closure code.<br />
                        • <b>Annotation - </b>Engineer needs to summarize the conversation before closing the case. <br />
                        • <b>Case linking - </b>Engineer needs to ensure the conversation is linked to the correct customer card/ CDAX case.<br />
                        • <b>Survey Link - </b>Engineer must send correct survey link and survey ID during the conversation closure.<br />
                        • <b>Product & Contact Information - </b>Engineer needs to capture complete product & contact details to have a CDAX case logged/ CSO created. 
                    </td>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Closing</th>
                </tr>

                <tr>
                    <td>Did the Engineer summarize the interaction, offer additional assistance, & close it appropriately?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer closed the chat on a positive note by providing solution to the customer. Offered additional assistance, closed with HP branding. Provided Chat re-log link E.g.; Proactively provided service center phone numbers on dispatch cases. <br />
                        • <b>Offer Additional assistance - </b>Chat was closed without offering any additional assistance/chat re-log link was not provided.<br />
                        • <b>HP Branding - </b>Engineer missed out on HP Branding.<br />
                        • <b>NA - </b>No scope For e.g. - customer ended the conversation abruptly/ chat got disconnected due to network/ VPN issue etc.  <br />
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
Rude/ Unprofessional behaviour<br />
NPS (Non-Proliferation Screening)/ RPL (Restricted Party List)<br />
Wrong email address<br />
Defect closure<br />
Survey solicitation<br />
Call disconnect<br />
PCI (Payment Card Industry)<br />
ACL (Australian Consumer Law)

                    </td>
                </tr>

                <tr style="background-color:dimgray;color:white">
                    <th colspan="2" scope="col" style="text-align:center;">Tracking Questions</th>
                </tr>

                <tr>
                    <td>Engineer provided WOW experience /DAB</td>
                    <td class="gdlines">
                        • <b>Met- </b>The Absolute Best interaction. Provided exceptional support and showcased customer obsessed behaviour. <br />
                        • <b>NA - </b>Missed out on exhibiting customer obsessed behaviour. 
                    </td>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">SAPOS</th>
                </tr>

                <tr>
                    <td>Did the engineer offer the right product/ Service?</td>
                    <td class="gdlines">
                        • <b>NA - </b>There was no opportunity to make sales offer<br />
                        • <b>Did not Offer - </b>Engineer fails to offer SAPOS when there was an opportunity<br />
                        • <b>Offered - </b>Engineer makes an offer for SAPOS<br />
                        • <b>Wrong Offer - </b>Engineer makes an offer. However, not for an appropriate product/ service. Offer was made only to fulfil the parameter.
                    </td>
                </tr>

                <tr>
                    <td>Was the Sales pitch effective?</td>
                    <td class="gdlines">
                        • <b>Met </b>Engineer’s sales pitch qualifies as a genuine attempt.<br />
                        • <b>Not Met </b>Engineer’s sales pitch does not qualify as a genuine attempt<br />
                        • <b>NA </b>There was no opportunity to make a sales offer.
                    </td>

                </tr>

                <tr>
                    <td>Was the Sale offer logged accurately?</td>
                    <td class="gdlines">
                        • <b>NA - </b>There was no opportunity to create<br />
                        • <b>Met - </b>Engineer created a Sales offer in CDAX <br />
                        • <b>Not Met - </b>Engineer failed to create a Sales offer in CDAX
                    </td>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">First Call Resolution</th>
                </tr>

                <tr>
                    <td>First conversation resolution/ Same day resolution opportunity</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer resolved & confirmed the issue resolution on the very first interaction/ same day - including dispatch cases.<br />
                        • <b>FCR - Cu - </b>When Engineer could not confirm resolution on the first interaction due to any reason caused by Customer (Customer busy, requests a follow-up on a later date/ time, Customer not by the unit etc..).<br />
                        • <b>FCR - Eng - </b>Engineer fails to provide the resolution in the first interaction when there was an opportunity.<br />
                        • <b>FCR - HP - </b>When Engineer could not confirm resolution on the first interaction due to any reason related to HP.  For e.g., Process/Tool limitations etc. (POP validation, Tool downtime)<br />
                        • <b>NA - </b>There was no opportunity for Engineer to provide any resolution on the first interaction. 
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
