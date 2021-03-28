package com.qq.modules.td.logic.action.plant.coconutCannon
{
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.basic.PlantActionIdle;
   import com.qq.utils.blit.QBlitUI;
   import flash.events.MouseEvent;
   
   public class PCoconutCannonActionIdle extends PlantActionIdle
   {
       
      
      private var _blitContainer:IBlitDisplayContainer;
      
      public function PCoconutCannonActionIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this.addArea();
      }
      
      override public function leaveState() : void
      {
         this.removeArea();
         super.leaveState();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      private function addArea() : void
      {
         var _loc1_:IBlitClip = null;
         this.removeArea();
         if(_gameObject.damageArea.width == 0 || _gameObject.damageArea.height == 0)
         {
            _loc1_ = QBlitUI.createClipByRect(50,50,0);
         }
         else
         {
            _loc1_ = QBlitUI.createClipByRect(_gameObject.damageArea.width,_gameObject.damageArea.height,0);
         }
         _loc1_.x = _gameObject.damageArea.x;
         _loc1_.y = _gameObject.damageArea.y;
         this._blitContainer = QBlitUI.createContainer();
         this._blitContainer.AddChild(_loc1_);
         _gameObject.frontLayer.addChild(this._blitContainer.asset);
         _gameObject.frontLayer.mouseChildren = true;
         this._blitContainer.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function removeArea() : void
      {
         if(this._blitContainer)
         {
            this._blitContainer.removeEventListener(MouseEvent.CLICK,this.onClick);
            _gameObject.frontLayer.removeChild(this._blitContainer.asset);
            this._blitContainer = null;
         }
         _gameObject.frontLayer.mouseChildren = false;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         _plant.setAction(TDConstant.PCoconutCannonAction_Shoot);
      }
   }
}
