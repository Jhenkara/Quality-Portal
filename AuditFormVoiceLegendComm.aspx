<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditFormVoiceLegendComm.aspx.cs" Inherits="Audit_Legends.WebForm1" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>Home</title>

        <!--Bootstrap CSS CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <link href="AuditFormVoiceLegendComm.css" rel="stylesheet" type="text/css" />
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

    <script type="text/javascript">
        $(function () {
            $("#tbId4").datepicker(null);
        });
    </script>

    <form id="form1" runat="server">
        <%--Top Form--%>
    <div class="auto-style1">
        <%--<img src="hp_logo_black.jpeg" style="width:100px;overflow:auto;float:left"/>--%>
        <h1 style="color:aliceblue;background-color:black;text-align:center;line-height:100px;"><img src="HP-blue.png" style="width:98px;overflow:auto;float:initial;"/> Premium Voice Legend Audit Form </h1>
    </div>

    <div class="row" style="margin-left:20px;margin-top:20px;">
        <div class="col-sm-10">
        <table id="table1" style="float: left">
            <tr>
                <th>
                    QA Name 
                </th>
                <td>
                    <asp:TextBox ID="tbId1" CssClass="form-control" AutoCompleteType="Disabled" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Customer Type 
                </th>
                <td>
                    <asp:DropDownList ID="ddCusType" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Commercial" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Consumer" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <th>
                    Business Unit 
                </th>
                <td>
                    <asp:DropDownList ID="ddBU" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="PSG" Value="0"></asp:ListItem>
                        <asp:ListItem Text="IPG" Value="1"></asp:ListItem>
                        <asp:ListItem Text="CSC" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <th>
                    Delivery Type 
                </th>
                <td>
                    <asp:DropDownList ID="ddDeliType" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Voice" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Chat" Value="1"></asp:ListItem>
                        <asp:ListItem Text="SCM" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Partner" Value="3"></asp:ListItem>
                        <asp:ListItem Text="RD" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <th>
                    Month 
                </th>
                <td>
                    <asp:DropDownList ID="ddMonth" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Jan" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Feb" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Mar" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Apr" Value="3"></asp:ListItem>
                        <asp:ListItem Text="May" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Jun" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Jul" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Aug" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Sep" Value="8"></asp:ListItem>
                        <asp:ListItem Text="Oct" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Nov" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Dec" Value="11"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <th>
                    Employee ID 
                </th>
                <td>
                    <asp:TextBox ID="tbId2" CssClass="form-control" AutoCompleteType="Disabled" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Employee Name 
                </th>
                <td>
                    <asp:TextBox ID="tbId3" CssClass="form-control" AutoCompleteType="Disabled" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Call Date 
                </th>
                <td>
                    <asp:TextBox ID="tbId4" CssClass="form-control" AutoCompleteType="Disabled" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Evaluation Date : 
                </th>
                <td>
                    <asp:TextBox ID="tbId5" CssClass="form-control" AutoCompleteType="Disabled" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Case Id 
                </th>
                <td>
                    <asp:TextBox ID="tbId6" CssClass="form-control" AutoCompleteType="Disabled" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Call Id/SR Id 
                </th>
                <td>
                    <asp:TextBox ID="tbId7" CssClass="form-control" AutoCompleteType="Disabled" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Call Duration
                </th>
                <td>
                    <asp:TextBox ID="tbId8" CssClass="form-control" AutoCompleteType="Disabled" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Case Type 
                </th>
                <td>
                    <asp:DropDownList ID="ddCaseType" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Remote" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Service Centre" Value="1"></asp:ListItem>
                        <asp:ListItem Text="On Site" Value="2"></asp:ListItem>
                        <asp:ListItem Text="CSR" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Quick Log" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <th>
                    Problem Description 
                </th>
                <td>
                    <asp:TextBox ID="tbId9" CssClass="form-control" AutoCompleteType="Disabled" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Product Line
                </th>
                <td>
                    <asp:DropDownList ID="ddProdLin" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Omen" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Spectre" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <th>
                    Audit No.
                </th>
                <td>
                    <asp:TextBox ID="tbId10" CssClass="form-control" AutoCompleteType="Disabled" runat="server" Height="25px" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th>
                    Persona Idetified as :
                </th>
                <td>
                    <asp:DropDownList ID="ddPersona" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Beginner Ben" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Seasoned Sam" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Leisure Liam" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Focused Fred" Value="3"></asp:ListItem>
                        <asp:ListItem Text="At home Hanna" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Upgrade Ursala" Value="5"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
                
            <tr>
                <th>
                    Proficiency Level
                </th>
                <td>
                    <asp:DropDownList ID="ddProfLvl" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Novice" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Emerging" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Effective" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Advanced" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Expert" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <th>
                    Prediction
                </th>
                <td>
                    <asp:DropDownList ID="ddPred" runat="server" Height="25px" Width="300px">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Promoter" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Passive" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Detractor" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>

        <table style="float: left;margin-left:10px;">
            <tr>
                <th style="width:300px;text-align:center">
                    Highlights
                </th>

                <th style="width:300px;text-align:center">
                    Opportunities
                </th>
            </tr>

            <tr>
                <td>
                    <asp:TextBox ID="TextBox1" TextMode="MultiLine" AutoCompleteType="Disabled" runat="server" Height="280px" Width="280px"></asp:TextBox>
                </td>

                <td>
                    <asp:TextBox ID="TextBox2" TextMode="MultiLine" AutoCompleteType="Disabled" runat="server" Height="280px" Width="280px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <th style="height:50px;text-align:center;font-size:larger;"> 
                    Total Compliance : 
                </th>
                <th style="height:50px;text-align:center;font-size:larger;">
                    <asp:Label id="TotalCompl" runat="server"></asp:Label>
                </th>
            </tr>
        </table>
    </div>
    <br />
    <br />

        <%--Bottom Form--%>
    <%--<asp:GridView runat="server" ID="gvQstn1" AutoGenerateColumns="false" Height="101px" Width="668px">
        <Columns>
            <asp:BoundField DataField="" HeaderText="" />
            <asp:BoundField DataField="" HeaderText="" />
            <asp:BoundField DataField="" HeaderText="" />
            <asp:BoundField DataField="" HeaderText="" />
            <asp:BoundField DataField="" HeaderText="" />
            <asp:BoundField DataField="" HeaderText="" />

        </Columns>
    </asp:GridView>--%>
        <div class="col-sm-12" style="text-align:center;margin-top:20px;float:left;font-size:small;">
        <table border="1">
            <thead>
                <tr>
                    <th scope="col">Code</th>
                    
                    <th scope="col">Areas</th>

                    <th scope="col">Parameters-Customer Critical</th>

                    <th scope="col">Audit Score</th>
                    
                    <th scope="col">Max Score</th>

                    <th scope="col">Scoring</th>
                    
                    <th scope="col">Severity</th>
                </tr>
            </thead>

            <tbody>
                <%--Communication--%>
                <tr>
                    <th>A1</th>
                    <th rowspan="10" scope="rowgroup">Communication</th>
                    <td>FLA Opened the Call with Smile and Energy (Within 5 Seconds)</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="dda1" runat="server" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Select Score--" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>Low</td>
                </tr>

                <tr>
                    <th>A2</th>
                    <td>FLA Appreciated and Utilized the Customer Time Efficiently (Wait time - IVR, Hold time)</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="dda2" runat="server" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>Low</td>
                </tr>

                <tr>
                    <th>A3</th>
                    <td>FLA Adapt to the Customer style of Communication (Communication/Softskill/ Pace and Avoided repeating)</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="dda3" runat="server" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>Low</td>
                </tr>

                <tr>
                    <th>A4</th>
                    <td>FLA Listened to Customer's concern and Paraphrased to display that we have understood the avoiding any confusion</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="dda4" runat="server" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td>Min</td>
                </tr>

                <tr>
                    <th>A5</th>
                    <td>FLA used Positive phrases/Assurance statements with Empathetic/Emotional tone when addressing the customer's need(Agent also needs to <br />confirm on previous ticket and re-assure if there were any concerns shared) provide positive experience</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="dda5" runat="server" onchange="DropDownFilter(this);"><asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="15"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td>Medium</td>
                </tr>

                <tr>
                    <th>A6</th>
                    <td>FLA stood by the Product and Promoted HP Product and Services</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="dda6" runat="server" onchange="DropDownFilter(this);"><asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td>Low</td>
                </tr>

                <tr>
                    <th>A7</th>
                    <td>FLA showcased Commitment towards the Customer/Issue and took Ownership (Immediate callback ,follow up)</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="dda7" runat="server" onchange="DropDownFilter(this);"><asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td>Low</td>
                </tr>

                <tr>
                    <th>A8</th>
                    <td>FLA followed Ease of Effort procedures to make the Customer Experience Smoother</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="dda8" runat="server" onchange="DropDownFilter(this);"><asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td>Medium</td>
                </tr>

                <tr>
                    <th>A9</th>
                    <td>FLA Personalized the call and made an attempt to Amaze the Customer - Amazing Experience(Display Vow Factor)</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="dda9" runat="server" onchange="DropDownFilter(this);"><asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td>Medium</td>
                </tr>

                <tr>
                    <th>A10</th>
                    <td>FLA closed the call Assuring continued support and provided Direct number, Operation hours and SupportWebsite</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="dda10" runat="server" onchange="DropDownFilter(this);"><asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td>Low</td>
                </tr>

                <tr>
                    <td colspan="2"> </td>
                    <th>Customer & Business Critical</th>
                    <td colspan="2" style="background-color:aqua">
                        <asp:Label ID="TotalComm" runat="server"></asp:Label>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <%--Technical Knowledge--%>
                <tr>
                    <th>B1</th>
                    <th rowspan="5" scope="rowgroup">Technical Knowledge</th>
                    <td>FLA asked right Technical/Probing questions to Isolate the Issue</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="ddb1" runat="server" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>Low</td>
                </tr>

                <tr>
                    <th>B2</th>
                    <td>FLA matched the Technical Ability of the Customer and used simple Terms for Better Understanding</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="ddb2" runat="server" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>Low</td>
                </tr>

                <tr>
                    <th>B3</th>
                    <td>FLA used Logical and Accurate Troubleshooting steps following Logic Flow, Alerts and TCG updats</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="ddb3" runat="server" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td>High</td>
                </tr>

                <tr>
                    <th>B4</th>
                    <td>FLA took a Confirmation from Customer and verified the resolution with a Practical Test.</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="ddb4" runat="server" onchange="DropDownFilter(this);"><asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td>Low</td>
                </tr>

                <tr>
                    <th>B5</th>
                    <td>FLA Educated the Customer on possible cause and how to Avoid similar issues in Future - Emails</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="ddb5" runat="server" onchange="DropDownFilter(this);"><asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td>Low</td>
                </tr>

                <tr>
                    <td colspan="2"> </td>
                    <th>Customer & Business Critical</th>
                    <td colspan="2" style="background-color:aqua">
                        <asp:Label ID="TotalTechKnow" runat="server"></asp:Label>
                    </td>
                    <td> </td>
                    <td> </td>
                </tr>

                <%--Process--%>

                <tr>
                    <th>C1</th>
                    <th rowspan="7" scope="rowgroup">Process</th>
                    <td>FLA Captured/Verified/Updated Customer Details accurately in CDAX.(Customer Profile) - Email- High, Phone - Low</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="ddc1" runat="server" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>High</td>
                </tr>

                <tr>
                    <th>C2</th>
                    <td>FLA Captured/Verified/Updated the Product information accurately.</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="ddc2" runat="server" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>Low</td>
                </tr>

                <tr>
                    <th>C3</th>
                    <td>FLA Created/Updated the Case accurately with Critial Troubleshooting Steps and Call Experience(Includes checking previous case history <br />of the customer & appropriately assisting them)</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="ddc3" runat="server" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>Medium</td>
                </tr>

                <tr>
                    <th>C4</th>
                    <td>FLA Created/Updated the Service Order and Sales Offer with appropriate Clossure codes - Case Status and Resolution Code as per Wise Process.</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="ddc4" runat="server" onchange="DropDownFilter(this);"><asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td>Medium</td>
                </tr>

                <tr>
                    <th>C5</th>
                    <td>FLA verified the Warranty Entitlement and provided the best OOW/POP options for the customer's product. (Start Date/End Date)</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="ddc5" runat="server" onchange="DropDownFilter(this);"><asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td>Low</td>
                </tr>

                <tr>
                    <th>C6</th>
                    <td>FLA used appropriate Scripts/Disclaimers as defined by Process Guidelines - (LMI sessions and Privacy Script)</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="ddc6" runat="server" onchange="DropDownFilter(this);"><asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td>High</td>
                </tr>

                <tr>
                    <th>C7</th>
                    <td>FLA followed proper Transfer/Escalation Procedure following ARC Guidelines -Atleast 1 attempt to De-escalate</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="ddc7" runat="server" onchange="DropDownFilter(this);"><asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td>Medium</td>
                </tr>

                <tr>
                    <td colspan="2"> </td>
                    <th>Customer & Business Critical</th>
                    <td colspan="2" style="background-color:aqua">
                        <asp:Label ID="TotalProcess" runat="server"></asp:Label>
                    </td>
                    <td> </td>
                    <td> </td>
                </tr>

                 <%--Service--%>
                <tr>
                    <th>D1</th>
                    <th rowspan="5" scope="rowgroup">Service</th>
                    <td>FLA created Service after exhausting all possible Technical Options and Resources</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="ddd1" runat="server" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>Low</td>
                </tr>

                <tr>
                    <th>D2</th>
                    <td>FLA documented the Dispatch Template accurately with Failure ID's and Symptom Codes in Newton </td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="ddd2" runat="server" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>Low</td>
                </tr>

                <tr>
                    <th>D3</th>
                    <td>FLA provided complete information about the Service ( TAT, Repair/Installation Instructions, Carrier information and Tracking details,<br /> Educate about callback/sms/email which will be received)</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="ddd3" runat="server" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>Medium</td>
                </tr>

                <tr>
                    <th>D4</th>
                    <td>FLA shipped correct Part/RCD's and Unit to the customer? (Choose correct Part/OS and CTO model)</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="ddd4" runat="server" onchange="DropDownFilter(this);"><asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td>Medium</td>
                </tr>

                <tr>
                    <th>D5</th>
                    <td>FLA updated the correct Shipping/Pick up Address for Part/RCD's and Unit</td>
                    <td></td>
                    <td>2</td>
                    <td><asp:DropDownList ID="ddd5" runat="server" onchange="DropDownFilter(this);"><asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td>Low</td>
                </tr>

                <tr>
                    <td colspan="2"> </td>
                    <th>Business Critical</th>
                    <td colspan="2" style="background-color:aqua">
                        <asp:Label ID="TotalService" runat="server"></asp:Label>
                    </td>
                    <td> </td>
                    <td> </td>
                </tr>

                <%--PCI--%>
                <tr>
                    <th>E1</th>
                    <th rowspan="4" scope="rowgroup">PCI</th>
                    <td>Did the Engineer processed Sale / Waiver following Process Guidelines</td>
                    <td></td>
                    <td></td>
                    <td><asp:DropDownList ID="dde1" runat="server" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>Low</td>
                </tr>

                <tr>
                    <th>E2</th>
                    <td>Did the Engineer Avoid Repeating the Credit/Debit/Payment Card Details</td>
                    <td></td>
                    <td></td>
                    <td><asp:DropDownList ID="dde2" runat="server" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>CAT</td>
                </tr>

                <tr>
                    <th>E3</th>
                    <td>Did the Engineer informed the Exact price of the Product/Service to the Customer</td>
                    <td></td>
                    <td></td>
                    <td><asp:DropDownList ID="dde3" runat="server" onchange="DropDownFilter(this);">
                        <asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td>CAT</td>
                </tr>

                <tr>
                    <th>E4</th>
                    <td>FLA created and Updated the Sales Order accurately in CDAX (Cost and Offer)</td>
                    <td></td>
                    <td></td>
                    <td><asp:DropDownList ID="dde4" runat="server" onchange="DropDownFilter(this);"><asp:ListItem Enabled="true" text="--Select Score--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td>Cat</td>
                </tr>

                <tr>
                    <td colspan="2"></td>
                    <th>Business Critical</th>
                    <td colspan="2" style="background-color:aqua">
                        <asp:Label ID="TotalPCI" runat="server"></asp:Label>
                    </td>
                    <td> </td>
                    <td> </td>
                </tr>

                <%--Tracking Questions--%>
                <tr>
                    <th>F1</th>
                    <th rowspan="7" scope="rowgroup">Tracking Questions<br /><br />Operations<br />Requirement</th>
                    <td>ASG exhibited Professionalism behavior on call? (Conduct and Attitude - Abbusive, Rude, Argumentative and <br />No Response for more than 3 minutes)</td>
                    <td> </td>
                    <td> </td>
                    <td><asp:DropDownList ID="ddf1" runat="server">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td></td>
                </tr>

                <tr>
                    <th>F2</th>
                    <td>ASG avoided asking any questions related to survey or ask customer to share feedback regarding the support experience?</td>
                    <td> </td>
                    <td> </td>
                    <td><asp:DropDownList ID="ddf2" runat="server">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="3"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td></td>
                </tr>

                <tr>
                    <th>F3</th>
                    <td>Model </td>
                    <td> </td>
                    <td> </td>
                    <td><asp:DropDownList ID="ddf3" runat="server">
                            <asp:ListItem Text="HP Spectre x360" Value="0"></asp:ListItem>
                            <asp:ListItem Text="HP Omen" Value="1"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td></td>
                </tr>

                <tr>
                    <th>F4</th>
                    <td>Gauge if the customer is Extrovert or Introvert(Extrovert- Build conversation/ Introvert - Quick Solution)</td>
                    <td> </td>
                    <td> </td>
                    <td><asp:DropDownList ID="ddf4" runat="server">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td></td>
                </tr>

                <tr>
                    <th>F5</th>
                    <td>Referance documents, fatcual information shared with customer& provided adequate assurance</td>
                    <td> </td>
                    <td> </td>
                    <td><asp:DropDownList ID="ddf5" runat="server">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td></td>
                </tr>

                <tr>
                    <th>F6</th>
                    <td>Increase the speed of Resolution, be assertive & confident</td>
                    <td> </td>
                    <td> </td>
                    <td><asp:DropDownList ID="ddf6" runat="server">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td></td>
                </tr>

                <tr>
                    <th>F7</th>
                    <td>Rapport built while providing the resolution</td>
                    <td> </td>
                    <td> </td>
                    <td><asp:DropDownList ID="ddf7" runat="server">
                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                        <asp:ListItem Text="No" Value="5"></asp:ListItem>
                        <asp:ListItem Text="NA" Value="0"></asp:ListItem></asp:DropDownList></td>
                    <td></td>
                </tr>

                
            </tbody>
        </table>
    </div>
        <div class="text-sm-center" style="align-items:center;width:100%;">
        <br /><br />
        <asp:Button ID="btnSubmit" CssClass="btnsub" runat="server" Text="Submit" onclick="Submit_Button"/>
        </div>
    </div>
    </form>

   

    <script type="text/javascript">
        var Totalvalue = 0; Target = 100;

        function DropDownFilter(current_id) {
            var e = current_id.id;
            var get = document.getElementById(e);
            var getvalue = get.options[get.selectedIndex].value;
            Totalvalue = parseFloat(Totalvalue) + parseFloat(getvalue);
            document.getElementById("TotalCompl").innerHTML = Target - Totalvalue + "%";
        }
   
    </script>
    
</body>
</html>
