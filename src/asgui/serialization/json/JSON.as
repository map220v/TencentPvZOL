package asgui.serialization.json
{
   public class JSON
   {
       
      
      public function JSON()
      {
         super();
      }
      
      public static function deserialize(param1:String) : *
      {
         var at:Number = NaN;
         var ch:String = null;
         var _isDigit:Function = null;
         var _isHexDigit:Function = null;
         var _white:Function = null;
         var _string:Function = null;
         var _next:Function = null;
         var _array:Function = null;
         var _object:Function = null;
         var _number:Function = null;
         var _word:Function = null;
         var _value:Function = null;
         var _error:Function = null;
         var source:String = param1;
         source = new String(source);
         at = 0;
         ch = " ";
         _isDigit = function(param1:String):*
         {
            return "0" <= param1 && param1 <= "9";
         };
         _isHexDigit = function(param1:String):*
         {
            return _isDigit(param1) || "A" <= param1 && param1 <= "F" || "a" <= param1 && param1 <= "f";
         };
         _error = function(param1:String):void
         {
            throw new Error(param1,at - 1);
         };
         _next = function():*
         {
            ch = source.charAt(at);
            at += 1;
            return ch;
         };
         _white = function():void
         {
            while(ch)
            {
               if(ch <= " ")
               {
                  _next();
               }
               else
               {
                  if(ch != "/")
                  {
                     break;
                  }
                  switch(_next())
                  {
                     case "/":
                        while(_next() && ch != "\n" && ch != "\r")
                        {
                        }
                        break;
                     case "*":
                        _next();
                        while(true)
                        {
                           if(ch)
                           {
                              if(ch == "*")
                              {
                                 if(_next() == "/")
                                 {
                                    break;
                                 }
                              }
                              else
                              {
                                 _next();
                              }
                           }
                           else
                           {
                              _error("Unterminated Comment");
                           }
                        }
                        _next();
                        break;
                     default:
                        _error("Syntax Error");
                  }
               }
            }
         };
         _string = function():*
         {
            var _loc3_:* = undefined;
            var _loc4_:* = undefined;
            var _loc1_:* = "";
            var _loc2_:* = "";
            var _loc5_:Boolean = false;
            if(ch == "\"")
            {
               while(_next())
               {
                  if(ch == "\"")
                  {
                     _next();
                     return _loc2_;
                  }
                  if(ch == "\\")
                  {
                     switch(_next())
                     {
                        case "b":
                           _loc2_ += "\b";
                           break;
                        case "f":
                           _loc2_ += "\f";
                           break;
                        case "n":
                           _loc2_ += "\n";
                           break;
                        case "r":
                           _loc2_ += "\r";
                           break;
                        case "t":
                           _loc2_ += "\t";
                           break;
                        case "u":
                           _loc4_ = 0;
                           _loc1_ = 0;
                           while(_loc1_ < 4)
                           {
                              _loc3_ = parseInt(_next(),16);
                              if(!isFinite(_loc3_))
                              {
                                 _loc5_ = true;
                                 break;
                              }
                              _loc4_ = _loc4_ * 16 + _loc3_;
                              _loc1_ += 1;
                           }
                           if(_loc5_)
                           {
                              _loc5_ = false;
                              break;
                           }
                           _loc2_ += String.fromCharCode(_loc4_);
                           break;
                        default:
                           _loc2_ += ch;
                     }
                  }
                  else
                  {
                     _loc2_ += ch;
                  }
               }
            }
            _error("Bad String");
            return null;
         };
         _array = function():*
         {
            var _loc1_:Array = [];
            if(ch == "[")
            {
               _next();
               _white();
               if(ch == "]")
               {
                  _next();
                  return _loc1_;
               }
               while(ch)
               {
                  _loc1_.push(_value());
                  _white();
                  if(ch == "]")
                  {
                     _next();
                     return _loc1_;
                  }
                  if(ch != ",")
                  {
                     break;
                  }
                  _next();
                  _white();
               }
            }
            _error("Bad Array");
            return null;
         };
         _object = function():*
         {
            var _loc1_:* = {};
            var _loc2_:* = {};
            if(ch == "{")
            {
               _next();
               _white();
               if(ch == "}")
               {
                  _next();
                  return _loc2_;
               }
               while(ch)
               {
                  _loc1_ = _string();
                  _white();
                  if(ch != ":")
                  {
                     break;
                  }
                  _next();
                  _loc2_[_loc1_] = _value();
                  _white();
                  if(ch == "}")
                  {
                     _next();
                     return _loc2_;
                  }
                  if(ch != ",")
                  {
                     break;
                  }
                  _next();
                  _white();
               }
            }
            _error("Bad Object");
         };
         _number = function():*
         {
            var _loc2_:* = undefined;
            var _loc1_:* = "";
            var _loc3_:String = "";
            var _loc4_:String = "";
            if(ch == "-")
            {
               _loc1_ = "-";
               _loc4_ = _loc1_;
               _next();
            }
            if(ch == "0")
            {
               _next();
               if(ch == "x" || ch == "X")
               {
                  _next();
                  while(_isHexDigit(ch))
                  {
                     _loc3_ += ch;
                     _next();
                  }
                  if(_loc3_ != "")
                  {
                     return Number(_loc4_ + "0x" + _loc3_);
                  }
                  _error("mal formed Hexadecimal");
               }
               else
               {
                  _loc1_ += "0";
               }
            }
            while(_isDigit(ch))
            {
               _loc1_ += ch;
               _next();
            }
            if(ch == ".")
            {
               _loc1_ += ".";
               while(_next() && ch >= "0" && ch <= "9")
               {
                  _loc1_ += ch;
               }
            }
            _loc2_ = 1 * _loc1_;
            if(!isFinite(_loc2_))
            {
               _error("Bad Number");
               return NaN;
            }
            return _loc2_;
         };
         _word = function():*
         {
            switch(ch)
            {
               case "t":
                  if(_next() == "r" && _next() == "u" && _next() == "e")
                  {
                     _next();
                     return true;
                  }
                  break;
               case "f":
                  if(_next() == "a" && _next() == "l" && _next() == "s" && _next() == "e")
                  {
                     _next();
                     return false;
                  }
                  break;
               case "n":
                  if(_next() == "u" && _next() == "l" && _next() == "l")
                  {
                     _next();
                     return null;
                  }
                  break;
            }
            _error("Syntax Error");
            return null;
         };
         _value = function():*
         {
            _white();
            switch(ch)
            {
               case "{":
                  return _object();
               case "[":
                  return _array();
               case "\"":
                  return _string();
               case "-":
                  return _number();
               default:
                  return ch >= "0" && ch <= "9" ? _number() : _word();
            }
         };
         return _value();
      }
      
      public static function serialize(param1:*) : String
      {
         var _loc2_:String = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc6_:* = undefined;
         var _loc7_:* = null;
         var _loc8_:Number = NaN;
         var _loc5_:* = "";
         switch(typeof param1)
         {
            case "object":
               if(param1)
               {
                  if(param1 is Array)
                  {
                     _loc4_ = param1.length;
                     _loc3_ = 0;
                     while(_loc3_ < _loc4_)
                     {
                        _loc6_ = serialize(param1[_loc3_]);
                        if(_loc5_)
                        {
                           _loc5_ += ",";
                        }
                        _loc5_ += _loc6_;
                        _loc3_++;
                     }
                     return "[" + _loc5_ + "]";
                  }
                  if(typeof param1.toString != "undefined")
                  {
                     for(_loc7_ in param1)
                     {
                        if(typeof (_loc6_ = param1[_loc7_]) != "undefined" && typeof _loc6_ != "function")
                        {
                           _loc6_ = serialize(_loc6_);
                           if(_loc5_)
                           {
                              _loc5_ += ",";
                           }
                           _loc5_ += serialize(_loc7_) + ":" + _loc6_;
                        }
                     }
                     return "{" + _loc5_ + "}";
                  }
               }
               return "null";
            case "number":
               return !!isFinite(param1) ? String(param1) : "null";
            case "string":
               _loc4_ = param1.length;
               _loc5_ = "\"";
               _loc3_ = 0;
               for(; _loc3_ < _loc4_; _loc3_ += 1)
               {
                  _loc2_ = param1.charAt(_loc3_);
                  if(_loc2_ >= " ")
                  {
                     if(_loc2_ == "\\" || _loc2_ == "\"")
                     {
                        _loc5_ += "\\";
                     }
                     _loc5_ += _loc2_;
                     continue;
                  }
                  switch(_loc2_)
                  {
                     case "\b":
                        _loc5_ += "\\b";
                        break;
                     case "\f":
                        _loc5_ += "\\f";
                        break;
                     case "\n":
                        _loc5_ += "\\n";
                        break;
                     case "\r":
                        _loc5_ += "\\r";
                        break;
                     case "\t":
                        _loc5_ += "\\t";
                        break;
                     default:
                        _loc8_ = _loc2_.charCodeAt();
                        _loc5_ += "\\u00" + Math.floor(_loc8_ / 16).toString(16) + (_loc8_ % 16).toString(16);
                        break;
                  }
               }
               return _loc5_ + "\"";
            case "boolean":
               return String(param1);
            default:
               return "null";
         }
      }
   }
}
