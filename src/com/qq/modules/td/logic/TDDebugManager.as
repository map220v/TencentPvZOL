package com.qq.modules.td.logic
{
   import PVZ.Cmd.Cmd_DailyTD_ReportResult_CS;
   import PVZ.Cmd.Cmd_NoEndTD_ReportResult_CS;
   import PVZ.Cmd.Cmd_SnowMan_ReportResult_CS;
   import PVZ.Cmd.Cmd_TD_ReportLevelResult_CS;
   import com.qq.modules.dailyTD.command.DailyTdProxyCmd;
   import com.qq.modules.endlessTD.command.EndlessTDProxyCmd;
   import com.qq.modules.td.command.TDProxyCmd;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.modules.yetiTD.command.YetiTDProxyCmd;
   import com.qq.utils.tqos.TQOSUtils;
   import flash.utils.ByteArray;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class TDDebugManager
   {
      
      private static var _instance:TDDebugManager;
       
      
      private var _checkFunID:int;
      
      private var _type:int;
      
      private var _cacheMsg;
      
      private var _cacheLog:String;
      
      public function TDDebugManager()
      {
         super();
      }
      
      public static function getInstance() : TDDebugManager
      {
         if(_instance == null)
         {
            _instance = new TDDebugManager();
         }
         return _instance;
      }
      
      public function checkTDServerMsg(param1:int, param2:*, param3:String) : void
      {
         if(this._checkFunID)
         {
            clearTimeout(this._checkFunID);
            this._checkFunID = 0;
         }
         this._checkFunID = setTimeout(this.checkCallBack,10000);
         this._type = param1;
         this._cacheMsg = param2;
         this._cacheLog = param3;
      }
      
      public function uncheckTDSeverMsg() : void
      {
         if(this._checkFunID)
         {
            clearTimeout(this._checkFunID);
            this._checkFunID = 0;
         }
      }
      
      private function checkCallBack() : void
      {
         var _loc3_:Cmd_TD_ReportLevelResult_CS = null;
         var _loc4_:Cmd_DailyTD_ReportResult_CS = null;
         var _loc5_:Cmd_NoEndTD_ReportResult_CS = null;
         var _loc6_:Cmd_SnowMan_ReportResult_CS = null;
         var _loc1_:* = "TDResultRepeat_" + this._type + "_";
         var _loc2_:ByteArray = new ByteArray();
         switch(this._type)
         {
            case TDStartParam.Normal:
               _loc3_ = this._cacheMsg as Cmd_TD_ReportLevelResult_CS;
               TDProxyCmd.finishLevel(_loc3_.levelId,_loc3_.subLevelId,_loc3_.challengeLevelId,_loc3_.score,_loc3_.passResult,_loc3_.achievementList,true);
               break;
            case TDStartParam.Daily:
               _loc4_ = this._cacheMsg as Cmd_DailyTD_ReportResult_CS;
               DailyTdProxyCmd.reportDailyTDResult(_loc4_.stageId,_loc4_.passResult,_loc4_.stDailyTD,this._cacheLog,true);
               break;
            case TDStartParam.Endless:
               _loc5_ = this._cacheMsg as Cmd_NoEndTD_ReportResult_CS;
               EndlessTDProxyCmd.reportResult(_loc5_.passResult,_loc5_.score,this._cacheLog,true);
               break;
            case TDStartParam.Yeti:
               _loc6_ = this._cacheMsg as Cmd_SnowMan_ReportResult_CS;
               YetiTDProxyCmd.reportResult(_loc6_.passResult,_loc6_.killNum,this._cacheLog,true);
         }
         _loc2_.writeUTFBytes(this._cacheLog);
         _loc1_ += _loc2_.length;
         _loc2_.compress();
         _loc1_ += "_" + _loc2_.length;
         TQOSUtils.getInstance().reportMsg(_loc1_);
      }
   }
}
