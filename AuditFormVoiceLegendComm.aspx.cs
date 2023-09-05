using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Audit_Legends
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Button(object sender, EventArgs args)
        {
            //Con.Open();
            //SqlCommand cmd = Con.CreateCommand();

            //string CommandText = "INSERT INTO [dbo].[Audit_VoiceLegend](Audit_No,Agent_Name,QA_Name,Case_Number,Problem_Description,Call_ID,Call_Duration,Call_Date,Evaluation_Date,Phone_Number,Product_Line,Service_Created,Week_Number,Customer_Experience,Total_Compliance,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,B1,B2,,B3,B4,B5,C1,C2,C3,C4,C5,C6,C7,D1,D2,D3,D4,D5,E1,E2,E3,E4,E5,F1,F2,F3,F4,F5,F6,F7,F8,Highlights,Opportunities,MaxComm,MaxTech,MaxProcess,MaxService,MaxPCI,AchComm,AchTech,AchProcess,AchService,AchPCI,ResComm,ResTech,ResProcess,ResService,ResPCI,Month,AgentName1,TL,ID,Manager,Audit_Count,) VALUES(@Audit_No,@Agent_Name,@QA_Name,@Case_Number,@Problem_Description,@Call_ID,@Call_Duration,@Call_Date,@Evaluation_Date,@Phone_Number,@Product_Line,@Service_Created,@Week_Number,@Customer_Experience,@Total_Compliance,@A1,@A2,@A3,@A4,@A5,@A6,@A7,@A8,@A9,@A10,@B1,@B2,@B3,@B4,@B5,@C1,@C2,@C3,@C4,@C5,@C6,@C7,@D1,@D2,@D3,@D4,@D5,@E1,@E2,@E3,@E4,@E5,@F1,@F2,@F3,@F4,@F5,@F6,@F7,@F8,@MaxA1,@MaxA2,@MaxA3,@MaxA4,@MaxA5,@MaxA6,@MaxA7,@MaxA8,@MaxA9,@MaxA10,@MaxB1,@MaxB2,@MaxB3,@MaxB4,@MaxB5,@MaxC1,@MaxC2,@MaxC3,@MaxC4,@MaxC5,@MaxC6,@MaxC7,@MaxD1,@MaxD2,@MaxD3,@MaxD4,@MaxD5,@MaxE1,@MaxE2,@MaxE3,@MaxE4,@MaxE5,@MaxF1,@MaxF2,@MaxF3,@MaxF4,@MaxF5,@MaxF6,@MaxF7,@MaxF8,@Highlights,@Opportunities,@MaxComm,@MaxTech,@MaxProcess,@MaxService,@MaxPCI,@AchComm,@AchTech,@AchProcess,@AchService,@AchPCI,@ResComm,@ResTech,@ResProcess,@ResService,@ResPCI,@Month,@AgentName1,@TL,@ID,@Manager,@Audit_Count,)";
            //cmd = new SqlCommand(CommandText, Con);
            //cmd.Parameters.AddWithValue("@Audit_No", VoiceLegendId1.Text);
            //cmd.Parameters.AddWithValue("@Agent_Name", VoiceLegendId2.Text);
            //cmd.Parameters.AddWithValue("@QA_Name", VoiceLegendId3.Text);
            //cmd.Parameters.AddWithValue("@Case_Number", VoiceLegendId4.Text);
            //cmd.Parameters.AddWithValue("@Problem_Description", VoiceLegendId5.Text);
            //cmd.Parameters.AddWithValue("@Call_ID", VoiceLegendId6.Text);
            //cmd.Parameters.AddWithValue("@Call_Duration", VoiceLegendId7.Text);
            //cmd.Parameters.AddWithValue("@Call_Date", VoiceLegendId8.Text);
            //cmd.Parameters.AddWithValue("@Phone_Number", VoiceLegendId10.Text);
            //cmd.Parameters.AddWithValue("@Product_Line", VoiceLegendId11.Text);
            //cmd.Parameters.AddWithValue("@Service_Created", VoiceLegendId12.Text);
            //cmd.Parameters.AddWithValue("@Week_Number", VoiceLegendId13.Text);
            //cmd.Parameters.AddWithValue("@Customer_Experience", ddCusExp.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@TotalCompl", TotalCompl.Text);
            //cmd.Parameters.AddWithValue("@Highlights", TextBox1.Text);
            //cmd.Parameters.AddWithValue("@Opportunities", TextBox2.Text);
            //cmd.Parameters.AddWithValue("@A1", dda1.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@A2", dda2.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@A3", dda3.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@A4", dda4.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@A5", dda5.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@A6", dda6.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@A7", dda7.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@A8", dda8.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@A9", dda9.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@A10", dda10.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@B1", ddb1.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@B2", ddb2.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@B3", ddb3.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@B4", ddb4.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@B5", ddb5.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@C1", ddc1.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@C2", ddc2.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@C3", ddc3.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@C4", ddc4.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@C5", ddc5.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@C6", ddc6.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@C7", ddc7.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@D1", ddd1.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@D2", ddd2.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@D3", ddd3.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@D4", ddd4.SelectedItem.Text);
            //cmd.Parameters.AddWithValue("@D5", ddd5.SelectedItem.Text);

            //SqlDataReader dr = cmd.ExecuteReader();
            //Con.Close();
        }
    }
}