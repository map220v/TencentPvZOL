package com.qq.modules.td.logic.action.bullet
{
   import com.qq.modules.td.command.effects.TDEffectCmd;
   
   public class BulletActionForBambooGun extends BulletActionParabola
   {
       
      
      public function BulletActionForBambooGun()
      {
         super();
      }
      
      override protected function initBulletState() : void
      {
         super.initBulletState();
         TDEffectCmd.playTraceAtGameObject("",this._gameObject);
      }
      
      override protected function updateDirection() : void
      {
         var _loc1_:Number = Math.atan2(-_speedY,_speedX);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
