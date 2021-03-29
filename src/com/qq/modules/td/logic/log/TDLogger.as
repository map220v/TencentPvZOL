package com.qq.modules.td.logic.log
{
   import com.qq.modules.td.logic.log.data.ITDLog;
   import com.qq.modules.td.logic.log.data.TDLog_ChangeFuel;
   import com.qq.modules.td.logic.log.data.TDLog_ChangeSun;
   import com.qq.modules.td.logic.log.data.TDLog_ChoosePlantList;
   import com.qq.modules.td.logic.log.data.TDLog_CropPlant;
   import com.qq.modules.td.logic.log.data.TDLog_DamagePlant;
   import com.qq.modules.td.logic.log.data.TDLog_DamageZombie;
   import com.qq.modules.td.logic.log.data.TDLog_DoubleCheckError;
   import com.qq.modules.td.logic.log.data.TDLog_InitData;
   import com.qq.modules.td.logic.log.data.TDLog_KillZombie;
   import com.qq.modules.td.logic.log.data.TDLog_StartData;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import org.as3commons.logging.api.getLogger;
   
   public class TDLogger
   {
      
      public static const LOG_TYPE_InitData:int = 1;
      
      public static const LOG_TYPE_StartData:int = 2;
      
      public static const LOG_TYPE_ChangeSun:int = 3;
      
      public static const LOG_TYPE_CropPlant:int = 4;
      
      public static const LOG_TYPE_ChangeFuel:int = 5;
      
      public static const LOG_TYPE_KillZombie:int = 6;
      
      public static const LOG_TYPE_DamageZombie:int = 7;
      
      public static const LOG_TYPE_DamagePlant:int = 8;
      
      public static const LOG_TYPE_ChoosePlantList:int = 9;
      
      public static const LOG_TYPE_DoubleCheckError:int = 100;
      
      private static var _instance:TDLogger;
       
      
      private var _intervalList:Array;
      
      private var _logData:Array;
      
      private var _logType:Array;
      
      public function TDLogger()
      {
         super();
         this._logType = new Array();
         this._logType[LOG_TYPE_InitData] = new TDLog_InitData();
         this._logType[LOG_TYPE_StartData] = new TDLog_StartData();
         this._logType[LOG_TYPE_ChangeSun] = new TDLog_ChangeSun();
         this._logType[LOG_TYPE_CropPlant] = new TDLog_CropPlant();
         this._logType[LOG_TYPE_ChangeFuel] = new TDLog_ChangeFuel();
         this._logType[LOG_TYPE_KillZombie] = new TDLog_KillZombie();
         this._logType[LOG_TYPE_DamageZombie] = new TDLog_DamageZombie();
         this._logType[LOG_TYPE_DamagePlant] = new TDLog_DamagePlant();
         this._logType[LOG_TYPE_ChoosePlantList] = new TDLog_ChoosePlantList();
         this._logType[LOG_TYPE_DoubleCheckError] = new TDLog_DoubleCheckError();
         this._intervalList = new Array();
         this._intervalList[LOG_TYPE_DamageZombie] = [30000,0];
         this._intervalList[LOG_TYPE_DamagePlant] = [30000,0];
      }
      
      public static function dispose() : void
      {
         _instance = null;
      }
      
      public static function getInstance() : TDLogger
      {
         if(_instance == null)
         {
            _instance = new TDLogger();
         }
         return _instance;
      }
      
      public function dispose() : void
      {
         this._logType = null;
         this._logData = null;
      }
      
      public function updateStartDatalog(param1:int) : void
      {
         var _loc4_:Array = null;
         if(this._logData == null)
         {
            return;
         }
         var _loc2_:int = this._logData.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this._logData[_loc3_]) != null && _loc4_[0] == LOG_TYPE_StartData)
            {
               _loc4_[5] = param1;
               break;
            }
            _loc3_++;
         }
      }
      
      public function write(param1:int, param2:Array) : void
      {
         var _loc5_:Array = null;
         var _loc3_:int = TDGameInfo.getInstance().getCurGameTime();
         if(this._intervalList[param1] != null)
         {
            if(!((_loc5_ = this._intervalList[param1])[1] == 0 || _loc3_ > _loc5_[1] + _loc5_[0]))
            {
               return;
            }
            _loc5_[1] = _loc3_ + _loc5_[0];
         }
         var _loc4_:ITDLog;
         if((_loc4_ = this._logType[param1]) == null)
         {
            getLogger("TDLog").error("未知的日志类型");
         }
         else
         {
            param2.unshift(param1,_loc3_);
            this._logData.push(_loc4_.write(param2));
         }
      }
      
      public function init() : void
      {
      }
      
      public function reset() : void
      {
         var _loc1_:Array = null;
         this._logData = new Array();
         for each(_loc1_ in this._intervalList)
         {
            _loc1_[1] = 0;
         }
         getLogger("TDLog").info("Reset Log");
         TDLogCmd.initTDLog(TDStageInfo.getInstance().mapFileMD5,TDStageInfo.getInstance().tdGameType);
      }
      
      public function getLog() : String
      {
         var _loc4_:Array = null;
         TDLogCmd.replaceStartGameLog();
         var _loc1_:Array = new Array();
         var _loc2_:int = this._logData.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this._logData[_loc3_];
            _loc1_.push(_loc4_.join(","));
            _loc3_++;
         }
         return _loc1_.join(":");
      }
      
      public function format(param1:String) : String
      {
         var _loc6_:String = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:ITDLog = null;
         if(param1 == null)
         {
            return "";
         }
         var _loc2_:String = "";
         var _loc3_:Array = param1.split(":");
         var _loc4_:int = _loc3_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc8_ = (_loc7_ = (_loc6_ = _loc3_[_loc5_]).split(","))[0];
            if((_loc9_ = this._logType[_loc8_]) != null)
            {
               _loc2_ = _loc2_.concat(_loc9_.toString(_loc7_),"<br>");
            }
            _loc5_++;
         }
         return _loc2_;
      }
   }
}
