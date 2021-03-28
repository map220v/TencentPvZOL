package com.qq.modules.qzoneShare.model
{
   import PVZ.Cmd.Cmd_Qzone_QueryShareList_SC;
   import PVZ.Cmd.Cmd_Qzone_SendShareMsg_SC;
   import PVZ.Cmd.Dto_ShareInfo;
   import PVZ.Cmd.E_QzoneShareType;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.qzoneShare.model.templates.QZoneShareTempFactory;
   import com.qq.modules.qzoneShare.model.templates.ce.QZoneShareTemplate;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class QZoneShareProxy extends BasicProxy
   {
       
      
      public var isOpen:Boolean = false;
      
      public var descParam:Array;
      
      public var backFunc:Function;
      
      public var curShareId:uint;
      
      public var shareIdList:Array;
      
      public var shareLeftTimes:int;
      
      public var shareType:uint;
      
      public var cardId:uint;
      
      public function QZoneShareProxy()
      {
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_Qzone_QueryShareList_SC.$MessageID,this.on_Qzone_QueryShareList_SC],[Cmd_Qzone_SendShareMsg_SC.$MessageID,this.on_Qzone_GetShareReward_SC]];
      }
      
      private function on_Qzone_QueryShareList_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Qzone_QueryShareList_SC = param1.socketData as Cmd_Qzone_QueryShareList_SC;
         this.shareIdList = _loc2_.shareInfo;
         this.shareLeftTimes = _loc2_.leftAllTimes;
      }
      
      private function on_Qzone_GetShareReward_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:Dto_ShareInfo = null;
         var _loc2_:Cmd_Qzone_SendShareMsg_SC = param1.socketData as Cmd_Qzone_SendShareMsg_SC;
         if(_loc2_.rewardList)
         {
            CommonCmd.itemFly(_loc2_.rewardList);
         }
         var _loc4_:int = 0;
         while(_loc4_ < this.shareIdList.length)
         {
            _loc3_ = this.shareIdList[_loc4_];
            if(_loc3_.shareId == _loc2_.shareInfo.shareId)
            {
               this.shareIdList[_loc4_] = _loc2_.shareInfo;
            }
            _loc4_++;
         }
         this.shareLeftTimes = _loc2_.leftAllTimes;
      }
      
      public function checkTDShareMsg(param1:int, param2:uint, param3:uint, param4:uint) : uint
      {
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:Array = null;
         if(!this.checkFirstCondition)
         {
            return 0;
         }
         var _loc5_:Vector.<QZoneShareTemplate> = QZoneShareTempFactory.instance.getQZoneShareTempsByType(E_QzoneShareType.E_QzoneShareType_TD);
         var _loc10_:int = 0;
         while(_loc10_ < _loc5_.length)
         {
            if((_loc9_ = _loc5_[_loc10_].tdId.split("-")).length > 2 && _loc9_[0] == param1 && _loc9_[1] == param2 && _loc9_[2] == param3 && param4 == _loc5_[_loc10_].tdStar)
            {
               return _loc5_[_loc10_].id;
            }
            _loc10_++;
         }
         return 0;
      }
      
      public function checkFBShareMsg(param1:int, param2:uint) : uint
      {
         if(!this.checkFirstCondition)
         {
            return 0;
         }
         var _loc3_:Vector.<QZoneShareTemplate> = QZoneShareTempFactory.instance.getQZoneShareTempsByType(E_QzoneShareType.E_QzoneShareType_Fuben);
         return 0;
      }
      
      public function checkFriendPvPShareMsg() : uint
      {
         if(!this.checkFirstCondition)
         {
            return 0;
         }
         var _loc1_:Vector.<QZoneShareTemplate> = QZoneShareTempFactory.instance.getQZoneShareTempsByType(E_QzoneShareType.E_QzoneShareType_FriendPVP);
         if(_loc1_.length > 0)
         {
            return _loc1_[0].id;
         }
         return 0;
      }
      
      public function checkTalentShareMsg(param1:int) : uint
      {
         if(!this.checkFirstCondition)
         {
            return 0;
         }
         var _loc2_:Vector.<QZoneShareTemplate> = QZoneShareTempFactory.instance.getQZoneShareTempsByType(E_QzoneShareType.E_QzoneShareType_Talent);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_].talentId == param1)
            {
               return _loc2_[_loc3_].id;
            }
            _loc3_++;
         }
         return 0;
      }
      
      public function checkCardShareMsg(param1:uint, param2:uint) : uint
      {
         if(!this.checkFirstCondition)
         {
            return 0;
         }
         var _loc3_:Vector.<QZoneShareTemplate> = QZoneShareTempFactory.instance.getQZoneShareTempsByType(E_QzoneShareType.E_QzoneShareType_Card);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_].cardStar == param2)
            {
               return _loc3_[_loc4_].id;
            }
            _loc4_++;
         }
         return 0;
      }
      
      public function checkLabMakeShareMsg() : uint
      {
         if(!this.checkFirstCondition)
         {
            return 0;
         }
         var _loc1_:Vector.<QZoneShareTemplate> = QZoneShareTempFactory.instance.getQZoneShareTempsByType(E_QzoneShareType.E_QzoneShareType_Lab);
         if(_loc1_.length > 0)
         {
            return _loc1_[0].id;
         }
         return 0;
      }
      
      public function checkSignInShareMsg() : uint
      {
         this.shareType = 0;
         if(!this.checkFirstCondition)
         {
            return 0;
         }
         var _loc1_:Vector.<QZoneShareTemplate> = QZoneShareTempFactory.instance.getQZoneShareTempsByType(E_QzoneShareType.E_QzoneShareType_SignIn);
         if(_loc1_.length > 0)
         {
            return _loc1_[0].id;
         }
         return 0;
      }
      
      private function get checkFirstCondition() : Boolean
      {
         if(ExternalVars.PlatformFlag == ExternalVars.SFROM_QZONE && this.isOpen)
         {
            if(this.shareLeftTimes > 0)
            {
               return true;
            }
            return false;
         }
         return false;
      }
      
      public function getShareInfo(param1:uint) : Dto_ShareInfo
      {
         var _loc2_:Dto_ShareInfo = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.shareIdList.length)
         {
            _loc2_ = this.shareIdList[_loc3_];
            if(_loc2_.shareId == param1)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
   }
}
