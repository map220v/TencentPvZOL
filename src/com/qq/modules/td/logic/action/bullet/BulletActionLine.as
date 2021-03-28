package com.qq.modules.td.logic.action.bullet
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class BulletActionLine extends BasicBulletActionRunning
   {
       
      
      private var _speed:int;
      
      private var _shooterRoadIndex:int;
      
      public function BulletActionLine()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._speed = _bullet.bulletData.getSpeed(TDGameObjectData.SPEED_BULLET) * _bullet.shootDir;
      }
      
      override protected function initBulletState() : void
      {
         super.initBulletState();
         if(_bullet.shooter != null && _bullet.shooter.objectModel != null)
         {
            _targetRoadIndex = _bullet.shooter.objectModel.roadIndex;
         }
      }
      
      override public function dispose() : void
      {
         _shooter = null;
         super.dispose();
      }
      
      override protected function getFireTarget() : IGameObject
      {
         var _loc1_:IGameObject = null;
         var _loc2_:IGameObject = null;
         var _loc3_:Array = null;
         var _loc4_:IGameObject = null;
         if(_bullet.objectModel.camp == TDConstant.TDCamp_Enemy)
         {
            _loc1_ = TDSearchTargetUtils.searchTargetPlant(_bullet,null,true);
            if(_loc1_ == null)
            {
               _loc2_ = TDSearchTargetUtils.searchTargetNutsShield(_bullet,true);
               if(_loc2_)
               {
                  _loc1_ = _loc2_;
               }
            }
         }
         else
         {
            _loc3_ = TDSearchTargetUtils.getZombieList(_bullet,!!_bullet.bulletData.bulletStaticInfo.isMulRow ? null : [_targetRoadIndex]);
            for each(_loc4_ in _loc3_)
            {
               if(TDCheckCollision.isCollision(_bullet,_bullet.damageArea,_loc4_,_loc4_.damageArea))
               {
                  _loc1_ = _loc4_;
                  break;
               }
            }
         }
         return _loc1_;
      }
      
      override protected function updateBulletPos() : void
      {
         var _loc1_:Number = this._speed * _pastTime;
         _bullet.setLocation(_bullet.x + _loc1_,_bullet.y);
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
