package com.qq.modules.td.model
{
   public class TDMiniGameNoSunData
   {
      
      private static var _instance:TDMiniGameNoSunData;
       
      
      public var dropSunValueList:Array;
      
      public function TDMiniGameNoSunData()
      {
         super();
         this.dropSunValueList = new Array();
      }
      
      public static function getInstance() : TDMiniGameNoSunData
      {
         if(_instance == null)
         {
            _instance = new TDMiniGameNoSunData();
         }
         return _instance;
      }
      
      public function reset() : void
      {
         var _loc1_:XMLList = null;
         var _loc2_:XML = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.dropSunValueList = new Array();
         if(TDStageInfo.getInstance().stageParamXml != null)
         {
            _loc1_ = TDStageInfo.getInstance().stageParamXml.dropSun.zombie;
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = _loc2_.@type;
               _loc4_ = _loc2_.@value;
               this.dropSunValueList[_loc3_] = _loc4_;
            }
         }
      }
      
      public function getDropSunByZombieType(param1:int) : int
      {
         if(this.dropSunValueList[param1] == null)
         {
            return 0;
         }
         return this.dropSunValueList[param1];
      }
   }
}
