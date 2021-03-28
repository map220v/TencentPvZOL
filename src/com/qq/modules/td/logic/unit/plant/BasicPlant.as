package com.qq.modules.td.logic.unit.plant
{
   import PVZ.Cmd.Dto_PlantInfo;
   import asgui.blit.display.IBlitDisplayObject;
   import com.greensock.TweenMax;
   import com.qq.CommandName;
   import com.qq.constant.td.TDChallengeScoreType;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.display.ColorMatrix;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDPlantBaseStaticInfo;
   import com.qq.modules.td.data.game.unit.TDPlantData;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.data.game.unit.ce.TDAvatarInfoTemplateCE;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDChallengeScoreManager;
   import com.qq.modules.td.logic.TDSpecialSkillTrigger;
   import com.qq.modules.td.logic.bt_ai.AIFileConstant;
   import com.qq.modules.td.logic.log.TDLogCmd;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.modules.td.logic.trigger.events.TriggerEvent;
   import com.qq.modules.td.logic.unit.basic.GameObject;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.object.TDNutsShield;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.QBlitBoneUtil;
   import flash.filters.ColorMatrixFilter;
   import tencent.data.ArgData;
   import tencent.tools.behaviourTrees.BehaviourTreeCenter;
   
   public class BasicPlant extends GameObject
   {
       
      
      public var plantData:TDPlantData;
      
      public var killByZombie:Boolean = false;
      
      public var killByPrePlantType:Boolean = false;
      
      public var killBySelfExplode:Boolean = false;
      
      public function BasicPlant()
      {
         super();
      }
      
      public function castSkill() : void
      {
         var _loc1_:Vector.<ArgData> = null;
         var _loc2_:int = 0;
         var _loc3_:ArgData = null;
         if(this.plantData.plantStaticInfo.baseInfo.params)
         {
            if(this.plantData.plantStaticInfo.baseInfo.params.length > 0)
            {
               _loc1_ = ArgData.createVectorByString(this.plantData.plantStaticInfo.baseInfo.params,"|",":");
               _loc2_ = 0;
               while(_loc2_ < _loc1_.length)
               {
                  _loc3_ = _loc1_[_loc2_];
                  if(_loc3_.head_int == TDConstant.Plant_Param_SendMessage)
                  {
                     CommandDispatcher.send(_loc3_.arg[0]);
                  }
                  _loc2_++;
               }
            }
         }
      }
      
      override public function setData(param1:TDGameObjectData) : void
      {
         super.setData(param1);
         this.plantData = param1 as TDPlantData;
      }
      
      override protected function initAnmi(param1:Boolean = false, param2:Boolean = false) : void
      {
         super.initAnmi(param1,param2);
         this.initHideBones();
         var _loc3_:String = "idle";
         if(this.plantData.plantStaticInfo.baseInfo.staticActionName != null && this.plantData.plantStaticInfo.baseInfo.staticActionName.length > 0)
         {
            _loc3_ = this.plantData.plantStaticInfo.baseInfo.staticActionName;
         }
         animation.gotoAndStop(_loc3_);
      }
      
      protected function initHideBones() : void
      {
         var _loc1_:IBlitDisplayObject = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:* = false;
         var _loc6_:Dto_PlantInfo = null;
         var _loc7_:Array = null;
         var _loc8_:TDAvatarInfoTemplateCE = null;
         var _loc2_:TDPlantBaseStaticInfo = this.plantData.staticInfo as TDPlantBaseStaticInfo;
         if(_loc2_.InitHideBones)
         {
            _loc5_ = false;
            if((_loc6_ = TDStageInfo.getInstance().getPlantDto(this.plantData.unitType)) && _loc6_.avatarId != 0)
            {
               _loc5_ = QBlitBoneUtil.updateAvatar(animation.bone,CardTemplateFactory.instance.getPlantAvatarByAvatarId(_loc6_.avatarId),false,true) == 1;
            }
            if(_loc5_ == false)
            {
               if(this.plantData.plantStaticInfo.avaterID != 0)
               {
                  if((_loc8_ = TDDataFactory.instance.getAvatarInfoByID(this.plantData.plantStaticInfo.avaterID)) != null)
                  {
                     _loc7_ = _loc8_.avatarBoneNames.split(";");
                  }
               }
               _loc3_ = 0;
               while(_loc3_ < _loc2_.InitHideBones.length)
               {
                  _loc4_ = _loc2_.InitHideBones[_loc3_];
                  if(_loc7_ != null)
                  {
                     if(_loc7_.indexOf(_loc4_) == -1)
                     {
                        animation.setBoneVisibleRule(_loc4_,false);
                     }
                  }
                  else
                  {
                     animation.setBoneVisibleRule(_loc4_,false);
                  }
                  _loc3_++;
               }
            }
            animation.renderForce();
         }
      }
      
      override protected function startTimeRecord() : void
      {
         super.startTimeRecord();
         if(objectModel.staticInfo.getParam(TDConstant.Plant_Param_InitDurationTimeCurrentTime) == 1)
         {
            timeRecordMap[TDConstant.TimeRecord_PlantDuration] = TDGameInfo.getInstance().getCurGameTime();
         }
         else
         {
            timeRecordMap[TDConstant.TimeRecord_PlantDuration] = int.MIN_VALUE;
         }
         if(objectModel.staticInfo.getParam(TDConstant.Plant_Param_InitNextLaunchTimeZero) == 1)
         {
            timeRecordMap[TDConstant.TimeRecord_NextLaunchTime] = 0;
         }
         else
         {
            timeRecordMap[TDConstant.TimeRecord_NextLaunchTime] = TDGameInfo.getInstance().getCurGameTime();
         }
      }
      
      override public function changeHp(param1:int, param2:int, param3:int, param4:IGameObject) : Boolean
      {
         var _loc10_:TDNutsShield = null;
         if(param3 != TDConstant.AttackMode_ZombieLaser && param2 != TDConstant.AttackType_Magic)
         {
            if(_loc10_ = this.checkNutsShield(param1,param2,param3,param4))
            {
               CommandDispatcher.send(CommandName.TD_Damage_SwitchTo_NutsShield,[_loc10_,param1,param2,param3,param4]);
               return false;
            }
         }
         var _loc5_:int = this.plantData.curHp.get();
         var _loc6_:int = this.plantData.maxHp.get();
         if(param3 == TDConstant.AttackMode_ZombieFire)
         {
            param1 = -int.MAX_VALUE;
         }
         var _loc7_:int = this.plantData.curArmorHp.get();
         var _loc8_:int = param1;
         if(param1 < 0 && _loc7_ > 0)
         {
            if((_loc7_ += param1) < 0)
            {
               param1 = _loc7_;
               this.plantData.curArmorHp.set(0);
            }
            else
            {
               param1 = 0;
               this.plantData.curArmorHp.set(_loc7_);
            }
            showHPState();
            this.updateArmor();
         }
         var _loc9_:int;
         if((_loc9_ = _loc5_ + param1) <= 0)
         {
            _loc9_ = 0;
         }
         if(_loc9_ > _loc6_)
         {
            _loc9_ = _loc6_;
         }
         if(_loc9_ != _loc5_)
         {
            this.plantData.curHp.set(_loc9_);
            showHPState();
            if(_loc9_ <= 0)
            {
               if(param3 == TDConstant.AttackMode_Normal)
               {
                  TDSoundCmd.plantByEated();
               }
               this.killByZombie = true;
               this.deadHandler(param2,param3,param4);
            }
            else if(param1 < 0)
            {
               this.playEatEffect();
            }
         }
         if(_loc8_ < 0)
         {
            TDLogCmd.recordPlantDamage(uid,this.plantData.plantStaticInfo.id,this.plantData.maxArmorHp.get(),_loc7_,_loc6_,_loc9_,_loc8_);
         }
         return this.killByZombie;
      }
      
      protected function deadHandler(param1:int, param2:int, param3:IGameObject) : void
      {
         this.dispose();
      }
      
      protected function checkNutsShield(param1:int, param2:int, param3:int, param4:IGameObject) : TDNutsShield
      {
         var _loc6_:TDNutsShield = null;
         var _loc5_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Nuts_Shield);
         for each(_loc6_ in _loc5_)
         {
            if(_loc6_.columnIndex == this.objectModel.column)
            {
               return _loc6_;
            }
         }
         return null;
      }
      
      public function addShovelEffect() : void
      {
         var _loc1_:ColorMatrixFilter = null;
         var _loc2_:ColorMatrix = null;
         if(!_isVaild)
         {
            return;
         }
         _loc1_ = new ColorMatrixFilter();
         _loc2_ = new ColorMatrix();
         _loc2_.adjustBrightness(0.2);
         _loc1_.matrix = _loc2_;
         addFilter(TDConstant.TDFilter_ShovelEffect,_loc1_);
      }
      
      public function removeShovelEffect() : void
      {
         removeFilter(TDConstant.TDFilter_ShovelEffect);
      }
      
      public function startLevelupTip() : void
      {
         if(!_isVaild)
         {
            return;
         }
         TweenMax.fromTo(frontLayer,0.7,{"colorTransform":{"tint":null}},{
            "colorTransform":{"tintAmount":0.7},
            "repeat":-1,
            "yoyo":true
         });
      }
      
      public function stopLevelUpTip() : void
      {
         if(!_isVaild)
         {
            return;
         }
         TweenMax.to(frontLayer,0.1,{"colorTransform":{"tintAmount":0}});
      }
      
      public function playEatEffect() : void
      {
         if(!_isVaild)
         {
            return;
         }
         TweenMax.to(animation.display,0.2,{
            "colorTransform":{"tintAmount":-0.3},
            "onComplete":this.stopEatEffct
         });
      }
      
      private function stopEatEffct() : void
      {
         if(!_isVaild)
         {
            return;
         }
         TweenMax.to(animation.display,0.2,{"colorTransform":{"tintAmount":0}});
      }
      
      private function endEatEffct() : void
      {
         removeFilter(TDConstant.TDFilter_EatEffect);
      }
      
      public function showSpecialSkillChooseEffect() : void
      {
         var _loc1_:ColorMatrixFilter = null;
         var _loc2_:ColorMatrix = null;
         if(!_isVaild)
         {
            return;
         }
         _loc1_ = new ColorMatrixFilter();
         _loc2_ = new ColorMatrix();
         _loc2_.adjustBrightness(0.2);
         _loc1_.matrix = _loc2_;
         addFilter(TDConstant.TDFilter_SpecialSkillChoose,_loc1_);
      }
      
      public function hideSpecialSkillChooseEffect() : void
      {
         if(!_isVaild)
         {
            return;
         }
         removeFilter(TDConstant.TDFilter_SpecialSkillChoose);
      }
      
      public function updateArmor() : void
      {
         var _loc4_:String = null;
         if(this.plantData.armorNameList == null)
         {
            return;
         }
         var _loc1_:int = this.plantData.armorNameList.length;
         var _loc2_:int = _loc1_ - Math.ceil(this.plantData.curArmorHp.get() / this.plantData.maxArmorHp.get() * _loc1_);
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            if((_loc4_ = this.plantData.armorNameList[_loc3_]) != null && _loc4_.length > 0)
            {
               if(_loc3_ == _loc2_)
               {
                  animation.setBoneVisibleRule(_loc4_,true);
               }
               else
               {
                  animation.setBoneVisibleRule(_loc4_,false);
               }
            }
            _loc3_++;
         }
         if(_loc2_ == _loc1_)
         {
            this.plantData.armorNameList = null;
         }
      }
      
      public function revive() : void
      {
         this.startTimeRecord();
         if(this.plantData.plantStaticInfo.baseInfo.AIMode.length > 0)
         {
            if(AIFileConstant[this.plantData.plantStaticInfo.baseInfo.AIMode])
            {
               BehaviourTreeCenter.instance.addAITreeByConfigClass(this.uid,this.model.staticInfo.type,AIFileConstant[this.plantData.plantStaticInfo.baseInfo.AIMode] as Class,[this]);
            }
            else
            {
               BehaviourTreeCenter.instance.addAITreeByCode(this.uid,this.model.staticInfo.type,this.plantData.plantStaticInfo.baseInfo.AIMode,[this]);
            }
         }
      }
      
      public function runAI(param1:Boolean = false) : void
      {
         if(param1 && this.isFrozenAI())
         {
            this.setFrozenAI(false);
         }
         if(this.isFrozenAI())
         {
            return;
         }
         BehaviourTreeCenter.instance.runAI(this.uid);
      }
      
      override public function dispose(param1:Boolean = true) : void
      {
         var _loc4_:BasicPlant = null;
         var _loc5_:Object = null;
         TDSpecialSkillTrigger.getInstance().checkRemovePlant(uid);
         var _loc2_:Array = TDGameInfo.getInstance().getPlantByTileIndex(this.plantData.tileIndex,TDConstant.PlantUsefulness_Plant);
         if(_loc2_.length > 0)
         {
            (_loc4_ = _loc2_[0]).plantData.setProtectedPlant(null);
         }
         var _loc3_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByIndex(this.plantData.tileIndex);
         if(_loc3_ != null)
         {
            _loc3_.removePlantType(this.plantData.plantStaticInfo.baseInfo.id);
         }
         setVaild(false);
         TweenMax.killTweensOf(frontLayer);
         if(param1)
         {
            if(!this.killByPrePlantType)
            {
               CommandDispatcher._dispatcher.dispatchEvent(new TriggerEvent(TDTrigConst.TYPE_PLANT_DIE,[this]));
               TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Lose_Plant);
            }
            if(this.killByZombie)
            {
               TalentManager.instance.getKillPlantDropSun(this.plantData.plantStaticInfo,this);
            }
            (_loc5_ = new Object()).plantType = this.plantData.plantStaticInfo.type;
            _loc5_.tileIndex = this.plantData.tileIndex;
            CommandDispatcher.send(CommandName.TD_PLANT_REMOVE,_loc5_);
            if(this.plantData)
            {
               this.plantData.cleanBuff();
            }
         }
         super.dispose(param1);
      }
      
      override public function update() : void
      {
         super.update();
      }
      
      override public function setLocation(param1:Number, param2:Number) : void
      {
         super.setLocation(param1,param2);
         setHPBarLoaction(param1,param2);
      }
   }
}
