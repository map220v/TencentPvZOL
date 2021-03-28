package com.qq.utils.tqos
{
   import com.adobe.serialization.json.JSON;
   import com.qq.GameGloble;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.sendToURL;
   import org.as3commons.logging.api.getLogger;
   
   public class TQOSUtils
   {
      
      private static const CMD_Report_TD_Performence:String = "1";
      
      private static const CMD_Report_Error:String = "Report_Error";
      
      private static var _instance:TQOSUtils;
       
      
      private const MAX_REPORT_PARA_COUNT:int = 10;
      
      private const cmd:int = 5;
      
      private var qosreq:String;
      
      private const businessID:int = 17095;
      
      private var ctlID:String;
      
      private var serverID:String;
      
      private var qosNum:int = 1;
      
      private var qosList:String;
      
      private const qosID:int = 17095;
      
      private var qosVal:int = 0;
      
      private var appendDescFlag:int = 2;
      
      public function TQOSUtils()
      {
         super();
      }
      
      public static function getInstance() : TQOSUtils
      {
         if(_instance == null)
         {
            _instance = new TQOSUtils();
         }
         return _instance;
      }
      
      public function report_TD_performence(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:String) : void
      {
         var _loc8_:Array = [CMD_Report_TD_Performence,param1,param2,param3,param4,param5,param6,param7];
         this.report(_loc8_);
      }
      
      public function reportMsg(param1:String, param2:Boolean = true) : void
      {
         if(param2)
         {
            getLogger("reportMsg").error(param1);
         }
         var _loc3_:String = "roleId=" + (!!GameGloble.actorModel ? GameGloble.actorModel.roleId.toString() : "null");
         _loc3_ += "ServerID=" + GameGloble.actorModel.zoneID;
         _loc3_ += "UID=" + ExternalVars.UID;
         var _loc4_:Array = [CMD_Report_Error,_loc3_,param1];
         this.report(_loc4_);
      }
      
      private function report(param1:Array, param2:Array = null) : void
      {
         var _loc5_:* = undefined;
         var _loc3_:int = param1.length;
         var _loc4_:Array = [];
         var _loc6_:String = "";
         var _loc7_:RegExp = /,/g;
         var _loc8_:int = 0;
         while(_loc8_ < _loc3_)
         {
            if((_loc5_ = param1[_loc8_]) is String)
            {
               _loc5_ = (_loc5_ as String).replace(_loc7_,"_");
            }
            if(_loc8_ >= this.MAX_REPORT_PARA_COUNT - 1)
            {
               _loc6_ += " " + String(_loc5_);
            }
            else
            {
               _loc4_.push(_loc5_);
            }
            _loc8_++;
         }
         if(_loc6_ != "")
         {
            _loc4_.push(_loc6_);
         }
         var _loc9_:String = "tqos=" + this.encode(param2,_loc4_);
         var _loc10_:URLRequest;
         (_loc10_ = new URLRequest("http://ied-tqosweb.qq.com:8001")).data = _loc9_;
         _loc10_.method = URLRequestMethod.POST;
         sendToURL(_loc10_);
      }
      
      private function encode(param1:Array, param2:Array) : String
      {
         var _loc3_:Object = {
            "Head":{"Cmd":5},
            "Body":{"QQSRep":{
               "BusinessID":this.businessID,
               "QosNum":this.qosNum,
               "QosList":[{
                  "QosID":17095,
                  "QosVal":0,
                  "AppendDescFlag":this.appendDescFlag,
                  "AppendDesc":{"Comm":{
                     "IntNum":(!!param1 ? param1.length : 0),
                     "IntList":(!!param1 ? param1.length : []),
                     "StrNum":(!!param2 ? param2.length : 0),
                     "StrList":(!!param2 ? param2 : [])
                  }}
               }]
            }}
         };
         return com.adobe.serialization.json.JSON.encode(_loc3_);
      }
   }
}
