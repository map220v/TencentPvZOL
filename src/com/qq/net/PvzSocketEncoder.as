package com.qq.net
{
   import PVZ.Cmd.CmdCommon;
   import TConnD_WebDef.ErrorMap;
   import TConnD_WebDef.Macros;
   import TConnD_WebDef.QQUserSimp;
   import TConnD_WebDef.TWebPvzPkg;
   import com.qq.GameGloble;
   import com.qq.modules.main.server.PvzSocketService;
   import com.tencent.protobuf.Message;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import org.as3commons.logging.api.getLogger;
   import tencent.io.service.interfaces.IProtoEncoder;
   import tencent.io.service.interfaces.IProtocol;
   
   public class PvzSocketEncoder implements IProtoEncoder
   {
       
      
      private var uin:uint;
      
      private var skey:String;
      
      private var cmdDic:Dictionary;
      
      private var pkg:TWebPvzPkg;
      
      private var isEncryption:Boolean;
      
      public function PvzSocketEncoder(param1:uint, param2:String)
      {
         super();
         this.uin = param1;
         this.skey = param2;
         this.cmdDic = new Dictionary();
         this.pkg = new TWebPvzPkg();
         this.pkg.Head.Base.Magic = Macros.TWEB_MAGIC;
         this.pkg.Head.Base.Cmd = Macros.TWEB_CMD_UPLOAD;
         this.pkg.Head.Base.UserType = Macros.TWEB_USER_QQSIMPLE;
         this.pkg.Head.Base.User.QQUserSimple = new QQUserSimp();
         this.pkg.Head.Base.User.QQUserSimple.Uin = param1;
         this.pkg.Head.Base.User.QQUserSimple.SKey = param2;
      }
      
      public function encode(param1:IProtocol) : *
      {
         var _loc2_:CmdCommon = new CmdCommon();
         _loc2_.cmdName = (param1.protoData as Message).$messageID;
         if(!_loc2_.cmdName || _loc2_.cmdName == "")
         {
            getLogger("socket").warn("socket c2s , cmdName不存在，消息忽略");
            return;
         }
         var _loc3_:ByteArray = new ByteArray();
         (param1.protoData as Message).writeTo(_loc3_);
         _loc2_.cmdData = _loc3_;
         _loc2_.seqId = ++PvzSocketService.seqId;
         getLogger("seq").debug("seq ID:" + _loc2_.seqId);
         var _loc4_:ByteArray = new ByteArray();
         _loc2_.writeTo(_loc4_);
         if(ExternalVars.IS_Encryption)
         {
            _loc4_ = GameGloble.msgCheckFunc(_loc4_);
         }
         this.pkg.Head.Base.BodyLen = _loc4_.length;
         this.pkg.Body = _loc4_;
         var _loc5_:ByteArray = new ByteArray();
         var _loc6_:int;
         if((_loc6_ = this.pkg.encode(_loc5_)) != ErrorMap.NO_ERROR)
         {
            getLogger("socket").error("encode() failed. " + ErrorMap.getErrorString(_loc6_));
            return;
         }
         return _loc5_;
      }
      
      public function get encoderParam() : *
      {
         return null;
      }
      
      private function getCmdNameByCmd(param1:Object) : String
      {
         if(!(param1 is Message))
         {
            getLogger("socket").error("cmd is not extends Message！");
            return null;
         }
         return (param1 as Message).$messageID;
      }
   }
}
