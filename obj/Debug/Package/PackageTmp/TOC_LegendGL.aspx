<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TOC_LegendGL.aspx.cs" Inherits="Audit_Legends.TOC_LegendGL" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>TOC / DVT Legend Guidelines</title>
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
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <style type="text/css">
            .auto-style1 {
                width: 100%;
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
    <div class="auto-style1" style="color:aliceblue;background-color:black;text-align:left;line-height:100px;width:100%">
        <%--<img src="hp_logo_black.jpeg" style="width:100px;overflow:auto;float:left"/>--%>
        <h1><img src="Images/HP logoblu.png" style="width:98px;overflow:auto;float:initial;"/> TOC / DVT Legend Guidelines </h1>
    </div>

    <div style="text-align:right;height:80px;">
        <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnLogout" CausesValidation="false" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    </div>

    <div class="row " style="margin-left:20px;margin-top:20px;">
        
    <br />
    <br />
        

        <div class="col-sm-12" style="max-width:90%;text-align:center;margin-left:50px;margin-top:20px;margin-right:100px;font-size:medium;">
        <table id="table2" border="1"  style="background-color:white;align-items:center">
            <thead>
                <tr style="text-align:center;background-color:cornflowerblue;color:white">
                    
                    <th scope="col">Parameter</th>

                    <th scope="col">Checklist</th>
                </tr>
            </thead>

        <tbody>
                <tr>
                    <td>TAT 30 minutes / CCTAT (Met / Not Met)
                    </td>
                    <td>TAT is calculated from the time the case is assigned to the time the case is dispatched/assigned back to the engineer</td>
                    
                </tr>

                <tr>
                    <td>UEFI Adherence (Updated / Not Updated)</td>
                    <td>UEFI pass ID/fail ID or exception code has to be updated in the Remote Diags Section of CDAX as per the global process document for applicable components</td>
                    
                </tr>

                <tr>
                    <td>Logical TS / Diagnosis Accuracy
                    </td>
                    <td>Diagnosis should be accurate based on the available information, T/S being recommended should be logical and relevant. Suggesting irrelevant t/s, unnecessary steps, not suggesting required steps, incorrect diagnosis will lead to markdown (partial or Not Met) based on the extent of the miss</td>
                    
                </tr>

                <tr>
                    <td>Case Approved / Rejected / Modify</td>
                    <td>Based on available information, approval provided should be correct. Cases being rejected without clearly documented reasons, cases approved even though there was insufficient information etc. may be marked here.</td>
                    
                </tr>

                <tr>
                    <td>Parts Accuracy (Yes / No)</td>
                    <td>Part number provided must be accurate from relevant sources. If a case is rejected for wrong part, guide the engineer to find the right part/provide the right part. If multiple parts need to be replaced, ensure all part numbers are correct.</td>
                   
                </tr>

                <tr>
                    <td>WISE usage/entitlement (Met / Not Met)</td>
                    <td>Check wise for known advisories/articles for the issue. If it is a service advisory, guide the engineers to change OTC and attach the advisory and follow the steps as per the document. Swollen battery class issue to be followed. Any OTC changes missed by the engineer has to be checked by DVT.</td>
                    
                </tr>

                <tr>
                    <td>PRE Tool (Met / Not Met) - RS</td>
                    <td>PRE tool has to be used whenever there is a part change needed, also paste the note from PRE tool to CDAX internal notes. If PRE tool recommends wrong part, find the correct part from other sources and fill the feedback on the tool.</td>
                    
                </tr>

                <%--<tr>
                    <th colspan="5" style="text-align:center;background-color:cornflowerblue;color:white">Tracking Questions</th>
                </tr>--%>

                <%--Tracking Questions--%>

                <%--<tr>
                    <th>QA Rating **** </th>
                    <td><asp:DropDownList ID="C09" runat="server" Height="25px" Width="150px" >
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Delight" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Expected" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Basic" Value="2"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <th>Compliance ? </th>
                    <td><asp:DropDownList ID="C10" runat="server" Height="25px" Width="150px" >
                        <asp:ListItem Enabled="true" text="NA" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="High" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Very High" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Critical" Value="2"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <th>FCR</th>
                    <td><asp:DropDownList ID="C11" runat="server" Height="25px" Width="150px" >
                        <asp:ListItem Enabled="true" text="NA" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                
                <tr>
                    <th>Did the engineer request customer for picture (Picture of serial number of the part) to identify there is no fraudulent activity?</th>
                        <td><asp:DropDownList ID="C12" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" Text="NA" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr> 

                <tr>
                    <th>Remote session - Did the engineer use any 3rd party software to take remote access?</th>
                        <td><asp:DropDownList ID="C13" runat="server" Height="25px" Width="150px">
                        <asp:ListItem Enabled="true" Text="NA" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>--%>
            </tbody>
        </table>
    </div>
    </div>
    </form>
</body>
</html>