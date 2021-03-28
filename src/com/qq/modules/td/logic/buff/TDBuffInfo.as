package com.qq.modules.td.logic.buff
{
   import asgui.blit.Blit;
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.blit.display.IBlitDisplayObject;
   import com.greensock.TweenMax;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDElementType;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.data.GlobelProtectValue;
   import com.qq.modules.td.data.game.buff.TDBuffStaticInfo;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.effects.TDEffectPlayInfo;
   import com.qq.utils.UrlManager;
   import com.qq.utils.blit.QBlitUI;
   import com.qq.utils.db.ClientDBTableName;
   import flash.geom.Point;
   import org.as3commons.logging.api.getLogger;
   
   public class TDBuffInfo
   {
       
      
      public var buffStaticInfo:TDBuffStaticInfo;
      
      private var _removeTime:Number;
      
      private var _lastUpdateTime:Number;
      
      protected var _target:IGameObject;
      
      private var _effect:IBlitDisplayContainer;
      
      private var _dynamicParam:Array;
      
      public function TDBuffInfo()
      {
         super();
      }
      
      public function init(param1:int, param2:IGameObject, param3:IGameObject) : void
      {
         this.buffStaticInfo = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_TDBuffInfo,param1,TDBuffStaticInfo);
         this._target = param2;
         this._dynamicParam = new Array();
         this.resetEndTime(param3);
      }
      
      public function dispose() : void
      {
         this.onRemovedBuffEffect();
         this._target = null;
         this._dynamicParam = null;
      }
      
      public function update() : void
      {
         if(this._target == null)
         {
            getLogger("TD").debug("buff目标不存在");
            return;
         }
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(this.buffStaticInfo.duration.get() != 0)
         {
            if(_loc1_ > this._removeTime)
            {
               this.onBuffRunningEffect();
               if(this._target)
               {
                  this._target.objectModel.removeBuff(this.buffStaticInfo.id);
               }
               return;
            }
         }
         if(_loc1_ - this._lastUpdateTime >= 500)
         {
            this._lastUpdateTime = _loc1_;
            this.onBuffRunningEffect();
         }
      }
      
      public function onAddedBuffEffect() : void
      {
         var _loc1_:String = null;
         var _loc2_:TDMapTileData = null;
         var _loc3_:IBlitClip = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:IBlitDisplayObject = null;
         var _loc7_:Point = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if(this._target == null)
         {
            getLogger("TD").debug("buff目标不存在");
            return;
         }
         switch(this.buffStaticInfo.catalog)
         {
            case TDConstant.TDBuffType_Heal:
               if(this.buffStaticInfo.hasParam(TDConstant.TDBuffParam_effectUrl))
               {
                  _loc1_ = this.buffStaticInfo.getParam(TDConstant.TDBuffParam_effectUrl);
                  this._effect = TDFactory.playBlitDisplay(_loc1_,this._target.x,this._target.y,0,true);
               }
               break;
            case TDConstant.TDBuffType_Frozen:
               this._target.setFrozenAI(true);
               this._target.animation.stop();
               break;
            case TDConstant.TDBuffType_Wet:
               this._target.animation.setBoneVisibleRule("torch_fire_*",false);
               this._target.animation.setBoneVisibleRule("torch_end_lit",false);
               break;
            case TDConstant.TDBuffType_Decelerate:
               if(this._target.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie)
               {
                  this._target.objectModel.speedChangeValue = this.buffStaticInfo.effectValue.get() * 0.01 * this._target.getCurSpeed();
                  this._target.setRunningProp(TDConstant.GameObject_Prop_ChangeMoveSpeed,1);
               }
               break;
            case TDConstant.TDBuffType_Accelerate:
               if(this._target.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie)
               {
                  this._target.objectModel.speedChangeValue = this.buffStaticInfo.effectValue.get() * 0.01 * this._target.getCurSpeed();
                  this._target.setRunningProp(TDConstant.GameObject_Prop_ChangeMoveSpeed,1);
                  _loc1_ = UrlManager.getInstance().getUrl(UrlManager.Url_TD_EFFECTS,this.buffStaticInfo.getParam(TDConstant.TDBuffParam_effectUrl));
                  this._effect = Blit.factory.CreateBlitContainer();
                  this._effect.AddChildAt(QBlitUI.createClipFromUrl(_loc1_),0);
                  this._target.frontLayer.addChildAt(this._effect.asset,0);
               }
               break;
            case TDConstant.TDBuffType_Stun:
               this._target.setFrozenAI(true);
               this._target.animation.setBoneVisibleRule("torch_fire_*",false);
               this._target.animation.setBoneVisibleRule("torch_end_lit",false);
               this._target.animation.stop();
               break;
            case TDConstant.TDBuffType_Butter:
               this._target.setFrozenAI(true);
               this._target.animation.stop();
               _loc1_ = UrlManager.getInstance().getUrl(UrlManager.Url_TD_EFFECTS,this.buffStaticInfo.getParam(TDConstant.TDBuffParam_effectUrl));
               this._effect = Blit.factory.CreateBlitContainer();
               _loc3_ = QBlitUI.createClipFromUrl(_loc1_);
               _loc3_.autoUpdatePosition = false;
               this._effect.AddChildAt(_loc3_,0);
               if(this._target.objectModel.staticInfo.butterPosList.length != 0)
               {
                  _loc5_ = 0;
                  while(_loc5_ < this._target.objectModel.staticInfo.butterPosList.length)
                  {
                     _loc4_ = this._target.objectModel.staticInfo.butterPosList[_loc5_];
                     if(_loc6_ = this._target.animation.getBoneClone(_loc4_[0]))
                     {
                        (_loc7_ = new Point()).x = _loc6_.x + this._target.animation.bone.asset.x;
                        _loc7_.y = _loc6_.y + this._target.animation.bone.asset.y;
                        this._effect.asset.x = _loc7_.x + int(_loc4_[1]) * 0.55;
                        this._effect.asset.y = _loc7_.y + int(_loc4_[2]) * 0.55;
                        break;
                     }
                     _loc5_++;
                  }
               }
               this._target.frontLayer.addChild(this._effect.asset);
               break;
            case TDConstant.TDBuffType_Poisoned:
               _loc1_ = UrlManager.getInstance().getUrl(UrlManager.Url_TD_EFFECTS,this.buffStaticInfo.getParam(TDConstant.TDBuffParam_effectUrl));
               this._effect = Blit.factory.CreateBlitContainer();
               this._effect.AddChildAt(QBlitUI.createClipFromUrl(_loc1_),0);
               this._target.frontLayer.addChild(this._effect.asset);
               break;
            case TDConstant.TDBuffType_OxygenSupplying:
               _loc2_ = TDGameInfo.getInstance().getRoadTileByGamePos(this._target.x,this._target.y);
               if(_loc2_ && _loc2_.hasState(TDConstant.RoadTileState_Supply_Oxygen) == false && this._target is BasicPlant && (this._target as BasicPlant).plantData.plantStaticInfo.baseInfo.isSeaPlant == 0)
               {
                  _loc1_ = UrlManager.getInstance().getUrl(UrlManager.Url_TD_EFFECTS,this.buffStaticInfo.getParam(TDConstant.TDBuffParam_effectUrl));
                  this._effect = Blit.factory.CreateBlitContainer();
                  this._effect.AddChildAt(QBlitUI.createClipFromUrl(_loc1_),0);
                  this._target.frontLayer.addChild(this._effect.asset);
               }
               break;
            case TDConstant.TDBuffType_BubbleSrounding:
            case TDConstant.TDBuffType_Special_BubbleSrounding:
               _loc1_ = UrlManager.getInstance().getUrl(UrlManager.Url_TD_EFFECTS,this.buffStaticInfo.getParam(TDConstant.TDBuffParam_effectUrl));
               this._effect = Blit.factory.CreateBlitContainer();
               this._effect.AddChildAt(QBlitUI.createClipFromUrl(_loc1_),0);
               this._target.frontLayer.addChild(this._effect.asset);
               break;
            case TDConstant.TDBuffType_StormDown:
               _loc1_ = UrlManager.getInstance().getUrl(UrlManager.Url_TD_EFFECTS,this.buffStaticInfo.getParam(TDConstant.TDBuffParam_effectUrl));
               this._effect = Blit.factory.CreateBlitContainer();
               this._effect.AddChildAt(QBlitUI.createClipFromUrl(_loc1_),0);
               this._target.frontLayer.addChild(this._effect.asset);
               this._effect.asset.y = this._target.damageArea.y + this._target.damageArea.height * 0.5;
         }
         this.addElementEffect();
         if(this.buffStaticInfo.hasParam(TDConstant.TDBuffParam_addState))
         {
            _loc8_ = this.buffStaticInfo.getParam(TDConstant.TDBuffParam_addState);
            this._target.objectModel.setState(_loc8_);
         }
         if(this.buffStaticInfo.removeBuffList.length > 0)
         {
            for each(_loc9_ in this.buffStaticInfo.removeBuffList)
            {
               this._target.objectModel.removeBuff(_loc9_);
            }
         }
      }
      
      public function onBuffRunningEffect() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(this._target == null)
         {
            getLogger("TD").debug("buff目标不存在");
            return;
         }
         if(this.buffStaticInfo.catalog == TDConstant.TDBuffType_Heal)
         {
            if(this.buffStaticInfo.effectValue.get() > 0)
            {
               _loc1_ = this.buffStaticInfo.effectValue.get() * GlobelProtectValue.getInstance().get(GlobelProtectValue.KEY_VALUE_001);
               _loc1_ = GlobelProtectValue.getInstance().get(GlobelProtectValue.KEY_FIGHTPOWER) * _loc1_;
               this._target.changeHp(_loc1_,TDConstant.AttackType_Magic,TDConstant.AttackMode_Normal,null);
            }
         }
         if(this.buffStaticInfo.catalog == TDConstant.TDBuffType_Stun)
         {
            if(!this._target.isFrozenAI())
            {
               this._target.setFrozenAI(true);
               this._target.animation.stop();
            }
         }
         if(this.buffStaticInfo.catalog == TDConstant.TDBuffType_Frozen)
         {
            if(!this._target.isFrozenAI())
            {
               this._target.setFrozenAI(true);
               this._target.animation.stop();
            }
         }
         if(this.buffStaticInfo.catalog == TDConstant.TDBuffType_Poisoned)
         {
            if(this.buffStaticInfo.effectValue.get() < 0 && (this._target.objectModel.unitType != TDConstant.PlantType_Nuts || !(this._target is BasicPlant && (this._target as BasicPlant).isSleep)))
            {
               _loc2_ = this.buffStaticInfo.effectValue.get();
               this._target.changeHp(_loc2_,TDConstant.AttackType_Magic,TDConstant.AttackMode_Normal,null);
            }
         }
         if(this.buffStaticInfo.catalog == TDConstant.TDBuffType_ShortOfOxygen)
         {
            if(!this._target.objectModel.hasBuff(TDConstant.TDBuffID_OxygenSupplyedTemp) && !this._target.objectModel.hasBuff(TDConstant.TDBuffID_OxygenSupplyedAlways) && this.buffStaticInfo.effectValue.get() < 0)
            {
               _loc2_ = this.buffStaticInfo.effectValue.get();
               this._target.changeHp(_loc2_,TDConstant.AttackType_Magic,TDConstant.AttackMode_Normal,null);
            }
         }
         if(this.buffStaticInfo.catalog == TDConstant.TDBuffType_BubbleSrounding || this.buffStaticInfo.catalog == TDConstant.TDBuffType_Special_BubbleSrounding)
         {
            if(!this._target.isFrozenAI())
            {
               this._target.setFrozenAI(true);
               this._target.animation.stop();
            }
            _loc2_ = this.buffStaticInfo.effectValue.get();
            TDDamageCaculete.executeDamage(this._target,_loc2_,TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,null);
         }
         if(this.buffStaticInfo.catalog == TDConstant.TDBuffType_StormDown)
         {
            if(this._target is BasicPlant)
            {
               (this._target as BasicPlant).plantData.resetDuration();
               (this._target as BasicPlant).plantData.addDurationPlus(this.buffStaticInfo.effectValue.get() * 0.01);
            }
         }
         if(this.buffStaticInfo.catalog == TDConstant.TDBuffType_Plant_AttackSpeed_Up)
         {
            if(this._target is BasicPlant)
            {
               (this._target as BasicPlant).plantData.resetDuration();
               (this._target as BasicPlant).plantData.addDurationPlus(-this.buffStaticInfo.effectValue.get() * 0.01);
            }
         }
      }
      
      public function onRemovedBuffEffect() : void
      {
         var _loc1_:int = 0;
         if(this._target == null)
         {
            getLogger("TD").debug("buff目标不存在");
            return;
         }
         if(this._effect != null)
         {
            TweenMax.to(this._effect,1,{
               "alpha":0,
               "onComplete":this.onRemoveEffectComplete,
               "onCompleteParams":[this._effect]
            });
            this._effect = null;
         }
         switch(this.buffStaticInfo.catalog)
         {
            case TDConstant.TDBuffType_Heal:
               break;
            case TDConstant.TDBuffType_Frozen:
               if(this._target && this._target.animation)
               {
                  this._target.animation.play(this._target.animation.lastLoop,true);
                  if(this._target.hasFilter(TDConstant.TDFilter_FrozenEffect))
                  {
                     this._target.removeFilter(TDConstant.TDFilter_FrozenEffect);
                  }
               }
               this._target.setFrozenAI(false);
               break;
            case TDConstant.TDBuffType_Decelerate:
               if(this._target.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie)
               {
                  this._target.objectModel.speedChangeValue = 0;
                  this._target.setRunningProp(TDConstant.GameObject_Prop_ChangeMoveSpeed,1);
               }
               break;
            case TDConstant.TDBuffType_Accelerate:
               if(this._target.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie)
               {
                  this._target.objectModel.speedChangeValue = 0;
                  this._target.setRunningProp(TDConstant.GameObject_Prop_ChangeMoveSpeed,1);
               }
               break;
            case TDConstant.TDBuffType_Stun:
               if(this._target && this._target.animation)
               {
                  this._target.animation.play(this._target.animation.lastLoop,true);
               }
               this._target.setFrozenAI(false);
               break;
            case TDConstant.TDBuffType_Butter:
               if(this._target && this._target.animation)
               {
                  this._target.animation.play(this._target.animation.lastLoop,true);
               }
               this._target.setFrozenAI(false);
               break;
            case TDConstant.TDBuffType_BubbleSrounding:
               if(this._dynamicParam[TDConstant.TDBuffParam_electric] != true)
               {
                  if(!this._target.objectModel.hasBuff(TDConstant.TDBuffID_Special_BubbleSround))
                  {
                     TDEffectCmd.playBlitAnimation(TDObjTypeID.Obj_Bubble_Normal_Split,this._target.x,this._target.y - this._target.damageArea.height * 0.5,new TDEffectPlayInfo("animation"));
                  }
               }
               if(this._target && this._target.animation)
               {
                  this._target.animation.play(this._target.animation.lastLoop,true);
               }
               this._target.setFrozenAI(false);
               break;
            case TDConstant.TDBuffType_Special_BubbleSrounding:
               if(this._dynamicParam[TDConstant.TDBuffParam_electric] != true)
               {
                  if(!this._target.objectModel.hasBuff(TDConstant.TDBuffID_BubbleSround))
                  {
                     TDEffectCmd.playBlitAnimation(TDObjTypeID.Obj_Bubble_Normal_Split,this._target.x,this._target.y - this._target.damageArea.height * 0.5,new TDEffectPlayInfo("animation"));
                  }
               }
               if(this._target && this._target.animation)
               {
                  this._target.animation.play(this._target.animation.lastLoop,true);
               }
               this._target.setFrozenAI(false);
               break;
            case TDConstant.TDBuffType_StormDown:
               if(this._target && this._target is BasicPlant)
               {
                  (this._target as BasicPlant).plantData.resetDuration();
               }
               break;
            case TDConstant.TDBuffType_Plant_AttackSpeed_Up:
               if(this._target && this._target is BasicPlant)
               {
                  (this._target as BasicPlant).plantData.resetDuration();
               }
         }
         this.removeElementEffect();
         if(this.buffStaticInfo.hasParam(TDConstant.TDBuffParam_addState))
         {
            _loc1_ = this.buffStaticInfo.getParam(TDConstant.TDBuffParam_addState);
            this._target.objectModel.cleanState(_loc1_);
         }
      }
      
      private function onRemoveEffectComplete(param1:IBlitDisplayContainer) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.Dispose();
      }
      
      private function addElementEffect() : void
      {
         switch(this.buffStaticInfo.elementType)
         {
            case TDElementType.ICE_TYPE:
               this._target.animation.setBoneVisibleRule("torch_fire_*",false);
               this._target.animation.setBoneVisibleRule("torch_end_lit",false);
         }
      }
      
      private function removeElementEffect() : void
      {
         switch(this.buffStaticInfo.elementType)
         {
            case TDElementType.ICE_TYPE:
               if(this._target.hasFilter(TDConstant.TDFilter_FrozenEffect))
               {
                  this._target.removeFilter(TDConstant.TDFilter_FrozenEffect);
               }
         }
      }
      
      public function resetEndTime(param1:IGameObject = null) : void
      {
         this._lastUpdateTime = TDGameInfo.getInstance().getCurGameTime();
         if(param1 && param1 is BasicPlant)
         {
            this._removeTime = this._lastUpdateTime + TalentManager.instance.getBuffTime((param1 as BasicPlant).plantData.plantStaticInfo,this.buffStaticInfo);
         }
         else
         {
            this._removeTime = this._lastUpdateTime + this.buffStaticInfo.duration.get();
         }
      }
      
      public function setDynamicParam(param1:int, param2:*) : void
      {
         this._dynamicParam[param1] = param2;
      }
      
      public function getDynamicParam(param1:int) : *
      {
         return this._dynamicParam[param1];
      }
   }
}
