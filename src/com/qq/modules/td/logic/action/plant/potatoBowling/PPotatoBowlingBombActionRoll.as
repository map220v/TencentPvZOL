package com.qq.modules.td.logic.action.plant.potatoBowling
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.command.game.TDExplodeCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import flash.geom.Rectangle;
   
   public class PPotatoBowlingBombActionRoll extends BasicPlantAction
   {
      
      private static const _damageArea:Rectangle = new Rectangle(-10,-30,20,40);
       
      
      private var _hitRow:int;
      
      private var _lastTime:Number;
      
      private var _speed:Number;
      
      private var _xSpeed:Number;
      
      private var _ySpeed:Number;
      
      private var _isAttacking:Boolean;
      
      private var _minY:Number;
      
      private var _maxY:Number;
      
      public function PPotatoBowlingBombActionRoll()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay("walk",true);
         this._speed = _plant.plantData.plantStaticInfo.baseInfo.getParam(21);
         this._xSpeed = this._speed;
         this._ySpeed = 0;
         this._isAttacking = true;
         TDSoundCmd.bowlingimpact();
         this._lastTime = TDGameInfo.getInstance().getCurGameTime();
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileInf(0,1);
         var _loc3_:TDMapTileData = TDGameInfo.getInstance().getRoadTileInf(0,TDGameInfo.getInstance().maxRow);
         var _loc4_:TDPlantStaticInfo = TDDataFactory.instance.getPlantInfoByID(_plant.plantData.plantStaticInfo.type);
         this._minY = TDGameInfo.getInstance().getPlantPosByTileData(_loc2_,_loc4_).y;
         this._maxY = TDGameInfo.getInstance().getPlantPosByTileData(_loc3_,_loc4_).y;
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
      
      override public function runningState() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:IGameObject = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Rectangle = null;
         if(this._isAttacking)
         {
            _loc1_ = TDGameInfo.getInstance().getCurGameTime();
            _gameObject.setLocation(_gameObject.x + this._xSpeed * (_loc1_ - this._lastTime) * 0.001,_gameObject.y + this._ySpeed * (_loc1_ - this._lastTime) * 0.001);
            this._lastTime = _loc1_;
            if(_gameObject.x > TDGameInfo.getInstance().gameArea.x + TDGameInfo.getInstance().gameArea.width)
            {
               TDGameInfo.getInstance().removeGameoObjectFromGame(_gameObject);
               return;
            }
            _loc2_ = this.getHitTarget();
            if(_loc2_)
            {
               this._hitRow = TDGameInfo.getInstance().getRoadIndex(_loc2_.y);
               this.changeSpeed();
               TDSoundCmd.potatoMineExplode();
               CommandDispatcher.send(CommandName.TD_PlayShakeEffect);
               TDEffectCmd.playBombEffect(1000,_gameObject.x,_gameObject.y);
               _loc3_ = _plant.objectModel.staticInfo.getParam(TDConstant.Plant_Param_DamageRangeW);
               _loc4_ = _plant.objectModel.staticInfo.getParam(TDConstant.Plant_Param_DamageRangeH);
               _loc5_ = new Rectangle(_plant.x - _loc3_ * 0.5,_plant.y - _loc4_ * 0.5,_loc3_,_loc4_);
               TDExplodeCmd.plantExplodeDamage(_plant,_loc5_);
               TDGameInfo.getInstance().removeGameoObjectFromGame(_gameObject);
            }
            else if(_gameObject.y <= this._minY && this._ySpeed < 0 || _gameObject.y >= this._maxY && this._ySpeed > 0)
            {
               this._ySpeed = -this._ySpeed;
               this._hitRow = -1;
            }
         }
      }
      
      private function getHitTarget() : IGameObject
      {
         var _loc2_:IGameObject = null;
         var _loc1_:Array = TDSearchTargetUtils.getZombieList(_plant);
         for each(_loc2_ in _loc1_)
         {
            if(this._hitRow != TDGameInfo.getInstance().getRoadIndex(_loc2_.y) && TDCheckCollision.isCollision(_gameObject,_gameObject.attackArea,_loc2_,_damageArea))
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function changeSpeed() : void
      {
         this._xSpeed = this._speed * Math.SQRT1_2;
         if(this._hitRow <= 1)
         {
            this._ySpeed = this._speed * Math.SQRT1_2;
         }
         else if(this._hitRow >= 5)
         {
            this._ySpeed = this._speed * -1 * Math.SQRT1_2;
         }
         else if(this._ySpeed == 0)
         {
            this._ySpeed = this._speed * (Math.random() >= 0.5 ? -1 : 1) * Math.SQRT1_2;
         }
         else
         {
            this._ySpeed = -this._ySpeed;
         }
      }
   }
}
