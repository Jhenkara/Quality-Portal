<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="1x1_Tracker.aspx.cs" Inherits="Audit_Legends._1x1_Tracker" %>

<!DOCTYPE html>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>Connect - 1x1 Tracker</title>
    <%--<link rel="shortcut icon" href="Images/HP logoblu.png"  />--%>

        <!--Bootstrap CSS CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
        <link href="Exit_Form.css" rel="stylesheet" type="text/css" />
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
                margin-left:10px;
                width: 222px;
            }
            .auto-style10 {
                font-family: 'HP Simplified Light';
                font-size: 13px;
                font-weight: bold;
                float: left;
                margin-right: 5px;
                margin-left: 10px;
                width: 192px;
            }
            </style>
</head>
<body>

    <script type="text/javascript">
        $(function () { 
        });
    </script>

    <form id="form1" runat="server">
        <%--Top Form--%>
    <div class="auto-style1" style="color:aliceblue;background-color:#4d4e4f;text-align:left;line-height:100px;width:100%">
        <%--<img src="hp_logo_black.jpeg" style="width:100px;overflow:auto;float:left"/>--%>
        <h1><%--<img src="Images/hp_logo_white.png" style="width:98px;overflow:auto;float:initial;"/>--%> Connect - 1x1 Tracker </h1>
    </div>

    <div id="Pane1">
        <div class="container-fluid" style="margin-top:5px;height:auto;width:95%;">
            <div class="card">
                <div class="card-body" style="background-color:white; box-shadow: 0px 0px 3px grey; border-radius:5px;">
                    <div class="row">
                        <div class="col-md-5" style="width:80%;">
                        <table id="table1">
                            
                            <tr>
                                <%--<th class="auto-style9">
                                    Employee ID :
                                </th>--%>
                                <td>
                                    <asp:TextBox ID="tbEID" CssClass="form-control input-xs" TextMode="MultiLine" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <%--<th class="auto-style9">
                                    Employee Name :
                                </th>--%>
                                <td>
                                    <asp:TextBox ID="tbEName" CssClass="form-control input-xs" TextMode="MultiLine" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <%--<th class="auto-style9">
                                    Employee Mail :
                                </th>--%>
                                <td>
                                    <asp:TextBox ID="tbEMail" CssClass="form-control input-xs" TextMode="MultiLine" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <%--<th class="auto-style9">
                                    Date Created :
                                </th>--%>
                                <td>
                                    <asp:TextBox ID="tbDateCreated" CssClass="form-control input-xs" TextMode="MultiLine" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Retention :
                                </th>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" CssClass="form-control input-xs" runat="server" AutoPostBack="true">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="High" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Medium" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Low" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                                
                            <tr>
                                <th class="auto-style9">
                                    Performance Scorecard Discussed :
                                </th>
                                <td>
                                    <asp:DropDownList ID="DropDownList3" CssClass="form-control input-xs" runat="server" AutoPostBack="true">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="NA" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Employee Feedback :
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox3" CssClass="form-control input-xs" TextMode="MultiLine" placeholder="Please capture all Employee feedback, concerns and discussions here." AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Manager Feedback :
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox1" CssClass="form-control input-xs" TextMode="MultiLine" placeholder="Please capture all Manager feedback and discussions here." AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>

                                <th class="auto-style10">
                                    Improvement Actions : 
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox2" CssClass="form-control input-xs" placeholder="Please document the improvement actions discussed with the employee." AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    IDP Discussion :
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox6" CssClass="form-control input-xs" placeholder="Please capture the learnings, opportunities and actions." AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                                <th class="auto-style10">
                                    Career Aspiration :
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox9" CssClass="form-control input-xs" placeholder="Please capture the learnings, opportunities and actions." AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            
                        </table>
                        </div>

                        
                    <br />
                    <br />
                    </div>
                </div>

                <div class="auto-style8" style="align-items:center;">
                        <br /><br />
                        <asp:Button ID="btnSubmit" CssClass="btnsub" runat="server" Text="Submit"/>
                </div>
            </div>
        </div>
        </div>
    </form>
</body>
</html>

