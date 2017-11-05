using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Meeting_System.Classes
{

    public class MeetDetails
    {
        //[BsonId]
        //public ObjectId _id { get; set; }
        public string Room_id { get; set; }
        public string Room_name { get; set; }
        public string Room_status { get; set; }
        public string Room_startTime { get; set; }
        public string Room_endTime { get; set; }
        public string Person_name { get; set; }
        public string Token_id { get; set; }
        public string Attendi_details { get; set; }
        public string Meeting_Purpose { get; set; }
        public string Description { get; set; }
    }
    public class UserDetails
    {
        public string Contact_No { get; set; }
        public string User_name { get; set; }
        public string Password { get; set; }

    }
}