package com.qq.modules.main.service
{
   import PVZ.Cmd.Cmd_ExitInfo_SC;
   import asgui.utils.StringUtil;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.constant.PrivilegeConst;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.main.model.templates.ExitGameTipsFactory;
   import com.qq.modules.main.model.templates.ExitGameTipsTemplate;
   import com.qq.modules.onlineReward.model.OnlineRewardModel;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.DateUtils;
   import com.qq.utils.UtilsManager;
   import org.allencuilib.util.TimeUtils;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class ExitTipsProxy extends BasicProxy
   {
       
      
      [Inject]
      public var actorModel:ActorModel;
      
      [Inject]
      public var model:OnlineRewardModel;
      
      [Inject]
      public var privilegeProxy:PrivilegeProxy;
      
      private var evtStr:String = "";
      
      private var msg:Cmd_ExitInfo_SC;
      
      public function ExitTipsProxy()
      {
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_ExitInfo_SC.$MessageID,this.onDataChange]];
      }
      
      private function onDataChange(param1:SocketServiceEvent) : void
      {
         this.msg = param1.socketData as Cmd_ExitInfo_SC;
         UtilsManager.exitTip = this.getTips;
      }
      
      private function getMaxCount(param1:int, param2:int) : int
      {
         var _loc3_:int = param1;
         switch(param2)
         {
            case 5:
            case 6:
               if(this.privilegeProxy.hasPrivilege(PrivilegeConst.PRIVILEGE_TD_XIAO_JIN_LONG))
               {
                  _loc3_ += this.privilegeProxy.getPrivilegeParamById(PrivilegeConst.PRIVILEGE_TD_XIAO_JIN_LONG);
               }
         }
         return _loc3_;
      }
      
      public function getTips() : String
      {
         var _loc2_:ExitGameTipsTemplate = null;
         this.evtStr = "";
         var _loc1_:int = ServerConfigTemplateFactory.instance.iExitNoticeCount;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < ExitGameTipsFactory.instance.allTips.length)
         {
            _loc2_ = ExitGameTipsFactory.instance.allTips[_loc4_];
            _loc3_ = this.getActCount(this.msg,_loc2_.id);
            if(this.getLvLimit(_loc2_) && _loc2_.checkIsInTime() && _loc3_ < _loc2_.count)
            {
               this.evtStr += "★" + _loc2_.desc + " " + _loc3_ + "/" + this.getMaxCount(_loc2_.count,_loc2_.id) + "\n";
               if(--_loc1_ <= 0)
               {
                  break;
               }
            }
            _loc4_++;
         }
         if(this.actorModel.currEnergy > 0)
         {
            this.evtStr += "\n★" + StringUtil.substitute(FontNormal.EXIT_GAME_ENERGY,this.actorModel.currEnergy);
         }
         return StringUtil.substitute(FontNormal.EXIT_GAME_TIPS,this.evtStr + this.onlineGift);
      }
      
      private function getLvLimit(param1:ExitGameTipsTemplate) : Boolean
      {
         if(param1.id == 4)
         {
            return this.actorModel.getTDOpenedStageID() > 1;
         }
         return param1.lv <= this.actorModel.actorLevel;
      }
      
      public function get onlineGift() : String
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = this.model.getNextRewardTime();
         if(_loc1_ != 0)
         {
            _loc2_ = DateUtils.getInstance().getInterval(_loc1_);
            if(_loc2_ <= 0)
            {
               return FontNormal.EXIT_GAME_GIFT;
            }
            return StringUtil.substitute(FontNormal.EXIT_GAME_GIFT_TIME,TimeUtils.formatSecondToStr(_loc2_));
         }
         return "";
      }
      
      private function getActCount(param1:Cmd_ExitInfo_SC, param2:int) : int
      {
         var _loc3_:int = 0;
         switch(param2)
         {
            case 1:
               _loc3_ = param1.signIn;
               break;
            case 2:
               _loc3_ = param1.presentEnergy;
               break;
            case 3:
               _loc3_ = param1.friendFight;
               break;
            case 4:
               _loc3_ = param1.dailyTD;
               break;
            case 5:
               _loc3_ = param1.catchThief;
               break;
            case 6:
               _loc3_ = param1.protectFarm;
               break;
            case 7:
               _loc3_ = param1.guildFertilization;
               break;
            case 8:
               _loc3_ = param1.arean;
               break;
            case 9:
               _loc3_ = param1.worldBoss;
               break;
            case 10:
               _loc3_ = param1.goldRoomCollect;
               break;
            case 11:
               _loc3_ = param1.zombieIsland;
               break;
            case 12:
               _loc3_ = param1.treasureFormation;
               break;
            case 13:
               _loc3_ = param1.treasureSeize;
         }
         return _loc3_;
      }
   }
}
