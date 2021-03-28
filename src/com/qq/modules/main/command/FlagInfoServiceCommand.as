package com.qq.modules.main.command
{
   import PVZ.Cmd.Cmd_Card_RawAttribute_CS;
   import PVZ.Cmd.Cmd_Chat_GetObjInfo_CS;
   import PVZ.Cmd.Cmd_Flag_GetList_CS;
   import PVZ.Cmd.Dto_CardIdLevel;
   import PVZ.Cmd.ObjInfoType;
   import com.qq.modules.main.server.PvzSocketService;
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class FlagInfoServiceCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var server:PvzSocketService;
      
      public function FlagInfoServiceCommand()
      {
         super();
      }
      
      public function initFlagInfo() : void
      {
         var _loc1_:Cmd_Flag_GetList_CS = new Cmd_Flag_GetList_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function getDtoFromServer(param1:int, param2:Int64, param3:Int64) : void
      {
         var _loc4_:Cmd_Chat_GetObjInfo_CS = null;
         if(param2.isZero() == false)
         {
            (_loc4_ = new Cmd_Chat_GetObjInfo_CS()).type = param1;
            _loc4_.uid = param2;
            _loc4_.roleid = param3;
            this.server.sendMessage(_loc4_);
         }
      }
      
      public function getDtoFromeServerByStringPara(param1:String) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Int64 = null;
         var _loc6_:Int64 = null;
         var _loc2_:Array = param1.split("|");
         var _loc3_:int = int(_loc2_[0]);
         switch(_loc3_)
         {
            case ObjInfoType.E_ObjInfoType_ItemInfo:
               _loc4_ = int(_loc2_[1]);
               _loc5_ = Int64.parseInt64(_loc2_[2]);
               _loc6_ = Int64.parseInt64(_loc2_[3]);
               break;
            case ObjInfoType.E_ObjInfoType_CardFullInfo:
               _loc4_ = int(_loc2_[1]);
               _loc5_ = Int64.parseInt64(_loc2_[2]);
               _loc6_ = Int64.parseInt64(_loc2_[3]);
               break;
            case ObjInfoType.E_ObjInfoType_ItemInfo:
               _loc6_ = Int64.parseInt64(_loc2_[1]);
         }
         this.getDtoFromServer(_loc3_,_loc5_,_loc6_);
      }
      
      public function getCard_RawAttribute(param1:Array) : void
      {
         var _loc6_:Array = null;
         var _loc7_:Dto_CardIdLevel = null;
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         var _loc2_:Array = new Array();
         var _loc3_:int = param1.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc6_ = param1[_loc4_];
            (_loc7_ = new Dto_CardIdLevel()).baseId = _loc6_[0];
            _loc7_.level = _loc6_[1];
            _loc2_.push(_loc7_);
            _loc4_++;
         }
         var _loc5_:Cmd_Card_RawAttribute_CS;
         (_loc5_ = new Cmd_Card_RawAttribute_CS()).allCard = _loc2_;
         this.server.sendMessage(_loc5_);
      }
   }
}
