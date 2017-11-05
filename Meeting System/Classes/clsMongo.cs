using BookMyShow.CommonLibrary;
using MongoDB.Bson;
using MongoDB.Driver;
using MongoDB.Driver.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BackOffice
{
    public class clsMongo
    {

        private const string udcErrorSource = "clsMongo";
        private MongoServer objMdbServer = null;
        private MongoClient objMdbClient = null;
        public string strMongoDBConnectionstring;
        public string strMongoDataBase;
        public string strException;

        /// <summary>
        /// Mongo db connection setting
        /// </summary>
        /// <param name="strConnectionstring"> MongoDB connection URI </param>
        /// <param name="strDataBase">Database name </param>
        public clsMongo(string strConnectionstring, string strDataBase)
        {
            const string udcErrorMethod = "Mongo(string strConnectionstring ,string strDataBase)";

            try
            {
                this.strMongoDBConnectionstring = strConnectionstring;
                this.strMongoDataBase = strDataBase;
                this.objMdbClient = new MongoClient(this.strMongoDBConnectionstring);
                this.objMdbServer = objMdbClient.GetServer();
            }
            catch (Exception objEx)
            {
                clsLog.blnLogError(udcErrorSource, udcErrorMethod, "Error in Connecting to server..", objEx.Message);
            }

        }

        public MongoCursor<BsonDocument> bsonReadDocument(string strCollectionName, IMongoQuery query)
        {
            const string udcErrorMethod = "bsonReadDocument";
            MongoCursor<BsonDocument> bsonDoc = null;

            try
            {
                if (!(string.IsNullOrWhiteSpace(strMongoDataBase)) && !(string.IsNullOrWhiteSpace(strCollectionName)))
                {

                    bsonDoc = objMdbServer.GetDatabase(strMongoDataBase).GetCollection(strCollectionName).Find(query);

                }
                else
                {
                    strException = "MongoDataBaseName and MongoCollection Name is Null or Void";
                    clsLog.blnLogError("clsMongoDBEngine", "bsonReadDocument", strException, "");
                }
            }
            catch (Exception ex)
            {
                strException = ex.Message;
                clsLog.blnLogError(udcErrorSource, udcErrorMethod, strException, "DNF Error");
            }
            return bsonDoc;
        }

        public bool blnInsertDocument(string strCollectionName, BsonDocument bsonDoc)
        {
            const string udcErrorMethod = "blnInsertDocument";
            bool blnReturn = false;
            try
            {
                if (!(string.IsNullOrWhiteSpace(strMongoDataBase)) && !(string.IsNullOrWhiteSpace(strCollectionName) && !(bsonDoc.IsBsonNull)))
                {
                    WriteConcernResult objWrite = objMdbServer.GetDatabase(strMongoDataBase).GetCollection(strCollectionName).Insert(bsonDoc);
                    blnReturn = objWrite.Ok;
                }
                else
                {
                    strException = "MongoDataBaseName, MongoCollectionName and BsonDoc is Null or Void";
                    clsLog.blnLogError(udcErrorSource, udcErrorMethod, strException, "");
                }
            }
            catch (Exception ex)
            {
                strException = ex.Message;
                clsLog.blnLogError(udcErrorSource, udcErrorMethod, strException, "DNF Error");
            }

            return blnReturn;
        }

        public bool blnUpdateDocument(string strCollectionName, IMongoQuery query, IMongoUpdate update)
        {
            const string udcErrorMethod = "blnUpdateDocument";
            bool blnReturn = false;
            try
            {
                if (!(string.IsNullOrWhiteSpace(strMongoDataBase)) && !(string.IsNullOrWhiteSpace(strCollectionName)))
                {
                    WriteConcernResult objWrite = objMdbServer.GetDatabase(strMongoDataBase).GetCollection(strCollectionName).Update(query, update, WriteConcern.Acknowledged);
                    blnReturn = objWrite.Ok;
                }
                else
                {
                    strException = "MongoDataBaseName and MongoCollection Name is Null or Void";
                    clsLog.blnLogError("clsMongoDBEngine", "bsonReadDocument", strException, "");
                }
            }
            catch (Exception ex)
            {
                strException = ex.Message;
                clsLog.blnLogError(udcErrorSource, udcErrorMethod, strException, "DNF Error");
            }

            return blnReturn;
        }

        public long lngGetDocumentCount(string strCollectionName, IMongoQuery query, bool blnIsDistinct = false, string strDisinctField = null)
        {
            const string udcErrorMethod = "lngGetDocumentCount";
            long lngCount = 0;
            try
            {
                if (!(string.IsNullOrWhiteSpace(strMongoDataBase)) && !(string.IsNullOrWhiteSpace(strCollectionName)))
                {
                    if (blnIsDistinct == false)
                    {
                        lngCount = objMdbServer.GetDatabase(strMongoDataBase).GetCollection(strCollectionName).Count(query);
                    }
                    if (blnIsDistinct == true)
                    {
                        lngCount = objMdbServer.GetDatabase(strMongoDataBase).GetCollection(strCollectionName).Distinct(strDisinctField, query).Count();
                    }
                }
                else
                {
                    strException = "MongoDataBaseName and MongoCollection Name is Null or Void";
                    clsLog.blnLogError("clsMongoDBEngine", "bsonReadDocument", strException, "");
                }
            }
            catch (Exception ex)
            {
                strException = ex.Message;
                clsLog.blnLogError(udcErrorSource, udcErrorMethod, strException, "DNF Error");
            }
            return lngCount;

        }
   
        public bool blnRemoveDocument(string strCollectionName, IMongoQuery query)
        {
            bool blnReturn = false;
            try
            {
                if (!(string.IsNullOrWhiteSpace(strMongoDataBase)) && !(string.IsNullOrWhiteSpace(strCollectionName)))
                {
                    SafeModeResult objResult = objMdbServer.GetDatabase(strMongoDataBase).GetCollection(strCollectionName).Remove(query, RemoveFlags.Single, SafeMode.True);
                    blnReturn = objResult.Ok;
                }
            }
            catch (Exception exception)
            {
                Exception objEx = exception;
                blnReturn = false;
                clsLog.blnLogError("clsMongoDBEngine", "blnRemoveDocument", "Error Removing Dcoument : ", objEx.ToString());
            }
            return blnReturn;
        }


    }
}