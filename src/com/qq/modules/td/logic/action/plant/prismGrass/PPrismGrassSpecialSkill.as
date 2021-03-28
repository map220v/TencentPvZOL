package com.qq.modules.td.logic.action.plant.prismGrass
{
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class PPrismGrassSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      private var _totalDamage:Number;
      
      private var _damageDuration:Number;
      
      private var _onceDamage:Number;
      
      private var _curDamage:Number;
      
      private var _targetZombie:BasicZombie;
      
      private var _lastZombie:BasicZombie;
      
      private var _connectLineList:Array;
      
      private var _casted:Boolean;
      
      private var _t_castTimeOut:int;
      
      private var _startTime:Number;
      
      public function PPrismGrassSpecialSkill()
      {
         this._connectLineList = [];
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         var _loc2_:int = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_PrismGrass_BaseDamage);
         var _loc3_:int = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_PrismGrass_ExtendDamage);
         var _loc4_:Array = this.getAllSunsProductor();
         this._totalDamage = _loc2_ + _loc3_ * _loc4_.length;
         this._damageDuration = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_PrismGrass_DamageTime);
         this._onceDamage = this._totalDamage * 1000 / (GameGloble.stage.frameRate * this._damageDuration);
         this._startTime = TDGameInfo.getInstance().getCurGameTime();
         this._curDamage = 0;
         this._casted = false;
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_on);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantFoodOn);
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_CleanGameSence,this.onCleanScene);
      }
      
      private function onCleanScene(param1:CommonEvent) : void
      {
         finishSpecialSkill();
         this.dispose();
      }
      
      protected function onFinishPlantFoodOn(param1:Event) : void
      {
         var _loc2_:BasicPlant = null;
         var _loc3_:IGameObject = null;
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFoodOn);
         for each(_loc2_ in this.getAllSunsProductor())
         {
            TDGameObjectCmd.addGameObjectByPos(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_PrismGrass_Connect_Line,_loc2_.damageArea.x + 0.5 * _loc2_.damageArea.width,_loc2_.damageArea.y + 0.5 * _loc2_.damageArea.height);
            _loc3_ = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
            this._connectLineList.push(_loc3_);
            _loc3_.setAction(TDConstant.PrismGrassConnectLineIdle,[_loc2_,_plant]);
         }
         if(this._connectLineList.length > 0)
         {
            this._t_castTimeOut = setTimeout(this.castConnectLineEnd,1000);
         }
         else
         {
            this.castConnectLineEnd();
         }
      }
      
      private function castConnectLineEnd() : void
      {
         clearTimeout(this._t_castTimeOut);
         this.recyleConnectLine();
         if(_plant && _plant.getActionID() == TDConstant.PPrismGrassSpecialSkill)
         {
            _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood,true);
         }
         this._casted = true;
      }
      
      private function getAllSunsProductor() : Array
      {
         var _loc3_:BasicPlant = null;
         var _loc1_:Array = [];
         var _loc2_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.objectModel.staticInfo.getParam(TDConstant.Plant_Param_GenerateItemType) == TDConstant.UnitType_PlantSun)
            {
               _loc1_.push(_loc3_);
            }
         }
         return _loc1_;
      }
      
      private function getTargetZombie(param1:Array) : void
      {
         var _loc3_:Number = NaN;
         var _loc6_:BasicZombie = null;
         var _loc2_:Number = int.MAX_VALUE;
         var _loc4_:Point = new Point(_plant.x,_plant.y);
         var _loc5_:Point = new Point();
         for each(_loc6_ in param1)
         {
            _loc5_.x = _loc6_.x;
            _loc5_.y = _loc6_.y;
            _loc3_ = Point.distance(_loc4_,_loc5_);
            if(_loc3_ <= _loc2_)
            {
               _loc2_ = _loc3_;
               this._targetZombie = _loc6_;
            }
         }
      }
      
      override public function runningState() : void
      {
         var _loc2_:IGameObject = null;
         if(!this._casted)
         {
            return;
         }
         var _loc1_:Array = TDGameInfo.getInstance().getZombieList(null,0,true,true);
         if(this.isOverTime || _loc1_ == null || _loc1_.length == 0 || _plant == null)
         {
            finishSpecialSkill();
            return;
         }
         if(this._targetZombie == null || this._targetZombie.objectModel.curHp.get() <= 0)
         {
            this.getTargetZombie(_loc1_);
         }
         if(this._targetZombie != null)
         {
            this.outputDamage(this._targetZombie);
            if(this._targetZombie != this._lastZombie)
            {
               _loc2_ = this.findOwnHitLine();
               if(_loc2_)
               {
                  _loc2_.setAction(TDConstant.PrismGrassHitLineIdle,[_plant,this._targetZombie],true);
               }
               else
               {
                  TDGameObjectCmd.addGameObjectByPos(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_PrismGrass_Hit_Line,_plant.x + 15,_plant.y - 40);
                  _loc2_ = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
                  _loc2_.setRunningProp(TDConstant.Gameobject_Prop_PrismGrass_Hitline_Owner,_plant.uid);
                  _loc2_.setAction(TDConstant.PrismGrassHitLineIdle,[_plant,this._targetZombie],true);
               }
               this.outputDamage(this._targetZombie);
            }
            this._lastZombie = this._targetZombie;
         }
      }
      
      private function outputDamage(param1:BasicZombie) : void
      {
         if(this.isOverTime)
         {
            return;
         }
         this._curDamage += this._onceDamage;
         this._targetZombie.changeHp(0 - this._onceDamage,TDConstant.AttackType_Normal,TDConstant.AttackMode_Skill,_plant);
         if(this._curDamage >= this._totalDamage)
         {
            finishSpecialSkill();
         }
      }
      
      private function FinishPlantFood(param1:Event) : void
      {
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_off);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantFoodOff);
      }
      
      protected function onFinishPlantFoodOff(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFoodOff);
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         this.recyleConnectLine();
         var _loc1_:IGameObject = this.findOwnHitLine();
         if(_loc1_)
         {
            _loc1_.Dispose();
         }
         this._lastZombie = null;
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFoodOn);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFoodOff);
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_CleanGameSence,this.onCleanScene);
      }
      
      override public function dispose() : void
      {
         this.recyleConnectLine();
         var _loc1_:IGameObject = this.findOwnHitLine();
         if(_loc1_)
         {
            _loc1_.Dispose();
         }
         this._lastZombie = null;
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_CleanGameSence,this.onCleanScene);
      }
      
      private function findOwnHitLine() : IGameObject
      {
         var _loc2_:IGameObject = null;
         var _loc1_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_PrismGrass_Hit_Line);
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_.getRunningProp(TDConstant.Gameobject_Prop_PrismGrass_Hitline_Owner) == _plant.uid)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function recyleConnectLine() : void
      {
         var _loc1_:IGameObject = null;
         for each(_loc1_ in this._connectLineList)
         {
            if(!_loc1_.hasDisposed)
            {
               _loc1_.Dispose();
            }
         }
         this._connectLineList = [];
      }
      
      private function get isOverTime() : Boolean
      {
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(_loc1_ - this._startTime > this._damageDuration)
         {
            return true;
         }
         return false;
      }
   }
}
