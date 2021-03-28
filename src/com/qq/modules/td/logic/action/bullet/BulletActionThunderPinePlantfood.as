package com.qq.modules.td.logic.action.bullet
{
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.sound.command.SoundCmd;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.effects.TDEffectPlayInfo;
   import flash.geom.Point;
   
   public class BulletActionThunderPinePlantfood extends BasicBulletActionRunning
   {
       
      
      private const MAX_EJECT_TIMES:int = 6;
      
      private var _firstEject:Boolean;
      
      private var _speed:Number;
      
      private var _curTargetZombie:BasicZombie;
      
      private var _lastTargetZombie:BasicZombie;
      
      private var _ejectTimes:int;
      
      public function BulletActionThunderPinePlantfood()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _bullet.isSpecialSkill = true;
         this._speed = _bullet.bulletData.bulletStaticInfo.moveSpeed;
         this._ejectTimes = 0;
         this._firstEject = true;
      }
      
      override public function runningState() : void
      {
         super.runningState();
         if(this._ejectTimes >= this.MAX_EJECT_TIMES)
         {
            TDEffectCmd.playBlitAnimation(TDObjTypeID.Obj_ThunderPine_Plantfood_Hit,_bullet.x,_bullet.y,new TDEffectPlayInfo("animation"));
            _bullet.Dispose();
            return;
         }
         if(this._curTargetZombie == null || this._curTargetZombie.objectModel.curHp.get() <= 0)
         {
            this._curTargetZombie = this.findNextZombie();
            if(this._curTargetZombie == null)
            {
               TDEffectCmd.playBlitAnimation(TDObjTypeID.Obj_ThunderPine_Plantfood_Hit,_bullet.x,_bullet.y,new TDEffectPlayInfo("animation"));
               _bullet.Dispose();
               return;
            }
         }
         if(TDCheckCollision.isCollision(_bullet,_bullet.damageArea,this._curTargetZombie,this._curTargetZombie.damageArea))
         {
            this.damageZombie();
         }
         else
         {
            this.flyToTarget();
         }
      }
      
      private function damageZombie() : void
      {
         if(this._curTargetZombie)
         {
            ++this._ejectTimes;
            TDDamageCaculete.caculateBulletDamage(_bullet,this._curTargetZombie);
            this._lastTargetZombie = this._curTargetZombie;
            this._curTargetZombie = this.findNextZombie();
            SoundCmd.playSound(TDSoundID.Plant_Seapine);
         }
      }
      
      private function flyToTarget() : void
      {
         var _loc1_:Number = this._curTargetZombie.x;
         var _loc2_:Number = this._curTargetZombie.y - this._curTargetZombie.damageArea.height * 0.5;
         var _loc3_:Number = this._speed * _pastTime;
         var _loc4_:Number = Math.sqrt(Math.pow(_loc2_ - _bullet.y,2) + Math.pow(_loc1_ - _bullet.x,2));
         _bullet.x += (_loc1_ - _bullet.x) * _loc3_ / _loc4_;
         _bullet.y += (_loc2_ - _bullet.y) * _loc3_ / _loc4_;
      }
      
      private function findNextZombie() : BasicZombie
      {
         var _loc3_:Number = NaN;
         var _loc4_:BasicZombie = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc1_:BasicZombie = null;
         var _loc2_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Zombie);
         if(this._firstEject)
         {
            this._firstEject = false;
            _loc3_ = int.MAX_VALUE;
            for each(_loc4_ in _loc2_)
            {
               if(_loc4_ && _loc4_ != this._lastTargetZombie && _loc4_.objectModel.curHp.get() > 0 && _loc4_.x < _loc3_)
               {
                  _loc3_ = _loc4_.x;
                  _loc1_ = _loc4_;
               }
            }
         }
         else
         {
            _loc5_ = int.MAX_VALUE;
            for each(_loc4_ in _loc2_)
            {
               if(_loc4_ && _loc4_ != this._lastTargetZombie && _loc4_.objectModel.curHp.get() > 0)
               {
                  if((_loc6_ = Point.distance(new Point(_bullet.x,_bullet.y),new Point(_loc4_.x,_loc4_.y))) < _loc5_)
                  {
                     _loc5_ = _loc6_;
                     _loc1_ = _loc4_;
                  }
               }
            }
         }
         return _loc1_;
      }
      
      override public function leaveState() : void
      {
         this._curTargetZombie = null;
         super.leaveState();
      }
   }
}
