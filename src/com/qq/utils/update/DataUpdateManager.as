package com.qq.utils.update
{
   import com.qq.utils.DateUtils;
   import com.qq.utils.DelayManager;
   import flash.utils.Dictionary;
   
   public class DataUpdateManager
   {
      
      private static var _instance:DataUpdateManager;
      
      public static const ID_CollectCoin:int = 0;
      
      public static const ID_CollectEnergy:int = 1;
      
      public static const ID_OnlineDailyReward:int = 2;
      
      public static const ID_Activity:int = 3;
      
      public static const ID_SignIn:int = 4;
      
      public static const ID_SinglesDay:int = 5;
      
      public static const ID_Offline:int = 6;
      
      public static const ID_Exped:int = 7;
      
      public static const ID_Declare:int = 8;
      
      public static const ID_DailyQuest:int = 9;
      
      public static const ID_DailyAct:int = 10;
      
      public static const ID_Thanksgiving:int = 11;
      
      public static const ID_ActConsumeFundIcon:int = 12;
      
      public static const ID_ActSpringIcon:int = 13;
      
      public static const ID_LuckyStar:int = 14;
      
      public static const ID_StoreRefreshDailyLimit:int = 15;
      
      public static const ID_ActPennyShop:int = 16;
      
      public static const ID_ActHitJar:int = 17;
      
      private static const PARAM_ID:int = 0;
      
      private static const PARAM_Func:int = 1;
      
      private static const PARAM_FuncParam:int = 2;
       
      
      private var _map:Dictionary;
      
      private var _timeIDList:Array;
      
      public function DataUpdateManager()
      {
         super();
         this._map = new Dictionary();
         this._timeIDList = new Array();
      }
      
      public static function getInstance() : DataUpdateManager
      {
         if(_instance == null)
         {
            _instance = new DataUpdateManager();
         }
         return _instance;
      }
      
      public function addUpdateHandler(param1:int, param2:Function, param3:Array = null) : void
      {
         this.removeDelay(param1);
         this.addDelay(param1,param2,param3);
      }
      
      private function hasDelay(param1:int) : Boolean
      {
         var _loc2_:Array = null;
         for each(_loc2_ in this._map)
         {
            if(_loc2_[PARAM_ID] == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      private function getDelayData(param1:int) : Array
      {
         var _loc2_:Array = null;
         for each(_loc2_ in this._map)
         {
            if(_loc2_[PARAM_ID] == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function addDelay(param1:int, param2:Function, param3:Array) : void
      {
         var _loc4_:Array = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         if(!this.hasDelay(param1))
         {
            (_loc4_ = new Array())[PARAM_ID] = param1;
            _loc4_[PARAM_Func] = param2;
            _loc4_[PARAM_FuncParam] = param3;
            this._map[param1] = _loc4_;
            _loc5_ = DateUtils.getInstance().getNextUpdateDelaySecond();
            _loc6_ = DelayManager.getInstance().addDelay(_loc5_ * 1000,this.onTimeOut,false,[param1]);
            this._timeIDList[param1] = _loc6_;
         }
      }
      
      public function removeDelay(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Array = this.getDelayData(param1);
         if(_loc2_ != null)
         {
            _loc3_ = this._timeIDList[param1];
            DelayManager.getInstance().removeDelay(_loc3_);
            delete this._map[param1];
         }
      }
      
      private function onTimeOut(param1:int) : void
      {
         var _loc4_:Function = null;
         var _loc5_:Array = null;
         var _loc2_:int = this._timeIDList[param1];
         DelayManager.getInstance().removeDelay(_loc2_);
         var _loc3_:Array = this.getDelayData(param1);
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_[PARAM_Func];
            _loc5_ = _loc3_[PARAM_FuncParam];
            if(_loc4_ != null)
            {
               _loc4_.apply(null,_loc5_);
            }
            this.addUpdateHandler(param1,_loc4_,_loc5_);
         }
      }
   }
}
