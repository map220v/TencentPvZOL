package com.qq.modules.main.logic.moveitem
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
   import flash.geom.Point;
   
   public class MoveRewardItemViewMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:MoveRewardItemView;
      
      private var _moveFinishFunc:Function;
      
      private var _isShowItemName:Boolean = false;
      
      public function MoveRewardItemViewMediator()
      {
         super();
      }
      
      override public function reset(param1:Object = null) : void
      {
         var _loc4_:BagItemTemplate = null;
         var _loc5_:Dto_IdNum = null;
         var _loc6_:Dto_ItemInfo = null;
         super.reset(param1);
         if(param1 == null)
         {
            return;
         }
         var _loc2_:Object = param1[0];
         this._isShowItemName = param1[1];
         var _loc3_:Point = param1[2];
         this._moveFinishFunc = param1[3];
         if(_loc2_ is Dto_IdNum)
         {
            _loc5_ = _loc2_ as Dto_IdNum;
            _loc4_ = ItemTemplateFactory.instance.getBagItemTemplateById(_loc5_.id);
            this.update(_loc4_,_loc5_.num,_loc3_);
         }
         else if(_loc2_ is Dto_ItemInfo)
         {
            _loc6_ = _loc2_ as Dto_ItemInfo;
            _loc4_ = ItemTemplateFactory.instance.getBagItemTemplateById(_loc6_.id);
            this.update(_loc4_,_loc6_.num,_loc3_);
         }
      }
      
      private function update(param1:BagItemTemplate, param2:int, param3:Point) : void
      {
         var _loc4_:String = null;
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
            _loc4_ = param1.name.concat(" x",param2);
         }
         else
         {
            _loc4_ = param2.toString();
         }
         this.view.text.text = _loc4_;
         TweenMax.to(this.view,3,{
            "x":param3.x,
            "y":param3.y,
            "ease":Circ.easeOut,
            "onComplete":this.onEffectFinish,
            "onCompleteParams":[this.view]
         });
      }
      
      private function onEffectFinish(param1:DisplayObject) : void
      {
         if(this._moveFinishFunc != null)
         {
            this._moveFinishFunc.apply(this);
         }
         UtilsManager.removeFromContainer(param1);
         IDisposable(param1).Dispose();
      }
   }
}
