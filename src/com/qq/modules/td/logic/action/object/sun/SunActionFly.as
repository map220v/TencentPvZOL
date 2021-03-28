package com.qq.modules.td.logic.action.object.sun
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.utils.UtilsManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class SunActionFly extends BasicSunAction
   {
       
      
      private var _snapshot:Bitmap;
      
      private var _snapshotContainer:Sprite;
      
      public function SunActionFly()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _sun.animation.gotoAndStop(TDConstant.ObjectAnmi_Idle);
         var _loc2_:BitmapData = _sun.animation.getSnapshot();
         if(_loc2_ == null)
         {
            this.leaveState();
         }
         else
         {
            this._snapshot = new Bitmap(_loc2_);
            _sun.animation.visible = false;
            this._snapshotContainer = new Sprite();
            this._snapshot.x = _gameObject.animation.offsetX;
            this._snapshot.y = _gameObject.animation.offsetY;
            this._snapshotContainer.addChild(this._snapshot);
            TDUILayerManager.topSceneLayer.addChild(this._snapshotContainer);
         }
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
