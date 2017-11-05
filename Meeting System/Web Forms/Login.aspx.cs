using System;
using System.Linq;
using MongoDB.Driver;
using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Driver.Builders;

namespace Meeting_System.Web_Forms
{
    public partial class Login : System.Web.UI.Page
    {
        const string udcErrorSource = "Login";
        public static BackOffice.clsMongo objMongo = new BackOffice.clsMongo(clsSettings.Get("MettingRoom", "MONGODB", ""), clsSettings.Get("MettingRoom", "DATABASE", "MEETROOM"));
        public const string strCollectionName = "tblUser_Details";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {

            const string udcErrorMethod = "Submit_Click";
            BsonDocument bsonDoc = new BsonDocument();
            clsUserInfo objMongoData;
            try
            {
                string strUserName = txtUserName.Text.Trim();
                string strPass = txtUserPass.Text.Trim();

                if (!string.IsNullOrWhiteSpace(strUserName) && !string.IsNullOrWhiteSpace(strPass))
                {
                    var userId = Query.EQ("_id", strUserName);
                    MongoCursor<BsonDocument> cursor = objMongo.bsonReadDocument(strCollectionName, userId);
                    if (cursor != null && cursor.Count() > 0)
                    {
                        bsonDoc = cursor.FirstOrDefault();
                        objMongoData = BsonSerializer.Deserialize<clsUserInfo>(bsonDoc.ToJson());
                        clsLog.blnLogDebug(udcErrorSource, udcErrorMethod, "User Data successfully fetched from mongo database", "", "", "", "");
                        if (strPass.Equals(objMongoData.Password.Trim()))
                        {
                            //ClientScript.RegisterClientScriptBlock(this.GetType(), "Successfully Saved", "<script language=javascript>alert('Successfully logged in!!!');</script>");
                            //Response.Redirect("/Web Forms/RoomLayout.aspx");
                            Session["username"] = objMongoData._id;
                            Server.Transfer("/Web Forms/RoomLayout.aspx");
                        }
                        else
                        {
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "Invalid Password", "<script language=javascript>alert('Invalid password');</script>");
                            clsLog.blnLogError(udcErrorSource, udcErrorMethod, "User Password is not correct", "");
                        }
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Invalid User ID or Password", "<script language=javascript>alert('Invalid User ID or Password');</script>");
                        clsLog.blnLogError(udcErrorSource, udcErrorMethod, "UserData not received from Mongo database or | User does not exist", "");
                    }
                }
            }
            catch (Exception ex)
            {
                clsLog.blnLogError(udcErrorSource, udcErrorMethod, "Exception catched in method blnValidateLogin !! ", " | Exception : " + ex.ToString());
            }
        }

    }
    public class clsUserInfo
    {
        public string _id { get; set; }
        public string Password { get; set; }
    }
}
