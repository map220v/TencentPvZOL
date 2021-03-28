package com.qq.modules.td.logic.action.object.seaSplashEffect
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.object.TDSeaSplashEffect;
   
   public class SeaSplashEffectActionFollow extends BasicAction
   {
       
      
      private var m_lastX:Number = 0;
      
      private var m_lastY:Number = 0;
      
      public function SeaSplashEffectActionFollow()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         var _loc2_:IGameObject = (_gameObject as TDSeaSplashEffect).followedObj;
         if(_loc2_ && _loc2_.animation && _loc2_.animation.bone && _loc2_.animation.bone.asset)
         {
            _gameObject.animation.bone.asset.width = _loc2_.animation.bone.asset.width + 10;
            _gameObject.animation.bone.asset.height = _loc2_.animation.bone.asset.height + 10;
         }
         _gameObject.animation.gotoAndPlay("idle",true);
      }
      
      override public function runningState() : void
      {
         super.runningState();
         this.followTarget();
      }
      
      private function followTarget() : void
      {
         var _loc1_:IGameObject = (_gameObject as TDSeaSplashEffect).followedObj;
         if(_loc1_)
         {
            _gameObject.setLocation(_loc1_.x + _loc1_.animation.offsetX - _gameObject.animation.offsetX,_loc1_.y + _loc1_.animation.offsetY - _gameObject.animation.offsetY);
            this.m_lastX = _loc1_.x;
            this.m_lastY = _loc1_.y;
         }
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
   }
}
