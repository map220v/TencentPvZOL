package com.qq.modules.td.logic.action.object.other
{
   import com.qq.GameGloble;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import flash.geom.Point;
   
   public class YetiKeyAction extends BasicAction
   {
       
      
      private var _targetPt:Point;
      
      private var _speed:int = 8;
      
      public function YetiKeyAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._targetPt = new Point(this.flyTargetX,this.flyTargetY);
      }
      
      override public function runningState() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Point = null;
         super.runningState();
         var _loc1_:Point = new Point(_gameObject.x,_gameObject.y);
         if(this._targetPt.equals(_loc1_))
         {
            _gameObject.Dispose();
         }
         else
         {
            _loc2_ = Point.distance(_loc1_,this._targetPt);
            _loc3_ = Point.interpolate(this._targetPt,_loc1_,this._speed >= _loc2_ ? Number(1) : Number(this._speed / _loc2_));
            _gameObject.setLocation(_loc3_.x,_loc3_.y);
         }
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
      
      private function get flyTargetX() : int
      {
         return (600 - GameGloble.xAddForScene) / GameGloble.scaleCurrent;
      }
      
      private function get flyTargetY() : int
      {
         return 70 / GameGloble.scaleCurrent;
      }
   }
}
