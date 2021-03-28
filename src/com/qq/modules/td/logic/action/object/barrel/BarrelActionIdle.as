package com.qq.modules.td.logic.action.object.barrel
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   
   public class BarrelActionIdle extends BasicAction
   {
       
      
      public function BarrelActionIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.stop();
      }
      
      override public function runningState() : void
      {
         super.runningState();
         this.updateDamageState();
      }
      
      private function updateDamageState() : void
      {
         if(_gameObject.objectModel.curHp.get() <= 0)
         {
            _gameObject.setAction(TDConstant.BarrelAction_Die);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
