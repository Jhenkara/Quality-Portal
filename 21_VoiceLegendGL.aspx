<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="21_VoiceLegendGL.aspx.cs" Inherits="Audit_Legends._21_VoiceLegendGL" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>FY21 Voice Legend Guidelines</title>
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
        <h1><img src="Images/HP logoblu.png" style="width:98px;overflow:auto;float:initial;"/> FY21 Voice Legend Guidelines </h1>
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
Script: “Welcome to HP. My name is 'Tony’. How may I help you today?””
<br />
                        • <b>Introduction - </b>Engineer needs to introduce himself/ herself by name/ pseudo name within 5 seconds of call opening. Engineer has to ensure that the call opening is positive and energetic and that there is no abrupt call opening<br />
                        • <b>HP Branding - </b>Engineer needs to use the right HP Branding while opening the Call.<br />
                        • <b>Paraphrasing - </b>Engineer must paraphrase the issue using the key points reported by the customer (if there are multiple points shared by them) or acknowledge the issue accordingly in the beginning of the conversation.<br />
                        • <b>Assurance - </b>Engineer needs to pay attention to every detail, recognize customer's emotions, act promptly and reassure the customer on reaching a positive outcome.<br />
                    </td>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Tool Usage</th>
                </tr>

                <tr>
                    <td>Did the Engineer use the available data/tools/resources to enhance customer experience?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer made appropriate use of tools to improve customer experience, made it easy to collect serial number, avoided repetitive questions to gather information.<br />
                        • <b>LMI - Live Lens - </b>Engineer needs to use the Remote Access option whenever there is a need and opportunity.<br />
                        • <b>Serial Number - </b>Engineer needs to guide the customer on how & from where to get the serial number and verify the same. <br />
                        • <b>Entitlement or PoP Validation - </b>Correct entitlement is selected by checking for additional carepacks OTC changes to be made as per process (ex. 05D for ADP coverage) Ensure CDAX tool usage is done correctly (ex. Trade template should be under sales offer, Invoice for warranty update should be attached under the asset etc.). Follow the defined process for OTC changes (ex. Trade cases: 01-T OTC is changed by trade team and not CC)<br />
                        • <b>PIN - </b>Not validating PIN on Priority / Support1 / Service partner /Named Accounts call & updating the same in the PIN field in the case.<br />
                        • <b>Class Issue / WISE Usage - </b>Engineer needs to adhere to the WISE advisories for Class Issues defined as per the process. Defined Article in WISE is followed but not attached under the Knowledge & Attachment section on the case (Article number may be documented in the case notes)<br />
                        • <b>CTI / Did the agent relate to case? - </b>It is very important to update the “right” case to the phone call from a reporting and audit perspective, Use the CDAX auto search results to validate customer information whenever they are available. If it is not available,  then only ask for customer details, and so on and follow the standard process. It is very important to update the “right” case to the phone call from a reporting and audit perspective. <br />
                        • <b>PRE Tool - </b> has to be used whenever there is a part change needed, also paste the note from PRE tool to CDAX internal notes. 
If PRE tool recommends wrong part, find the correct part from other sources and fill the feedback on the tool. <br />
                        • <b>Ease of Effort - </b>Engineer must adapt to best practices on call to ensure customer's experience is effortless (e.g. Engineer should ask the customer name and phone number to validate the details present in the account registered in CDAX, If an existing customer (individual or company) contacts CC, the agent should not proactively provide details of the customer account registered in CDAX). Also, engineer should collect only the basic details in the beginning of the conversation and provide assistance to the customer rather than collecting all the contact details.

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
                        • <b>Not Met - </b>Relevant troubleshooting steps were not provided to the customer which resulted in incomplete solution (missing out on possible First Case Resolution) or resulting in recurrence of the issue. <br />
                        • <b>Partial - </b>Irrelevant / Incomplete troubleshooting was done by the Engineer. <br />
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
                        • <b>Met - </b>Engineer was professional on the call, acknowledged customer through out the interaction & educated wherever needed.<br />
                        • <b>MCSL - Matching Customer Skill Level - </b>Engineer needs to match customer skill level while interacting. This includes matching the customer's language and technical proficiency, age, cultural background, to name a few. For Eg - If customer is not Tech savvy Engineer should avoid using jargon & explain in simple terms. Objective is to make customer feel comfortable
Think about who can see what you have shared. There may be more than one person replying to you. The customer could be of any Age group.<br />
                        • <b>Objection Handling - </b>Engineer needs to pay attention to what is being said and acknowledge the objection and provide alternate options. Engineer should not take customer’s objection personally.<br />
                        • <b>Active Listening / Attention to details  - </b>Engineer needs to pay attention to every detail, recognize customer's emotions, act  promptly and reassure the customer on reaching a positive outcome. Engineer needs to attentively listen while customer is speaking, paraphrase and reflect on what is being said. Customer asked to repeat more than once. Avoid repeating the troubleshooting steps on a repeat interaction<br />
                        • <b>Educating Customer - </b>Engineer fails to educate customer whenever there was a opportunity - Must Educate the customer unless the customer mentions or behaves , in a manner that suggests that he does not need to know or does not have the time
Once the root cause is established inform the customer about the cause of the issue.
Detail the probable logically trouble shooting steps so that the customer is aware of what is being done.
Seek customers agreement to proceed.<br />
                        • <b>Acknowledgement - </b> Were the acknowledgments provided by the agent specific, in terms of emotion/ situation of the caller? Were the statements used reflective of this understanding in terms of tone and choice of words?  When there is a Timely verbal response to a statement or question ( Yes, ok, sure, alright…) followed by an intention to help/inform.<br />
                        • <b>NA - </b>NA - There was no opportunity for the said sub-parameter.
                </tr>

                <tr>
                    <td>Communication opportunity</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer communicated with the customer in a grammatically correct language, tone of voice and rate of speech.<br />
                        • <b>Comprehension - </b>Engineer fails to understand what customer is trying to express
Engineer must understand what the customer is trying to say and respond in a way that customer is able to understand as well. <br />
                        • <b>Rate of Speech - </b>Engineer needs to have a controlled rate of speech. A faster rate of speech will be difficult for the customers to understand and a slower, might cause boredom. <br />
                        • <b>Tone of Voice - </b>When Tone of Voice is not professional while communicating with a customer | Sudden shift in Volume/pitch that may sound condescending to the customer/ Polite & Positive Choice of words. Did the engineer approach the entire call with energy and positivity?<br />
                        • <b>Language/Accent - </b>Engineer must use clear & correct language on the call / MTI. Engineer needs to speak in a clear accent with correct pronunciation. Engineer speak with an accent that may hamper the customer's comprehension, and end up repeating information. Also ensure to ask open ended questions rather than closed questions where in the choice for answering is limited.<br />
                        • <b>NA - </b>NA - There was no opportunity for the said sub-parameter


                    </td>
                </tr>

                <tr>
                    <td>Customer Obsessed Behaviour</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer built rapport with the customer by providing adequate assurance, engaging in a courteous & empathetic conversation which resulted in an effortless experience for the customer. <br />
                        • <b>Rapport Building - </b>When Engineer fails to build a rapport with the Cust when there was an opportunity. For Eg - Cust is friendly and talkative, Engineer should use this opportunity to build a rapport and make Cust more comfortable - Based on the call and customer.
Paid attention to every detail, recognised customer's emotions acted promptly and reassured the customer on reaching a positive outcome. Did the engineer identify the customer behaviour and make appropriate changes in communication style? / Did the engineer understand the customer’s state of mind and respond appropriately?<br />
                        • <b>Assurance - </b>Engineer must provide a positive declaration intended to give confidence to the customer about the resolution.  <br />
                        • <b>Professionalism - </b>The Engineer displayed unprofessional behaviour by using sarcastic / abusive or confrontational language / rude / vulgar / sexual comments / slandering HP brand / products / speaking negative of competitors / co-workers. Was the FLE respectful in his/her conversation with the customer Be careful with humor and sarcasm. What is funny to us may not be to the customer.<br />
                        • <b>Courtesy - </b>Engineer needs to showcase politeness in their attitude and behavior towards customers. Ex. Avoid interruption while customer is speaking, using pleasantries etc.<br />
                        • <b>Empathy - </b>Engineer needs to make an attempt to empathize with the customer. Must understand what customer is feeling and see things from their point of view.<br />
                        • <b>NA - </b>NA - There was no opportunity for the said sub-parameter
                    </td>
                </tr>

                <tr>
                    <td>Time Management</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer managed the time spent over the call with the customer by providing quick resolution and adhering to the hold & mute guidelines. <br />
                        • <b>Hold, Mute and Dead air - </b>Engineer needs to follow appropriate hold & mute procedure. 
Maximum 2 holds on a single call.
Maximum 3 minutes on each hold.
Follow the Hold usage (Seeking customer’s permission, reason for hold, return on time & thank the customer upon return).
Avoid dead air - engage with the customer and if longer time is needed, utilize hold (upto 3 mins as mentioned above)/offer callback
Explained dead air of 30 seconds and no unexplained dead air. There is excess of background noise from the engineers end and engineer has failed to apologize and address the same thus impacting the call experience for the customer.<br />
                        • <b>Speed of Resolution  - </b>Engineer needs to perform logical troubleshooting steps and guide the customer to perform the troubleshooting steps quickly without unnecessarily wasting customer’s time. <br />
                        • <b>Call Control - </b>Customer has deviated from the call & Engineer fails to take control of call. Customer is more knowledgeable in terms of technical/process and takes control of the chat. Did the engineer show purpose and intent throughout the call? Did the engineer use different question types to control the call and extract information?<br />
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
                    <td>Did the Engineer follow call back process and meet call back commitment?</td>
                    <td class="gdlines">
                        • <b>NA - </b>Engineer did not have any opportunity for call back
                        • <b>Met - </b>Engineer collected the BTTR (Best time to reach), offered call back whenever required, documented & called back the customer (including call disconnect).<br />
                        • <b>Did not Offer - </b>Engineer needs to offer a call back when there is an opportunity; instead of asking the customer to call back.<br />
                        • <b>CBC (callback commitment) Not Set - </b>Engineer needs to log the call back commitment in CDAX. In scenarios when case is left open without any actions, a valid callback commitment (technical/courtesy) needs to be scheduled on the case<br />
                        • <b>CBC (callback commitment) Not Met - </b>Engineer needs to meet the 'CBC Set'. Leverage of +/ -1 hour is allowed.<br />
                        • <b>BTTR (Best time to reach) Not Captured - </b>Engineer needs to capture or collect the best time to reach the customer.<br />
                        • <b>Call Disconnect - </b>Engineer must call back the customer when there is a call disconnect.<br />
                        • <b>Email Follow up - </b>Engineer needs to send emails if it was promised on call in a timely manner.
In case callback was not immediately possible, ensure to send the email to customer.
                    </td>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Ownership</th>
                </tr>

                <tr>
                    <td>Did the Engineer showcased ownership/ escalated the call if required?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer took complete responsibility of the issue in providing end to end resolution. Set the right expectations, kept the customer informed about the proceedings on the case and escalated the issue wherever applicable. <br />
                        • <b>Expecatation Setting/KCI - </b>Engineer needs to set right expectations whenever it is required and provide appropriate disclaimers. 
E.g. - While arranging service (how & when), long time required for research, process requirements, defective part needs to be returned to HP, Data back-up when unit is collected for a repair, Retaining the printer accessories (cartridges & power cord) during printer replacement, taking remote access via LMI/Live Lens, battery shipment related instructions, etc. 
Need to keep the customer informed about case status/progress if it's under process from backend teams like POP,EMT, 2LS etc.
Engineer has shared SVC details with the customer on a service event call/case without following the process update (India only)<br />
                        • <b>External source / RDT India - </b>Engineer should not share a third-party link with the customer. Cite your sources. All links and information should be from HP or from HP partners such as Microsoft, Intel, Apple etc. Don’t share inappropriate materials or links to customer’s E-mail or to their Social Media account etc. Failed to follow updated RDT process guidelines (India)<br />
                        • <b>Escalation Process - </b>Engineer needs to follow the escalation/ elevation process wherever applicable. Involving relevant team for the situation' e.g. Part intervention when back ordered (MATEX); 2LS for repeated failure, CRT for Complaints, QRP, QCP etc.
                    </td>
                </tr>

                <tr style="background-color:darkblue;color:white">
                    <th colspan="2" scope="col" style="text-align:center;">Documentation</th>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Case Logging</th>
                </tr>

                <tr>
                    <td>Did the Engineer document conversation details accurately? </td>
                    <td class="gdlines"> 
                        • <b>Met - </b>Engineer fulfilled all the criteria. 
                        • <b>Partial - </b>Engineer missed out on collecting few details, but all the important details are captured. E.g. - Incorrect/ Incomplete templates (Case Logging, WO Template, GN Template, Trade Template, CRT template, Elevations template, etc.) was used in the case.<br />
                        • <b>Missed Case Creation - </b>Engineer failed to log a case or Quick Case was logged instead<br />
                        • <b>Missed QC - </b>Engineer missed to log Quick Case for a scenario which required the same<br />
                        • <b>Fabrication - </b>Engineer fabricated the case documentation to suit the resolution<br />
                        • <b>No Documentation - </b>Engineer failed to document any information in the Case/ Quick Case notes<br />
                        • <b>Inaccurate / Incomplete Contact Information - </b>Engineer missed capturing or updating the complete contact details to have a case logged/ did not follow email verification process. Contact card needs to be created with appropriate customer name and company name accordingly (For individual customer, account name would be customer name and for customer calling from company, account name should be company name).
                    </td>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">Closing</th>
                </tr>

                <tr>
                    <td>Did the Engineer summarize the interaction, offer additional assistance, & close it appropriately?</td>
                    <td class="gdlines">
                        • <b>Met - </b>Engineer provided Case id, / checked the receipt of Case Log email, offered additional assistance, closed the call on a positive note & with HP branding.  
E.g.; Proactively provided service center phone numbers on dispatch cases. <br />
                        • <b>Offer Additional assistance - </b>Call was closed without offering any additional assistance.<br />
                        • <b>HP Branding - </b>Engineer missed out on HP Branding. 
"Thank you for contacting HP" 
Branding wouldn't be -  "HP Services", "HP Computers", "HP Printers"<br />
                        • <b>NA - </b>No scope for call closure. For e.g. - customer ended the conversation abruptly/ call got disconnected due to network/ VPN issue etc.  <br />
                    </td>
                </tr>

                
                <tr style="background-color:white;color:red">
                    <th colspan="2" scope="col" style="text-align:center;">Compliance</th>
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

                <tr style="background-color:dimgray;color:white">
                    <th colspan="2" scope="col" style="text-align:center;">Tracking Questions</th>
                </tr>

                <tr>
                    <td>Engineer provided WOW experience /DAB</td>
                    <td class="gdlines">
                        • <b>Met- </b>The Absolute Best Call. Provided exceptional support and showcased customer obsessed behavior<br />
                        • <b>NA - </b>Missed out on exhibiting customer obsessed behavior. 
                    </td>
                </tr>

                <tr>
                    <th scope="col" style="text-align:center;">SAPOS</th>
                </tr>

                <tr>
                    <td>Did the engineer offer the right product/ Service?</td>
                    <td class="gdlines">
                        • <b>NA - </b>There was no opportunity to make sales offer <br />
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
                        • <b>NA - </b>There was no opportunity to create <br />
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
                        • <b>Met - </b>Engineer resolved & confirmed the issue resolution on the very first interaction/ same day - including dispatch cases. <br />
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
