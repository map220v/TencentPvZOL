package com.qq.modules.td.view.components
{
   import asgui.utils.StringUtil;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.TDPrivilegeInfo;
   import com.qq.modules.bag.BagGlobals;
   import com.qq.modules.bag.ItemType;
   import com.qq.modules.bag.command.BagProxyCmd;
   import com.qq.modules.bag.model.vo.BagItemVO;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.buy.command.BuyProxyCmd;
   import com.qq.modules.login.command.LoginServerCmd;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.templates.font.FontHKHB;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class TDPrivilegeWindowMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDPrivilegeWindow;
      
      private const PRIVILEGE_LIST:Array = [[FontHKHB.TD_PRIVILEGE_TITLE_7,FontHKHB.TD_PRIVILEGE_DESC_7,FontHKHB.TD_PRIVILEGE_SUB_DESC_7],[FontHKHB.TD_PRIVILEGE_TITLE_5,FontHKHB.TD_PRIVILEGE_DESC_5,FontHKHB.TD_PRIVILEGE_SUB_DESC_5],[FontHKHB.TD_PRIVILEGE_TITLE_8,FontHKHB.TD_PRIVILEGE_DESC_8,FontHKHB.TD_PRIVILEGE_SUB_DESC_8],[FontHKHB.TD_PRIVILEGE_TITLE_6,FontHKHB.TD_PRIVILEGE_DESC_6,FontHKHB.TD_PRIVILEGE_SUB_DESC_6],[FontHKHB.TD_PRIVILEGE_TITLE_1,FontHKHB.TD_PRIVILEGE_DESC_1,FontHKHB.TD_PRIVILEGE_SUB_DESC_1],[FontHKHB.TD_PRIVILEGE_TITLE_2,FontHKHB.TD_PRIVILEGE_DESC_2,FontHKHB.TD_PRIVILEGE_SUB_DESC_2],[FontHKHB.TD_PRIVILEGE_TITLE_3,FontHKHB.TD_PRIVILEGE_DESC_3,FontHKHB.TD_PRIVILEGE_SUB_DESC_3],[FontHKHB.TD_PRIVILEGE_TITLE_4,FontHKHB.TD_PRIVILEGE_DESC_4,FontHKHB.TD_PRIVILEGE_SUB_DESC_4]];
      
      public function TDPrivilegeWindowMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         var _loc3_:Object = null;
         super.init();
         this.onPrivilegeUpdate(null);
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.PRIVILEGE_LIST.length)
         {
            _loc3_ = {
               "name":this.PRIVILEGE_LIST[_loc2_][0],
               "desc":this.PRIVILEGE_LIST[_loc2_][1],
               "subDesc":this.PRIVILEGE_LIST[_loc2_][2]
            };
            _loc1_.push(_loc3_);
            _loc2_++;
         }
         this.view.list.itemRendererClass = TDPrivilegeItemCell;
         this.view.list.dataProvider = _loc1_;
         TDGameObjectCmd.removeReviewZombie();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.btnActive,MouseEvent.CLICK,this.onClick);
         addContextListener(CommandName.TD_GET_UNLOCK_PLANT_INFO,this.onPrivilegeUpdate,CommonEvent);
         addContextListener(BagGlobals.BAG_ITEM_USE,this.onItemUse);
      }
      
      private function onClick(param1:Event) : void
      {
         var _loc2_:Vector.<BagItemVO> = null;
         var _loc3_:BagItemVO = null;
         switch(param1.currentTarget)
         {
            case this.view.btnActive:
               _loc2_ = GameGloble.bagProxy.getItemsByType(null,null,[ItemType.SUB_TYPE_TDVIPCARD]);
               if(_loc2_.length > 0)
               {
                  _loc3_ = _loc2_[0];
                  if(_loc3_ != null)
                  {
                     CommonCmd.showConfirmWindow("使用塔防特权卡，激活或者续期塔防特权，是否继续？",BagProxyCmd.useItem,[_loc3_.itemID,1]);
                  }
               }
               else
               {
                  CommonCmd.showConfirmWindow("将花费100Q点激活或者续期塔防特权，是否继续？",BuyProxyCmd.buy,[14]);
               }
         }
      }
      
      private function onItemUse(param1:Event) : void
      {
         LoginServerCmd.requestPrivilegeAndUnlockPlantInfo(1,1,1);
      }
      
      private function onPrivilegeUpdate(param1:CommonEvent) : void
      {
         var _loc2_:Number = NaN;
         if(TDPrivilegeInfo.getInstance().hasTDPrivilege)
         {
            this.view.l_title_state.text = FontHKHB.TD_PRIVILEGE_ACTIVED;
            this.view.l_title_state.SetStyle("color","#70FCFB");
            this.view.btnActive.label = "续期塔防特权";
            _loc2_ = TDPrivilegeInfo.getInstance().privilegeRemainTime / (24 * 3600);
            if(_loc2_ < 1 && _loc2_ > 0)
            {
               _loc2_ = 1;
            }
            if(_loc2_ < 0)
            {
               this.view.l_time.text = StringUtil.substitute(FontHKHB.TD_PRIVILEGE_DURATION,30);
            }
            else
            {
               this.view.l_time.text = StringUtil.substitute(FontHKHB.TD_PRIVILEGE_REMAIN_DURATION,int(_loc2_));
            }
         }
         else
         {
            this.view.l_title_state.text = FontHKHB.TD_PRIVILEGE_NO_ACTIVE;
            this.view.l_title_state.SetStyle("color","#FFFFFF");
            this.view.btnActive.label = "一键激活所有特权";
            this.view.l_time.text = StringUtil.substitute(FontHKHB.TD_PRIVILEGE_DURATION,30);
         }
      }
      
      override public function dispose() : void
      {
         TDGameObjectCmd.reviewZombie();
         super.dispose();
      }
   }
}
