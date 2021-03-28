package org.allencuilib.util
{
   import com.qq.utils.DateUtils;
   
   public final class TimeUtils
   {
      
      public static const LEFT_HH_MM_SS:String = "hh:mm:ss";
      
      public static const LEFT_HH_MM:String = "hh:mm";
      
      public static const LEFT_MM_SS:String = "mm:ss";
      
      public static const LEFT_DD_HH_MM$CHN:String = "dd天 hh:mm";
      
      public static const LEFT_DD_HH$CHN:String = "dd天 hh";
      
      public static const LEFT_HH_MM$CHN:String = "dd天 hh";
      
      public static const HH_MM_SS:String = "HH_MM_SS";
      
      public static const HH_MM:String = "HH_MM";
      
      public static const MM_SS:String = "MM_SS";
      
      public static const HH_MM$CHN:String = "HH_MM$CHN";
      
      public static const YY_MM_DD:String = "yy-mm-dd";
      
      public static const YY_MM_DD_HH_MM:String = "yy-mm-dd hh:mm";
      
      public static const YY_MM_DD_HH_MM_SS:String = "yy-mm-dd hh:mm:ss";
      
      public static const MM_DD_HH_MM:String = "mm-dd hh:mm";
      
      public static const MM_DD_HH_MM$CHN:String = "mm月dd日 hh:mm";
      
      public static const MM_DD_HH_MM_SS$CHN:String = "mm月dd日 hh:mm:ss";
      
      public static const DAY_HH_MM$CHN:String = "周D hh:mm";
      
      public static const DAY_HH_MM_SS$CHN:String = "周D hh:mm:ss";
      
      public static const YY_MM_DD$CHN:String = "yy年mm月dd日";
      
      public static const DAY_STR:Array = ["日","一","二","三","四","五","六"];
       
      
      public function TimeUtils()
      {
         super();
      }
      
      public static function GetDigitalTimeString(param1:uint, param2:Boolean = false, param3:Boolean = true) : String
      {
         var _loc4_:String = "";
         var _loc5_:int = !!param3 ? int(int(param1 / 3600)) : int(int(param1 / 3600) % 24);
         if(param2 || _loc5_ > 0)
         {
            _loc4_ += toTwo(_loc5_) + ":";
         }
         var _loc6_:int = int(param1 % 3600 / 60);
         if(param2 || _loc5_ > 0 || _loc6_ > 0)
         {
            _loc4_ += toTwo(_loc6_) + ":";
         }
         var _loc7_:int = int(param1 % 60);
         return _loc4_ + toTwo(_loc7_);
      }
      
      public static function formatSecondToStr(param1:Number, param2:String = "hh:mm:ss", param3:Boolean = false) : String
      {
         var _loc5_:Date = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:String = null;
         var _loc21_:int = 0;
         var _loc22_:String = null;
         var _loc23_:int = 0;
         var _loc24_:String = null;
         var _loc4_:* = "";
         if(param3)
         {
            _loc5_ = DateUtils.getInstance().getServerDate();
            param1 -= _loc5_.timezoneOffset * 60;
         }
         if(_loc5_ == null)
         {
            _loc5_ = new Date();
         }
         _loc5_.time = param1 * 1000;
         var _loc6_:int = _loc5_.getFullYear();
         var _loc7_:int = _loc5_.getMonth() + 1;
         var _loc8_:String = toTwo(_loc7_);
         var _loc9_:int = _loc5_.getDate();
         var _loc10_:String = toTwo(_loc9_);
         var _loc11_:int = _loc5_.hours;
         var _loc12_:String = toTwo(_loc11_);
         var _loc13_:int = _loc5_.minutes;
         var _loc14_:String = toTwo(_loc13_);
         var _loc15_:int = _loc5_.seconds;
         var _loc16_:String = toTwo(_loc15_);
         var _loc17_:String = DAY_STR[_loc5_.getDay()];
         switch(param2)
         {
            case YY_MM_DD:
            case YY_MM_DD_HH_MM:
            case YY_MM_DD_HH_MM_SS:
            case MM_DD_HH_MM:
            case YY_MM_DD$CHN:
            case DAY_HH_MM$CHN:
            case DAY_HH_MM_SS$CHN:
            case MM_DD_HH_MM$CHN:
            case HH_MM_SS:
            case HH_MM:
            case MM_SS:
            case HH_MM$CHN:
               if(param2 == YY_MM_DD)
               {
                  _loc4_ = _loc6_ + "-" + _loc14_ + "-" + _loc10_;
               }
               else if(param2 == YY_MM_DD_HH_MM)
               {
                  _loc4_ = _loc6_ + "-" + _loc8_ + "-" + _loc10_ + " " + _loc12_ + ":" + _loc14_;
               }
               else if(param2 == YY_MM_DD_HH_MM_SS)
               {
                  _loc4_ = _loc6_ + "-" + _loc8_ + "-" + _loc10_ + " " + _loc12_ + ":" + _loc14_ + ":" + _loc16_;
               }
               else if(param2 == MM_DD_HH_MM)
               {
                  _loc4_ = _loc8_ + "-" + _loc10_ + " " + _loc12_ + ":" + _loc14_;
               }
               else if(param2 == YY_MM_DD$CHN)
               {
                  _loc4_ = _loc6_ + "年" + _loc8_ + "月" + _loc10_ + "日";
               }
               else if(param2 == DAY_HH_MM$CHN)
               {
                  _loc4_ = "周" + _loc17_ + " " + _loc12_ + ":" + _loc14_;
               }
               else if(param2 == DAY_HH_MM_SS$CHN)
               {
                  _loc4_ = "周" + _loc17_ + " " + _loc12_ + ":" + _loc14_ + ":" + _loc16_;
               }
               else if(param2 == MM_DD_HH_MM$CHN)
               {
                  _loc4_ = _loc8_ + "月" + _loc10_ + "日 " + _loc12_ + ":" + _loc14_;
               }
               else if(param2 == HH_MM_SS)
               {
                  _loc4_ = _loc12_ + ":" + _loc14_ + ":" + _loc16_;
               }
               else if(param2 == HH_MM)
               {
                  _loc4_ = _loc12_ + ":" + _loc14_;
               }
               else if(param2 == MM_SS)
               {
                  _loc4_ = _loc14_ + ":" + _loc16_;
               }
               else if(param2 == HH_MM$CHN)
               {
                  _loc4_ = _loc12_ + "小时" + _loc14_ + "分";
               }
               break;
            case LEFT_DD_HH_MM$CHN:
            case LEFT_DD_HH$CHN:
            case LEFT_HH_MM$CHN:
            case LEFT_HH_MM:
            case LEFT_HH_MM_SS:
            case LEFT_MM_SS:
               _loc18_ = int(param1 / (24 * 3600));
               _loc19_ = int((param1 - _loc18_ * 24 * 3600) / 3600);
               _loc20_ = toTwo(_loc19_);
               _loc21_ = int((param1 - _loc18_ * 24 * 3600 - _loc19_ * 3600) / 60);
               _loc22_ = toTwo(_loc21_);
               _loc23_ = param1 % 60;
               _loc24_ = toTwo(_loc23_);
               if(param2 == LEFT_DD_HH_MM$CHN)
               {
                  _loc4_ = _loc18_ + "天" + _loc20_ + "小时" + _loc22_ + "分";
               }
               else if(param2 == LEFT_DD_HH$CHN)
               {
                  _loc4_ = _loc18_ + "天" + _loc20_ + "小时";
               }
               else if(param2 == LEFT_HH_MM$CHN)
               {
                  _loc4_ = _loc20_ + "小时" + _loc22_ + "分";
               }
               else if(param2 == LEFT_HH_MM)
               {
                  _loc4_ = _loc20_ + ":" + _loc22_;
               }
               else if(param2 == LEFT_HH_MM_SS)
               {
                  _loc19_ = int(param1 / 3600);
                  _loc4_ = (_loc20_ = toTwo(_loc19_)) + ":" + _loc22_ + ":" + _loc24_;
               }
               else if(param2 == LEFT_MM_SS)
               {
                  _loc4_ = _loc22_ + ":" + _loc24_;
               }
         }
         return _loc4_;
      }
      
      public static function formatSevTimeToStr(param1:uint, param2:String = "hh:mm:ss") : String
      {
         var _loc3_:* = "";
         var _loc4_:Date;
         (_loc4_ = DateUtils.getInstance().getServerDate()).time = param1 * 1000;
         var _loc5_:int = _loc4_.getFullYear();
         var _loc6_:int = _loc4_.getMonth() + 1;
         var _loc7_:String = toTwo(_loc6_);
         var _loc8_:int = _loc4_.getDate();
         var _loc9_:String = toTwo(_loc8_);
         var _loc10_:int = _loc4_.getHours();
         var _loc11_:String = toTwo(_loc10_);
         var _loc12_:int = _loc4_.getMinutes();
         var _loc13_:String = toTwo(_loc12_);
         var _loc14_:int = _loc4_.getSeconds();
         var _loc15_:String = toTwo(_loc14_);
         var _loc16_:String = DAY_STR[_loc4_.getDay()];
         switch(param2)
         {
            case LEFT_HH_MM:
               _loc3_ = _loc11_ + ":" + _loc13_;
               break;
            case LEFT_HH_MM_SS:
               _loc3_ = _loc11_ + ":" + _loc13_ + ":" + _loc15_;
               break;
            case LEFT_MM_SS:
               _loc3_ = _loc13_ + ":" + _loc15_;
               break;
            case YY_MM_DD:
               _loc3_ = _loc5_ + "-" + _loc13_ + "-" + _loc9_;
               break;
            case YY_MM_DD_HH_MM:
               _loc3_ = _loc5_ + "-" + _loc7_ + "-" + _loc9_ + " " + _loc11_ + ":" + _loc13_;
               break;
            case YY_MM_DD_HH_MM_SS:
               _loc3_ = _loc5_ + "-" + _loc7_ + "-" + _loc9_ + " " + _loc11_ + ":" + _loc13_ + ":" + _loc15_;
               break;
            case MM_DD_HH_MM:
               _loc3_ = _loc7_ + "-" + _loc9_ + " " + _loc11_ + ":" + _loc13_;
               break;
            case LEFT_DD_HH_MM$CHN:
               _loc3_ = int(param1 / (24 * 3600)) + "天" + _loc11_ + "小时" + _loc13_ + "分";
               break;
            case LEFT_DD_HH$CHN:
               _loc3_ = int(param1 / (24 * 3600)) + "天" + _loc11_ + "小时";
               break;
            case LEFT_HH_MM$CHN:
               _loc3_ = _loc11_ + "小时" + _loc13_ + "分";
               break;
            case MM_DD_HH_MM$CHN:
               _loc3_ = _loc7_ + "月" + _loc9_ + "日 " + _loc11_ + ":" + _loc13_;
               break;
            case MM_DD_HH_MM_SS$CHN:
               _loc3_ = _loc7_ + "月" + _loc9_ + "日 " + _loc11_ + ":" + _loc13_ + ":" + _loc14_;
               break;
            case DAY_HH_MM$CHN:
               _loc3_ = "周" + _loc16_ + " " + _loc11_ + ":" + _loc13_;
         }
         return _loc3_;
      }
      
      public static function toTwo(param1:Number) : String
      {
         if(param1 < 10)
         {
            return "0" + param1;
         }
         return param1.toString();
      }
      
      public static function getTimeBrief(param1:uint) : String
      {
         if(param1 >= 3600)
         {
            return Math.ceil(param1 / 3600) + "小时";
         }
         return Math.ceil(param1 / 60) + "分钟";
      }
   }
}
