package com.qq.modules.main.server
{
   import PVZ.Cmd.Cmd_Shop_BuyItem_CS;
   import PVZ.Cmd.Cmd_Shop_BuyItem_SC;
   import asgui.utils.StringUtil;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.constant.UseDiamondConstant;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.main.model.StoreModel;
   import com.qq.modules.shop.model.ShopTemplateFactory;
   import com.qq.modules.shop.model.templates.ce.ShopItemTemplateCE;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import org.robotlegs.mvcs.Actor;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class StoreService extends Actor
   {
       
      
      private var _isInit:Boolean;
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      [Inject]
      public var storeModel:StoreModel;
      
      [Inject]
      public var actorModel:ActorModel;
      
      public function StoreService()
      {
         super();
      }
      
      public function init() : void
      {
         if(this._isInit)
         {
            return;
         }
         this._isInit = true;
         this.pvzService.eventDispatcher.addEventListener(Cmd_Shop_BuyItem_SC.$MessageID,this.onMessage);
      }
      
      private function onMessage(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Shop_BuyItem_SC = null;
         switch(param1.type)
         {
            case Cmd_Shop_BuyItem_SC.$MessageID:
               _loc2_ = param1.socketData as Cmd_Shop_BuyItem_SC;
               this.storeModel.applyItemBackFunc(_loc2_.shopId);
               this.storeModel.removeItemBackFunc(_loc2_.shopId);
               dispatch(new CommonEvent(UseDiamondConstant.BUY_ITEM_OK,_loc2_.shopId));
         }
      }
      
      public function buyItemWithBackFunc(param1:String, param2:uint, param3:int, param4:uint, param5:Function, param6:Array, param7:int = 0, param8:Boolean = false) : void
      {
         var _loc9_:ShopItemTemplateCE = null;
         var _loc10_:String = null;
         var _loc11_:int = 0;
         if(param5 != null)
         {
            this.storeModel.addItemBackFunc(param2,param5,param6);
         }
         if(param8)
         {
            this.buyByShopID(param2,param3);
         }
         else
         {
            if((_loc9_ = ShopTemplateFactory.instance.getMallItemTemplateByShopID(param2)).needVIP > this.actorModel.selfPrivilegeModel.vipLevel)
            {
               CommonCmd.showVipConfirm(StringUtil.substitute(FontHKHB.SHOP_BUY_NEED_VIP,ItemTemplateFactory.instance.getBagItemName(_loc9_.itemID),_loc9_.needVIP));
               return;
            }
            if(param1 == "")
            {
               if(_loc9_ != null)
               {
                  _loc10_ = _loc9_.desc;
               }
               else
               {
                  _loc10_ = "";
               }
               param1 = StringUtil.substitute(FontNormal.SHOP_CONFIRM_BUY,_loc10_,param3);
            }
            if(param4 == 0)
            {
               _loc11_ = 0;
               if(_loc9_ != null)
               {
                  _loc11_ = _loc9_.price;
               }
               param4 = _loc11_ * param3;
            }
            this.storeModel.curItemShopId = _loc9_.id;
            this.storeModel.itemCount = param3;
            CommonCmd.confirmUseDiamond(param1,param4,this.onCheckBuy,this.onCancel,param7,_loc9_.useGold > 0);
         }
      }
      
      private function onCancel() : void
      {
         this.storeModel.removeItemBackFunc(this.storeModel.curItemShopId);
      }
      
      public function buyByItemID(param1:int, param2:int) : void
      {
         var _loc3_:ShopItemTemplateCE = ShopTemplateFactory.instance.getMallItemTemplateByItemID(param1);
         if(_loc3_)
         {
            this.buyByShopID(_loc3_.id,param2);
         }
      }
      
      public function buyByShopID(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_Shop_BuyItem_CS = new Cmd_Shop_BuyItem_CS();
         _loc3_.shopId = param1;
         _loc3_.num = param2;
         this.pvzService.sendMessage(_loc3_);
      }
      
      private function onCheckBuy() : void
      {
         var _loc1_:Cmd_Shop_BuyItem_CS = new Cmd_Shop_BuyItem_CS();
         _loc1_.shopId = this.storeModel.curItemShopId;
         _loc1_.num = this.storeModel.itemCount;
         this.pvzService.sendMessage(_loc1_);
      }
   }
}
