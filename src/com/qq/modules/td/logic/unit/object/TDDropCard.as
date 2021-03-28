package com.qq.modules.td.logic.unit.object
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDTrackGameConstant;
   import com.qq.display.TDCardItem;
   import com.qq.modules.td.model.TDMoveCardTrackData;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UtilsManager;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class TDDropCard extends TDNormalObject
   {
       
      
      private var _cardItem:Sprite;
      
      public function TDDropCard()
      {
         super();
      }
      
      public function get cardItem() : Sprite
      {
         return this._cardItem;
      }
      
      override protected function initAnmi(param1:Boolean = false, param2:Boolean = false) : void
      {
         this._cardItem = new Sprite();
         var _loc3_:TDCardItem = new TDCardItem();
         _loc3_.setCard(getRunningProp(TDConstant.GameObject_Prop_DropCardId));
         this._cardItem.addChild(_loc3_);
      }
      
      override protected function initListener() : void
      {
         this._cardItem.addEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
      }
      
      private function onRollOver(param1:MouseEvent) : void
      {
         if(TDMoveCardTrackData.getInstance().currentTrackCardNum < TDTrackGameConstant.MAX_CARD_ON_TRACK)
         {
            this._cardItem.removeEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
            setAction(TDConstant.DropCardAction_Collect);
            CommandDispatcher.send(CommandName.TD_CollectCard,{"obj":this});
         }
      }
      
      override public function dispose(param1:Boolean = true) : void
      {
         removeMouseEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         if(this._cardItem)
         {
            UtilsManager.removeFromContainer(this._cardItem);
            this._cardItem = null;
         }
         super.dispose();
      }
   }
}
