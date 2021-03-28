package com.qq.modules.td.logic.action.object.leaf
{
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.utils.UtilsManager;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class LeafActionCollect extends BasicAction
   {
       
      
      private var _snapshot:Bitmap;
      
      private var _snapshotContainer:Sprite;
      
      public function LeafActionCollect()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndStop("idle");
         this._snapshot = new Bitmap(_gameObject.animation.getSnapshot());
         _gameObject.animation.visible = false;
         this._snapshotContainer = new Sprite();
         this._snapshot.x = _gameObject.animation.offsetX;
         this._snapshot.y = _gameObject.animation.offsetY;
         this._snapshotContainer.addChild(this._snapshot);
         TDUILayerManager.topSceneLayer.addChild(this._snapshotContainer);
         TDSoundCmd.pickupLeaf();
      }
      
      override public function runningState() : void
      {
         super.runningState();
         this._snapshotContainer.x = _gameObject.x;
         this._snapshotContainer.y = _gameObject.y;
         this._snapshotContainer.scaleX = _gameObject.scaleX;
         this._snapshotContainer.scaleY = _gameObject.scaleY;
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         if(this._snapshot != null)
         {
            UtilsManager.removeFromContainer(this._snapshotContainer);
            UtilsManager.removeFromContainer(this._snapshot);
            this._snapshot.bitmapData.dispose();
            this._snapshot = null;
            this._snapshotContainer = null;
         }
      }
   }
}
