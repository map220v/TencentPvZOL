package com.qq.modules.td.logic.action.bullet
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.DMath;
   
   public class BulletActionParabola extends BasicBulletActionRunning
   {
       
      
      protected var _speedX:Number;
      
      protected var _speedY:Number;
      
      protected var _assY:Number;
      
      protected var _lastTime:Number;
      
      protected var _groundY:Number;
      
      protected var _totalTime:Number;
      
      protected var _isDrop:Boolean;
      
      protected var _maxY:Number;
      
      protected var _roadIndex:int;
      
      private var cacheY:Number = 0;
      
      public function BulletActionParabola()
      {
         super();
      }
      
      override protected function updateBulletPos() : void
      {
         this._speedY += this._assY * _pastTime;
         var _loc1_:Number = _gameObject.y - this._speedY * _pastTime;
         _gameObject.setLocation(_gameObject.x + this._speedX * _pastTime,_loc1_);
         this.updateDirection();
         if(this.cacheY < _gameObject.y && this._isDrop == false)
         {
            this.cacheY = _gameObject.y;
         }
         else
         {
            this._isDrop = true;
         }
      }
      
      protected function updateDirection() : void
      {
      }
      
      override protected function initBulletState() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         super.initBulletState();
         this._maxY = 227;
         this._totalTime = 1.2;
         var _loc1_:Number = 0;
         if(_bullet.target != null)
         {
            _loc2_ = _bullet.target.x;
            _loc3_ = _bullet.target.y;
         }
         else
         {
            _loc2_ = _bullet.shooter.x;
            _loc3_ = _bullet.shooter.y;
         }
         _loc1_ = DMath.getDistance(_gameObject.x,_gameObject.y,_loc2_,_gameObject.y) - _targetCurSpeed * this._totalTime;
         if(_loc1_ < 20)
         {
            this._totalTime = 0.2;
            _loc1_ = 20;
            this._maxY = 100;
         }
         this._assY = -2 * this._maxY / (this._totalTime * 0.5 * (this._totalTime * 0.5));
         this._speedX = _loc1_ / this._totalTime;
         this._speedY = -this._assY * this._totalTime * 0.5;
         this._groundY = _loc3_;
         this._isDrop = false;
         this._roadIndex = _targetRoadIndex;
      }
      
      override protected function updateBulletState() : void
      {
         var _loc1_:IGameObject = this.getFireTarget();
         if(_loc1_ != null)
         {
            doBulletBoom(_loc1_);
         }
         else if(_gameObject.y > this._groundY)
         {
            _bullet.setAction(TDConstant.BAction_Disappear);
         }
      }
      
      override protected function getFireTarget() : IGameObject
      {
         var _loc1_:IGameObject = null;
         var _loc2_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:IGameObject = null;
         var _loc3_:IGameObject = _bullet.shooter;
         if(_loc3_.objectModel.camp == TDConstant.TDCamp_Self)
         {
            _loc4_ = TDSearchTargetUtils.getZombieList(_bullet,[_targetRoadIndex]);
         }
         else
         {
            _loc4_ = TDGameInfo.getInstance().getPlantListByRoadIndex([_loc3_.objectModel.roadIndex]);
         }
         if(_loc4_.length > 0)
         {
            _loc4_.sortOn("x",Array.NUMERIC);
            for each(_loc5_ in _loc4_)
            {
               if(TDCheckCollision.isCollision(_gameObject,_gameObject.damageArea,_loc5_,_loc5_.damageArea))
               {
                  _loc1_ = _loc5_;
                  break;
               }
            }
         }
         return _loc1_;
      }
   }
}
