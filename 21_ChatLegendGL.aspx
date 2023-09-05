<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="21_ChatLegendGL.aspx.cs" Inherits="Audit_Legends._21_ChatLegendGL" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>FY21 Chat Legend Guidelines</title>
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
        <h1><img src="Images/HP logoblu.png" style="width:98px;overflow:auto;float:initial;"/> FY21 Chat Legend Guidelines </h1>
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
                    <td >Did the Engineer comprehend the customer's issue correctly, acknowledge the issue & assured to assist?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer used the correct opening script with right HP Branding as defined in WISE. 
Comprehended & paraphrased/ acknowledged the issue. Confirmed that he/ she followed the customer's conversation. 
Ensured that opening script was provided without any delay.
Script: “Welcome to HP. My name is 'Tony’. How may I help you today?”
<br />
                        • <b>Introduction - </b>Engineer needs to introduce himself/ herself by name/ pseudo name at the earliest<br />
                        • <b>HP Branding - </b>Engineer needs to use the right HP Branding while opening the Chat<br />
                        • <b>Paraphrasing - </b>Engineer needs to acknowledge or paraphrase the issue reported by customer.<br />
                        • <b>Assurance - </b>Engineer needs to use the Remote Access option whenever there is a need and opportunity. <br />
                        • <b>KYC Info - </b>Engineer needs to confirm the below details on every fresh chat (not required on repeat chat/chats were customer comes for an update):
Sl. No./Product details:<br />
Contact number:<br />
Alternative number:<br />
Email ID:<br />
Country:
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
                        • <b>Serial Number - </b>EEngineer needs to guide the customer on how & from where to get the serial number and verify the same. <br />
                        • <b>Entitlement or PoP Validation</b>Correct entitlement is selected by checking for additional Carepack OTC changes to be made as per process (ex. 05D for ADP coverage) Ensure CDAX tool usage is done correctly (ex. Trade template should be under sales offer, Invoice for warranty update should be attached under the asset etc.). Follow the defined process for OTC changes (ex. Trade cases: 01-T OTC is changed by trade team and not CC)<br />
                        • <b>Class Issue / WISE Usage - </b>Engineer needs to adhere to the WISE advisories for Class Issues defined as per the process.
Defined Article in WISE is followed but not attached under the Knowledge & Attachment section on the case (Article number may be documented in the case notes)<br />
                        • <b>Ease of Effort - </b>Engineer should ask the customer name and phone number to validate the details present in the account registered in CDAX. Engineer must adapt to best practices on call to ensure customer's experience is effortless.<br />
                        • <b>Contact linking on chats - </b>Engineer must create contact card with necessary and link the conversation to that contact card.<br />
                        • <b>PRE Tool - </b>Engineer must create contact card with necessary and link the conversation to that contact card.<br />
                        • <b>NA - </b>   Applicable for chats where above parameters are not applicable.
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
                    <td>Behavioural skill opportunity</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer was professional on the chat, acknowledged customer through out the interaction & educated wherever needed.<br />
                        • <b>MCSL - Matching Customer Skill Level - </b>Engineer needs to match customer’s skill level while interacting. 
For E.g. - If the customer is not tech savvy, Engineer should avoid using jargon & explain in simple terms. Objective is to make customer feel comfortable. <br />
                        • <b>Objection Handling - </b>Engineer needs to pay attention to what is being said and acknowledge the objection and provide alternate options. Engineer should not take customer’s objection personally.<br />
                        • <b>Attention to details - </b>Engineer needs to pay attention to every detail, recognize customer's emotions, act  promptly and reassure the customer on reaching a positive outcome. Engineer needs to attentively listen while customer is speaking, paraphrase and reflect on what is being said
When there is a Timely verbal response to a statement or question ( Yes, ok, sure, alright…) followed by an intention to help/inform. Customer asked to repeat more than once. Avoid repeating the troubleshooting steps on a repeat interaction<br />
                        • <b>Educating Customer - </b>Engineer needs to educate the customer whenever there is an opportunity, unless the customer mentions that he does not need to know or does not have the time. Once the root cause is established, inform the customer about the cause of the issue. Detail the probable logical troubleshooting steps so that the customer is aware of what is being done. Seek customer’s agreement to proceed.<br />
                        • <b>Acknowledgement - </b>Engineer needs to acknowledge appropriately & adequately when needed during the conversation.<br />
                        • <b>NA - </b>NA - There was no opportunity for the said sub-parameter.
                    </td>
                </tr>

                <tr>
                    <td>Communication opportunity</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer communicated with the customer in a grammatically correct language, tone of chat<br />
                        • <b>End to End CRM skills  - </b>Engineer has displayed good customer relationship management skills throughout the chat. <br />
                        • <b>Rate of Speech - </b>Engineer needs to have a controlled rate of speech. A faster rate of speech will be difficult for the customers to understand and a slower, might cause boredom. NA to be chosen when call-back is not audited. <br />
                        • <b>Tone of Voice - </b>Engineer needs to maintain a positive tone throughout the conversation. NA to be chosen when call-back is not audited.<br />
                        • <b>Language - </b>Engineer needs to speak in a grammatically correct, simple & complete sentences on chat. Engineer must use clear & correct language( MTI). Engineer needs to communicate clearly with correct grammar. Engineers must communicate in short, simple & complete sentences.<br />
                        • <b>NA - </b>NA - There was no opportunity for the said sub-parameter.
                    </td>
                </tr>

                <tr>
                    <td>Customer Obsessed Behaviour</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer built rapport with the customer by providing adequate assurance, engaging in a courteous & empathetic conversation which resulted in an effortless experience for the customer. <br />
                        • <b>Rapport Building - </b>Engineer needs to build rapport with the customer whenever there is an opportunity. For E.g. – Customer is friendly and talkative, Engineer should use this opportunity to build a rapport and make customer more comfortable. Engineer must pay attention to every detail, recognize customer's emotions,  act promptly and reassure the customer on reaching a positive outcome.<br />
                        • <b>Assurance - </b>Engineer must provide a positive declaration intended to give confidence to the customer about the resolution. <br />
                        • <b>Professionalism - </b>The Engineer displayed unprofessional behaviour by using sarcastic / abusive or confrontational language / rude / vulgar / sexual comments / slandering HP brand / products / speaking negative of competitors / co-workers. Was the FLE respectful in his/her conversation with the customer Be careful with humour and sarcasm. What is funny to us may not be to the customer.<br />
                        • <b>Courtesy - </b>Engineer needs to showcase politeness in their attitude and behavior towards customers. Ex. Avoid interruption while customer is speaking, using pleasantries etc.<br />
                        • <b>Empathy - </b>Engineer needs to make an attempt to empathize with the customer. Must understand what customer is feeling and see things from their point of view.<br />
                        • <b>NA - </b>NA - There was no opportunity for the said sub-parameter.
                    </td>
                </tr>

                <tr>
                    <td>Time Management</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer managed the time spent over the chat with the customer by providing quick resolution and adhering to the hold & mute guidelines. <br />
                        • <b>Delayed Response - </b>When Engineer fails to respond to Customer on time on the chat/get back to customer at the stipulated time
When engineer remains on chat even though conversation has ended<br />
                        • <b>Speed of Resolution  - </b>Engineer needs to perform logical troubleshooting steps and guide the customer to perform the troubleshooting steps quickly without unnecessarily wasting customer’s time. <br />
                        • <b>Chat Control - </b>Customer has deviated from the chat & Engineer fails to take control of chat. Customer is more knowledgeable in terms of technical/process and takes control of the chat.<br />
                        • <b>NA - </b>NA - There was no opportunity for the said sub-parameter.
                    </td>
                </tr>
                
                <tr style="background-color:darkblue;color:white">
                    <th colspan="2" scope="col" style="text-align:center;">Customer Excellence</th>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Callback</th>
                </tr>

                <tr>
                    <td>Did the engineer do necessary timely follow ups on chat before closure?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer collected the BTTR (Best time to reach), offered call back whenever required, documented & called back the customer (including call disconnect).<br />
                        • <b>Email Follow-up - </b><br />
                        • <b>Snooze - </b>Engineer did not follow the snooze process as per the process guidelines.<br />
                        • <b>Call back adherence - </b>Engineer did not call back the customer when the Chat got disconnected.<br />
                        • <b>NA - </b>Engineer did not have any opportunity for call back
                    </td>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Ownership</th>
                </tr>

                <tr>
                    <td>Did the Engineer showcased ownership/ escalated the chat if required?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer took complete responsibility of the issue in providing end to end resolution. Set the right expectations, kept the customer informed about the proceedings on the case and escalated the issue wherever applicable. <br />
                        • <b>Expecatation Setting / KCI - </b>Engineer needs to set right expectations whenever it is required. E.g. - While arranging service, long time required for research, process requirements, defective part needs to be returned to HP, Data back-up when unit is collected for a repair, etc. Retaining the printer accessories (cartridges & power cord) during printer replacement, etc. Need to keep the customer informed about case status/progress if it's under process from backend teams like POP,EMT, 2LS etc.<br />
                        • <b>External source / RDT India - </b>Engineer should not share a third-party link with the customer. Cite your sources. All links and information should be from HP or from HP partners such as Microsoft, Intel, Apple etc. Don’t share inappropriate materials or links to customer’s E-mail or to their Social Media account etc. Failed to follow updated RDT process guidelines (India)<br />
                        • <b>Disclaimer - </b>Provide disclaimer about the call being recorded on outbound calls. Did not follow approved script/process to use LMI & live lens.<br />
                        • <b>Escalation Process - </b>Engineer needs to follow the escalation/ elevation process wherever applicable.
                    </td>
                </tr>

                <tr style="background-color:darkblue;color:white">
                    <th colspan="2" scope="col" style="text-align:center;">Documentation</th>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Case Logging</th>
                </tr>

                <tr>
                    <td>Did the Engineer document conversation details accurately?</td>
                    <td class="gdlines"> 
                        • <b>Met - </b>Engineer fulfilled all the criteria. <br />
                        • <b>Partial - </b>Engineer missed out on collecting few details, but all the important details are documented. E.g. - Incorrect/ Incomplete templates was used in the case, documentation template has not been used. Engineer missed updating/adding correct contact details on the contact card or selected incorrect contact details while re-entitling the case.<br />
                        • <b>Missed Case Creation - </b>Engineer failed to log a case or Quick Case was logged instead of a main case<br />
                        • <b>Fabrication - </b>Engineer fabricated the case documentation to suit the resolution<br />
                        • <b>No Documentation - </b>Engineer failed to document any information in the Case/ Quick Case notes
                        • <b>Did not link chat to CDAX - </b>Engineer did not create contact card & also failed to link chat to CDAX.<br />
                        • <b>NA - </b>Applicable for chats where above parameters are not applicable.
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
                        • <b>NCLF</b> (No Case Log Found)/ Incomplete/ Documentation <br />
                        • <b>Ownership</b><br />
                        • <b>Incomplete/ Incorrect resolution</b><br />
                        • <b>Rude/ Unprofessional behavior</b><br />
                        • <b>NPS (Non-Proliferation Screening)/ RPL (Restricted Party List)</b><br />
                        • <b>Wrong email address</b><br />
                        • <b>Defect closure</b><br />
                        • <b>Survey solicitation</b><br />
                        • <b>Call disconnect</b><br />
                        • <b>Chat Disconnect</b>Engineer did not follow snooze process after the chat was disconnected.<br />
                        • <b>PCI (Payment Card Industry)</b><br />
                        • <b>ACL (Australian Consumer Law)</b><br />
                        • <b>Conversation Resolution Code</b>Engineer has not selected correct resolution code before closing the chat.<br />
                        • <b>Chat linking to CDAX case</b>Engineer did not link chat to CDAX case.  <br />
                        • <b>Contact linking on all chats</b>Engineer did not create a contact card & link the chat to that contact card.

                    </td>
                </tr>

                <tr style="background-color:dimgray;color:white">
                    <th colspan="2" scope="col" style="text-align:center;">Tracking Questions</th>
                </tr>

                <tr>
                    <td>Engineer provided WOW experience /DAB</td>
                    <td class="gdlines">
                        • <b>Met- </b>The Absolute Best Chat. Provided exceptional support and showcased customer obsessed behavior<br />
                        • <b>NA - </b>Missed out on exhibiting customer obsessed behavior. 
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
