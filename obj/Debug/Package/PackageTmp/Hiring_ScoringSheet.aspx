<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hiring_ScoringSheet.aspx.cs" Inherits="Audit_Legends.Hiring_ScoringSheet" %>

<!DOCTYPE html>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--Datepicker Jscript format -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css1/bootstrap.min.css" rel="stylesheet" />

    <title>Scoring Sheet</title>
    <%--<link rel="shortcut icon" href="Images/HP logoblu.png"  />--%>

        <!--Bootstrap CSS CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
        <link href="PersonaVoiceLegend.css" rel="stylesheet" type="text/css" />
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
            }
            
            .checkbox input{
                margin-left:50px;
            }
            .input{
                margin: auto; 
                /*setting margin to auto of the cheeckbox*/
                display: flex;/*Flex box property*/
            }
            </style>
</head>
<body>

    <script type="text/javascript">
        $(function () {
            $("#tbId2").datepicker(null);
            $("#TextBox4").datepicker(null);
        });
    </script>

    <form id="form1" runat="server">
        <%--Top Form--%>
    <div class="auto-style1" style="color:aliceblue;background-color:#4d4e4f;text-align:left;line-height:100px;width:100%">
        <%--<img src="hp_logo_black.jpeg" style="width:100px;overflow:auto;float:left"/>--%>
        <h1><%--<img src="Images/hp_logo_white.png" style="width:98px;overflow:auto;float:initial;"/>--%>&nbsp; Scoring Sheet </h1>
    </div>

    <div id="Pane1">
        <div class="container-fluid" style="margin-top:5px;height:auto;width:95%;">
            <div class="card">
                <div class="card-body" style="background-color:white; box-shadow: 0px 0px 3px grey; border-radius:5px;">
                    <div class="row">
                        <div class="col-md-5" style="width:45%;">
                            <p style="display: inline-block; font-family: 'HP Simplified'; font-size:large; text-decoration: underline; text-align:center; font-weight: bold"> </p>
                        <table id="table1">
                            
                            <tr>
                                <th class="auto-style9">
                                    Interviewer Name
                                </th>
                                <td>
                                        <asp:TextBox ID="tbId1" CssClass="form-control input-xs" AutoPostBack="true" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Date
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId2" CssClass="form-control input-xs" placeholder="Choose / type in 'MM/DD/YYYY' Format" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Vendor  
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddVendor" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="MPHASIS LIMITED" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="QUESS CORP LTD" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="JOULESTOWATTS BUSINESS SOLUTIONS" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="FIDELIS CORPORATE SOLUTIONS" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="ETEAM INFOSERVICES PVT LTD" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                                
                            <tr>
                                <th class="auto-style9">
                                    Candidate Name
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox1" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Candidate Phone Number 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId4" CssClass="form-control input-xs" placeholder="Enter 10 digit Mobile Number" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Email ID
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox2" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Voice Clarity(Fatal 0/5)
                                </th>
                                <td>
                                    <asp:TextBox ID="tbVoice" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Accent (out of 10)
                                </th>
                                <td>
                                    <asp:TextBox ID="tbAccent" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" onkeyup="CalcScore();"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Fluency (out of 10)
                                </th>
                                <td>
                                    <asp:TextBox ID="tbFluency" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" onkeyup="CalcScore();"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Grammar (out of 10)
                                </th>
                                <td>
                                    <asp:TextBox ID="tbGrammar" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" onkeyup="CalcScore();"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Comprehension (out of 10)
                                </th>
                                <td>
                                    <asp:TextBox ID="tbComprehension" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" onkeyup="CalcScore();"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Sum
                                </th>
                                <td>
                                    <asp:TextBox ID="tbSum" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Score
                                </th>
                                <td>
                                    <asp:TextBox ID="tbScore" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Grade
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId11" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Observations
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId12" TextMode="MultiLine" CssClass="form-control input-xs" AutoPostBack="false" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server" Height="55px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="col-md-5" style="width:50%;">

                            <p style="display: inline-block; font-family: 'HP Simplified'; font-size:large; text-decoration: underline;text-align:center; font-weight: bold"> </p>

                        <table id="table2">

                            
                            <tr>
                                <th class="auto-style9">
                                    Status
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddStatus" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Reject" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="On Hold" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Recommended for
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddJobLevel" CssClass="form-control input-xs" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddJobLevel_SelectedIndexChanged">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="L1 India" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="L1 Global" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Omnichannel" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Others" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr id="trOthers" runat="server">
                                <th class="auto-style9">
                                    Others
                                </th>
                                <td>
                                    <asp:TextBox ID="tbOthers" CssClass="form-control input-xs" TextMode="MultiLine" placeholder="*" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Experienced candidate
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddExp" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Years of relevant experience 
                                </th>
                                <td>
                                    <asp:TextBox ID="tbId13" CssClass="form-control input-xs" AutoPostBack="false" placeholder="In years" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Have personal Laptop
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddLaptop" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                    Have broadband
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddBroadband" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Fully Vaccinated?
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddExpCert" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Yes" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Partial" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            
                            <tr>
                                <th class="auto-style9">
                                    Tech Round
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddTechRound" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Reject" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No Show" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Tech Score
                                </th>
                                <td>
                                    <asp:TextBox ID="tbTechScore" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            
                            <tr>
                                <th class="auto-style9">
                                    Ops Panel Name
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox3" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Ops interview date
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox4" CssClass="form-control input-xs" placeholder="Choose / type in 'MM/DD/YYYY' Format" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            
                            <tr>
                                <th class="auto-style9">
                                    Ops Status
                                </th>
                                <td>
                                    <asp:DropDownList ID="ddOpsStatus" CssClass="form-control input-xs" runat="server">
                                        <asp:ListItem Enabled="true" text="--Choose--" Value="-1" ></asp:ListItem>
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Reject" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No Show" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Pending" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <th class="auto-style9">
                                     Comments
                                </th>
                                <td>
                                    <asp:TextBox ID="TextBox5" CssClass="form-control input-xs" AutoCompleteType="Disabled" BorderStyle="Inset" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </div>


                    <br />
                    <br />
                    </div>
                </div>

                <div class="auto-style8" style="align-items:center;">
                        <br /><br />
                        <asp:Button ID="btnSubmit" CssClass="btnsub" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>
                </div>
            </div>
        </div>
        </div>
    </form>

    <script type="text/javascript">
        function CalcScore() {
            
            var q1 = parseInt(document.getElementById("tbAccent").value);
            var q2 = parseInt(document.getElementById("tbFluency").value);
            var q3 = parseInt(document.getElementById("tbGrammar").value);
            var q4 = parseInt(document.getElementById("tbComprehension").value);
            

            var Sum = q1 + q2 + q3 + q4;

            var Score = Sum / 4;

            if (!isNaN(Sum)) {

                document.getElementById('tbSum').value = Sum;
            }
            

            document.getElementById('tbScore').value = Score;

            if (Score > 8.999) {
                document.getElementById("tbId11").value = "A";
            }
            else if (Score >= 6.999 && Score < 8.999) { document.getElementById("tbId11").value = "B"; }
            else if(Score >= 6.499 && Score < 6.999) { document.getElementById("tbId11").value = "6A"; }
            else if(Score >= 5.9 && Score < 6.499) { document.getElementById("tbId11").value = "6B"; }
            else if(Score < 5.9) { document.getElementById("tbId11").value = "C"; }
        }
    </script>
    <p style="color:red;text-align:center;"> For any Technical assistance, contact Nikhil R (nikhil.r@hp.com)</p>
</body>
</html>
