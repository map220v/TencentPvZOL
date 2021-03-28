package com.qq.modules.td.logic.action.object.dropCard
{
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.object.TDDropCard;
   import com.qq.utils.UtilsManager;
   import flash.display.Sprite;
   
   public class DropCardActionCollect extends BasicAction
   {
       
      
      public function DropCardActionCollect()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         TDSoundCmd.pickupLeaf();
      }
      
      override public function runningState() : void
      {
         super.runningState();
         this.view.x = _gameObject.x;
         this.view.y = _gameObject.y;
         this.view.scaleX = _gameObject.scaleX;
         this.view.scaleY = _gameObject.scaleY;
         this.view.alpha = _gameObject.alpha;
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         if(this.view != null)
         {
            UtilsManager.removeFromContainer(this.view);
         }
      }
      
      private function get view() : Sprite
      {
         return (_gameObject as TDDropCard).cardItem;
      }
   }
}
