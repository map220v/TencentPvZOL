package com.qq.modules.td.logic.action.bullet
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class BulletActionForMelonpult extends BasicBulletActionRunning
   {
       
      
      public var intX:Number;
      
      public var intY:Number;
      
      public var gravity:Number;
      
      private var totalTime:Number;
      
      private var frameIndex:int = 0;
      
      private var _isDrop:Boolean = false;
      
      private var cacheY:Number = 0;
      
      private var frameRate:Number = 25.0;
      
      private var totalFrame:Number;
      
      private var cacheTime:Number = 0;
      
      public function BulletActionForMelonpult()
      {
         super();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override protected function initBulletState() : void
      {
         super.initBulletState();
         this.totalTime = 1.1;
         this.totalFrame = 40 * this.totalTime;
         this.intX = _gameObject.x;
         this.intY = _gameObject.y + 20;
         this.gravity = 0.45;
         this.frameIndex = 0;
         this.cacheY = _bullet.y;
         this.cacheTime = TDGameInfo.getInstance().getCurGameTime();
         this._isDrop = false;
      }
      
      protected function updateDirection() : void
      {
         _bullet.rotation -= 30;
      }
      
      override protected function updateBulletPos() : void
      {
         super.updateBulletPos();
         var _loc1_:int = Math.floor((TDGameInfo.getInstance().getCurGameTime() - this.cacheTime) / this.frameRate);
         if(_loc1_ > 0)
         {
            this.cacheTime = TDGameInfo.getInstance().getCurGameTime();
            this.frameIndex += _loc1_;
            var _loc2_:Number = (_bullet.target.x + 40 - this.intX) / this.totalFrame * this.frameIndex + this.intX;
            var _loc3_:Number = ((_bullet.target.y - this.intY) / this.totalFrame - this.totalFrame * this.gravity + this.frameIndex * this.gravity) * this.frameIndex + this.intY;
            _bullet.setLocation(_loc2_,_loc3_);
            if(this.cacheY < _loc3_)
            {
               this._isDrop = true;
            }
            this.cacheY = _loc3_;
            this.updateDirection();
            return;
         }
      }
      
      override protected function updateBulletState() : void
      {
         if(!this._isDrop)
         {
            return;
         }
         var _loc1_:IGameObject = this.getFireTarget();
         if(_loc1_ != null)
         {
            doBulletBoom(_loc1_);
         }
         else if(_bullet.y > _targetY + 50)
         {
            _bullet.setAction(TDConstant.BAction_Disappear);
         }
      }
      
      override protected function getFireTarget() : IGameObject
      {
         var _loc1_:IGameObject = null;
         if(_bullet.target && _bullet.target.isVaild)
         {
            if(TDCheckCollision.isCollision(_gameObject,_gameObject.damageArea,_bullet.target,_bullet.target.damageArea))
            {
               _loc1_ = _bullet.target;
            }
         }
         return _loc1_;
      }
   }
}
