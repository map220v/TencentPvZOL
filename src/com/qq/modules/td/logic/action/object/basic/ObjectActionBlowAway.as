package com.qq.modules.td.logic.action.object.basic
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class ObjectActionBlowAway extends BasicAction
   {
       
      
      private var _blowSpeed:int = 10;
      
      public function ObjectActionBlowAway()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
      }
      
      override public function runningState() : void
      {
         super.runningState();
         _gameObject.setLocation(_gameObject.x + this._blowSpeed,_gameObject.y);
         if(!TDGameInfo.getInstance().isInScreen(_gameObject.x,_gameObject.y))
         {
            _gameObject.Dispose();
         }
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
   }
}
