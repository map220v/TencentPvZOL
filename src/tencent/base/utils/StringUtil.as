package tencent.base.utils
{
   import flash.utils.ByteArray;
   
   public class StringUtil
   {
       
      
      public function StringUtil()
      {
         super();
      }
      
      public static function trim(param1:String) : String
      {
         if(param1 == null)
         {
            return "";
         }
         return StringUtil.ltrim(StringUtil.rtrim(param1));
      }
      
      public static function ltrim(param1:String) : String
      {
         var _loc2_:Number = param1.length;
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_)
         {
            if(param1.charCodeAt(_loc3_) > 32)
            {
               return param1.substring(_loc3_);
            }
            _loc3_++;
         }
         return "";
      }
      
      public static function rtrim(param1:String) : String
      {
         var _loc2_:Number = param1.length;
         var _loc3_:Number = _loc2_;
         while(_loc3_ > 0)
         {
            if(param1.charCodeAt(_loc3_ - 1) > 32)
            {
               return param1.substring(0,_loc3_);
            }
            _loc3_--;
         }
         return "";
      }
      
      public static function substitute(param1:String, ... rest) : String
      {
         var _loc4_:Array = null;
         var _loc3_:uint = rest.length;
         if(_loc3_ == 1 && rest[0] is Array)
         {
            _loc3_ = (_loc4_ = rest[0] as Array).length;
         }
         else
         {
            _loc4_ = rest;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            param1 = param1.replace(new RegExp("\\{" + _loc5_ + "\\}","g"),_loc4_[_loc5_]);
            _loc5_++;
         }
         return param1;
      }
      
      public static function substituteByID(param1:String, param2:Object) : String
      {
         var _loc3_:* = null;
         for(_loc3_ in param2)
         {
            param1 = param1.replace(new RegExp("\\{\\$" + _loc3_ + "\\}","g"),param2[_loc3_]);
         }
         return param1;
      }
      
      public static function replace(param1:String, param2:String, param3:String) : String
      {
         return param1.split(param2).join(param3);
      }
      
      public static function intercept(param1:String, param2:uint, param3:String) : String
      {
         if(param1 == null)
         {
            return "";
         }
         if(param1.length > param2 && param2 > 0)
         {
            param1 = param1.slice(0,param2);
            param1 += param3;
         }
         return param1;
      }
      
      public static function htmlEncode(param1:String) : String
      {
         param1 = replace(param1,"&","&amp;");
         param1 = replace(param1,"\"","&quot;");
         param1 = replace(param1,"\"","&apos;");
         param1 = replace(param1,"<","&lt;");
         return replace(param1,">","&gt;");
      }
      
      public static function cdata(param1:String) : XML
      {
         return new XML("<![CDATA[" + param1 + "]]>");
      }
      
      public static function stripGtAndLt(param1:String) : String
      {
         param1 = replace(param1,"<","&lt;");
         return replace(param1,">","&gt;");
      }
      
      public static function validateEmail(param1:String) : Boolean
      {
         var _loc2_:RegExp = /^[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
         return param1.match(_loc2_) != null;
      }
      
      public static function validateCreditCard(param1:String) : Boolean
      {
         var _loc2_:Number = NaN;
         if(param1.length < 7 || param1.length > 19 || Number(param1) < 1000000)
         {
            return false;
         }
         var _loc3_:Number = 0;
         var _loc4_:* = true;
         var _loc5_:Number = param1.length;
         while(--_loc5_ > -1)
         {
            if(_loc4_)
            {
               _loc3_ += Number(param1.substr(_loc5_,1));
            }
            else
            {
               _loc2_ = Number(param1.substr(_loc5_,1)) * 2;
               _loc3_ += _loc2_ > 8 ? (_loc2_ = _loc2_ - 9) : _loc2_;
            }
            _loc4_ = !_loc4_;
         }
         return _loc3_ % 10 == 0;
      }
      
      public static function GB2312toUTF8(param1:*) : String
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeMultiByte(param1,"gb2312");
         _loc2_.position = 0;
         return _loc2_.readMultiByte(_loc2_.bytesAvailable,"utf-8");
      }
      
      public static function UTF8toGB2312(param1:*) : String
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeMultiByte(param1,"utf-8");
         _loc2_.position = 0;
         return _loc2_.readMultiByte(_loc2_.bytesAvailable,"gb2312");
      }
      
      public static function zeroPad(param1:uint) : String
      {
         var _loc2_:String = null;
         if(param1 < 10)
         {
            _loc2_ = "0" + param1;
         }
         else
         {
            _loc2_ = String(param1);
         }
         return _loc2_;
      }
      
      public static function toUNString(param1:String) : String
      {
         var replStr:Function = null;
         var str:String = param1;
         replStr = function():String
         {
            var _loc2_:String = arguments[1];
            var _loc3_:Number = parseInt("0x" + _loc2_);
            return String.fromCharCode(_loc3_);
         };
         var myPattern:RegExp = /%u(....)/g;
         var reslut:String = str.replace(myPattern,replStr);
         try
         {
            reslut = unescape(reslut);
         }
         catch(e:Error)
         {
         }
         return reslut;
      }
      
      public static function toProperType(param1:String, param2:Boolean = true) : *
      {
         var _loc3_:Number = parseFloat(param1);
         if(param2)
         {
            if(!isNaN(_loc3_))
            {
               return _loc3_;
            }
         }
         else if(_loc3_.toString() == param1)
         {
            return _loc3_;
         }
         switch(param1)
         {
            case "true":
               return true;
            case "false":
               return false;
            case "":
            case "null":
               return null;
            case "undefined":
               return undefined;
            case "Infinity":
               return Infinity;
            case "-Infinity":
               return -Infinity;
            case "NaN":
               return NaN;
            default:
               return param1;
         }
      }
      
      public static function getDateString(param1:Number) : String
      {
         var _loc2_:Date = new Date();
         _loc2_.setTime(param1 * 1000);
         var _loc3_:String = String(_loc2_.getFullYear());
         var _loc4_:String = String(_loc2_.getMonth() + 1 < 10 ? "0" : "") + (_loc2_.getMonth() + 1);
         var _loc5_:String = String(_loc2_.getDate() < 10 ? "0" : "") + _loc2_.getDate();
         return _loc3_ + "." + _loc4_ + "." + _loc5_;
      }
      
      public static function getMonth_Day_TimeString(param1:Number) : String
      {
         var _loc2_:Date = new Date();
         _loc2_.setTime(param1 * 1000);
         var _loc3_:String = String(_loc2_.getMonth() + 1);
         var _loc4_:String = String(_loc2_.getDate());
         var _loc5_:String = String(_loc2_.getHours() < 10 ? "0" : "") + _loc2_.getHours();
         var _loc6_:String = String(_loc2_.getMinutes() < 10 ? "0" : "") + _loc2_.getMinutes();
         return _loc3_ + " 月 " + _loc4_ + " 日 " + _loc5_ + ":" + _loc6_;
      }
      
      public static function getYear_Month_Day_TimeString(param1:Number) : String
      {
         var _loc2_:Date = new Date();
         _loc2_.setTime(param1 * 1000);
         var _loc3_:String = String(_loc2_.getFullYear());
         var _loc4_:String = String(_loc2_.getMonth() + 1);
         var _loc5_:String = String(_loc2_.getDate());
         var _loc6_:String = String(_loc2_.getHours() < 10 ? "0" : "") + _loc2_.getHours();
         var _loc7_:String = String(_loc2_.getMinutes() < 10 ? "0" : "") + _loc2_.getMinutes();
         return _loc3_ + " 年 " + _loc4_ + " 月 " + _loc5_ + " 日 " + _loc6_ + ":" + _loc7_;
      }
      
      public static function getHour_Min_SecString(param1:Number) : String
      {
         var _loc2_:Date = new Date();
         _loc2_.setTime(param1 * 1000);
         var _loc3_:String = String(_loc2_.getHours() < 10 ? "0" : "") + _loc2_.getHours();
         var _loc4_:String = String(_loc2_.getMinutes() < 10 ? "0" : "") + _loc2_.getMinutes();
         var _loc5_:String = String(_loc2_.getSeconds() < 10 ? "0" : "") + _loc2_.getSeconds();
         return _loc3_ + ":" + _loc4_ + ":" + _loc5_;
      }
      
      public static function getLeftTime_Hour_Min_SecString(param1:Number) : String
      {
         var _loc2_:String = String(param1 % 60 < 10 ? "0" : "") + param1 % 60;
         var _loc3_:String = String(Math.floor(param1 / 60) % 60 < 10 ? "0" : "") + Math.floor(param1 / 60) % 60;
         var _loc4_:String;
         return (_loc4_ = String(Math.floor(Math.floor(param1 / 60) / 60) < 10 ? "0" : "") + Math.floor(Math.floor(param1 / 60) / 60)) + ":" + _loc3_ + ":" + _loc2_;
      }
      
      public static function getLeftTime_Min_SecString(param1:Number) : String
      {
         var _loc2_:String = String(param1 % 60 < 10 ? "0" : "") + param1 % 60;
         var _loc3_:String = String(Math.floor(param1 / 60) % 60 < 10 ? "0" : "") + Math.floor(param1 / 60) % 60;
         return _loc3_ + ":" + _loc2_;
      }
      
      public static function isChinese_Number_Letter(param1:String) : Boolean
      {
         var _loc2_:RegExp = null;
         _loc2_ = /^(?!_)(?!.*?_$)[a-zA-Z0-9_一-龥]+$/g;
         if(_loc2_.exec(param1))
         {
            return true;
         }
         return false;
      }
   }
}
