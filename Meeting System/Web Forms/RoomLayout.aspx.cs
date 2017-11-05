using Meeting_System.Classes;
using MongoDB.Bson;
using MongoDB.Bson.IO;
using MongoDB.Bson.Serialization;
using MongoDB.Driver;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Meeting_System.Web_Forms
{
    public partial class RoomLayout : System.Web.UI.Page
    {
        public static BackOffice.clsMongo objMongo = new BackOffice.clsMongo(clsSettings.Get("MettingRoom", "MONGODB", ""), clsSettings.Get("MettingRoom", "DATABASE", "MEETROOM"));
        protected void Page_Load(object sender, EventArgs e)
        {
            divRoomsLayout.Visible = false;
            idCreatedBy.Value = Convert.ToString(Session["username"]);
        }

        protected void ShowResult1_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime dtmStartDateTime = Convert.ToDateTime(idStartDate.Value);
                DateTime dtmEndDateTime = Convert.ToDateTime(idEndDate.Value);

                List<MeetDetails> lstReturnedMeetDetailDoc = lstGetMeetDetailDoc(dtmStartDateTime, dtmEndDateTime);
                vdMapBlockedRooms(lstReturnedMeetDetailDoc);
                divRoomsLayout.Visible = true;
            }
            catch (Exception ex)
            {
                //error log
            }
        }

        public List<MeetDetails> lstGetMeetDetailDoc(DateTime dtmStartDateTime, DateTime dtmEndDateTime)
        {
            List<MeetDetails> lstMeetfilter = new List<MeetDetails>();
            List<MeetDetails> lstMeet = new List<MeetDetails>();
            MeetDetails clsObj = null;
            QueryDocument objQuery = new QueryDocument();
            try
            {
                objQuery.Add("Room_status", "Y");

                var vrMeet = objMongo.bsonReadDocument("tblMeetRoom_Details", objQuery);
                foreach (var objMeet in vrMeet)
                {
                    clsObj = new MeetDetails();
                    clsObj.Room_id = objMeet["Room_id"].ToString();
                    clsObj.Room_name = objMeet["Room_name"].ToString();
                    clsObj.Room_startTime = objMeet["Room_startTime"].ToString();
                    clsObj.Room_endTime = objMeet["Room_endTime"].ToString();
                    lstMeet.Add(clsObj);
                }
                for (int i = 0; i < lstMeet.Count; i++)
                {
                    if (Convert.ToDateTime(lstMeet[i].Room_startTime) < dtmEndDateTime && dtmStartDateTime < Convert.ToDateTime(lstMeet[i].Room_endTime))
                    {
                        clsObj = new MeetDetails();
                        clsObj.Room_id = lstMeet[i].Room_id;
                        clsObj.Room_name = lstMeet[i].Room_name;
                        lstMeetfilter.Add(clsObj);
                    }
                }
                return lstMeetfilter;
            }
            catch (Exception Ex)
            {
                return lstMeetfilter;
            }
        }

        public void vdMapBlockedRooms(List<MeetDetails> lstMeetDetailsDoc)
        {
            try
            {
                string strIdParam = "";
                foreach (MeetDetails objMeetDetails in lstMeetDetailsDoc)
                {
                    switch (objMeetDetails.Room_id)
                    {
                        case "AMP":
                            btnAmphi.Attributes["class"] = "btn btn-danger";
                            //ClientScript.RegisterStartupScript(GetType(), "script", "disableAmphiFunction();", true);
                            hdnAmphi.Value = "true";
                            break;
                        case "FISHBOWL":
                            btnFishBowl.Attributes["class"] = "btn btn-danger";
                            //ClientScript.RegisterStartupScript(GetType(), "script", "disableFishFunction();", true);
                            hdnFish.Value = "true";
                            break;
                        case "GARAGE":
                            btnGarage.Attributes["class"] = "btn btn-danger";
                            //ClientScript.RegisterStartupScript(GetType(), "script", "disableGarageFunction();", true);
                            hdnGarage.Value = "true";
                            break;
                        case "NEST":
                            btnNest.Attributes["class"] = "btn btn-danger";
                            //ClientScript.RegisterStartupScript(GetType(), "script", "disableNestFunction();", true);
                            hdnNest.Value = "true";
                            break;
                    }
                }
                ClientScript.RegisterStartupScript(GetType(), "script", "disableFunction();", true);
            }
            catch (Exception Ex)
            {

                //error log
                //exception alert
            }
        }

        protected void btnEventSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string strEventDetailsJson = CreateEventDoc();
                insertdoc(strEventDetailsJson);
            }
            catch (Exception Ex)
            {

                //errorlog
            }
        }

        public string CreateEventDoc()
        {
            string strMethod = "CreateEventDoc()";
            string strEventDetailsJson = "";
            try
            {
                List<MeetDetails> lstMeet = new List<MeetDetails>();
                MeetDetails clsMeet = new MeetDetails();
                // MEETROOM DETAILS
                string strRoomName = idLocation.Value;
                switch (strRoomName)
                {
                    case "The FishBowl":
                        clsMeet.Room_id = "FISHBOWL";
                        break;
                    case "The Garage":
                        clsMeet.Room_id = "GARAGE";
                        break;
                    case "Amphitheatre":
                        clsMeet.Room_id = "AMP";
                        break;
                    case "The Nest":
                        clsMeet.Room_id = "NEST";
                        break;

                }
                Session["Location"]= clsMeet.Room_name = strRoomName;
                Session["StartDatetime"] = clsMeet.Room_startTime = idStartDateTime.Value.ToString();
                Session["EndDatetime"] = clsMeet.Room_endTime = idEndDateTime.Value.ToString();
                clsMeet.Room_status = "Y"; //Should be changed to C if cancelled
                Session["Attendees"] = clsMeet.Attendi_details = "afsan.gujarati@bookmyshow.com|irfan.shailh@bookmyshow.com|suresh.rajput@bookmyshow.com"; //need to be dynamic should come from FE
                clsMeet.Token_id = "";
                Session["CreatedBy"] = clsMeet.Person_name = idCreatedBy.Value;
                Session["EventTitle"] = clsMeet.Meeting_Purpose = idEventTitle.Value;
                Session["Description"] = clsMeet.Description = idDescription.Value;
                strEventDetailsJson = JsonConvert.SerializeObject(clsMeet, Newtonsoft.Json.Formatting.Indented);
                return strEventDetailsJson;
            }
            catch (Exception ex)
            {
                clsLog.blnLogError("", strMethod, "Error while forming meeting details data", ex.ToString());
                return strEventDetailsJson;
            }
        }
        public void insertdoc(string strEventDetailsJson)
        {
            string strMethod = "insertdoc()";
            try
            {
                BsonDocument bsonEventDetails = BsonDocument.Parse(strEventDetailsJson);

                if (objMongo.blnInsertDocument("tblMeetRoom_Details", bsonEventDetails))
                {
                    //form a data using the inputs and show the user a confirmation page
                    Server.Transfer("/Web Forms/ConfirmationPage.aspx");
                }
                else
                {
                    //error with exception and response
                }
            }
            catch (Exception ex)
            {
                clsLog.blnLogError("", strMethod, "Error while inserting meeting details", ex.ToString());
            }
        }
    }
}