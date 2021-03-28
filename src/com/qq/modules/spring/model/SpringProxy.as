package com.qq.modules.spring.model
{
   import PVZ.Cmd.Cmd_Spring_GetCredits_SC;
   import PVZ.Cmd.Cmd_Spring_OpenBox_SC;
   import PVZ.Cmd.Dto_IdNum;
   import PVZ.Cmd.Dto_SpringRewardBox;
   import PVZ.Cmd.FlexibleActivity_11;
   import com.qq.modules.bag.ItemType;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.bag.model.BagService;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.spring.SpringConst;
   import com.qq.modules.spring.model.vo.SpringRewardVO;
   import com.qq.templates.font.FontHKHB;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class SpringProxy extends BasicProxy
   {
       
      
      [Inject]
      public var bagService:BagService;
      
      private var m_vecReward:Vector.<SpringRewardVO>;
      
      private var m_currentScore:uint;
      
      private var m_hasSignInToday:Boolean;
      
      public function SpringProxy()
      {
         super();
      }
      
      public function get currentScore() : uint
      {
         return this.m_currentScore;
      }
      
      public function get hasSignInToday() : Boolean
      {
         return this.m_hasSignInToday;
      }
      
      public function get rewards() : Vector.<SpringRewardVO>
      {
         return this.m_vecReward;
      }
      
      override public function listMsgInterests() : Array
      {
         return [[FlexibleActivity_11.$MessageID,this.onFlexibleActivity_11],[Cmd_Spring_GetCredits_SC.$MessageID,this.onCmd_Spring_GetCredits_SC],[Cmd_Spring_OpenBox_SC.$MessageID,this.onCmd_Spring_OpenBox_SC]];
      }
      
      private function onFlexibleActivity_11(param1:SocketServiceEvent) : void
      {
         var _loc3_:SpringRewardVO = null;
         var _loc4_:Dto_SpringRewardBox = null;
         var _loc2_:FlexibleActivity_11 = param1.socketData as FlexibleActivity_11;
         this.m_vecReward = new Vector.<SpringRewardVO>();
         this.m_currentScore = _loc2_.credits;
         this.m_hasSignInToday = _loc2_.todayGetCredit;
         for each(_loc4_ in _loc2_.box)
         {
            _loc3_ = new SpringRewardVO();
            _loc3_.parseFromDTO(_loc4_);
            this.m_vecReward.push(_loc3_);
         }
         this.dispatch(new CommonEvent(SpringConst.EVENT_SPRING_INFO_UPDATE));
      }
      
      private function onCmd_Spring_GetCredits_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Spring_GetCredits_SC = param1.socketData as Cmd_Spring_GetCredits_SC;
         this.m_currentScore = _loc2_.credits;
         this.m_hasSignInToday = true;
         CommonCmd.txtFly(FontHKHB.SPRING_SIGN_IN_SUCCESS);
         this.dispatch(new CommonEvent(SpringConst.EVENT_SPRING_INFO_UPDATE));
      }
      
      private function onCmd_Spring_OpenBox_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:SpringRewardVO = null;
         var _loc4_:BagItemTemplate = null;
         var _loc5_:Array = null;
         var _loc6_:Dto_IdNum = null;
         var _loc2_:Cmd_Spring_OpenBox_SC = param1.socketData as Cmd_Spring_OpenBox_SC;
         for each(_loc3_ in this.m_vecReward)
         {
            if(_loc3_.index == _loc2_.index)
            {
               _loc3_.hasOpen = true;
            }
         }
         _loc5_ = [];
         for each(_loc6_ in _loc2_.items)
         {
            if(!(_loc4_ = ItemTemplateFactory.instance.getBagItemTemplateById(_loc6_.id)))
            {
               continue;
            }
            switch(_loc4_.subType)
            {
               case ItemType.SUB_TYPE_GIFT_BAG:
               case ItemType.SUB_TYPE_TREASURE_CHEST:
                  this.bagService.useItem(_loc6_.id);
                  break;
               default:
                  _loc5_.push(_loc6_);
                  break;
            }
         }
         if(_loc5_.length > 0)
         {
            CommonCmd.itemFly(_loc5_);
         }
         this.dispatch(new CommonEvent(SpringConst.EVENT_SPRING_INFO_UPDATE));
      }
   }
}
