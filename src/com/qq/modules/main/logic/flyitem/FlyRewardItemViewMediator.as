package com.qq.modules.main.logic.flyitem
{
   import PVZ.Cmd.Dto_IdNum;
   import PVZ.Cmd.Dto_ItemInfo;
   import asgui.core.IDisposable;
   import com.greensock.TweenMax;
   import com.greensock.easing.Circ;
   import com.qq.modules.bag.ItemType;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.utils.UtilsManager;
   import flash.display.DisplayObject;
   
   public class FlyRewardItemViewMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:FlyRewardItemView;
      
      private var _isShowItemName:Boolean = false;
      
      public function FlyRewardItemViewMediator()
      {
         super();
      }
      
      override public function reset(param1:Object = null) : void
      {
         var _loc3_:BagItemTemplate = null;
         var _loc4_:Dto_IdNum = null;
         var _loc5_:Dto_ItemInfo = null;
         super.reset(param1);
         if(param1 == null)
         {
            return;
         }
         var _loc2_:Object = param1[0];
         this._isShowItemName = param1[1];
         if(_loc2_ is Dto_IdNum)
         {
            _loc4_ = _loc2_ as Dto_IdNum;
            _loc3_ = ItemTemplateFactory.instance.getBagItemTemplateById(_loc4_.id);
            this.update(_loc3_,_loc4_.num);
         }
         else if(_loc2_ is Dto_ItemInfo)
         {
            _loc5_ = _loc2_ as Dto_ItemInfo;
            _loc3_ = ItemTemplateFactory.instance.getBagItemTemplateById(_loc5_.id);
            this.update(_loc3_,_loc5_.num);
         }
         else if(_loc2_ is CustomFlyItem)
         {
            this.updateCustom(_loc2_ as CustomFlyItem);
         }
      }
      
      private function updateCustom(param1:CustomFlyItem) : void
      {
         var _loc2_:String = null;
         this.view.icon.source = param1.icon;
         if(this._isShowItemName)
         {
            _loc2_ = param1.name.concat(" x",param1.count);
         }
         else
         {
            _loc2_ = param1.count.toString();
         }
         this.view.text.text = _loc2_;
         TweenMax.to(this.view,3,{
            "y":this.view.y - 250,
            "ease":Circ.easeOut,
            "onComplete":this.onEffectFinish,
            "onCompleteParams":[this.view]
         });
      }
      
      private function update(param1:BagItemTemplate, param2:int) : void
      {
         var _loc3_:String = null;
         if(param1 == null)
         {
            this.onEffectFinish(this.view);
            return;
         }
         if(param1.type == ItemType.TYPE_CARD)
         {
            this.view.icon.setCardIconByBattleCardId(param1.getCardId().id);
         }
         else
         {
            this.view.icon.source = param1.iconSource;
         }
         if(this._isShowItemName)
         {
            _loc3_ = param1.name.concat(" x",param2);
         }
         else
         {
            _loc3_ = param2.toString();
         }
         this.view.text.text = _loc3_;
         TweenMax.to(this.view,3,{
            "y":this.view.y - 250,
            "ease":Circ.easeOut,
            "onComplete":this.onEffectFinish,
            "onCompleteParams":[this.view]
         });
      }
      
      private function onEffectFinish(param1:DisplayObject) : void
      {
         UtilsManager.removeFromContainer(param1);
         IDisposable(param1).Dispose();
      }
   }
}
