package com.qq.modules.market.view
{
   import com.qq.constant.ItemID;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.bag.model.vo.BagProxy;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.utils.UtilsManager;
   import flash.events.Event;
   
   public class MarketItemToolTipMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var bagProxy:BagProxy;
      
      [Inject]
      public var actor:ActorModel;
      
      public function MarketItemToolTipMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view,Event.CHANGE,this.changeHandler);
      }
      
      protected function changeHandler(param1:Event) : void
      {
         this.update();
      }
      
      public function update() : void
      {
         var _loc1_:int = Number(this.view.text);
         var _loc2_:BagItemTemplate = ItemTemplateFactory.instance.getBagItemTemplateById(_loc1_);
         var _loc3_:int = 0;
         switch(_loc2_.id)
         {
            case ItemID.Coin:
               _loc3_ = this.actor.actorCoin;
               break;
            case ItemID.Sun:
               _loc3_ = this.actor.actorSun;
               break;
            case ItemID.Soil:
               _loc3_ = this.actor.fosterTicket;
               break;
            default:
               _loc3_ = this.bagProxy.getItemNumByItemID(_loc1_);
         }
         this.view.nameTxt.text = _loc2_.name;
         this.view.hasData.text = UtilsManager.converNum(_loc3_);
         this.view.useData.text = _loc2_.desc;
         this.view.useData.ValidateSkin();
         this.view.getWayData.text = _loc2_.gainWay;
         this.view.layout();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function get view() : MarketItemToolTip
      {
         return this.viewComponent as MarketItemToolTip;
      }
   }
}
