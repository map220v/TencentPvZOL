package com.qq.utils
{
   import com.qq.utils.db.ShareObjectDB;
   import flash.external.ExternalInterface;
   import flash.utils.getTimer;
   
   public class GameDataReport
   {
      
      public static const Data_Start_Load:String = "Data_Start_Load";
      
      public static const Data_Finish_Load_MainFile:String = "Data_Finish_Load_MainFile";
      
      public static const Data_Start_Connect_Server:String = "Data_Start_Connect_Server";
      
      public static const Data_Finish_Connect_Server:String = "Data_Finish_Connect_Server";
      
      public static const Data_GuideTD_END:String = "Data_GuideTD_END";
      
      public static const Data_Show_GameScene_Success:String = "Data_Show_GameScene_Success";
      
      public static const Data_PreMovie_JUMPOUT:String = "Data_PreMovie_JUMPOUT";
      
      public static const Data_PreMovie_START:String = "Data_PreMovie_START";
      
      public static const Data_PreMovie_PLAYED_HALF:String = "Data_PreMovie_PLAYED_HALF";
      
      public static const Data_PreMovie_PLAYED_ALL:String = "Data_PreMovie_PLAYED_ALL";
      
      private static var _instance:GameDataReport;
       
      
      private var _time_record:Number;
      
      private var _is_Inited:Boolean;
      
      private var _dataCacheList:Array;
      
      private var _is_Report:Boolean = true;
      
      public function GameDataReport()
      {
         var _loc3_:Number = NaN;
         var _loc4_:Date = null;
         super();
         this._time_record = getTimer();
         this._is_Inited = true;
         this._dataCacheList = new Array();
         var _loc1_:Date = new Date();
         var _loc2_:Number = _loc1_.getTime();
         if(ShareObjectDB.getInstance().hasData("dataReport"))
         {
            _loc3_ = Number(ShareObjectDB.getInstance().readData("dataReport"));
            (_loc4_ = new Date()).setTime(_loc3_);
            if(_loc1_.date == _loc4_.date)
            {
               this._is_Report = false;
            }
         }
         ShareObjectDB.getInstance().writeData("dataReport",_loc2_,true);
      }
      
      public static function getInstance() : GameDataReport
      {
         if(_instance == null)
         {
            _instance = new GameDataReport();
         }
         return _instance;
      }
      
      public function report(param1:String, param2:Boolean = true, param3:Boolean = false) : void
      {
         if(!this._is_Report && !param3)
         {
            return;
         }
         var _loc4_:Array = [];
         var _loc5_:String = "{time}";
         var _loc6_:String = "0";
         if(ExternalVars.ZONE_ID.length > 0)
         {
            _loc6_ = ExternalVars.ZONE_ID;
         }
         _loc4_.unshift("DownloadDataReport","0",ExternalVars.UID,_loc5_,ExternalVars.SFrom,ExternalVars.Channel,_loc6_);
         if(param2)
         {
            _loc4_.push(getTimer() - this._time_record);
         }
         _loc4_.push(param1);
         var _loc7_:String = _loc4_.join("|");
         if(this._is_Inited || param3)
         {
            this.flush();
            this.post(_loc7_);
         }
         else
         {
            this._dataCacheList.push(_loc7_);
         }
      }
      
      public function flush() : void
      {
         var _loc1_:String = null;
         if(this._is_Inited)
         {
            while(this._dataCacheList.length > 0)
            {
               _loc1_ = this._dataCacheList.pop();
               this.post(_loc1_);
            }
         }
      }
      
      public function post(param1:String) : void
      {
         if(true)
         {
            if(ExternalInterface.available)
            {
               ExternalInterface.call("dataReport",param1);
            }
         }
      }
   }
}
