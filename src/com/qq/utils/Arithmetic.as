package com.qq.utils
{
   public class Arithmetic
   {
       
      
      public function Arithmetic()
      {
         super();
      }
      
      private static function isStart(param1:String, param2:int) : Boolean
      {
         return param2 <= 0 || param1.charAt(param2 - 1) == "(";
      }
      
      private static function isOperator(param1:String, param2:int) : Boolean
      {
         if(param2 >= param1.length || param2 < 0)
         {
            return false;
         }
         if(isStart(param1,param2))
         {
            return false;
         }
         var _loc3_:String = param1.charAt(param2);
         return _loc3_ == "+" || _loc3_ == "-" && !isOperator(param1,param2 - 1) || _loc3_ == "*" || _loc3_ == "/";
      }
      
      private static function isNumber(param1:String, param2:int) : Boolean
      {
         if(param2 >= param1.length || param2 < 0)
         {
            return false;
         }
         var _loc3_:String = param1.charAt(param2);
         return _loc3_ >= "0" && _loc3_ <= "9" || _loc3_ == "." || _loc3_ == "-" && (isOperator(param1,param2 - 1) || isStart(param1,param2));
      }
      
      private static function getPriority(param1:String) : int
      {
         switch(param1)
         {
            case ")":
               return 3;
            case "*":
            case "/":
               return 2;
            case "+":
            case "-":
               return 1;
            case "(":
               return -1;
            default:
               return 0;
         }
      }
      
      private static function getValue(param1:String, param2:Number, param3:Number) : Number
      {
         switch(param1)
         {
            case "*":
               return param3 * param2;
            case "/":
               return param3 / param2;
            case "-":
               return param3 - param2;
            case "+":
               return param3 + param2;
            default:
               return NaN;
         }
      }
      
      public static function exec(param1:String) : Number
      {
         var _loc4_:String = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         var _loc7_:int = 0;
         while(_loc7_ < param1.length)
         {
            if((_loc8_ = param1.charAt(_loc7_)) == " ")
            {
               _loc7_++;
            }
            if(_loc8_ == "(")
            {
               _loc2_.push(_loc8_);
               _loc7_++;
            }
            else if(_loc8_ == ")")
            {
               _loc4_ = _loc2_.pop();
               while(_loc4_ != "(")
               {
                  _loc5_ = _loc3_.pop();
                  _loc6_ = _loc3_.pop();
                  _loc3_.push(getValue(_loc4_,_loc5_,_loc6_));
                  _loc4_ = _loc2_.pop();
               }
               _loc7_++;
            }
            else if(isOperator(param1,_loc7_))
            {
               while(getPriority(_loc8_) <= getPriority(_loc2_[_loc2_.length - 1]) && _loc2_.length)
               {
                  _loc4_ = _loc2_.pop();
                  _loc5_ = _loc3_.pop();
                  _loc6_ = _loc3_.pop();
                  _loc3_.push(getValue(_loc4_,_loc5_,_loc6_));
               }
               _loc2_.push(param1.charAt(_loc7_));
               _loc7_++;
            }
            else
            {
               _loc9_ = "";
               while(isNumber(param1,_loc7_) && _loc7_ < param1.length)
               {
                  _loc9_ += param1.charAt(_loc7_);
                  _loc7_++;
               }
               _loc3_.push(Number(_loc9_));
            }
         }
         while(_loc2_.length)
         {
            _loc4_ = _loc2_.pop();
            _loc5_ = _loc3_.pop();
            _loc6_ = _loc3_.pop();
            _loc3_.push(getValue(_loc4_,_loc5_,_loc6_));
         }
         return _loc3_.pop();
      }
   }
}
