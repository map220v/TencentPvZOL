package com.qq.modules.td.logic.unit.plant
{
   import asgui.resources.AssetManager;
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.sound.command.SoundCmd;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.game.ui.TDLevelBar;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DelayManager;
   import com.qq.utils.UtilsManager;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class OxygenAlagePlant extends BasicPlant
   {
      
      public static const SUPPLY_LEVEL_MAX:int = 4;
      
      public static const SUPPLY_AREA:Array = [[[0,0],[-1,0],[1,0],[0,-1],[0,1]],[[0,0],[-1,0],[1,0],[0,-1],[0,1],[-1,1],[-1,-1],[1,-1],[1,1]],[[0,0],[-1,0],[1,0],[0,-1],[0,1],[-1,1],[-1,-1],[1,-1],[1,1],[2,0],[-2,0],[0,2],[0,-2]],[[0,0],[-1,0],[1,0],[0,-1],[0,1],[-1,1],[-1,-1],[1,-1],[1,1],[2,0],[-2,0],[0,2],[0,-2],[-2,-2],[-2,-1],[2,-2],[2,-1],[-2,2],[-2,1],[2,2],[2,1],[-1,-2],[-1,2],[1,-2],[1,2]]];
       
      
      private var _supplyTileList:Vector.<TDMapTileData>;
      
      private var _supplyLevel:int = 1;
      
      private var _lastTile:TDMapTileData;
      
      private var _levelBar:TDLevelBar;
      
      private var _cding:Boolean;
      
      private var _indicateVec:Vector.<MovieClip>;
      
      public function OxygenAlagePlant()
      {
         this._supplyTileList = new Vector.<TDMapTileData>();
         this._indicateVec = new Vector.<MovieClip>();
         super();
      }
      
      public function showLevelBar() : void
      {
         this._levelBar = new TDLevelBar();
         _frontLayer.addChild(this._levelBar.levelBarMC.asset);
         this._levelBar.levelBarMC.x = damageArea.x + damageArea.width * 0.5 - this._levelBar.levelBarMC.width * 0.5;
         this._levelBar.levelBarMC.y = damageArea.y + damageArea.height - 3;
      }
      
      override public function dispose(param1:Boolean = true) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:TDMapTileData = null;
         var _loc6_:Boolean = false;
         var _loc7_:OxygenAlagePlant = null;
         var _loc8_:Array = null;
         var _loc9_:BasicPlant = null;
         if(this._levelBar)
         {
            this._levelBar.Dispose();
            this._levelBar = null;
         }
         if(param1)
         {
            _loc2_ = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Plant,TDConstant.PlantType_Oxygenalage);
            _loc3_ = TDGameInfo.getInstance().minCol;
            while(_loc3_ <= TDGameInfo.getInstance().maxCol)
            {
               _loc4_ = TDGameInfo.getInstance().minRow;
               while(_loc4_ <= TDGameInfo.getInstance().maxRow)
               {
                  if(_loc5_ = TDGameInfo.getInstance().getRoadTileInf(_loc3_,_loc4_))
                  {
                     _loc6_ = false;
                     for each(_loc7_ in _loc2_)
                     {
                        if(_loc7_ && _loc7_.uid != this.uid && _loc7_.objectModel.curHp.get() > 0)
                        {
                           if(_loc7_.isTileCovered(_loc5_))
                           {
                              _loc6_ = true;
                              break;
                           }
                        }
                     }
                     if(!_loc6_)
                     {
                        _loc5_.cleanState(TDConstant.RoadTileState_Supply_Oxygen);
                        _loc8_ = TDGameInfo.getInstance().getPlantByTileIndex(_loc5_.index);
                        for each(_loc9_ in _loc8_)
                        {
                           if(_loc9_ && _loc9_.plantData)
                           {
                              _loc9_.plantData.removeBuff(TDConstant.TDBuffID_OxygenSupplyedAlways);
                           }
                        }
                     }
                  }
                  _loc4_++;
               }
               _loc3_++;
            }
         }
         super.dispose(param1);
      }
      
      override public function update() : void
      {
         super.update();
         this.updateTileList();
      }
      
      public function supplyLevelup() : void
      {
         var _loc1_:String = null;
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         if(this._supplyLevel < SUPPLY_LEVEL_MAX)
         {
            _loc1_ = this.plantData.plantStaticInfo.baseInfo.getParamStr(TDConstant.Plant_Param_OxygenAlage_Cost_Sun);
            _loc2_ = _loc1_.split(",");
            _loc3_ = parseInt(_loc2_[this._supplyLevel - 1]) - TalentManager.instance.getCostCut(this.plantData.plantStaticInfo);
            if(TDGameInfo.getInstance().sun.get() < _loc3_)
            {
               CommonCmd.txtFly("阳光数不足，需要消耗" + _loc3_ + "点阳光");
            }
            else
            {
               TDGameCmd.changeSun(-_loc3_);
               ++this._supplyLevel;
               this.updateTileList(true);
               this._levelBar.setLevel(this._supplyLevel - 1);
               SoundCmd.playSound(TDSoundID.Oxygen_LevelUp);
            }
         }
      }
      
      public function isTileCovered(param1:TDMapTileData) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._supplyTileList.length)
         {
            if(this._supplyTileList[_loc2_].index == param1.index)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      private function updateTileList(param1:Boolean = false) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:BasicPlant = null;
         var _loc8_:TDMapTileData = null;
         var _loc9_:TDMapTileData = null;
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(this.x,this.y);
         if(_loc2_)
         {
            _loc3_ = false;
            if(param1)
            {
               _loc3_ = true;
            }
            else if(this._lastTile == null || this._lastTile.index != _loc2_.index)
            {
               _loc3_ = true;
               this._lastTile = _loc2_;
            }
            if(_loc3_)
            {
               this._supplyTileList = new Vector.<TDMapTileData>();
               _loc4_ = SUPPLY_AREA[this._supplyLevel - 1];
               for each(_loc5_ in _loc4_)
               {
                  if(_loc8_ = TDGameInfo.getInstance().getRoadTileInf(_loc2_.roadCol + _loc5_[0],_loc2_.roadRow + _loc5_[1]))
                  {
                     _loc8_.setState(TDConstant.RoadTileState_Supply_Oxygen);
                     this._supplyTileList.push(_loc8_);
                  }
               }
               _loc6_ = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
               for each(_loc7_ in _loc6_)
               {
                  if(_loc7_)
                  {
                     if((_loc9_ = TDGameInfo.getInstance().getRoadTileByGamePos(_loc7_.x,_loc7_.y)) && this.isTileCovered(_loc9_))
                     {
                        if(!_loc7_.plantData.hasBuff(TDConstant.TDBuffID_OxygenSupplyedAlways))
                        {
                           _loc7_.plantData.addBuff(TDConstant.TDBuffID_OxygenSupplyedAlways,this);
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function showIndicateArea() : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:TDMapTileData = null;
         var _loc5_:MovieClip = null;
         if(this._cding)
         {
            return;
         }
         var _loc1_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(this.x,this.y);
         if(_loc1_)
         {
            _loc2_ = SUPPLY_AREA[this._supplyLevel - 1];
            for each(_loc3_ in _loc2_)
            {
               if(_loc4_ = TDGameInfo.getInstance().getRoadTileInf(_loc1_.roadCol + _loc3_[0],_loc1_.roadRow + _loc3_[1]))
               {
                  _loc5_ = this.getIndicateInstance();
                  CommandDispatcher.send(CommandName.TDEffectCommand_AddMc,_loc5_);
                  _loc5_.x = _loc4_.rect.x;
                  _loc5_.y = _loc4_.rect.y;
                  this.playIndicateMc(_loc5_);
               }
            }
            this._cding = true;
            DelayManager.getInstance().addDelay(1500,this.removeCD);
         }
      }
      
      private function playIndicateMc(param1:MovieClip) : void
      {
         var indicateMc:MovieClip = param1;
         indicateMc.addEventListener(Event.ENTER_FRAME,function(param1:Event):void
         {
            if(indicateMc.currentFrame == indicateMc.totalFrames)
            {
               indicateMc.removeEventListener(Event.ENTER_FRAME,arguments.callee);
               indicateMc.stop();
               UtilsManager.removeFromContainer(indicateMc);
               _indicateVec.push(indicateMc);
            }
         });
         indicateMc.gotoAndPlay(1);
      }
      
      private function removeCD() : void
      {
         this._cding = false;
      }
      
      public function get supplyLevel() : int
      {
         return this._supplyLevel;
      }
      
      public function getIndicateInstance() : MovieClip
      {
         if(this._indicateVec && this._indicateVec.length > 0)
         {
            return this._indicateVec.shift();
         }
         return AssetManager.GetClass("TD_TileIndicateMC") as MovieClip;
      }
   }
}
