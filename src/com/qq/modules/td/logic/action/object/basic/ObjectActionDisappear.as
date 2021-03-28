package com.qq.modules.td.logic.action.object.basic
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   
   public class ObjectActionDisappear extends BasicAction
   {
       
      
      public function ObjectActionDisappear()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         if(_gameObject.animation)
         {
            _gameObject.animation.stop();
         }
      }
      
      override public function runningState() : void
      {
         _gameObject.dispose();
      }
   }
}
