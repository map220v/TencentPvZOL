package com.qq.modules.td.view.game.layer
{
   import asgui.core.IDisposable;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.view.MixLayer;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.modules.td.view.components.TDChallengeScorePanel;
   import com.qq.modules.td.view.components.TDCoconutScorePanel;
   import com.qq.modules.td.view.components.TDEndlessScorePanel;
   import com.qq.modules.td.view.components.TDHammerPanle;
   import com.qq.modules.td.view.components.TDLimitCountCardSlotPanel;
   import com.qq.modules.td.view.components.TDRollingTrack;
   import com.qq.modules.td.view.components.TDSkillPlantPanel;
   import com.qq.modules.td.view.components.TDWindForcePanel;
   import com.qq.modules.td.view.components.TDYetiKeyPanel;
   import com.qq.modules.td.view.components.TdUiPlantsTrack;
   import com.qq.modules.td.view.game.ui.TDGameInfoPanel;
   import com.qq.modules.td.view.game.ui.TDShovelPanel;
   import com.qq.modules.td.view.ui.mini.TDMusicGameScorePanel;
   import com.qq.utils.UtilsManager;
   import flash.display.DisplayObject;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import org.robotlegs.extend.command.RobotlegExtendCmd;
   
   public class TDGameUILayer extends TDBasicLayer
   {
       
      
      public var panels:Vector.<ITDLocationUpdatable>;
      
      public var shovelInfoPanel:TDShovelPanel;
      
      public var yetiKeyPanel:TDYetiKeyPanel;
      
      public function TDGameUILayer()
      {
         super();
         RobotlegExtendCmd.registerMapView(getDefinitionByName(getQualifiedClassName(this)),TDGameUILayerMediator);
         RobotlegExtendCmd.createMediator(this);
      }
      
      override public function Dispose() : void
      {
         this.cleanPanel();
         super.Dispose();
         RobotlegExtendCmd.removeMediatorByView(this);
      }
      
      override protected function init() : void
      {
         super.init();
         this.name = "TDGameUILayer";
      }
      
      private function cleanPanel() : void
      {
         var _loc1_:ITDLocationUpdatable = null;
         for each(_loc1_ in this.panels)
         {
            UtilsManager.removeFromContainer(_loc1_);
            if(_loc1_ is IDisposable)
            {
               (_loc1_ as IDisposable).Dispose();
            }
         }
         this.panels = null;
         if(this.shovelInfoPanel != null)
         {
            UtilsManager.removeFromContainer(this.shovelInfoPanel);
            this.shovelInfoPanel.Dispose();
            this.shovelInfoPanel = null;
         }
         if(this.yetiKeyPanel != null)
         {
            UtilsManager.removeFromContainer(this.yetiKeyPanel);
            this.yetiKeyPanel.Dispose();
            this.yetiKeyPanel = null;
         }
      }
      
      public function initUI() : void
      {
         var _loc1_:ITDLocationUpdatable = null;
         var _loc2_:* = false;
         this.cleanPanel();
         this.panels = new Vector.<ITDLocationUpdatable>();
         if(TDStageInfo.getInstance().checkGameType(TDConstant.TDgameType_Parma_hasNormalCardSlot) || TDStageInfo.getInstance().checkGameType(TDConstant.TDGameType_Jewels))
         {
            _loc1_ = new TDGameInfoPanel();
            (_loc1_ as TDGameInfoPanel).setVisible(false);
            if(_loc1_)
            {
               this.panels.push(_loc1_);
            }
            addMixLayer(_loc1_ as MixLayer);
         }
         else if(TDStageInfo.getInstance().checkGameType(TDConstant.TDgameType_Parma_hasMovableCardSlot))
         {
            if(TDStageInfo.getInstance().tdGameType == TDConstant.TDGameType_Rolling)
            {
               _loc1_ = new TDRollingTrack();
               addChild(_loc1_ as DisplayObject);
               if(_loc1_)
               {
                  this.panels.push(_loc1_);
               }
            }
            else
            {
               _loc1_ = new TdUiPlantsTrack();
               addChild(_loc1_ as DisplayObject);
               if(_loc1_)
               {
                  this.panels.push(_loc1_);
               }
            }
         }
         else if(TDStageInfo.getInstance().checkGameType(TDConstant.TDgameType_Param_hasLimitCountCardSlot))
         {
            _loc1_ = new TDLimitCountCardSlotPanel();
            addChild(_loc1_ as DisplayObject);
            if(_loc1_)
            {
               this.panels.push(_loc1_);
            }
         }
         if(TDStageInfo.getInstance().tdGameType == TDConstant.TDGameType_TerracottaMemory)
         {
            _loc1_ = new TDHammerPanle();
            addChild(_loc1_ as DisplayObject);
            if(_loc1_)
            {
               this.panels.push(_loc1_);
            }
         }
         else if(TDStageInfo.getInstance().tdGameType == TDConstant.TDGameType_CarrotRocketShooting)
         {
            _loc2_ = int(TDStageInfo.getInstance().stageParamXml.isHaveWind.@value) > 0;
            if(_loc2_)
            {
               _loc1_ = new TDWindForcePanel();
               addChild(_loc1_ as DisplayObject);
               if(_loc1_)
               {
                  this.panels.push(_loc1_);
               }
            }
         }
         else if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless)
         {
            _loc1_ = new TDSkillPlantPanel();
            addChild(_loc1_ as DisplayObject);
            if(_loc1_)
            {
               this.panels.push(_loc1_);
            }
            _loc1_ = new TDEndlessScorePanel();
            addChild(_loc1_ as DisplayObject);
            if(_loc1_)
            {
               this.panels.push(_loc1_);
            }
         }
         this.addScorePanel();
         this.addShovelPanel();
         this.addSkillPlantPanel();
      }
      
      public function updateLocation(param1:Boolean = false) : void
      {
         var _loc2_:ITDLocationUpdatable = null;
         var _loc3_:TDGameInfo = null;
         var _loc4_:int = 0;
         for each(_loc2_ in this.panels)
         {
            _loc2_.updateLocation();
         }
         if(this.shovelInfoPanel)
         {
            _loc3_ = TDGameInfo.getInstance();
            if(TDStageInfo.getInstance().checkGameType(TDConstant.TDgameType_Parma_hasMovableCardSlot))
            {
               this.shovelInfoPanel.setLocation(270 + 650 / GameGloble.scaleCurrent,8);
            }
            else
            {
               _loc4_ = _loc3_.friendCardsData.slotCardData.length + _loc3_.normalCardsData.slotCardData.length;
               this.shovelInfoPanel.setLocation(420 + 50 * _loc4_,8);
            }
         }
      }
      
      private function addScorePanel() : void
      {
         var _loc1_:ITDLocationUpdatable = null;
         if(TDStageInfo.getInstance().checkGameType(TDConstant.TDgameType_Param_hasScorePanel))
         {
            switch(TDStageInfo.getInstance().tdGameType)
            {
               case TDConstant.TDGameType_VOS:
                  _loc1_ = new TDMusicGameScorePanel();
                  addChild(_loc1_ as DisplayObject);
                  _loc1_.visible = false;
                  break;
               case TDConstant.TDGameType_CoconutCannonShooting:
                  if(!TDStageInfo.getInstance().isChallengeLevel())
                  {
                     _loc1_ = new TDCoconutScorePanel();
                     addChild(_loc1_ as DisplayObject);
                  }
            }
         }
         if(_loc1_ == null && TDStageInfo.getInstance().isChallengeLevel())
         {
            _loc1_ = new TDChallengeScorePanel();
            addChild(_loc1_ as DisplayObject);
         }
         if(_loc1_)
         {
            this.panels.push(_loc1_);
         }
      }
      
      public function addShovelPanel() : void
      {
         if(TDStageInfo.getInstance().checkGameType(TDConstant.TDgameType_Param_hasShovelPanel))
         {
            this.shovelInfoPanel = new TDShovelPanel();
            this.shovelInfoPanel.setVisible(false);
            this.shovelInfoPanel.y = 6;
            addMixLayer(this.shovelInfoPanel);
         }
      }
      
      public function addSkillPlantPanel() : void
      {
         var _loc1_:ITDLocationUpdatable = null;
         if((TDStageInfo.getInstance().startParam.gameType == TDStartParam.Normal || TDStageInfo.getInstance().startParam.gameType == TDStartParam.Daily) && !TDStageInfo.getInstance().hasGuide && TDStageInfo.getInstance().tdGameType == TDConstant.TDGameType_Normal)
         {
            _loc1_ = new TDSkillPlantPanel();
            addChild(_loc1_ as DisplayObject);
            this.panels.push(_loc1_);
         }
      }
   }
}
