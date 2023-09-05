<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrainingSheetNH.aspx.cs" Inherits="Audit_Legends.TrainingSheetNH" %>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title> New Hire Training</title>
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
        <%--<style type="text/css">
            .auto-style1 {
                width: 100%;
            }
        </style>--%>
</head>
<body>

    <script type="text/javascript">
        $(function () {
            $("#tbId7").datepicker(null);
            $("#tbId8").datepicker(null);
        });
    </script>

    <form id="form1" runat="server">
        <%--Top Form--%>
    <div class="auto-style1" style="color:aliceblue;background-color:black;text-align:left;line-height:100px;width:100%">
        <%--<img src="hp_logo_black.jpeg" style="width:100px;overflow:auto;float:left"/>--%>
        <h1><img src="Images/HP logoblu.png" style="width:98px;overflow:auto;float:initial;"/> New Hire Training </h1>
    </div>

    <div style="text-align:right;height:80px;">
        <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
        <asp:Button ID="TrainingDashboard" CausesValidation="false" runat="server" Text="Training Dashboard" OnClick="TrainingDashboard_Click" />
<%--        <asp:Button ID="Download" CausesValidation="false" runat="server" Text="Download" OnClick="FileDownload" />--%>
        <asp:Button ID="btnLogout" CausesValidation="false" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    </div>

    <div class="row " style="margin-left:20px;margin-top:20px;">
        <div class="col-sm-12">
            <asp:HiddenField ID="hfv_empmail" runat="server" />
        <table id="table1" style="float: left">
            <tr>
                <th>
                    Trainer Name :
                </th>
                <td>
                    <asp:TextBox ID="tbId1" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Trainer Mail :
                </th>
                <td>
                    <asp:TextBox ID="tbId1a" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Employee ID 
                </th>
                <td>
                    <asp:TextBox ID="tbId2" CssClass="form-control" AutoPostBack="true" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Employee Name 
                </th>
                <td>
                    <asp:TextBox ID="tbId3" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Manager Name 
                </th>
                <td>
<%--                    <asp:DropDownList ID="ddl9" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Choudhury, Rajib" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Ali, Shaik BS" Value="1"></asp:ListItem>
                        <asp:ListItem Text="D'souza, Melwyn" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Kothandapani, Vasikaran" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Kumar, Ravi Channegowda" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Kulkarni, Archana" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Sayed Sameer Makandar" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Mangalath, Sandeep" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Prakash, Deepak" Value="8"></asp:ListItem>
                        <asp:ListItem Text="M S, Shruthi" Value="9"></asp:ListItem>
                        <asp:ListItem Text="D'Souza, Aovien Cletus" Value="10"></asp:ListItem>
                    </asp:DropDownList>--%>

                    <asp:TextBox ID="tbId4" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Soft Skill Trainer :
                </th>
                <td>
                    <asp:DropDownList ID="cbl1" runat="server">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Ashvi Peter Paul, Francis" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Karunakaran, Dhinakaran" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Balakumar, Jeevan" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Roy, Momi" Value="3"></asp:ListItem>
                    </asp:DropDownList>                
                </td>
            </tr>

            <tr>
                <th>
                    Technical Trainer :
                </th>
                <td>
                    <asp:DropDownList ID="ddl8" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Anand, John William" Value="0"></asp:ListItem>
                        <asp:ListItem Text="George, Roni Rajan" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Alfred, Simon" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <th>
                    Start Date 
                </th>
                <td>
                    <asp:TextBox ID="tbId7" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    End Date : 
                </th>
                <td>
                    <asp:TextBox ID="tbId8" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <th>
                    Batch Number :
                </th>
                <td>
                    <asp:TextBox ID="tbId9" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Duration : 
                </th>
                <td>
                    <asp:TextBox ID="tbId10" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    UAT 1 Score : 
                </th>
                <td>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    UAT 2 Score : 
                </th>
                <td>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    UAT 3 Score : 
                </th>
                <td>
                    <asp:TextBox ID="TextBox3" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    sNPS (0 - 30 days) : 
                </th>
                <td>
                    <asp:TextBox ID="TextBox4" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    sNPS (30 - 60 days) : 
                </th>
                <td>
                    <asp:TextBox ID="TextBox5" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            

        </table>

        <table id="table4" style="float:left;margin-left:30px;position:center">
            <tr>
                <th>
                    Posh Training :
                </th>
                <td>
                    <asp:DropDownList ID="ddl1" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Completed" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Not Assigned" Value="1"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <th>
                    PCI Compliance : 
                </th>
                <td>
                    <asp:DropDownList ID="ddl2" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Completed" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Not Assigned" Value="1"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <th>
                    Global Trade : 
                </th>
                <td>
                    <asp:DropDownList ID="ddl3" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Completed" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Not Assigned" Value="1"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <th>
                    NPS : 
                </th>
                <td>
                    <asp:DropDownList ID="ddl4" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Completed" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Not Assigned" Value="1"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <th>
                    Contingent Worker Code of Conduct :
                </th>
                <td>
                    <asp:DropDownList ID="ddl5" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Completed" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Not Assigned" Value="1"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

<%--            <tr>
                <th>
                    Topics Covered :
                </th>
                <td>
                    <asp:TextBox ID="tbId11" TextMode="MultiLine" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="80px" Width="300px"></asp:TextBox>
                </td>
            </tr>--%>
            
            <tr>
                <th>
                    Com Baseline Scores :
                </th>
                <td>
                    <asp:TextBox ID="tbId12" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Tech Baseline Scores :
                </th>
                <td>
                    <asp:TextBox ID="tbId13" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    TG1 :
                </th>
                <td>
                    <asp:TextBox ID="tbId14" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    TG2 :
                </th>
                <td>
                    <asp:TextBox ID="tbId15" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    TG3 :
                </th>
                <td>
                    <asp:TextBox ID="tbId16" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Quality Score (Wk 1) :
                </th>
                <td>
                    <asp:TextBox ID="TextBox6" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Quality Score (Wk 2) :
                </th>
                <td>
                    <asp:TextBox ID="TextBox7" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Quality Score (Wk 3) :
                </th>
                <td>
                    <asp:TextBox ID="TextBox8" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Quality Score (Wk 4) :
                </th>
                <td>
                    <asp:TextBox ID="TextBox9" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Trainer Feedback :
                </th>
                <td>
                    <asp:TextBox ID="TextBox10" TextMode="MultiLine" CssClass="form-control" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="80px" Width="300px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />

                <div class="text-sm-center" style="align-items:center;width:100%;">
        <br /><br />
        <asp:Button ID="btnUpdate" CssClass="btnsub" runat="server" Text="Update" OnClick="btnUpdate_Click" />
        </div>
    </div>
    </form>
