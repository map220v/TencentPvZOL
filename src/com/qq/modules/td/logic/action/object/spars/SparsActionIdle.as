package com.qq.modules.td.logic.action.object.spars
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.unitFunctor.SparsGroup;
   import com.qq.utils.CommandDispatcher;
   
   public class SparsActionIdle extends BasicAction
   {
       
      
      private var hitObjList:Array;
      
      private var group:SparsGroup;
      
      public function SparsActionIdle()
      {
         this.hitObjList = [];
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.stop();
         _gameObject.animation.frameRate = 10;
         CommandDispatcher._dispatcher.addEventListener(CommandName.SHOW_SPARS,this.showSparsHandler);
      }
      
      private function showSparsHandler(param1:CommonEvent) : void
      {
         _gameObject.animation.gotoAndPlay("d1",1);
      }
      
      override public function runningState() : void
      {
      }
      
      override public function leaveState() : void
      {
      }
      
      override public function dispose() : void
      {
         super.dispose();
         CommandDispatcher._dispatcher.removeEventListener(CommandName.SHOW_SPARS,this.showSparsHandler);
      }
   }
}
