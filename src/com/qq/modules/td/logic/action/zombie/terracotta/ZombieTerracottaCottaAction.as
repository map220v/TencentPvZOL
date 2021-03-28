package com.qq.modules.td.logic.action.zombie.terracotta
{
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.zombie.TerracottaZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDMiniGameTerracottaMemoryData;
   import com.qq.utils.UtilsManager;
   import com.qq.utils.blit.QBlitUI;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   
   public class ZombieTerracottaCottaAction extends BasicZombieAction
   {
       
      
      private const LINE_UP_GAP:int = 4;
      
      private var _blitContainer:IBlitDisplayContainer;
      
      private var _enterTime:int;
      
      private var _cursor:MovieClip;
      
      public function ZombieTerracottaCottaAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._enterTime = TDGameInfo.getInstance().getCurGameTime();
         _gameObject.setFrozenAI(true);
         _gameObject.animation.gotoAndStop("bingmayong_idle");
         this.addArea();
         _zombie.objectModel.removeBuff(TDConstant.TDBuffID_God);
      }
      
      override public function runningState() : void
      {
         super.runningState();
         if(TDMiniGameTerracottaMemoryData.getInstance().isWake || TDGameInfo.getInstance().getCurGameTime() >= this._enterTime + TDMiniGameTerracottaMemoryData.getInstance().knockTime)
         {
            TDMiniGameTerracottaMemoryData.getInstance().wakeCotta(_zombie as TerracottaZombie);
         }
      }
      
      override public function leaveState() : void
      {
         _gameObject.setFrozenAI(false);
         this.removeArea();
         this.removeHammer();
         super.leaveState();
      }
      
      private function addArea() : void
      {
         var _loc1_:IBlitClip = QBlitUI.createClipByRect(_gameObject.damageArea.width,_gameObject.damageArea.height,0);
         _loc1_.x = _gameObject.damageArea.x;
         _loc1_.y = _gameObject.damageArea.y;
         this._blitContainer = QBlitUI.createContainer();
         this._blitContainer.AddChild(_loc1_);
         _gameObject.frontLayer.addChild(this._blitContainer.asset);
         _gameObject.frontLayer.mouseChildren = true;
         this._blitContainer.addEventListener(MouseEvent.CLICK,this.onClick);
         this._blitContainer.addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         this._blitContainer.addEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
      }
      
      private function removeArea() : void
      {
         Mouse.show();
         if(this._blitContainer)
         {
            this._blitContainer.removeEventListener(MouseEvent.CLICK,this.onClick);
            this._blitContainer.removeEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
            this._blitContainer.removeEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
            _gameObject.frontLayer.removeChild(this._blitContainer.asset);
            this._blitContainer = null;
         }
         _gameObject.frontLayer.mouseChildren = false;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         TDMiniGameTerracottaMemoryData.getInstance().smash(_zombie as TerracottaZombie);
      }
      
      private function onRollOver(param1:Event) : void
      {
         Mouse.hide();
         GameGloble.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         if(this._cursor == null)
         {
            this._cursor = AssetManager.instance.GetNewClass("TD_UI_HammerCursor") as MovieClip;
            this._cursor.gotoAndStop("up");
         }
         TDUILayerManager.topEffectLayer.dragSp.addChild(this._cursor);
      }
      
      private function onRollOut(param1:Event) : void
      {
         this.removeHammer();
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         this._cursor.x = GameGloble.stage.mouseX;
         this._cursor.y = GameGloble.stage.mouseY;
      }
      
      private function removeHammer() : void
      {
         Mouse.show();
         GameGloble.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         if(this._cursor != null)
         {
            UtilsManager.removeFromContainer(this._cursor);
         }
      }
   }
}
