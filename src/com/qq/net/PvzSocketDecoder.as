package com.qq.net
{
   import PVZ.Cmd.CmdCommon;
   import PVZ.CmdConst;
   import TConnD_WebDef.ErrorMap;
   import TConnD_WebDef.TWebPvzPkg;
   import com.tencent.protobuf.Message;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import org.as3commons.logging.api.getLogger;
   import tencent.io.service.interfaces.IDecodeData;
   import tencent.io.service.interfaces.IProtoDecoder;
   import tencent.io.service.interfaces.IProtocol;
   
   public class PvzSocketDecoder implements IProtoDecoder
   {
       
      
      private var pkg:TWebPvzPkg;
      
      private var isEncryption:Boolean;
      
      public function PvzSocketDecoder()
      {
         super();
         this.pkg = new TWebPvzPkg();
      }
      
      public function socketParser(param1:*) : Array
      {
         var _loc2_:Array = [];
         var _loc3_:ByteArray = param1 as ByteArray;
         _loc3_.endian = Endian.BIG_ENDIAN;
         var _loc4_:int = this.pkg.decode(_loc3_);
         if(ErrorMap.NO_ERROR != _loc4_)
         {
            getLogger("socket").error("decode() failed. " + ErrorMap.getErrorString(_loc4_));
            return _loc2_;
         }
         var _loc5_:uint;
         if((_loc5_ = this.pkg.Head.Base.BodyLen) == 0)
         {
            getLogger("socket").error("decode() failed.  bodylen==0");
            return _loc2_;
         }
         var _loc6_:CmdCommon;
         (_loc6_ = new CmdCommon()).mergeFrom(_loc3_);
         var _loc7_:PvzProtocol = new PvzProtocol();
         var _loc8_:Class;
         if((_loc8_ = CmdConst.getClassByName(_loc6_.cmdName)) == null)
         {
            return null;
         }
         var _loc9_:Message;
         (_loc9_ = new _loc8_() as Message).mergeFrom(_loc6_.cmdData);
         _loc7_.protoData = _loc9_;
         return [_loc6_.errorCode,_loc7_];
      }
      
      public function parser(param1:IProtocol, param2:*) : Vector.<IDecodeData>
      {
         return null;
      }
      
      public function get resultHandler() : Function
      {
         return null;
      }
      
      public function set resultHandler(param1:Function) : void
      {
      }
      
      public function printJSON(param1:Object) : void
      {
      }
      
      public function parseJSON(param1:*, param2:int = 1) : String
      {
         var _loc4_:* = undefined;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc3_:* = "";
         if(this.getTypeof(param1) == "object")
         {
            _loc3_ += "{\n";
            for(_loc4_ in param1)
            {
               _loc3_ += this.getSpaces(param2) + _loc4_ + "=";
               if(this.getTypeof(param1[_loc4_]) == "object" || this.getTypeof(param1[_loc4_]) == "array")
               {
                  _loc3_ += this.parseJSON(param1[_loc4_],param2 + 1) + "\n";
               }
               else if((_loc5_ = this.getTypeof(param1[_loc4_])) == "string")
               {
                  _loc3_ += "\"" + param1[_loc4_] + "\"\n";
               }
               else if(_loc5_ == "number")
               {
                  _loc3_ += param1[_loc4_] + "\n";
               }
            }
            _loc3_ += this.getSpaces(param2 - 1 < 0 ? 0 : int(param2 - 1)) + "}";
         }
         else if(this.getTypeof(param1) == "array")
         {
            _loc3_ += "[\n";
            _loc6_ = param1.length;
            _loc4_ = 0;
            while(_loc4_ < _loc6_)
            {
               _loc3_ += this.getSpaces(param2) + "[" + _loc4_ + "]=";
               if(this.getTypeof(param1[_loc4_]) == "object" || this.getTypeof(param1[_loc4_]) == "array")
               {
                  _loc3_ += this.parseJSON(param1[_loc4_],param2 + 1) + "\n";
               }
               else
               {
                  if((_loc5_ = this.getTypeof(param1[_loc4_])) == "string")
                  {
                     _loc3_ += "\"" + param1[_loc4_] + "\"";
                  }
                  else if(_loc5_ == "number")
                  {
                     _loc3_ += param1[_loc4_];
                  }
                  _loc3_ += "\n";
               }
               _loc4_++;
            }
            _loc3_ += this.getSpaces(param2 - 1 < 0 ? 0 : int(param2 - 1)) + "]";
         }
         return _loc3_;
      }
      
      public function getSpaces(param1:int) : String
      {
         var _loc2_:* = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc2_ += " ";
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getTypeof(param1:*) : String
      {
         if(param1 is Array)
         {
            return "array";
         }
         if(param1 is String)
         {
            return "string";
         }
         if(param1 is Number)
         {
            return "number";
         }
         return "object";
      }
   }
}
