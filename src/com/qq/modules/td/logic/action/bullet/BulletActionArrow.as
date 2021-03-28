package com.qq.modules.td.logic.action.bullet
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.Bezier;
   import flash.geom.Point;
   
   public class BulletActionArrow extends BasicBulletActionRunning
   {
       
      
      private var _bezier:Bezier;
      
      private var _crtStep:int;
      
      private var _step:int;
      
      private var _count:int;
      
      protected var _isFinish:Boolean;
      
      public function BulletActionArrow()
      {
         super();
      }
      
      override protected function initBulletState() : void
      {
         super.initBulletState();
         this.initBezier();
      }
      
      private function initBezier() : void
      {
         var _loc1_:IGameObject = _bullet.shooter;
         var _loc2_:IGameObject = _bullet.target;
         var _loc3_:Point = new Point(_bullet.x,_bullet.y);
         var _loc4_:int = _loc1_.x + (_loc2_.x - _loc1_.x) * 0.7;
         var _loc5_:TDMapTileData = TDGameInfo.getInstance().getRoadTileInf(0,1);
         var _loc6_:int = _loc1_.y - Math.max(150,300 * Math.abs(_loc3_.x - _loc2_.x) / (_loc5_.rect.width * 10));
         var _loc7_:Point = new Point(_loc4_,_loc6_);
         var _loc8_:Point = new Point(_loc2_.x,_loc2_.y - 20);
         var _loc9_:int = Math.max(6,15 * Math.abs(_loc3_.x - _loc2_.x) / (_loc5_.rect.width * 10));
         this._bezier = new Bezier();
         this._bezier.init(_loc3_,_loc7_,_loc8_,_loc9_);
         this._crtStep = 0;
         this._step = 1;
         this._count = 0;
         this._isFinish = false;
         if(TDCheckCollision.isCollision(_gameObject,_gameObject.damageArea,_bullet.target,_bullet.target.damageArea))
         {
            this._isFinish = true;
         }
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      override protected function updateBulletPos() : void
      {
         super.updateBulletPos();
         var _loc1_:Array = this._bezier.getAnchorPoint(this._crtStep);
         if(_loc1_.length > 0)
         {
            _bullet.x = _loc1_[0];
            _bullet.y = _loc1_[1];
            _bullet.rotation = _loc1_[2];
            if(_bullet.rotation > 0 && _bullet.rotation <= 180)
            {
               ++this._count;
               if(this._count > 15)
               {
                  this._count = 0;
                  ++this._step;
               }
            }
            this._crtStep += this._step;
         }
         else
         {
            this._isFinish = true;
            TDSoundCmd.plantBeAttacked();
         }
      }
      
      override protected function updateBulletState() : void
      {
         var _loc1_:BasicPlant = null;
         var _loc2_:TDPlantStaticInfo = null;
         var _loc3_:TDMapTileData = null;
         var _loc4_:BasicPlant = null;
         super.updateBulletState();
         if(this._isFinish)
         {
            if(_bullet.target is BasicPlant)
            {
               _loc1_ = _bullet.target as BasicPlant;
               _loc2_ = _loc1_.plantData.plantStaticInfo;
               if(_loc2_.baseInfo.usefulness == TDConstant.PlantUsefulness_Container)
               {
                  _loc3_ = TDGameInfo.getInstance().getRoadTileByIndex(_loc1_.plantData.tileIndex);
                  if(_loc4_ = this.getNomalPlantInRoadTile(_loc3_))
                  {
                     _bullet.target = _loc4_;
                  }
               }
            }
            if(TDCheckCollision.isCollision(_gameObject,_gameObject.damageArea,_bullet.target,_bullet.target.damageArea))
            {
               TDDamageCaculete.caculateBulletDamage(_bullet,_bullet.target);
            }
            _gameObject.dispose();
         }
      }
      
      public function getNomalPlantInRoadTile(param1:TDMapTileData) : BasicPlant
      {
         var _loc3_:BasicPlant = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Array = TDGameInfo.getInstance().getPlantByTileIndex(param1.index);
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.plantData.isAlive())
            {
               if(_loc3_.plantData.tileIndex == param1.index)
               {
                  if(_loc3_.plantData.plantStaticInfo.baseInfo.usefulness == TDConstant.PlantUsefulness_Plant)
                  {
                     return _loc3_;
                  }
               }
            }
         }
         return null;
      }
   }
}
