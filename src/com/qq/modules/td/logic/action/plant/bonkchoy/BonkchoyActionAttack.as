package com.qq.modules.td.logic.action.plant.bonkchoy
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import flash.events.Event;
   
   public class BonkchoyActionAttack extends BasicPlantAction
   {
       
      
      private var _attackTypeList:Array;
      
      private var cacheTimeScale:int;
      
      private var critPlugRate:Number = 0;
      
      public function BonkchoyActionAttack()
      {
         super();
         this._attackTypeList = new Array();
         this._attackTypeList[TDConstant.Bonkchoy_AttckType_AttckRight] = [TDConstant.PlantAnmi_Attack];
         this._attackTypeList[TDConstant.Bonkchoy_AttckType_AttckLeft] = [TDConstant.PlantAnmi_Attack2];
         this._attackTypeList[TDConstant.Bonkchoy_AttckType_AttckBoth] = [TDConstant.PlantAnmi_Attack3];
         this._attackTypeList[TDConstant.Bonkchoy_AttckType_FinalAttckRight] = [TDConstant.PlantAnmi_Attack4];
         this._attackTypeList[TDConstant.Bonkchoy_AttckType_FinalAttackLeft] = [TDConstant.PlantAnmi_Attack5];
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc3_:String = null;
         super.enterState(param1);
         this.cacheTimeScale = _gameObject.animation.timeScale;
         var _loc2_:int = this.getAttckType();
         if(TDConstant.Bonkchoy_AttckType_NoAttack != _loc2_)
         {
            _loc3_ = this._attackTypeList[_loc2_];
            _gameObject.animation.gotoAndPlay(_loc3_,false);
            _gameObject.animation.addEventListener(Event.COMPLETE,this.onCompleteAttack);
            _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttack);
            TDSoundCmd.bonkchoyAttack(_loc2_);
         }
         else
         {
            _plant.setAction();
         }
      }
      
      private function onAttack(param1:FrameEvent) : void
      {
         var _loc2_:Vector.<IGameObject> = null;
         var _loc3_:IGameObject = null;
         var _loc4_:Number = NaN;
         if(param1.frameLabel == "attack")
         {
            _loc2_ = TDSearchTargetUtils.searchTargetForPlantWithAttackArea(_plant,[_plantModel.roadIndex]);
            if(_loc2_.length > 0)
            {
               _loc3_ = _loc2_[0];
               _loc4_ = 0;
               if(this.critPlugRate != 0)
               {
                  _loc4_ = -_plant.plantData.plantStaticInfo.baseInfo.damageValue * this.critPlugRate / 100;
               }
               TDDamageCaculete.caculatePlantAttckDamage(_plant,_loc3_,_loc4_);
               TDSoundCmd.zombieHitByBonkchoy();
            }
         }
      }
      
      private function onCompleteAttack(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttack);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onCompleteAttack);
         _plant.setAction();
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.timeScale = this.cacheTimeScale;
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttack);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onCompleteAttack);
      }
      
      private function getAttckType() : int
      {
         var _loc3_:IGameObject = null;
         var _loc4_:int = 0;
         this.critPlugRate = 0;
         var _loc1_:int = TDConstant.Bonkchoy_AttckType_NoAttack;
         var _loc2_:Vector.<IGameObject> = TDSearchTargetUtils.searchTargetForPlantWithAttackArea(_plant,[_plantModel.roadIndex]);
         if(_loc2_.length > 0)
         {
            _loc3_ = _loc2_[0];
            _plant.animation.timeScale = TalentManager.instance.getAttackSpeed(_plant.plantData.plantStaticInfo,_loc3_,this.cacheTimeScale);
            if(_gameObject.x < _loc3_.x)
            {
               _loc1_ = TDConstant.Bonkchoy_AttckType_AttckRight;
            }
            else
            {
               _loc1_ = TDConstant.Bonkchoy_AttckType_AttckLeft;
            }
            _loc4_ = TDDamageCaculete.getPlantAttckDamage(_plant,_loc3_);
            if(_loc3_.objectModel.curHp.get() + _loc4_ <= 0)
            {
               if(_loc3_.x < _plant.x)
               {
                  _loc1_ = TDConstant.Bonkchoy_AttckType_FinalAttackLeft;
               }
               else
               {
                  _loc1_ = TDConstant.Bonkchoy_AttckType_FinalAttckRight;
               }
            }
            if(_loc1_ != TDConstant.Bonkchoy_AttckType_FinalAttackLeft && _loc1_ != TDConstant.Bonkchoy_AttckType_FinalAttckRight)
            {
               this.critPlugRate = TalentManager.instance.isCritAttack(_plant.plantData.plantStaticInfo,_loc3_.objectModel.staticInfo.type);
               if(this.critPlugRate != 0)
               {
                  if(_loc3_.x < _plant.x)
                  {
                     _loc1_ = TDConstant.Bonkchoy_AttckType_FinalAttackLeft;
                  }
                  else
                  {
                     _loc1_ = TDConstant.Bonkchoy_AttckType_FinalAttckRight;
                  }
               }
            }
         }
         return _loc1_;
      }
   }
}
