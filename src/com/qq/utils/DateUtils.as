package com.qq.utils
{
   public class DateUtils
   {
      
      public static const ONE_DAY_SECOND:uint = 86400;
      
      public static const ONE_HOUR_SECOND:uint = 3600;
      
      private static var _instance:DateUtils;
       
      
      private var _localOffset:int;
      
      public function DateUtils()
      {
         super();
         this._localOffset = 0;
      }
      
      public static function getInstance() : DateUtils
      {
         if(_instance == null)
         {
            _instance = new DateUtils();
         }
         return _instance;
      }
      
      public function setServerTime(param1:Number) : void
      {
         this._localOffset = new Date().getTime() * 0.001 - param1;
      }
      
      public function getServerTime() : Number
      {
         var _loc1_:Date = new Date();
         return Math.floor(_loc1_.getTime() / 1000) - this._localOffset;
      }
      
      public function getServerDate() : Date
      {
         var _loc1_:Date = new Date();
         _loc1_.setTime(_loc1_.getTime() - this._localOffset * 1000);
         return _loc1_;
      }
      
      public function getInterval(param1:Number) : Number
      {
         return Number(param1 - this.getServerTime());
      }
      
      public function getDateDetailYearTime(param1:Number) : String
      {
         var _loc2_:Date = new Date();
         _loc2_.setTime(param1 * 1000);
         return this.fillNum(_loc2_.getFullYear()).concat("-",this.fillNum(_loc2_.getMonth() + 1),"-",this.fillNum(_loc2_.getDate())," ",this.fillNum(_loc2_.getHours()),":",this.fillNum(_loc2_.getMinutes()));
      }
      
      public function fillNum(param1:Number) : String
      {
         var _loc2_:String = String(param1);
         if(param1 <= 9)
         {
            _loc2_ = "0" + _loc2_;
         }
         return _loc2_;
      }
      
      public function getNextUpdateDelaySecond() : Number
      {
         var _loc1_:Date = this.getServerDate();
         _loc1_.hours += 24;
         _loc1_.hours = 0;
         _loc1_.minutes = DMath.randNum(0,3);
         _loc1_.seconds = DMath.randNum(1,59);
         return Number(this.getInterval(_loc1_.time * 0.001));
      }
      
      public function getServerT() : uint
      {
         var _loc1_:Date = this.getServerDate();
         return Date.UTC(_loc1_.fullYear,_loc1_.month,_loc1_.date,_loc1_.hours,_loc1_.minutes,_loc1_.seconds,0) / 1000;
      }
      
      public function getTimeOrder(param1:Date, param2:Date, param3:Date) : int
      {
         if(param1 < param2)
         {
            return -1;
         }
         if(param1 < param3)
         {
            return 0;
         }
         return 1;
      }
      
      public function getDateFromArr(param1:Array) : Date
      {
         var _loc2_:Date = this.getServerDate();
         _loc2_.seconds = 0;
         switch(param1.length)
         {
            case 2:
               _loc2_.minutes = _loc2_[1];
               _loc2_.hours = _loc2_[0];
               break;
            case 3:
               _loc2_.minutes = _loc2_[2];
               _loc2_.hours = _loc2_[1];
               _loc2_.date = _loc2_[0];
               break;
            case 4:
               _loc2_.minutes = _loc2_[3];
               _loc2_.hours = _loc2_[2];
               _loc2_.date = _loc2_[1];
               _loc2_.month = _loc2_[0] - 1;
         }
         return _loc2_;
      }
   }
}
