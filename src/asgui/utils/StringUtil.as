package asgui.utils
{
   public class StringUtil
   {
      
      public static const TAG_ENGLISH_LOWER_CASE:int = 1;
      
      public static const TAG_ENGLISH_UPPER_CASE:int = 2;
      
      public static const TAG_NUMBER:int = 4;
      
      public static const TAG_CHINESE:int = 16;
       
      
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
         var _loc2_:int = 0;
         while(isWhitespace(param1.charAt(_loc2_)))
         {
            _loc2_++;
         }
         var _loc3_:int = param1.length - 1;
         while(isWhitespace(param1.charAt(_loc3_)))
         {
            _loc3_--;
         }
         if(_loc3_ >= _loc2_)
         {
            return param1.slice(_loc2_,_loc3_ + 1);
         }
         return "";
      }
      
      public static function trimArrayElements(param1:String, param2:String) : String
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1 != "" && param1 != null)
         {
            _loc3_ = param1.split(param2);
            _loc4_ = _loc3_.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_[_loc5_] = StringUtil.trim(_loc3_[_loc5_]);
               _loc5_++;
            }
            if(_loc4_ > 0)
            {
               param1 = _loc3_.join(param2);
            }
         }
         return param1;
      }
      
      public static function isWhitespace(param1:String) : Boolean
      {
         switch(param1)
         {
            case " ":
            case "\t":
            case "\r":
            case "\n":
            case "\f":
               return true;
            default:
               return false;
         }
      }
      
      public static function substitute(param1:String, ... rest) : String
      {
         var _loc4_:Array = null;
         if(param1 == null)
         {
            return "";
         }
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
      
      public static function repeat(param1:String, param2:int) : String
      {
         if(param2 == 0)
         {
            return "";
         }
         var _loc3_:String = param1;
         var _loc4_:int = 1;
         while(_loc4_ < param2)
         {
            _loc3_ += param1;
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function restrict(param1:String, param2:String) : String
      {
         var _loc6_:uint = 0;
         if(param2 == null)
         {
            return param1;
         }
         if(param2 == "")
         {
            return "";
         }
         var _loc3_:Array = [];
         var _loc4_:int = param1.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param1.charCodeAt(_loc5_);
            if(testCharacter(_loc6_,param2))
            {
               _loc3_.push(_loc6_);
            }
            _loc5_++;
         }
         return String.fromCharCode.apply(null,_loc3_);
      }
      
      private static function testCharacter(param1:uint, param2:String) : Boolean
      {
         var _loc9_:uint = 0;
         var _loc11_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:* = true;
         var _loc7_:uint = 0;
         var _loc8_:int;
         if((_loc8_ = param2.length) > 0)
         {
            if((_loc9_ = param2.charCodeAt(0)) == 94)
            {
               _loc3_ = true;
            }
         }
         var _loc10_:int = 0;
         while(_loc10_ < _loc8_)
         {
            _loc9_ = param2.charCodeAt(_loc10_);
            _loc11_ = false;
            if(!_loc4_)
            {
               if(_loc9_ == 45)
               {
                  _loc5_ = true;
               }
               else if(_loc9_ == 94)
               {
                  _loc6_ = !_loc6_;
               }
               else if(_loc9_ == 92)
               {
                  _loc4_ = true;
               }
               else
               {
                  _loc11_ = true;
               }
            }
            else
            {
               _loc11_ = true;
               _loc4_ = false;
            }
            if(_loc11_)
            {
               if(_loc5_)
               {
                  if(_loc7_ <= param1 && param1 <= _loc9_)
                  {
                     _loc3_ = _loc6_;
                  }
                  _loc5_ = false;
                  _loc7_ = 0;
               }
               else
               {
                  if(param1 == _loc9_)
                  {
                     _loc3_ = _loc6_;
                  }
                  _loc7_ = _loc9_;
               }
            }
            _loc10_++;
         }
         return _loc3_;
      }
      
      public static function checkRemoveFromUnicode(param1:String, param2:int) : String
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:String = "";
         var _loc4_:int = param1.length;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param1.charCodeAt(_loc5_);
            if(param2 & TAG_ENGLISH_LOWER_CASE && _loc6_ >= 97 && _loc6_ <= 122)
            {
               _loc3_ += String.fromCharCode(_loc6_);
            }
            else if(param2 & TAG_ENGLISH_UPPER_CASE && _loc6_ >= 65 && _loc6_ <= 90)
            {
               _loc3_ += String.fromCharCode(_loc6_);
            }
            else if(param2 & TAG_NUMBER && _loc6_ >= 48 && _loc6_ <= 57)
            {
               _loc3_ += String.fromCharCode(_loc6_);
            }
            else if(param2 & TAG_CHINESE && _loc6_ >= 19968 && _loc6_ <= 40869)
            {
               _loc3_ += String.fromCharCode(_loc6_);
            }
            _loc5_++;
         }
         return _loc3_;
      }
   }
}
