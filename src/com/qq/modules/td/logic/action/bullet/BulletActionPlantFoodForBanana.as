package com.qq.modules.td.logic.action.bullet
{
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.effects.TDEffectPlayInfo;
   
   public class BulletActionPlantFoodForBanana extends BasicBulletActionRunning
   {
       
      
      public var bulletPos:String;
      
      private var m_selfTile:TDMapTileData;
      
      private var m_hitList:Array;
      
      private var initY:Number;
      
      private var _speed:int;
      
      private var _moveStage:int = 1;
      
      private var m_forwardY:Number;
      
      private var m_reverseY:Number;
      
      private var m_forwardX:Number;
      
      private var m_reverseX:Number;
      
      public function BulletActionPlantFoodForBanana()
      {
         this.m_hitList = [];
         super();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         this.bulletPos = _bullet.params[0];
         this._speed = _bullet.bulletData.getSpeed(TDGameObjectData.SPEED_BULLET);
         super.enterState(param1);
      }
      
      override protected function initBulletState() : void
      {
         var _loc2_:TDMapTileData = null;
         super.initBulletState();
         this.m_selfTile = TDGameInfo.getInstance().getRoadTileByIndex(_bullet.shooter.objectModel.tileIndex);
         this.m_reverseX = this.m_selfTile.rect.right;
         this.initY = this.m_selfTile.rect.y + this.m_selfTile.rect.height * 0.5;
         var _loc1_:int = _bullet.shooter.objectModel.column;
         if(_loc1_ >= 5)
         {
            this.m_forwardX = 4.5 * this.m_selfTile.rect.width + this.m_selfTile.rect.right;
         }
         else
         {
            _loc2_ = TDGameInfo.getInstance().getRoadTileInf(0,this.m_selfTile.roadIndex);
            this.m_forwardX = _loc2_.rect.x + _loc2_.rect.width * 0.5;
         }
         if(this.bulletPos == "middle")
         {
            this.m_forwardY = this.m_selfTile.rect.y;
            this.m_reverseY = this.m_selfTile.rect.bottom;
         }
         else if(this.bulletPos == "top")
         {
            this.m_forwardY = this.m_selfTile.rect.y - this.m_selfTile.rect.height * 0.5;
            this.m_reverseY = this.m_selfTile.rect.y + this.m_selfTile.rect.height * 0.5;
         }
         else
         {
            this.m_forwardY = this.m_selfTile.rect.bottom + this.m_selfTile.rect.height * 0.5;
            this.m_reverseY = this.m_selfTile.rect.y + this.m_selfTile.rect.height * 0.5;
         }
      }
      
      override protected function updateBulletPos() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         super.updateBulletPos();
         var _loc3_:Number = Math.sqrt(this.m_selfTile.rect.width * this.m_selfTile.rect.width + this.m_selfTile.rect.height * this.m_selfTile.rect.height);
         var _loc4_:Number = this.m_selfTile.rect.width / _loc3_;
         var _loc5_:Number = this.m_selfTile.rect.height / _loc3_;
         if(this._moveStage == 7)
         {
            if(_bullet.shooter.getRunningProp(TDConstant.Gameobject_Prop_Banana_Weak) == true)
            {
               _bullet.shooter.setAction(TDConstant.PlantAction_Idle,[[TDConstant.PlantAnmi_Idle2]]);
            }
            else
            {
               _bullet.shooter.setAction(TDConstant.PlantAction_Idle,[[TDConstant.PlantAnmi_Idle]]);
            }
            _bullet.Dispose();
         }
         else
         {
            if(this.bulletPos == "middle" || this.bulletPos == "top")
            {
               switch(this._moveStage)
               {
                  case 1:
                     _loc1_ = _bullet.x + this._speed * _loc4_ * 0.03;
                     _loc2_ = _bullet.y - this._speed * _loc5_ * 0.03;
                     if(_bullet.y <= this.m_forwardY)
                     {
                        this._moveStage = 2;
                     }
                     break;
                  case 2:
                     _loc1_ = _bullet.x + this._speed * 0.03;
                     _loc2_ = _bullet.y;
                     if(_bullet.x >= this.m_forwardX - this.m_selfTile.rect.width * 0.5)
                     {
                        this._moveStage = 3;
                     }
                     break;
                  case 3:
                     _loc1_ = _bullet.x + this._speed * _loc4_ * 0.03;
                     _loc2_ = _bullet.y + this._speed * _loc5_ * 0.03;
                     if(_bullet.x >= this.m_forwardX)
                     {
                        this._moveStage = 4;
                     }
                     break;
                  case 4:
                     _loc1_ = _bullet.x - this._speed * _loc4_ * 0.03;
                     _loc2_ = _bullet.y + this._speed * _loc5_ * 0.03;
                     if(_bullet.y >= this.m_reverseY)
                     {
                        this._moveStage = 5;
                     }
                     break;
                  case 5:
                     _loc1_ = _bullet.x - this._speed * 0.03;
                     _loc2_ = _bullet.y;
                     if(_bullet.x <= this.m_reverseX + this.m_selfTile.rect.width * 0.5)
                     {
                        this._moveStage = 6;
                     }
                     break;
                  case 6:
                     _loc1_ = _bullet.x - this._speed * _loc4_ * 0.03;
                     _loc2_ = _bullet.y - this._speed * _loc5_ * 0.03;
                     if(_bullet.x <= this.m_reverseX)
                     {
                        this._moveStage = 7;
                     }
               }
            }
            else
            {
               switch(this._moveStage)
               {
                  case 1:
                     _loc1_ = _bullet.x + this._speed * _loc4_ * 0.03;
                     _loc2_ = _bullet.y + this._speed * _loc5_ * 0.03;
                     if(_bullet.y >= this.m_forwardY)
                     {
                        this._moveStage = 2;
                     }
                     break;
                  case 2:
                     _loc1_ = _bullet.x + this._speed * 0.03;
                     _loc2_ = _bullet.y;
                     if(_bullet.x >= this.m_forwardX - this.m_selfTile.rect.width * 0.5)
                     {
                        this._moveStage = 3;
                     }
                     break;
                  case 3:
                     _loc1_ = _bullet.x + this._speed * _loc4_ * 0.03;
                     _loc2_ = _bullet.y - this._speed * _loc5_ * 0.03;
                     if(_bullet.x >= this.m_forwardX)
                     {
                        this._moveStage = 4;
                     }
                     break;
                  case 4:
                     _loc1_ = _bullet.x - this._speed * _loc4_ * 0.03;
                     _loc2_ = _bullet.y - this._speed * _loc5_ * 0.03;
                     if(_bullet.y <= this.m_reverseY)
                     {
                        this._moveStage = 5;
                     }
                     break;
                  case 5:
                     _loc1_ = _bullet.x - this._speed * 0.03;
                     _loc2_ = _bullet.y;
                     if(_bullet.x <= this.m_reverseX + this.m_selfTile.rect.width * 0.5)
                     {
                        this._moveStage = 6;
                     }
                     break;
                  case 6:
                     _loc1_ = _bullet.x - this._speed * _loc4_ * 0.03;
                     _loc2_ = _bullet.y + this._speed * _loc5_ * 0.03;
                     if(_bullet.x <= this.m_reverseX)
                     {
                        this._moveStage = 7;
                     }
               }
            }
            _bullet.setLocation(_loc1_,_loc2_);
            this.updateBulletRotation();
         }
      }
      
      private function updateBulletRotation() : void
      {
         if(this._moveStage >= 4)
         {
            _bullet.rotation = 180;
         }
         else
         {
            _bullet.rotation = 0;
         }
      }
      
      override protected function updateBulletState() : void
      {
         if(_bullet == null || this.bulletPos == "bottom" && this._moveStage >= 4)
         {
            return;
         }
         var _loc1_:IGameObject = this.getFireTarget();
         if(_loc1_ != null)
         {
            this.m_hitList.push(_loc1_.uid);
            TDEffectCmd.playBlitAnimation(TDObjTypeID.Obj_Banana_Hit,_bullet.x + 30,_bullet.y,new TDEffectPlayInfo("animation"));
            TDDamageCaculete.caculateBulletDamage(_bullet,_loc1_);
         }
      }
      
      override protected function getFireTarget() : IGameObject
      {
         var _loc1_:IGameObject = null;
         var _loc3_:int = 0;
         var _loc4_:TDMapTileData = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:BasicZombie = null;
         var _loc8_:TDMapTileData = null;
         var _loc9_:Array = null;
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(_bullet.x,_bullet.y);
         if(_loc2_)
         {
            _loc3_ = _loc2_.roadCol;
            _loc4_ = TDGameInfo.getInstance().getRoadTileInf(_loc3_,this.m_selfTile.roadRow);
            _loc5_ = [];
            if(this.bulletPos == "top")
            {
               if(this._moveStage <= 3)
               {
                  if(_loc4_.roadRow > TDGameInfo.getInstance().minRow)
                  {
                     _loc5_ = [_loc4_.roadRow,_loc4_.roadRow - 1];
                  }
                  else
                  {
                     _loc5_ = [_loc4_.roadRow];
                  }
               }
               else
               {
                  _loc5_ = [_loc4_.roadRow];
               }
            }
            else if(this.bulletPos == "middle")
            {
               if(this._moveStage <= 3)
               {
                  if(_loc4_.roadRow > TDGameInfo.getInstance().minRow)
                  {
                     _loc5_ = [_loc4_.roadRow,_loc4_.roadRow - 1];
                  }
                  else
                  {
                     _loc5_ = [_loc4_.roadRow];
                  }
               }
               else if(_loc4_.roadRow < TDGameInfo.getInstance().maxRow)
               {
                  _loc5_ = [_loc4_.roadRow,_loc4_.roadRow + 1];
               }
               else
               {
                  _loc5_ = [_loc4_.roadRow];
               }
            }
            else if(this._moveStage <= 3)
            {
               if(_loc4_.roadRow < TDGameInfo.getInstance().maxRow)
               {
                  _loc5_ = [_loc4_.roadRow + 1];
               }
            }
            _loc6_ = TDGameInfo.getInstance().getZombieList(_loc5_,0,true);
            for each(_loc7_ in _loc6_)
            {
               if((_loc8_ = TDGameInfo.getInstance().getRoadTileByGamePos(_loc7_.x,_loc7_.y)) && _loc8_.roadCol == _loc3_ && this.m_hitList.indexOf(_loc7_.objectModel.uid) < 0)
               {
                  _loc1_ = _loc7_;
                  break;
               }
            }
         }
         else
         {
            _loc9_ = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Object);
            for each(_loc7_ in _loc9_.length)
            {
               if(this.m_hitList.indexOf(_loc7_.objectModel.uid) < 0 && TDCheckCollision.isCollision(_bullet,_bullet.damageArea,_loc7_,_loc7_.damageArea))
               {
                  _loc1_ = _loc7_;
                  break;
               }
            }
         }
         return _loc1_;
      }
   }
}
