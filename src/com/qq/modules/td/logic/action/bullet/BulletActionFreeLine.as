package com.qq.modules.td.logic.action.bullet
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class BulletActionFreeLine extends BasicBulletActionRunning
   {
       
      
      private var _xSpeed:int;
      
      private var _ySpeed:int;
      
      public function BulletActionFreeLine()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
      }
      
      override protected function initBulletState() : void
      {
         super.initBulletState();
         var _loc1_:Number = _bullet.params[0];
         this._xSpeed = _bullet.bulletData.getSpeed(TDGameObjectData.SPEED_BULLET) * Math.cos(_loc1_);
         this._ySpeed = _bullet.bulletData.getSpeed(TDGameObjectData.SPEED_BULLET) * Math.sin(_loc1_);
      }
      
      override protected function getFireTarget() : IGameObject
      {
         var _loc1_:Vector.<IGameObject> = TDSearchTargetUtils.searchTargetForBullet(_bullet,[TDCheckCollision.getNewObjRect(_bullet,_bullet.damageArea)]);
         if(_loc1_.length > 0)
         {
            return _loc1_[0];
         }
         return null;
      }
      
      override protected function updateBulletPos() : void
      {
         _bullet.setLocation(_bullet.x + this._xSpeed * _pastTime,_bullet.y + this._ySpeed * _pastTime);
         super.updateBulletPos();
      }
      
      override protected function updateBulletState() : void
      {
         var _loc1_:IGameObject = this.getFireTarget();
         if(_loc1_ != null)
         {
            doBulletBoom(_loc1_);
         }
         else if(!TDGameInfo.getInstance().isInScreen(_bullet.x,_bullet.y))
         {
            _bullet.setAction(TDConstant.BAction_Disappear);
         }
      }
   }
}
