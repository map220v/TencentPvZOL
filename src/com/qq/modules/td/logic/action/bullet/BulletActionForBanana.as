package com.qq.modules.td.logic.action.bullet
{
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.effects.TDEffectPlayInfo;
   
   public class BulletActionForBanana extends BasicBulletActionRunning
   {
       
      
      private var _speed:int;
      
      private var _shooterRoadIndex:int;
      
      private var _distance:Number;
      
      private var _flyTime:int;
      
      private var _ass:Number;
      
      private var _curDirection:int = 1;
      
      private var _initX:Number;
      
      private var _hitZombieList:Array;
      
      public function BulletActionForBanana()
      {
         this._hitZombieList = [];
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         this._speed = _bullet.bulletData.getSpeed(TDGameObjectData.SPEED_BULLET);
         super.enterState(param1);
      }
      
      override protected function initBulletState() : void
      {
         var _loc3_:TDMapTileData = null;
         super.initBulletState();
         if(_bullet.shooter != null && _bullet.shooter.objectModel != null)
         {
            _targetRoadIndex = _bullet.shooter.objectModel.roadIndex;
         }
         var _loc1_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByIndex(_bullet.shooter.objectModel.tileIndex);
         var _loc2_:int = _bullet.shooter.objectModel.column;
         if(_loc2_ >= 5)
         {
            this._distance = 5 * _loc1_.rect.width;
         }
         else
         {
            _loc3_ = TDGameInfo.getInstance().getRoadTileInf(0,_targetRoadIndex);
            this._distance = _loc3_.rect.right - _loc1_.rect.right;
         }
         this._flyTime = 2 * this._distance * 320 / (3 * this._speed);
         this._ass = this._speed / this._flyTime;
         this._initX = _bullet.x;
      }
      
      override public function dispose() : void
      {
         _shooter = null;
         super.dispose();
      }
      
      override protected function getFireTarget() : IGameObject
      {
         var _loc1_:IGameObject = null;
         var _loc2_:Array = null;
         var _loc3_:IGameObject = null;
         if(_bullet.objectModel.camp == TDConstant.TDCamp_Enemy)
         {
            _loc1_ = TDSearchTargetUtils.searchTargetPlant(_bullet,null,true);
         }
         else
         {
            _loc2_ = TDSearchTargetUtils.getZombieList(_bullet,!!_bullet.bulletData.bulletStaticInfo.isMulRow ? null : [_targetRoadIndex]);
            for each(_loc3_ in _loc2_)
            {
               if(this._hitZombieList.indexOf(_loc3_.uid) < 0 && TDCheckCollision.isCollision(_bullet,_bullet.damageArea,_loc3_,_loc3_.damageArea))
               {
                  _loc1_ = _loc3_;
                  break;
               }
            }
         }
         return _loc1_;
      }
      
      override protected function updateBulletPos() : void
      {
         if(this._curDirection == 1)
         {
            _bullet.setLocation(_bullet.x + this._speed * 0.03,_bullet.y);
            this.updateSplashEffectDir();
            if(_bullet.x - this._initX >= this._distance)
            {
               this._curDirection = -1;
               this._speed = 0 - this._speed;
            }
         }
         else
         {
            _bullet.setLocation(_bullet.x + this._speed * 0.03,_bullet.y);
            this.updateSplashEffectDir();
            if(_bullet.x < this._initX)
            {
               _bullet.Dispose();
            }
         }
         super.updateBulletPos();
      }
      
      private function updateSplashEffectDir() : void
      {
         if(this._curDirection == 1)
         {
            _bullet.rotation = 0;
         }
         else
         {
            _bullet.rotation = 180;
         }
      }
      
      override protected function updateBulletState() : void
      {
         var _loc1_:IGameObject = null;
         var _loc2_:Boolean = false;
         if(_bullet)
         {
            _loc1_ = this.getFireTarget();
            if(_loc1_ != null)
            {
               _loc2_ = TDSearchTargetUtils.bulletBounce(_bullet,_loc1_);
               if(_loc2_)
               {
                  return;
               }
               this._hitZombieList.push(_loc1_.uid);
               TDEffectCmd.playBlitAnimation(TDObjTypeID.Obj_Banana_Hit,_bullet.x + 30,_bullet.y,new TDEffectPlayInfo("animation"));
               TDDamageCaculete.caculateBulletDamage(_bullet,_loc1_);
            }
         }
      }
   }
}
