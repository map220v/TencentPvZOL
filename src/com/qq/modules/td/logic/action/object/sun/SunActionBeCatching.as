package com.qq.modules.td.logic.action.object.sun
{
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   
   public class SunActionBeCatching extends BasicSunAction
   {
       
      
      private var targetPt:Point;
      
      private var target:BasicZombie;
      
      public function SunActionBeCatching()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc2_:Point = null;
         super.enterState(param1);
         if(_sun.beCatchingStep == 1)
         {
            if(_sun.animation.currentLabel == "transition_red")
            {
               _sun.animation.gotoAndPlay("red",true);
            }
            else
            {
               _sun.animation.addEventListener(Event.COMPLETE,this.onTransitionRedComplete);
               _sun.animation.gotoAndPlay("transition_red",false);
            }
         }
         else
         {
            this.target = param1[0];
            _sun.zombieCatcher = this.target;
            _loc2_ = new Point(this.target.x - 40,this.target.y - 120);
            if(_sun.beCatchingStep == 2)
            {
               _loc2_ = Point.interpolate(new Point(_sun.x,_sun.y),_loc2_,0.5);
            }
            this.targetPt = _loc2_;
         }
      }
      
      protected function onTransitionRedComplete(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.onTransitionRedComplete);
         _sun.animation.gotoAndPlay("red",true);
      }
      
      override public function runningState() : void
      {
         var _loc2_:Point = null;
         if(this.targetPt == null || _sun == null)
         {
            return;
         }
         if(_sun.zombieCatcher == null || _sun.zombieCatcher.objectModel.curHp.get() <= 0)
         {
            return;
         }
         var _loc1_:Point = new Point(_sun.x,_sun.y);
         if(Point.distance(_loc1_,this.targetPt) < 30)
         {
            if(_sun.beCatchingStep >= 3)
            {
               this.target.zombieData.storeSun += 100;
               _sun.dispose();
            }
         }
         else
         {
            _loc2_ = Point.interpolate(_loc1_,this.targetPt,0.95);
            _sun.x = _loc2_.x;
            _sun.y = _loc2_.y;
         }
      }
   }
}
