package com.qq.modules.signIn.model
{
   import PVZ.Cmd.Cmd_SignIn_GetInfo_SC;
   import PVZ.Cmd.Cmd_SignIn_GetRewardList_SC;
   import PVZ.Cmd.Cmd_SignIn_SetInfo_SC;
   import PVZ.Cmd.Dto_ItemInfo;
   import PVZ.Cmd.Dto_Reward_Info;
   import PVZ.Cmd.Dto_SignIn_Info;
   import asgui.utils.StringUtil;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.constant.PrivilegeConst;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.main.service.PrivilegeProxy;
   import com.qq.modules.qzoneShare.command.QZoneShareCmd;
   import com.qq.modules.signIn.SignInGlobal;
   import com.qq.modules.signIn.model.vo.SignInRewardVO;
   import com.qq.modules.signIn.model.vo.SignInVO;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.update.DataUpdateManager;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class SignInProxy extends BasicProxy
   {
       
      
      [Inject]
      public var actor:ActorModel;
      
      [Inject]
      public var privilegeProxy:PrivilegeProxy;
      
      private var m_signInInfo:SignInVO;
      
      private var m_hasInit:Boolean;
      
      private var m_vecReward:Vector.<SignInRewardVO>;
      
      private var m_freeRemainCount:uint;
      
      public function SignInProxy()
      {
         super();
         this.m_signInInfo = new SignInVO();
         this.m_vecReward = new Vector.<SignInRewardVO>();
         DataUpdateManager.getInstance().addUpdateHandler(DataUpdateManager.ID_SignIn,this.reset);
      }
      
      public function reset() : void
      {
         this.m_hasInit = false;
      }
      
      public function get signInData() : SignInVO
      {
         return this.m_signInInfo;
      }
      
      public function get allReward() : Vector.<SignInRewardVO>
      {
         return this.m_vecReward;
      }
      
      public function get freeRemainCount() : int
      {
         return ServerConfigTemplateFactory.instance.freeRemainCount;
      }
      
      public function getVipRemainCount() : uint
      {
         return this.privilegeProxy.getPrivilegeParamById(PrivilegeConst.PRIVILEGE_TD_SIGN_IN_NUM);
      }
      
      public function get canFreeRemain() : Boolean
      {
         if(this.privilegeProxy.hasPrivilege(PrivilegeConst.PRIVILEGE_TD_SIGN_IN_NUM))
         {
            return this.m_signInInfo.usedAllCount < this.freeRemainCount + this.getVipRemainCount();
         }
         return this.m_signInInfo.usedCount < this.freeRemainCount;
      }
      
      public function get hasInit() : Boolean
      {
         return this.m_hasInit;
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_SignIn_GetInfo_SC.$MessageID,this.onCmd_SignIn_GetInfo_SC],[Cmd_SignIn_SetInfo_SC.$MessageID,this.onCmd_SignIn_SetInfo_SC],[Cmd_SignIn_GetRewardList_SC.$MessageID,this.onCmd_SignIn_GetRewardList_SC]];
      }
      
      private function onCmd_SignIn_GetRewardList_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_SignIn_GetRewardList_SC = param1.socketData as Cmd_SignIn_GetRewardList_SC;
         this.loadRewardList(_loc2_.rewardList);
         this.m_hasInit = true;
         this.dispatch(new CommonEvent(SignInGlobal.EVENT_SIGNIN_INIT));
      }
      
      private function onCmd_SignIn_GetInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_SignIn_GetInfo_SC = param1.socketData as Cmd_SignIn_GetInfo_SC;
         this.loadSignInInfo(_loc2_.signInInfo);
      }
      
      private function onCmd_SignIn_SetInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc5_:String = null;
         var _loc2_:Cmd_SignIn_SetInfo_SC = param1.socketData as Cmd_SignIn_SetInfo_SC;
         this.loadSignInInfo(_loc2_.signInInfo);
         var _loc3_:SignInRewardVO = this.getRewardByDayIndex(this.m_signInInfo.totalDay);
         var _loc4_:Dto_ItemInfo = new Dto_ItemInfo();
         if(_loc3_.vipLevel > 0 && this.actor.selfPrivilegeModel.vipLevel >= _loc3_.vipLevel)
         {
            _loc4_.num = _loc3_.itemCount * 2;
            _loc5_ = StringUtil.substitute(FontNormal.SIGNIN_VIP_SUCCESS,_loc3_.vipLevel);
         }
         else
         {
            _loc4_.num = _loc3_.itemCount;
            _loc5_ = FontNormal.SIGNIN_NORMAL_SUCCESS;
         }
         _loc4_.id = _loc3_.itemID;
         var _loc6_:Array = [_loc4_];
         CommonCmd.itemFly(_loc6_);
         CommonCmd.txtFly(_loc5_);
         QZoneShareCmd.checkSignInShareMsg(null,null);
      }
      
      private function loadSignInInfo(param1:Dto_SignIn_Info) : void
      {
         this.m_signInInfo.hasSignIn = param1.bIsSigned;
         this.m_signInInfo.totalDay = param1.totalSignNum;
         this.m_signInInfo.remainDay = param1.remainSignNum;
         this.m_signInInfo.usedCount = param1.usedfreeTimes;
         this.m_signInInfo.usedVipCount = param1.usedVipFreeTimes;
         this.dispatch(new CommonEvent(SignInGlobal.EVENT_SIGNIN_UPDATE));
      }
      
      private function loadRewardList(param1:Array) : void
      {
         var _loc2_:SignInRewardVO = null;
         var _loc3_:Dto_Reward_Info = null;
         this.m_vecReward.length = 0;
         for each(_loc3_ in param1)
         {
            _loc2_ = new SignInRewardVO();
            _loc2_.dayIndex = _loc3_.date;
            _loc2_.itemCount = _loc3_.itemNum;
            _loc2_.itemID = _loc3_.itemId;
            _loc2_.vipLevel = _loc3_.vipLevel;
            this.m_vecReward.push(_loc2_);
         }
         this.m_vecReward.sort(this.sortByDate);
      }
      
      public function checkEnd() : Boolean
      {
         return this.m_signInInfo.totalDay < this.m_vecReward.length;
      }
      
      public function get currentDayIndex() : int
      {
         return this.m_signInInfo.totalDay + 1;
      }
      
      public function getRewardByDayIndex(param1:int) : SignInRewardVO
      {
         var _loc2_:int = param1 - 1;
         if(_loc2_ >= 0 && _loc2_ < this.m_vecReward.length)
         {
            return this.m_vecReward[_loc2_];
         }
         return null;
      }
      
      private function sortByDate(param1:SignInRewardVO, param2:SignInRewardVO) : int
      {
         return param1.dayIndex - param2.dayIndex;
      }
   }
}
