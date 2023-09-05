<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="22_Swivel_DaaSGL.aspx.cs" Inherits="Audit_Legends._22_Swivel_DaaSGL" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>FY22 Swivel DaaS Legend Guidelines</title>
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
        <h1><img src="Images/HP logoblu.png" style="width:98px;overflow:auto;float:initial;"/> FY22 Swivel DaaS Legend Guidelines </h1>
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

                                    <tr>
                                        <td >Did the engineer process/ action the case within the given time frame and acknowledged the customer’s issue?(SLO)</td>                                       
                                        <td class="gdlines">
                                            • <b> Met - </b> Engineer acknowledged and actioned the case well within the time frame.
                                            • <b>TAT Missed - </b> Engineer missed out on actioning the case within the agreed SLO. 
                                            • <b>Acknowledgement -</b> First email to customer needs to have acknowledgement about the case issue description instead of directly jumping to Probing – Troubleshooting. When case is assigned after cut off for dispatch, an acknowledgement email would have to be sent explaining to customer ownership of the case

                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Did the Engineer action the case with the right Process?</td>
                                        <td class="gdlines">
                                            • <b>Met - </b> Engineer has to follow the right process depending on the contract.
                                            • <b>Not Met - </b> Engineer has failed to follow the right process depending on the contract.

                                        </td>
                                        
                                    </tr>

                                    <%--<tr style="background-color:#1d5aab;color:white">
                                        <th colspan="5" scope="col" style="text-align:center;">Technical</th>
                                    </tr>--%>

                                    <%--<tr>
                                        <th scope="col" style="text-align:center;">Probing</th>
                                        <td  colspan="3"></td>
                                    </tr>--%>

                                    <tr>
                                        <td>
                                            Tool Usage</td>
                                        <td class="gdlines">
                                            • <b>Met - </b> Entitlement  - Ensure correct entitlement is selected as per process. Unnecessary OTC changes to not be made Ensure CDAX tool usage is done correctly.

Serial Number - Engineer needs to guide the customer on how & from where to get the serial number and verify the same.

Engineer used Tools such as - ITSM,WISE, Part surfer, SNR, E-Tracking/ BOE Score, Serial Number & Subassembly Tracker, My PIM, My PRS, available Softpacks, Scripts, Advisories, SDI, Internally created information/ solution reference system, Designated seniors (Mentors, EMT, 2LS), UEFI Diagnostics Usage, Error code capture."
                                            • <b>Not Met - </b> Engineer has failed to use the relevant tools.

                                        </td>
                                        
                                    </tr>

                                    <%--<tr>
                                        <th scope="col" style="text-align:center;">Solution / Resolution</th>
                                        <td  colspan="3"></td>
                                    </tr>--%>
                
                                    <tr>
                                        <td>Did the Engineer send an email with the right particulars of the case?</td>
                                        <td class="gdlines">
                                            • <b>Met - </b> Engineer responded to the email with the right information(CE , mailbox, respective IT).
                                            • <b>Not Met - </b> Engineer failed to respond to the email with the right information(CE , mailbox, respective IT).

                                        </td>
                                        
                                    </tr>


<%--                                    <tr style="background-color:#1e5eb3;color:white">
                                        <th colspan="5" scope="col" style="text-align:center;">Soft Skills</th>
                                    </tr>

                                    <tr>
                                        <th scope="col" style="text-align:center;"> Communication</th>
                                        <td  colspan="3"></td>
                                    </tr>--%>

                                    <tr>
                                        <td>Behavioural skill opportunity  <br /></td>
                                        <td class="gdlines">
                                            • <b>Met - </b> Engineer was professional during the interaction, acknowledged customer & educated wherever needed.
                                            • <b>MCSL - </b> Matching Customer Skill Level - Engineer needs to match customer’s skill level while interacting. For E.g. - If the customer is not tech savvy, Engineer should avoid using jargon & explain in simple terms. Objective is to make customer feel comfortable.
                                            • <b>Objection Handling - </b> Engineer needs to pay attention to what is being said and acknowledge the objection and provide alternate options. Engineer should not take customer’s objection personally.
                                            • <b>Professionalism - </b>Engineer should avoid displaying unprofessional behaviour with sarcastic/ abusive or confrontational language/ rude/ vulgar/ sexual comments/ slandering HP brand/ products/ speaking negative of competitors/ co-workers. Engineer needs to be respectful in his/her conversation with the customer.
                                            • <b>Courtesy/Empathy - </b> Engineer needs to showcase politeness in the attitude and behaviour towards customers. Engineer needs to make an attempt to empathize with the customer. Must understand what customer is feeling and see things from customer’s point of view."

                                        </td>
                                        
                                    </tr>

                                    <tr>
                                        <td>Email Communication<br />

                                        </td>
                                        <td class="gdlines">
                                            • <b>Met - </b> Engineer communicated with the customer in a grammatically correct language and tone of interaction and avoided usage of jargons and abbreviations.
                                            • <b>Usage of Jargons/short hand - </b> Engineer should avoid usage of jargons and abbreviations.
                                            • <b>Sentence structure/Grammar - </b> Engineers needs to communicate in a clear and correct Language. The written communication should be grammatically correct and should contain simple & complete sentences.
                                            • <b>Attention to Details - </b> Engineer needs to respond to the customer with relevant details. Ensure to write clearly and have a structured approach.
                                            • <b>NA - </b> There was no opportunity for the said sub-parameter."

                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>Did the Engineer follow call back process and meet call back commitment? <br />
                                        </td>
                                        <td class="gdlines">
                                            • <b>NA - </b> Engineer did not have any opportunity for call back • Met - Engineer collected the BTTR (Best time to reach), offered call back whenever required, documented & called back the customer (including call disconnect).
                                            • <b>Did not Offer - </b> Engineer needs to offer a call back when there is an opportunity; instead of asking the customer to call back.
                                            • <b>CBC (callback commitment) Not Set - </b> Engineer needs to log the call back commitment in CDAX. In scenarios when case is left open without any actions, a valid callback commitment (technical/courtesy) needs to be scheduled on the case
                                            • <b>CBC (callback commitment) Not Met - </b> Engineer needs to meet the 'CBC Set'. Leverage of +/ -1 hour is allowed.
                                            • <b>BTTR (Best time to reach) Not Captured - </b> Engineer needs to capture or collect the best time to reach the customer.
                                            • <b>Call Disconnect - </b> Engineer must call back the customer when there is a call disconnect.
                                            • <b>Email Follow up - </b> Engineer needs to send emails if it was promised on call in a timely manner. In case callback was not immediately possible, ensure to send the email to customer.

                                        </td>
                                    </tr>
                                                                        
                                    <tr>
                                        <td>Did the Engineer set right expectations?<br />
                                        </td>
                                        <td class="gdlines">
                                            • <b>Met - </b> Engineer fulfilled the criteria of setting the right expectations wherever needed.• KCI - Engineer needs to keep the customer informed about every move/ action/ effort taken during the course of case management/ interaction. If incorrect/ incomplete information, part order, troubleshooting is shared with the customer, the engineer needs to inform customer about the misses (if any) & assure the customer on the additional corrective actions taken towards solution."
                                            • <b>Not Met - </b> Engineer has failed to set right expectations.• Incorrect Expectations - Engineer failed to set the correct expectations whenever required. For e.g. - incorrect TAT given for repair etc..

                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Did the Engineer showcase ownership?<br /></td>
                                        <td class="gdlines">
                                            • <b>Met - </b> Engineer took complete accountability & ownership of the issue until resolution is provided, appropriately escalated when required & followed-up on time as agreed with the customer. Also, providing all the customer requested information and additional information which was discussed during the proceedings of the case. Such as phone number, address, email address, website links, product details for the referred party. Service center address, phone number. Pickup & drop off location details with phone number if available.
                                            • <b>E2E Case management - </b> Engineer needs to take complete accountability & ownership of the issue until resolution is provided, appropriately escalated when required & followed-up on time as agreed with the customer.
                                            • <b>Delayed follow-up callback / emails - </b> Engineer failed to callback the customer as committed or the Emails from customer are not checked and actioned on time.
                                            • <b>Not Met - </b> Engineer has failed to showcase ownership.

                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Did the Engineer document conversation details accurately?</td>
                                        <td class="gdlines">
                                            • <b>Met - </b> Engineer has fulfilled all the criteria. • Fabrication - Engineer has fabricated the case documentation to suit the resolution
                                            • <b>No Documentation - </b> Engineer failed to document any information in the Case
                                            • <b>Partial - </b> Engineer failed to document complete notes/information on the case
                                            • <b>Usage of Relevant templates - </b> Engineers needs to adhere to and use relevant templates on case-to-case basis. E.g. - WO Template, GN Template, Trade Template, CRT template, Elevations template, etc.

                                        </td>
                                    </tr>

                                    <tr style="background-color:white;color:red">
                                        <th colspan="5" scope="col" style="text-align:center;">Compliance</th>
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
