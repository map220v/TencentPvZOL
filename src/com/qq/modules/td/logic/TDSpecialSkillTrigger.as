package com.qq.modules.td.logic
{
   import asgui.resources.AssetManager;
   import com.greensock.TweenMax;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.plant.HayrickPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.view.game.layer.floor.TDFloorManager;
   import com.qq.utils.UtilsManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class TDSpecialSkillTrigger
   {
      
      private static var _instance:TDSpecialSkillTrigger;
       
      
      public var targetUID:int;
      
      private var _curTileIndex:int;
      
      private var _point:Point;
      
      private var _delayTimerID:int = -1;
      
      private var _linkPlantList:Array;
      
      public function TDSpecialSkillTrigger()
      {
         super();
         this._point = new Point();
      }
      
      public static function getInstance() : TDSpecialSkillTrigger
      {
         if(_instance == null)
         {
            _instance = new TDSpecialSkillTrigger();
         }
         return _instance;
      }
      
      public function start() : void
      {
         if(!TDStageInfo.getInstance().checkGameType(TDConstant.TDgameType_Param_hasPlantSpecialSkill))
         {
            return;
         }
         this._curTileIndex = -1;
         GameGloble.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      public function stop() : void
      {
         GameGloble.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      public function clean() : void
      {
         this.resetLinkPlant();
         this.stop();
      }
      
      public function checkRemovePlant(param1:int) : void
      {
         if(param1 == this.targetUID)
         {
            this.hideSpecialSkillPanel();
         }
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(TDGameInfo.getInstance().fuel.get() == 0)
         {
            return;
         }
         this.updateState(false);
      }
      
      public function updateState(param1:Boolean = false) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:BasicPlant = null;
         if(!TDGameInfo.getInstance().isRunningGame)
         {
            if(TDSpecialSkillTrigger.getInstance().targetUID != -1)
            {
               this.hideSpecialSkillPanel();
            }
            return;
         }
         if(TDGameInfo.getInstance().dragMode != TDConstant.MouseDragMode_None)
         {
            return;
         }
         if(TDUILayerManager.effectLayer == null)
         {
            return;
         }
         this._point.x = GameGloble.stage.mouseX;
         this._point.y = GameGloble.stage.mouseY;
         this._point = TDUILayerManager.effectLayer.globalToLocal(this._point);
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByScreenPos(this._point.x,this._point.y);
         if(_loc2_ != null)
         {
            if(param1 || this._curTileIndex != _loc2_.index)
            {
               this._curTileIndex = _loc2_.index;
               _loc3_ = TDGameInfo.getInstance().getPlantByTileIndex(this._curTileIndex);
               if(_loc3_.length > 0)
               {
                  _loc4_ = _loc3_.length;
                  _loc5_ = 0;
                  while(_loc5_ < _loc4_)
                  {
                     _loc6_ = _loc3_[_loc5_] as BasicPlant;
                     if(this.getIsCanShowSkillPanel(_loc6_))
                     {
                        this.showSpecialSkillPanel(_loc6_,param1);
                        _loc5_ = _loc4_;
                     }
                     _loc5_++;
                  }
               }
               else
               {
                  this.hideSpecialSkillPanel();
               }
            }
         }
         else
         {
            this._curTileIndex = -1;
            this.hideSpecialSkillPanel();
         }
      }
      
      private function getIsCanShowSkillPanel(param1:BasicPlant) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc2_:* = Boolean(param1 && param1.plantData.plantStaticInfo.baseInfo.usefulness != TDConstant.PlantUsefulness_Container);
         if(_loc2_)
         {
            if(param1.objectModel.unitType == TDConstant.PlantType_CoconutCannon)
            {
               _loc3_ = param1.getRunningProp(TDConstant.Gameobject_Prop_IsSleeping);
               _loc2_ = Boolean(_loc3_);
            }
            else if(param1.objectModel.unitType == TDConstant.PlantType_PrismGrass)
            {
               _loc3_ = param1.getRunningProp(TDConstant.Gameobject_Prop_IsSleeping);
               _loc2_ = !_loc3_;
            }
         }
         return _loc2_;
      }
      
      public function updatePosAt(param1:int, param2:int) : void
      {
         var _loc3_:BasicPlant = TDGameInfo.getInstance().getPlantByPos(param1,param2);
         this.showSpecialSkillPanel(_loc3_);
      }
      
      private function cleanDelay() : void
      {
         if(this._delayTimerID != -1)
         {
            clearTimeout(this._delayTimerID);
            this._delayTimerID = -1;
         }
      }
      
      public function showSpecialSkillPanel(param1:BasicPlant, param2:Boolean = false) : void
      {
         this.cleanDelay();
         if(param2)
         {
            this.onShowSpecialSkillPanel(param1);
         }
         else
         {
            this._delayTimerID = setTimeout(this.onShowSpecialSkillPanel,500,param1);
         }
      }
      
      private function onShowSpecialSkillPanel(param1:BasicPlant) : void
      {
         if(!this.meetSpecialSkillRequirement(param1,true))
         {
            return;
         }
         TDGameObjectCmd.showSpecialSkillPanel(param1.x,param1.y,param1.uid);
      }
      
      public function releaseSpecialSkill(param1:int) : void
      {
         var _loc4_:Array = null;
         var _loc5_:TDMapTileData = null;
         var _loc6_:BasicPlant = null;
         var _loc7_:int = 0;
         if(TDGameInfo.getInstance().dragMode != TDConstant.MouseDragMode_None)
         {
            return;
         }
         var _loc2_:BasicPlant = TDGameInfo.getInstance().getGameObjctByUID(param1) as BasicPlant;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:Vector.<TDMapTileData> = TDFloorManager.instance.getLinkPowerTile(_loc2_.objectModel.column,_loc2_.objectModel.roadIndex);
         for each(_loc5_ in _loc3_)
         {
            if((_loc4_ = TDGameInfo.getInstance().getPlantByTileIndex(_loc5_.index)).length > 0)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc4_.length)
               {
                  if(!(_loc4_[_loc7_] is HayrickPlant))
                  {
                     _loc6_ = _loc4_[_loc7_];
                     if(_loc2_.getActionID() == _loc2_.plantData.plantStaticInfo.baseInfo.specialActionName)
                     {
                        return;
                     }
                  }
                  _loc7_++;
               }
            }
         }
         this.addLinkPlant(param1);
         this.hideSpecialSkillPanel();
         TDGameObjectCmd.releaseSpecialSkill(_loc2_.uid);
         this.playLeafEffect(_loc2_.x,_loc2_.y - 40);
      }
      
      public function hideSpecialSkillPanel() : void
      {
         this.cleanDelay();
         TDGameObjectCmd.hideSpeicalSkillPanel();
      }
      
      public function meetSpecialSkillRequirement(param1:BasicPlant, param2:Boolean) : Boolean
      {
         if(param1 == null || !param1.isVaild || param1.isSleep)
         {
            return false;
         }
         if(param1.plantData.plantStaticInfo.baseInfo.specialActionName.length == 0)
         {
            return false;
         }
         if(TDGameInfo.getInstance().fuel.get() <= 0 && param2)
         {
            return false;
         }
         if(param1.plantData.plantStaticInfo.baseInfo.specialActionName == param1.getActionID())
         {
            return false;
         }
         return true;
      }
      
      public function runSpecialSkill(param1:BasicPlant) : void
      {
         var _loc2_:IGameObject = null;
         if(param1 == null)
         {
            return;
         }
         if(param1.plantData.plantStaticInfo.baseInfo.specialActionName.length > 0)
         {
            if(param1.getActionID() == param1.plantData.plantStaticInfo.baseInfo.specialActionName)
            {
               return;
            }
            param1.switchAction(param1.plantData.plantStaticInfo.baseInfo.specialActionName);
            _loc2_ = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,TDConstant.UnitType_PlantFoodEffect);
            _loc2_.objectModel.setParamValue(TDConstant.GameObjectData_Param_SpecialSkillPlantUIN,param1.uid);
            _loc2_.x = param1.x;
            _loc2_.y = param1.y;
            TDUILayerManager.bottomEffectLayer.addGameObjectTolayer(_loc2_);
            TDGameInfo.getInstance().addGameobjectToMap(_loc2_);
         }
      }
      
      private function playLeafEffect(param1:int, param2:int) : void
      {
         var _loc3_:MovieClip = AssetManager.instance.GetNewClass("TDUI_PlantFood") as MovieClip;
         TDUILayerManager.topSceneLayer.addChild(_loc3_);
         TweenMax.fromTo(_loc3_,1,{
            "x":TDGameInfo.getInstance().leafTargetX,
            "y":TDGameInfo.getInstance().leafTargetY
         },{
            "x":param1,
            "y":param2,
            "onComplete":this.onFinishLeafFly,
            "onCompleteParams":[_loc3_]
         });
      }
      
      private function onFinishLeafFly(param1:DisplayObject) : void
      {
         TweenMax.to(param1,1,{
            "alpha":0,
            "onComplete":this.onLeafDisappear,
            "onCompleteParams":[param1]
         });
      }
      
      private function onLeafDisappear(param1:DisplayObject) : void
      {
         if(param1 != null)
         {
            UtilsManager.removeFromContainer(param1);
         }
      }
      
      public function finishSpecialSkill(param1:BasicPlant) : void
      {
         var _loc2_:Vector.<TDMapTileData> = null;
         var _loc3_:Array = null;
         var _loc4_:TDMapTileData = null;
         var _loc5_:BasicPlant = null;
         var _loc6_:int = 0;
         if(this.containLinkPlant(param1.uid))
         {
            this.removeLinkPlant(param1.uid);
            _loc2_ = TDFloorManager.instance.getLinkPowerTile(param1.objectModel.column,param1.objectModel.roadIndex);
            for each(_loc4_ in _loc2_)
            {
               _loc3_ = TDGameInfo.getInstance().getPlantByTileIndex(_loc4_.index);
               if(_loc3_.length > 0)
               {
                  _loc6_ = 0;
                  while(_loc6_ < _loc3_.length)
                  {
                     if(!(_loc3_[_loc6_] is HayrickPlant))
                     {
                        _loc5_ = _loc3_[_loc6_];
                     }
                     _loc6_++;
                  }
                  if(param1 != _loc5_)
                  {
                     TDGameObjectCmd.releaseSpecialSkill(_loc5_.uid,false);
                  }
               }
            }
         }
      }
      
      public function resetLinkPlant() : void
      {
         this._linkPlantList = new Array();
      }
      
      public function addLinkPlant(param1:int) : void
      {
         if(this._linkPlantList == null)
         {
            return;
         }
         if(!this.containLinkPlant(param1))
         {
            this._linkPlantList.push(param1);
         }
      }
      
      public function containLinkPlant(param1:int) : Boolean
      {
         if(this._linkPlantList == null)
         {
            return false;
         }
         return this._linkPlantList.indexOf(param1) != -1;
      }
      
      public function removeLinkPlant(param1:int) : void
      {
         if(this._linkPlantList == null)
         {
            return;
         }
         var _loc2_:int = this._linkPlantList.indexOf(param1);
         if(_loc2_ != -1)
         {
            this._linkPlantList.splice(_loc2_,1);
         }
      }
   }
}
