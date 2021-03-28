package com.qq.modules.td.logic.action.bullet
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class BulletActionForThreepeater extends BasicBulletActionRunning
   {
       
      
      private var _xSpeed:int;
      
      private var _ySpeed:int;
      
      public function BulletActionForThreepeater()
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
         _targetRoadIndex = _bullet.params[0];
         _bullet.objectModel.roadIndex = _targetRoadIndex;
         this._xSpeed = _bullet.bulletData.getSpeed(TDGameObjectData.SPEED_BULLET);
         _targetY = TDGameInfo.getInstance().getRoadInfo(_targetRoadIndex).endY - 60;
         this._ySpeed = (_targetY > _bullet.y ? this._xSpeed : -this._xSpeed) * 1;
      }
      
      override public function dispose() : void
      {
         _shooter = null;
         super.dispose();
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
         if(Math.abs(this._ySpeed) > this._xSpeed * 0.1)
         {
            this._ySpeed *= 0.97;
         }
         var _loc1_:int = this._ySpeed * _pastTime;
         _bullet.setLocation(_bullet.x + this._xSpeed * _pastTime,Math.abs(_targetY - _bullet.y) < Math.abs(_loc1_) ? Number(_targetY) : Number(_bullet.y + _loc1_));
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
