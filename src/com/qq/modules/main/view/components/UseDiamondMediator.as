package com.qq.modules.main.view.components
{
   import asgui.managers.PopUpManager;
   import asgui.utils.StringUtil;
   import com.qq.GameGloble;
   import com.qq.constant.ItemID;
   import com.qq.constant.QuickPayType;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.command.ShortcutPayProxyCmd;
   import com.qq.modules.main.constant.UseDiamondConstant;
   import com.qq.modules.main.model.StoreModel;
   import com.qq.modules.main.service.ShortcutPayProxy;
   import com.qq.modules.shop.model.ShopTemplateFactory;
   import com.qq.modules.shop.model.templates.ce.ShopItemTemplateCE;
   import com.qq.templates.font.FontNormal;
   import flash.events.MouseEvent;
   
   public class UseDiamondMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var storeModel:StoreModel;
      
      [Inject]
      public var shortcutProxy:ShortcutPayProxy;
      
      [Inject]
      public var view:UseDiamondView;
      
      public var cancelFunc:Function;
      
      public var confirmedFunc:Function;
      
      public var confirmedCallbackParams:Array;
      
      public var diamondCost:int;
      
      public var descTxt:String;
      
      private var canDiscount:Boolean;
      
      private var type:uint;
      
      private var isConfirm:Boolean = false;
      
      private var needGoldDiamond:Boolean = false;
      
      public var isCustomDesc:Boolean;
      
      private var diamondEnough:Boolean = false;
      
      public function UseDiamondMediator()
      {
         super();
      }
      
      override public function onRemove() : void
      {
         if(!this.isConfirm)
         {
            this.applyCancelFunc();
         }
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.button_cancel,MouseEvent.CLICK,this.onClickCanel);
         addComponentListener(this.view.button_ok,MouseEvent.CLICK,this.onClickOk);
         addContextListener(UseDiamondConstant.INIT_USE_DIAMOND_OBJ,this.onInitUseDiamondConstant);
      }
      
      private function onInitUseDiamondConstant(param1:CommonEvent) : void
      {
         var _loc5_:Boolean = false;
         var _loc6_:ShopItemTemplateCE = null;
         this.cancelFunc = param1.readCustomParam("cancelFunc");
         this.confirmedFunc = param1.readCustomParam("confirmedFunc");
         this.diamondCost = param1.readCustomParam_Number("diamondCost");
         this.descTxt = param1.readCustomParam_String("descTxt");
         this.type = param1.readCustomParam_Number("type");
         this.needGoldDiamond = param1.readCustomParam("needGoldDiamond");
         this.confirmedCallbackParams = param1.readCustomParam("confirmedCallbackParams");
         this.isCustomDesc = param1.readCustomParam("isCustomDesc");
         var _loc2_:int = param1.readCustomParam("itemID");
         var _loc3_:int = param1.readCustomParam("itemNum");
         if(this.diamondCost == -1 && _loc2_ != -1)
         {
            if((_loc6_ = ShopTemplateFactory.instance.getMallItemTemplateByItemID(_loc2_)) != null)
            {
               this.diamondCost = _loc6_.price * _loc3_;
               this.needGoldDiamond = _loc6_.useGold == 1;
            }
            else
            {
               this.diamondCost = 0;
            }
         }
         var _loc4_:int = this.diamondCost;
         if(GameGloble.actorModel.isEnoughDiamond(_loc4_,this.needGoldDiamond))
         {
            this.diamondEnough = true;
         }
         this.updateDesc(_loc4_);
         if(this.type == 0)
         {
            this.view.checkbox_tip.visible = false;
            this.view.label_only_this.visible = false;
         }
         else
         {
            this.view.checkbox_tip.visible = true;
            if(QuickPayType.isQuickPay(this.type))
            {
               this.view.label_only_this.visible = true;
            }
            else
            {
               this.view.label_only_this.visible = false;
            }
         }
         if(this.shortcutProxy.getFlag(this.type) || QuickPayType.isQuickPay(this.type) && QuickPayType.isTipOnlyThis(this.type))
         {
            if(this.diamondEnough)
            {
               if(this.applyConfirmFunc())
               {
                  this.close();
               }
            }
            else
            {
               CommonCmd.showDiamondNotEnough(_loc4_,this.needGoldDiamond);
               this.applyCancelFunc();
               this.close();
            }
            return;
         }
         PopUpManager.AddPopUp(this.view,null,true);
      }
      
      public function updateDesc(param1:int) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc2_:int = !!this.needGoldDiamond ? int(ItemID.GoldDiamond) : int(ItemID.GiftDiamond1);
         switch(this.type)
         {
            case QuickPayType.BUY_Physical:
               _loc3_ = this.descTxt;
               this.view.textarea_desc.SetStyle("textAlign","center");
               break;
            default:
               if(this.isCustomDesc)
               {
                  _loc3_ = this.descTxt;
               }
               else
               {
                  if(!this.needGoldDiamond)
                  {
                     if((_loc5_ = param1 - GameGloble.actorModel.giftDiamond) > 0)
                     {
                        _loc4_ = "<font color=\'#FFFF00\'>(含".concat(_loc5_,ItemTemplateFactory.instance.getBagItemName(ItemID.GoldDiamond),")</font>");
                     }
                     else
                     {
                        _loc4_ = "";
                     }
                  }
                  else
                  {
                     _loc4_ = "";
                  }
                  _loc3_ = StringUtil.substitute(FontNormal.SHOP_BUY_DESC,this.descTxt,param1,ItemTemplateFactory.instance.getBagItemName(_loc2_),_loc4_);
               }
         }
         this.view.data = _loc3_;
      }
      
      private function onClickOk(param1:MouseEvent) : void
      {
         if(this.diamondEnough)
         {
            if(this.view.checkbox_tip.selected && this.type != 0)
            {
               if(QuickPayType.isQuickPay(this.type))
               {
                  QuickPayType.setTipOnlyThis(this.type);
               }
               else
               {
                  ShortcutPayProxyCmd.setShortcutPayTip(this.type,true);
               }
            }
            this.isConfirm = true;
            this.applyConfirmFunc();
         }
         else
         {
            CommonCmd.showDiamondNotEnough(this.diamondCost,this.needGoldDiamond);
            this.applyCancelFunc();
         }
         this.close();
      }
      
      private function applyConfirmFunc() : Boolean
      {
         this.isConfirm = true;
         if(this.confirmedFunc != null)
         {
            this.confirmedFunc.apply(this,this.confirmedCallbackParams);
            this.confirmedCallbackParams = null;
            this.confirmedFunc = null;
            return true;
         }
         return false;
      }
      
      private function applyCancelFunc() : Boolean
      {
         if(this.cancelFunc != null)
         {
            this.cancelFunc.apply();
            this.cancelFunc = null;
            return true;
         }
         return false;
      }
      
      private function onClickCanel(param1:MouseEvent) : void
      {
         this.applyCancelFunc();
         this.close();
      }
      
      private function close() : void
      {
         PopUpManager.RemovePopUp(this.view);
         this.view.Dispose();
      }
   }
}
