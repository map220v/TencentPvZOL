package com.qq.modules.td.logic.action.zombie.wolfKnight
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import flash.events.Event;
   
   public class ZActionWolfKnightSwoop extends BasicZombieAction
   {
       
      
      private const SWOOP_HEIGHT:uint = 70;
      
      private var m_totalFrames:uint;
      
      private var m_curFrame:uint;
      
      private var m_isEnd:Boolean;
      
      private var speedX:Number;
      
      private var speedY:Number;
      
      public function ZActionWolfKnightSwoop()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         var _loc2_:Boolean = param1[0];
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishJump);
         _gameObject.animation.gotoAndPlay("Swoop");
         this.m_totalFrames = 37;
         if(_loc2_)
         {
            this.speedX = 140 / this.m_totalFrames;
         }
         else
         {
            this.speedX = 0;
         }
         this.speedY = this.SWOOP_HEIGHT * 2 / this.m_totalFrames;
         _zombie.setShadeVisible(false);
         _zombie.setFrozenAI(true);
      }
      
      private function onFinishJump(param1:Event) : void
      {
      }
      
      override public function runningState() : void
      {
         var _loc2_:Number = NaN;
         if(this.m_curFrame >= this.m_totalFrames)
         {
            if(!this.m_isEnd)
            {
               this.m_isEnd = true;
               _zombie.animation.advanceTime(1);
               _zombie.setFrozenAI(false);
               _gameObject.setAction(TDConstant.ZAction_Run);
            }
            return;
         }
         ++this.m_curFrame;
         var _loc1_:Number = _zombie.x - this.speedX;
         if(this.m_curFrame < int(this.m_totalFrames * 0.5) + 1)
         {
            _loc2_ = _zombie.y - this.speedY;
         }
         else if(this.m_curFrame > int(this.m_totalFrames * 0.5) + 1)
         {
            _loc2_ = _zombie.y + this.speedY;
         }
         else
         {
            _loc2_ = _zombie.y;
         }
         _zombie.setLocation(_loc1_,_loc2_);
      }
      
      override public function leaveState() : void
      {
         _zombie.setShadeVisible(true);
         super.leaveState();
      }
   }
}
