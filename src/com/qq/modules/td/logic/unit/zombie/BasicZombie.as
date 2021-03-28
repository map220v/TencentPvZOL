package com.qq.modules.td.logic.unit.zombie
{
   import asgui.blit.display.IBlitDisplayObject;
   import asgui.managers.ToolTipManager;
   import com.greensock.TweenMax;
   import com.qq.CommandName;
   import com.qq.constant.td.TDChallengeScoreType;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.command.TDItemCmd;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.game.unit.TDZombieData;
   import com.qq.modules.td.data.game.unit.TDZombieStaticInfo;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.TDChallengeScoreManager;
   import com.qq.modules.td.logic.bt_ai.AIFileConstant;
   import com.qq.modules.td.logic.log.TDLogCmd;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.modules.td.logic.trigger.events.TriggerEvent;
   import com.qq.modules.td.logic.unit.basic.GameObject;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDMiniGameNoSunData;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DMath;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import tencent.tools.behaviourTrees.BehaviourTreeCenter;
   
   public class BasicZombie extends GameObject
   {
       
      
      public var zombieData:TDZombieData;
      
      public var hasStartDie:Boolean = false;
      
      private var _howlTime:Number = -1;
      
      public function BasicZombie()
      {
         super();
      }
      
      override public function setData(param1:TDGameObjectData) : void
      {
         super.setData(param1);
         this.zombieData = param1 as TDZombieData;
         if(AIFileConstant[this.zombieData.zombiestaticInfo.AIMode])
         {
            BehaviourTreeCenter.instance.addAITreeByConfigClass(this.uid,this.model.staticInfo.type,AIFileConstant[this.zombieData.zombiestaticInfo.AIMode] as Class,[this]);
         }
         else
         {
            BehaviourTreeCenter.instance.addAITreeByCode(this.uid,this.model.staticInfo.type,this.zombieData.zombiestaticInfo.AIMode,[this]);
         }
      }
      
      override protected function initAnmi(param1:Boolean = false, param2:Boolean = false) : void
      {
         super.initAnmi(param1,param2);
         this.initHideBones();
         this.updateArmorRelatedBone();
         this.updateArmorState(TDConstant.AttackMode_Normal,true);
         _animation.gotoAndStop(1);
      }
      
      override public function changeHp(param1:int, param2:int, param3:int, param4:IGameObject) : Boolean
      {
         var _loc12_:Boolean = false;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:Number = NaN;
         var _loc16_:int = 0;
         var _loc5_:int = this.zombieData.getAllArmorCurHp();
         var _loc6_:int = this.zombieData.maxHp.get();
         var _loc7_:int = this.zombieData.curHp.get();
         var _loc8_:int = param1;
         if(param4 is BasicPlant)
         {
            if((_loc12_ = TalentManager.instance.isShootDownArmor((param4 as BasicPlant).plantData.plantStaticInfo,param4.uid)) && _loc5_ > 0)
            {
               param1 = -_loc5_;
            }
         }
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:int = param1;
         if(param2 == TDConstant.AttackType_Normal)
         {
            if((_loc11_ = this.zombieData.reduceDefencePartHp(param1)) != param1)
            {
               if(param3 != TDConstant.AttackMode_ZombieAttack)
               {
                  TDEffectCmd.playArmorResistEffect(this);
               }
               _loc9_ = true;
            }
         }
         if(_loc11_ != 0)
         {
            if((_loc13_ = _loc7_ + _loc11_) <= 0)
            {
               _loc13_ = 0;
            }
            if(_loc13_ > _loc6_)
            {
               _loc13_ = _loc6_;
            }
            if(_loc13_ != _loc7_)
            {
               _loc9_ = true;
               this.zombieData.curHp.set(_loc13_);
               if(param3 != TDConstant.AttackMode_SquashAttack || _loc13_ > 0)
               {
                  this.updateDamageState(param3);
               }
               if(_loc13_ <= 0)
               {
                  _loc10_ = true;
                  CommandDispatcher._dispatcher.dispatchEvent(new TriggerEvent(TDTrigConst.TYPE_ZOMBIE_DIE,[this]));
                  if(param4 != null && param4 is BasicPlant)
                  {
                     CommandDispatcher._dispatcher.dispatchEvent(new CommonEvent(CommandName.TD_ZOMBIE_KILLED_BY_PLANT,param4));
                  }
                  if(param4 && param4.objectModel.unitCatalog == TDConstant.UnitCatalog_Plant)
                  {
                     TalentManager.instance.getKillZombieDropSun((param4 as BasicPlant).plantData.plantStaticInfo,this);
                  }
                  if(!this.zombieData.zombiestaticInfo.hasParam(TDConstant.Zombie_Param_isStopCheckEndGame))
                  {
                     if(TDGameInfo.getInstance().isLastZombie())
                     {
                        TDGameInfo.getInstance().setLastDieZombiePos(x,y);
                     }
                  }
                  else
                  {
                     TDGameCmd.isStopCheckEndTDGame(true);
                  }
                  this.startDie(param3);
                  TDSoundCmd.zombieDie(this.zombieData.zombiestaticInfo.id);
                  TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Kill_Zombie);
                  TDLogCmd.killZombie(this.zombieData.uid,this.zombieData.zombiestaticInfo.type,_loc6_,_loc13_);
                  if(param4 != null && param4 is BasicPlant)
                  {
                     if((_loc14_ = TalentManager.instance.getTimeToTransformId((param4 as BasicPlant).plantData.plantStaticInfo,(param4 as BasicPlant).uid)) > 0)
                     {
                        param4.setAction(TDConstant.PlantActionTransform,[_loc14_],true);
                     }
                  }
               }
            }
            if(this.zombieData.isDying == true && this.zombieData.isFinishDying == false)
            {
               _loc15_ = this.zombieData.curDyingHp.get() + _loc11_;
               this.zombieData.curDyingHp.set(_loc15_);
               if(_loc15_ <= 0)
               {
                  this.zombieData.dyingTime = 0;
               }
            }
         }
         if(_loc9_ && objectModel.camp == TDConstant.TDCamp_Enemy)
         {
            this.updateArmorState(param3);
            if(!this.hasStartDie && this.zombieData.zombiestaticInfo.catalog != TDConstant.ZombieCatalog_Boss)
            {
               showHPState();
            }
            playHitEffect();
         }
         if(this.zombieData.zombiestaticInfo.catalog == TDConstant.ZombieCatalog_Boss)
         {
            CommandDispatcher.send(CommandName.TD_BossHpChange,{
               "curHp":_loc7_,
               "maxHp":_loc6_
            });
         }
         if(_loc8_ < 0)
         {
            _loc16_ = this.zombieData.getAllArmorMaxHp();
            TDLogCmd.recordZombieDamage(uid,this.zombieData.zombiestaticInfo.type,_loc16_,_loc5_,_loc6_,_loc13_,_loc8_);
         }
         return _loc10_;
      }
      
      protected function updateArmorRelatedBone() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         if(this.zombieData.isHasDefencePart())
         {
            for each(_loc1_ in this.zombieData.armorData)
            {
               if(_loc1_[TDConstant.Armor_Hp] > 0)
               {
                  _loc2_ = true;
                  _loc3_ = false;
               }
               else
               {
                  _loc2_ = false;
                  _loc3_ = true;
               }
               _loc4_ = _loc1_[TDConstant.Armor_ExitBoneNameList];
               for each(_loc5_ in _loc4_)
               {
                  this.setBoneVisible(_loc5_,_loc2_);
               }
               _loc4_ = _loc1_[TDConstant.Armor_NoExitBoneNameList];
               for each(_loc6_ in _loc4_)
               {
                  this.setBoneVisible(_loc6_,_loc3_);
               }
            }
         }
      }
      
      protected function initHideBones() : void
      {
         var _loc1_:IBlitDisplayObject = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc2_:TDZombieStaticInfo = this.zombieData.staticInfo as TDZombieStaticInfo;
         if(_loc2_.InitHideBones)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.InitHideBones.length)
            {
               _loc4_ = _loc2_.InitHideBones[_loc3_];
               this.animation.setBoneVisibleRule(_loc4_,false);
               _loc3_++;
            }
         }
         animation.setBoneVisibleRule(TDConstant.Ground_LayerName,false);
         animation.setBoneVisibleRule(TDConstant.Ground_LayerName2,false);
      }
      
      public function dropArmor() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:String = null;
         for each(_loc1_ in this.zombieData.armorData)
         {
            if(!_loc1_[TDConstant.Armor_IsDrop])
            {
               this.updateArmorRelatedBone();
               _loc2_ = (this.zombieData.staticInfo as TDZombieStaticInfo).DropPartArmorList;
               if(_loc2_.length != 0)
               {
                  for each(_loc3_ in _loc2_)
                  {
                     this.setBoneVisible(_loc3_,false);
                  }
                  _loc1_[TDConstant.Armor_IsDrop] = true;
                  this.removeArmorTrigger();
                  TDSoundCmd.zombieDropBody();
                  TDGameObjectCmd.dropZombiePart(this,_loc2_,TDConstant.DropPart_Item,_loc1_[TDConstant.Armor_Name]);
               }
            }
         }
      }
      
      private function removeArmorTrigger() : void
      {
         if(this.zombieData.zombiestaticInfo.hasParam(TDConstant.Zombie_Param_CanJump))
         {
            this.zombieData.canJump = false;
         }
      }
      
      public function magnetArmor(param1:int, param2:int) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:String = null;
         for each(_loc3_ in this.zombieData.armorData)
         {
            if(!_loc3_[TDConstant.Armor_IsDrop] && _loc3_[TDConstant.Aromr_isIron])
            {
               _loc3_[TDConstant.Armor_IsDrop] = true;
               _loc3_[TDConstant.Armor_Hp] = 0;
               this.updateArmorRelatedBone();
               if((_loc4_ = _loc3_[TDConstant.Armor_AllPartName]).length != 0)
               {
                  for each(_loc5_ in _loc4_)
                  {
                     this.setBoneVisible(_loc5_,false);
                  }
                  this.removeArmorTrigger();
                  TDGameObjectCmd.magnetArmor(this,_loc4_,TDConstant.DropPart_Item,_loc3_[TDConstant.Armor_Name],param1,param2);
               }
            }
         }
      }
      
      public function hasIronArmor() : Boolean
      {
         var _loc1_:Array = null;
         for each(_loc1_ in this.zombieData.armorData)
         {
            if(!_loc1_[TDConstant.Armor_IsDrop] && _loc1_[TDConstant.Aromr_isIron])
            {
               return true;
            }
         }
         return false;
      }
      
      protected function updateArmorState(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Array = null;
         var _loc14_:String = null;
         if(param1 == TDConstant.AttackMode_BlowDisappear)
         {
            return;
         }
         for each(_loc7_ in this.zombieData.armorData)
         {
            _loc8_ = _loc7_[TDConstant.Armor_Hp];
            _loc9_ = _loc7_[TDConstant.Armor_MaxHp];
            _loc10_ = _loc7_[TDConstant.Armor_State];
            _loc11_ = _loc7_[TDConstant.Armor_MaxState];
            _loc12_ = Math.ceil(_loc8_ / _loc9_ * _loc11_);
            if(param2 || _loc12_ != _loc10_)
            {
               _loc7_[TDConstant.Armor_State] = _loc12_;
               if(_loc12_ <= 0)
               {
                  if(_loc7_[TDConstant.Armor_DropImmediately])
                  {
                     if(objectModel.isAlive())
                     {
                        if(param1 != TDConstant.AttackMode_BoomCharred && param1 != TDConstant.AttackMode_BoomDisappear && param1 != TDConstant.AttackMode_BlowDisappear)
                        {
                           this.dropArmor();
                           _loc3_ = (_loc4_ = _loc7_[TDConstant.Armor_Name]).split("|");
                           _loc6_ = 0;
                           while(_loc6_ < _loc3_.length)
                           {
                              if((_loc5_ = _loc3_[_loc6_]).indexOf(":") < 0)
                              {
                                 animation.setBoneVisibleRule(_loc5_,false);
                              }
                              else
                              {
                                 _loc13_ = _loc5_.split(":");
                                 for each(_loc14_ in _loc13_)
                                 {
                                    animation.setBoneVisibleRule(_loc14_,false);
                                 }
                              }
                              _loc6_++;
                           }
                        }
                     }
                  }
               }
               else
               {
                  _loc3_ = (_loc4_ = _loc7_[TDConstant.Armor_Name]).split("|");
                  if(_loc3_.length < _loc12_)
                  {
                     return;
                  }
                  _loc6_ = 0;
                  while(_loc6_ < _loc3_.length)
                  {
                     if((_loc5_ = _loc3_[_loc6_]).indexOf(":") < 0)
                     {
                        if(_loc11_ - _loc12_ != _loc6_)
                        {
                           animation.setBoneVisibleRule(_loc5_,false);
                        }
                        else
                        {
                           animation.setBoneVisibleRule(_loc5_,true);
                        }
                     }
                     else
                     {
                        _loc13_ = _loc5_.split(":");
                        for each(_loc14_ in _loc13_)
                        {
                           if(_loc11_ - _loc12_ != _loc6_)
                           {
                              animation.setBoneVisibleRule(_loc14_,false);
                           }
                           else
                           {
                              animation.setBoneVisibleRule(_loc14_,true);
                           }
                        }
                     }
                     _loc6_++;
                  }
               }
            }
         }
      }
      
      protected function updateDamageState(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:String = null;
         if(this.zombieData.isFlying && param1 == TDConstant.AttackMode_KillByToyCar)
         {
            return;
         }
         if(this.zombieData.dropPartMaxState > 0)
         {
            _loc2_ = Math.ceil(this.zombieData.curHp.get() / this.zombieData.maxHp.get() * this.zombieData.dropPartMaxState);
            if(_loc2_ != this.zombieData.dropPartState)
            {
               _loc3_ = this.zombieData.dropPartMaxState - this.zombieData.dropPartState;
               while(_loc3_ < this.zombieData.dropPartMaxState - _loc2_)
               {
                  _loc4_ = this.zombieData.zombiestaticInfo.DropPartNameList[_loc3_];
                  _loc5_ = this.zombieData.zombiestaticInfo.DropPartRelatedShowPartList[_loc3_];
                  _loc6_ = this.zombieData.zombiestaticInfo.DropPartTypeList[_loc3_];
                  _loc7_ = this.zombieData.zombiestaticInfo.DropPartRelatedPartList[_loc3_];
                  for each(_loc8_ in _loc7_)
                  {
                     this.setBoneVisible(_loc8_,false);
                  }
                  for each(_loc9_ in _loc5_)
                  {
                     this.setBoneVisible(_loc9_,true);
                  }
                  if(_loc4_)
                  {
                     for each(_loc10_ in _loc4_)
                     {
                        this.setBoneVisible(_loc10_,false);
                     }
                     if(param1 != TDConstant.AttackMode_BoomCharred && param1 != TDConstant.AttackMode_BoomDisappear && param1 != TDConstant.AttackMode_BlowDisappear)
                     {
                        TDGameObjectCmd.dropZombiePart(this,_loc4_,_loc6_);
                     }
                  }
                  _loc3_++;
               }
               this.zombieData.dropPartState = _loc2_;
               TDSoundCmd.zombieDropBody();
            }
         }
      }
      
      public function isPassWarfield() : Boolean
      {
         if(this.zombieData.isDying)
         {
            return false;
         }
         if(x < TDGameInfo.getInstance().passWarfieldPosX)
         {
            return true;
         }
         return false;
      }
      
      public function isLeaveWarfield() : Boolean
      {
         if(x > TDGameInfo.getInstance().zombieStartPosX)
         {
            return true;
         }
         return false;
      }
      
      public function isContinueNextAction() : Boolean
      {
         if(this.isPassWarfield())
         {
            return false;
         }
         if(this.isLeaveWarfield())
         {
            setAction(TDConstant.ZAction_Disappear);
            return false;
         }
         return true;
      }
      
      public function isEnterHouse() : Boolean
      {
         if(this.zombieData.isDying)
         {
            return false;
         }
         if(x < TDGameInfo.getInstance().enterHousePosX)
         {
            return true;
         }
         return false;
      }
      
      public function isTrigger() : Boolean
      {
         if(this.zombieData.isDying)
         {
            return false;
         }
         if(!this.zombieData.isDying && this.zombieData.isFinishDying)
         {
            return false;
         }
         return true;
      }
      
      public function revive(param1:Array = null) : void
      {
         var _loc2_:String = null;
         if(this.zombieData.zombiestaticInfo.enterActionIDList.length > 0)
         {
            _loc2_ = this.zombieData.zombiestaticInfo.enterActionIDList[0];
            setAction(_loc2_);
         }
         setMouseEnable(false);
         if(objectModel.hasFuel)
         {
            playFuelEffect();
         }
         if(objectModel.dropCard != 0)
         {
            playCarryCardEffect();
         }
         this.runAI();
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
      
      public function startWalk(param1:Array = null) : void
      {
         setAction(TDConstant.ZAction_Walk,param1);
      }
      
      public function startIdle(param1:Array = null) : void
      {
         setAction(TDConstant.ZAction_Idle,param1);
      }
      
      public function startDie(param1:int, param2:Array = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.zombieData.cleanBuff();
         this.hasStartDie = true;
         BehaviourTreeCenter.instance.removeAI(this.uid);
         hideHPState();
         switch(param1)
         {
            case TDConstant.AttackMode_KillByToyCar:
               if(this.zombieData.isFlying)
               {
                  _loc4_ = x + damageArea.x + damageArea.width * 0.5;
                  _loc5_ = y + damageArea.y + damageArea.height * 0.5;
                  setAction(TDConstant.ZAction_Disappear);
               }
               else
               {
                  this.setDying();
               }
               break;
            case TDConstant.AttackMode_BoomCharred:
               if(this.zombieData.zombiestaticInfo.charredType != 0)
               {
                  TDEffectCmd.playZombieCharredEffect(this);
                  animation.stop();
                  setVisible(false);
               }
               else
               {
                  setAction(TDConstant.ZAction_Disappear,param2);
               }
               break;
            case TDConstant.AttackMode_BoomDisappear:
            case TDConstant.AttackMode_BlowDisappear:
               setAction(TDConstant.ZAction_Disappear,param2);
               break;
            case TDConstant.AttackMode_Normal:
            case TDConstant.AttackMode_ZombieAttack:
            case TDConstant.AttackMode_Skill:
               this.setDying();
               break;
            case TDConstant.AttackMode_SquashAttack:
               TweenMax.delayedCall(0.1,this.onFinishKillBySquash);
         }
         this.lootItem();
      }
      
      private function onFinishKillBySquash() : void
      {
         this.dispose();
      }
      
      private function hasActionByName(param1:String) : Boolean
      {
         return _stateMachine.hasState(param1);
      }
      
      public function setBoneVisible(param1:String, param2:Boolean) : void
      {
         if(animation)
         {
            animation.setBoneVisibleRule(param1,param2);
         }
      }
      
      override public function getCurSpeed() : Number
      {
         var _loc1_:Number = 0;
         switch(getActionID())
         {
            case TDConstant.ZAction_Run:
               _loc1_ = model.getSpeed(TDGameObjectData.SPEED_RUN);
               break;
            case TDConstant.ZAction_Walk:
            case TDConstant.ZAction_Walk2:
               _loc1_ = model.getSpeed(TDGameObjectData.SPEED_WALK);
               break;
            case TDConstant.ZAction_Fly:
               _loc1_ = model.getSpeed(TDGameObjectData.SPEED_FLY);
         }
         return _loc1_;
      }
      
      protected function setDying() : void
      {
         if(objectModel.hasFuel)
         {
            stopFuelEffect();
         }
         if(objectModel.dropCard)
         {
            stopCarryCardEffect();
         }
         this.zombieData.isDying = true;
         this.zombieData.isFinishDying = false;
         timeRecordMap[TDConstant.TimeRecord_DyingDuration] = TDGameInfo.getInstance().getCurGameTime();
         this.dropArmor();
      }
      
      override public function update() : void
      {
         var _loc1_:String = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         super.update();
         if(!TDGameInfo.getInstance().isRunningGame)
         {
            return;
         }
         this.updateHowl();
         if(this.zombieData.isDying && !this.zombieData.isFinishDying)
         {
            if(TDGameInfo.getInstance().getCurGameTime() - timeRecordMap[TDConstant.TimeRecord_DyingDuration] > this.zombieData.dyingTime)
            {
               _loc1_ = TDConstant.ZAction_Death;
               _loc2_ = this.zombieData.zombiestaticInfo.deathActionIDList.length;
               if(_loc2_ > 0)
               {
                  _loc3_ = DMath.randNum(0,_loc2_ - 1);
                  _loc1_ = this.zombieData.zombiestaticInfo.deathActionIDList[_loc3_];
               }
               addAction(_loc1_,false);
               setAction(_loc1_,[getActionID()]);
               this.zombieData.isFinishDying = true;
               setShadeVisible(false);
            }
         }
      }
      
      public function addTooltip() : void
      {
         addMouseEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         addMouseEventListener(MouseEvent.CLICK,this.onClick);
         addMouseEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         setMouseEnable(true);
      }
      
      private function cleanTooltip() : void
      {
         removeMouseEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         removeMouseEventListener(MouseEvent.CLICK,this.onClick);
         removeMouseEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         setMouseEnable(false);
      }
      
      private function onClick() : void
      {
      }
      
      private function onRollOver() : void
      {
         this.dispatchEvent(new MouseEvent(MouseEvent.ROLL_OVER));
         var _loc1_:Point = frontLayer.localToGlobal(new Point());
         ToolTipManager.CreateToolTip("<b>" + this.zombieData.zombiestaticInfo.name + "</b>\n" + this.zombieData.zombiestaticInfo.desc,_loc1_.x - 50,_loc1_.y);
      }
      
      private function onRollOut() : void
      {
         ToolTipManager.DestroyToolTip();
      }
      
      public function lootItem() : void
      {
         var _loc3_:Array = null;
         var _loc4_:Point = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:int = this.zombieData.zombiestaticInfo.getLootItemID(Math.random());
         if(_loc1_ != 0)
         {
            TDItemCmd.showLootItemAt(_loc1_,x,y);
         }
         if(objectModel.hasFuel)
         {
            TDItemCmd.showLootItemAt(TDConstant.UnitType_Leaf,x,y);
            TDSoundCmd.dropLeaf();
         }
         if(objectModel.dropCard)
         {
            _loc3_ = [];
            _loc3_[TDConstant.GameObject_Prop_DropCardId] = objectModel.dropCard;
            TDItemCmd.showLootItemAt(TDConstant.UnitType_DropCard,x,y,_loc3_);
         }
         var _loc2_:Number = Math.PI / (this.zombieData.storeSun / 100 + 1);
         while(this.zombieData.storeSun > 0)
         {
            _loc4_ = Point.polar(100,Math.PI + _loc2_ * this.zombieData.storeSun / 100);
            _loc4_ = new Point(this.x + _loc4_.x,this.y + _loc4_.y);
            TDGameObjectCmd.generateSun(TDConstant.UnitType_Sun,this.x,this.y,_loc4_.x,_loc4_.y);
            this.zombieData.storeSun -= 100;
         }
         if(TDStageInfo.getInstance().tdGameType == TDConstant.TDGameType_NoSun)
         {
            _loc5_ = TDMiniGameNoSunData.getInstance().getDropSunByZombieType(objectModel.unitType);
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               TDItemCmd.showLootItemAt(TDConstant.UnitType_PlantSun,x,y - damageArea.height * 0.5);
               _loc6_++;
            }
         }
      }
      
      public function updateHowl() : void
      {
         if(this.zombieData.isDying)
         {
            return;
         }
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(this._howlTime == -1)
         {
            this._howlTime = _loc1_;
         }
         if(_loc1_ - this._howlTime > 2400)
         {
            this._howlTime = _loc1_;
            if(Math.random() < 0.1)
            {
               TDSoundCmd.zombieHowl();
            }
         }
      }
      
      override public function dispose(param1:Boolean = true) : void
      {
         if(this.zombieData.zombiestaticInfo.hasParam(TDConstant.Zombie_Param_isStopCheckEndGame))
         {
            TDGameCmd.isStopCheckEndTDGame(false);
         }
         this.cleanTooltip();
         super.dispose(param1);
      }
      
      override public function setLocation(param1:Number, param2:Number) : void
      {
         if(this.zombieData.checkState(TDConstant.TDUnitState_Block))
         {
            return;
         }
         super.setLocation(param1,param2);
         CommandDispatcher._dispatcher.dispatchEvent(new TriggerEvent(TDTrigConst.TYPE_ZOMBIE_MOVE,[this]));
         CommandDispatcher.send(CommandName.TD_Zombie_Move,[this]);
         setHPBarLoaction(param1,param2);
      }
   }
}
