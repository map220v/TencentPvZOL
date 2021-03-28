package com.qq.modules.city.view.components
{
   import PVZ.Cmd.Dto_PlantInfo;
   import PVZ.Cmd.Dto_TopFightRoleInfo;
   import PVZ.Cmd.E_City_BuildingType;
   import PVZ.Cmd.ExchangeStoreType;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.managers.CursorManager;
   import asgui.serialization.json.JSON;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.SceneCenter;
   import com.qq.constant.SceneName;
   import com.qq.constant.city.CityConstant;
   import com.qq.modules.activity.model.ActivityCommonInfo;
   import com.qq.modules.activity.model.ActivityProxy;
   import com.qq.modules.bank.command.BankViewCmd;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.buffActivity.BuffActivityGlobal;
   import com.qq.modules.card.command.CardViewCmd;
   import com.qq.modules.city.CityGlobals;
   import com.qq.modules.city.constant.CityBuildConstant;
   import com.qq.modules.city.model.templates.BuildingTemplateFactory;
   import com.qq.modules.city.model.templates.ce.BuildingTemplateCE;
   import com.qq.modules.embattle.command.EmbattleCmd;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.exchange.command.ExchangeCmd;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.lab.model.LabProxy;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.mapinfo.command.MapInfoViewCmd;
   import com.qq.modules.rank.command.RankViewCmd;
   import com.qq.modules.sound.command.UISoundCmd;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.logic.talent.constant.TalentAdvancedConditionType;
   import com.qq.modules.topKing.TopKingConst;
   import com.qq.modules.topKing.command.TopKingCmd;
   import com.qq.modules.topKing.command.TopKingProxyCmd;
   import com.qq.modules.union.command.UnionCmd;
   import com.qq.modules.welfareHall.command.WelfareHallCmd;
   import com.qq.modules.yetiTD.command.YetiTDViewCmd;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.IconUtil;
   import com.qq.utils.UtilsManager;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class CityBuildingViewMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var labProxy:LabProxy;
      
      [Inject]
      public var activityProxy:ActivityProxy;
      
      [Inject]
      public var view:CityBuildingView;
      
      public var buildingType:int;
      
      private var _hasNotice:Boolean;
      
      private var m_hasLoad:Boolean = false;
      
      private var _topKingHead:Image;
      
      private var _topKingName:Label;
      
      private var isOver:Boolean;
      
      private var buildingInfo:BuildingTemplateCE;
      
      public function CityBuildingViewMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.City_UpdateBuildingData,this.onUpdateBuildingData);
         addContextListener(CommandName.ChangeFormation,this.updateNewCardSlotTip);
         addContextListener(CommandName.ChangeLevel,this.updateNewCardSlotTip);
         addContextListener(CityBuildConstant.BUILD_NOTICE_EVENT,this.onBuildNotice);
         addContextListener(CityBuildConstant.BUILD_NOTICE_HIDE,this.onHideBuildNotice);
         addContextListener(CommandName.Guide_Check_Building,this.onCheckBuilding);
         addContextListener(CommandName.SHOW_HOME_EMBATTLE,this.onShowHomeEmbattle);
         addComponentListener(this.view.bg,Event.COMPLETE,this.onBgLoadComplete);
      }
      
      private function onCheckBuilding(param1:CommonEvent) : void
      {
         var _loc2_:int = param1.param as int;
         if(this.buildingType == _loc2_)
         {
            if(this.m_hasLoad)
            {
               this.dispatch(new CommonEvent(CityGlobals.CITY_BUILDING_LOAD_COMPLETE + "_" + this.buildingType));
            }
         }
      }
      
      private function onShowHomeEmbattle(param1:CommonEvent) : void
      {
         if(this.buildingType == CityConstant.Building_Myhome)
         {
            EmbattleCmd.zoomInCityHomeView(this.view.bg,EmbattleConst.MODE_HOME);
         }
      }
      
      private function onBgLoadComplete(param1:Event) : void
      {
         var mcBanner:DisplayObject = null;
         var info:ActivityCommonInfo = null;
         var buffType:String = null;
         var obj:Object = null;
         var evt:Event = param1;
         this.m_hasLoad = true;
         switch(this.buildingType)
         {
            case CityConstant.Building_Timemachine:
               MapInfoViewCmd.showTimemachine(this.view.bg,MovieClip(MovieClip((this.view.bg.mcHolder as Loader).content).getChildByName("mc")));
               break;
            case CityConstant.Building_Myhome:
               EmbattleCmd.embattleByHome(this.view.bg);
               this.updateNewCardSlotTip();
         }
         this.dispatch(new CommonEvent(CityGlobals.CITY_BUILDING_LOAD_COMPLETE + "_" + this.buildingType));
         var buildingInfo:BuildingTemplateCE = BuildingTemplateFactory.instance.getBuilding(this.buildingType);
         if(buildingInfo)
         {
            this.view.buildNameLabel.text = buildingInfo.name;
         }
         var nameTxt:TextField = MovieClip((this.view.bg.mcHolder as Loader).content).getChildByName("nameTxt") as TextField;
         if(nameTxt)
         {
            nameTxt.visible = false;
            this.view.buildNameLabel.x = this.view.bg.x + nameTxt.x;
            this.view.buildNameLabel.y = this.view.bg.y + nameTxt.y;
         }
         switch(this.buildingType)
         {
            case CityConstant.Building_DodgeAndCat:
            case CityConstant.Building_Shelling:
            case CityConstant.Building_WelfareHall:
               this.view.buildNameLabel.visible = false;
               break;
            case CityConstant.Building_Farm:
               this.view.buildNameLabel.text = FontHKHB.CITY_BUILD_NAME_MARK;
         }
         if(this.buildingType == CityConstant.Building_GARDEN)
         {
            mcBanner = MovieClip((this.view.bg.mcHolder as Loader).content).getChildByName("mcBanner");
            mcBanner.visible = false;
            for each(info in this.activityProxy.allActivity)
            {
               try
               {
                  obj = asgui.serialization.json.JSON.deserialize(info.clientParam);
                  buffType = obj.type;
               }
               catch(e:Error)
               {
               }
               if(buffType == BuffActivityGlobal.TYPE_GARDEN_EXP_PLUS && info && info.open)
               {
                  mcBanner.visible = true;
               }
            }
         }
         if(this.buildingType == CityConstant.Building_TopKing)
         {
            TopKingProxyCmd.requestRankInfo();
         }
         this.checkNotice();
      }
      
      override public function onRemove() : void
      {
         switch(this.buildingType)
         {
            case CityConstant.Building_Myhome:
               EmbattleCmd.removeCityHomeView(this.view.custom,this.view.bg);
               break;
            case CityConstant.Building_DodgeAndCat:
               break;
            case CityConstant.Building_Timemachine:
               MapInfoViewCmd.removeTimemachine(this.view.bg);
               break;
            case CityConstant.Building_WelfareHall:
               WelfareHallCmd.removeBuilding();
         }
      }
      
      override public function reset(param1:Object = null) : void
      {
         super.reset(param1);
         var _loc2_:Array = param1 as Array;
         this.buildingType = _loc2_[0];
         var _loc3_:Boolean = _loc2_[1];
         if(_loc3_)
         {
            this.update();
         }
         this.buildingInfo = BuildingTemplateFactory.instance.getBuilding(this.buildingType);
         switch(this.buildingType)
         {
            case CityConstant.Building_Farm:
            case CityConstant.Building_Myhome:
               this.view.hitTestEnabled = false;
               break;
            case CityConstant.Building_Reasearch:
               addContextListener(CommandName.Hide_Plant_Talent_Tip,this.onHidePlantTalentTip);
               break;
            case CityConstant.Building_Lab:
               addContextListener(CommandName.Hide_Lab_Tip,this.onHideLabTip);
               break;
            case CityConstant.Building_TopKing:
               addContextListener(TopKingConst.TopKing_RankInfo_Ready,this.onTopKingRankInfoReady);
         }
      }
      
      private function onTopKingRankInfoReady(param1:CommonEvent) : void
      {
         var _loc3_:Loader = null;
         var _loc4_:DisplayObjectContainer = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:DisplayObject = null;
         var _loc9_:Dto_TopFightRoleInfo = null;
         var _loc2_:Array = param1.param as Array;
         if(this._topKingHead == null)
         {
            _loc3_ = this.view.bg.mcHolder as Loader;
            if(_loc3_ == null)
            {
               return;
            }
            _loc4_ = _loc3_.content as MovieClip;
            _loc5_ = 0;
            if(_loc4_ == null)
            {
               _loc5_ = 0;
               _loc4_ = this.view;
            }
            else
            {
               _loc6_ = _loc4_.numChildren;
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  if((_loc8_ = _loc4_.getChildAt(_loc7_)).name == "nameTxt")
                  {
                     _loc5_ = _loc7_;
                     break;
                  }
                  _loc7_++;
               }
            }
            this._topKingHead = new Image();
            this._topKingHead.x = -55;
            this._topKingHead.y = -168;
            this._topKingHead.width = 58;
            this._topKingHead.height = 58;
            this._topKingHead.scaleContent = true;
            _loc4_.addChildAt(this._topKingHead,_loc5_);
            this._topKingName = new Label();
            this._topKingName.width = 115;
            this._topKingName.height = 30;
            this._topKingName.x = -62;
            this._topKingName.y = -107;
            this._topKingName.styleName = ".TXT_Center";
            this._topKingName.SetStyle("color","#ffa11e");
            _loc4_.addChildAt(this._topKingName,_loc5_);
         }
         if(_loc2_ == null || _loc2_.length == 0)
         {
            this._topKingHead.source = IconUtil.getUnknowHead();
            this._topKingName.text = TopKingConst.EmptyName;
         }
         else
         {
            _loc9_ = _loc2_[0];
            this._topKingHead.source = IconUtil.getFaceUrl(_loc9_.qqFaceURL);
            this._topKingName.text = _loc9_.roleName;
         }
      }
      
      private function onHideLabTip(param1:Event) : void
      {
         this.view.removeLabTechTip();
      }
      
      private function onHidePlantTalentTip(param1:Event) : void
      {
         GameGloble.actorModel.setNoNewUnlockPlant();
         this.updateNewTalentTip();
      }
      
      public function onClick(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(!this.isOver)
         {
            return;
         }
         this._hasNotice = false;
         this.checkNotice();
         this.onOut();
         switch(this.buildingType)
         {
            case CityConstant.Building_Reasearch:
               GameFlowCmd.gotoPlantTalent();
               break;
            case CityConstant.Building_Bar:
               GameFlowCmd.gotoDrunkery();
               break;
            case CityConstant.Building_Cemeterial:
               break;
            case CityConstant.Building_Factory:
               GuideCmd.showDaveTalkByText(FontHKHB.CITY_FACTORY_INFO);
               break;
            case CityConstant.Building_Myhome:
               if(param1.target is MovieClip && (param1.target as MovieClip).name == "home")
               {
                  CardViewCmd.showMainWd();
               }
               else
               {
                  _loc2_ = this.view.parent.getChildIndex(this.view);
                  this.view.parent.swapChildrenAt(_loc2_,this.view.parent.numChildren - 1);
                  EmbattleCmd.zoomInCityHomeView(this.view.bg);
               }
               break;
            case CityConstant.Building_Postoffice:
               GuideCmd.showDaveTalkByText(FontHKHB.CITY_POSTOFFICE_INFO);
               break;
            case CityConstant.Building_Timemachine:
               MapInfoViewCmd.showDetailWnd();
               break;
            case CityConstant.Building_Watchtower:
               MapInfoViewCmd.showHelpArmyWD();
               break;
            case CityConstant.Building_SuperMarket:
               GuideCmd.showDaveTalkByText(FontHKHB.CITY_SUPERMARKET_INFO);
               break;
            case CityConstant.Building_Farm:
               break;
            case CityConstant.Building_Lab:
               GameFlowCmd.enterLab();
               break;
            case CityConstant.Building_Alliance:
               UnionCmd.enterUnion();
               break;
            case CityConstant.Building_Arena:
               GameFlowCmd.gotoArenaEntrance();
               break;
            case CityConstant.Building_Bank:
               BankViewCmd.openBank();
               break;
            case CityConstant.Building_ZombieIsland:
               SceneCenter.getInstance().switchScene(SceneName.ZombieIsland);
               break;
            case CityConstant.Building_Nutrition:
               GameFlowCmd.gotoNutrition();
               break;
            case CityConstant.Building_Rank:
               RankViewCmd.openRankWindow();
               break;
            case CityConstant.Building_TrialRoad:
               GameFlowCmd.gotoTrialRoad();
               break;
            case CityConstant.Building_Yeti:
               YetiTDViewCmd.showMainWd();
               break;
            case CityConstant.Building_GARDEN:
               GameFlowCmd.gotoGarden();
               break;
            case CityConstant.Building_WORLD_TREE:
               GameFlowCmd.gotoWT();
               break;
            case CityConstant.Building_CardBar:
               GameFlowCmd.gotoCardBar();
               break;
            case CityConstant.Building_Debris:
               ExchangeCmd.openExchangeWithType(ExchangeStoreType.ExchangeStoreType_PlantTicket);
               break;
            case CityConstant.Building_Hole:
               GameFlowCmd.gotoHole();
               break;
            case CityConstant.Building_TopKing:
               TopKingCmd.openRankWindow();
         }
      }
      
      public function onOver() : void
      {
         this.isOver = true;
         switch(this.buildingType)
         {
            case CityConstant.Building_Myhome:
            case CityConstant.Building_Farm:
               break;
            default:
               this.view.filters = [new GlowFilter(16772164,1,4,4,8)];
         }
         CursorManager.currentCursorID = CursorManager.BUTTON;
         UISoundCmd.play_block_highlight();
      }
      
      public function onOut() : void
      {
         this.isOver = false;
         switch(this.buildingType)
         {
            case CityConstant.Building_Myhome:
            case CityConstant.Building_Farm:
               break;
            default:
               this.view.filters = null;
         }
         CursorManager.currentCursorID = CursorManager.NO_CURSOR;
      }
      
      public function update() : void
      {
         switch(this.buildingType)
         {
            case CityConstant.Building_Reasearch:
               this.updateNewTalentTip();
               break;
            case CityConstant.Building_Lab:
               this.updateNewLabTechTip();
               break;
            case CityConstant.Building_DodgeAndCat:
               break;
            case CityConstant.Building_WelfareHall:
               WelfareHallCmd.addBuilding(this.view.custom);
               break;
            case CityConstant.Building_Alliance:
               CommandDispatcher.send(CommandName.TALENT_LINK_GUIDE,{
                  "type":TalentAdvancedConditionType.HAS_JOINED_UNION,
                  "dis":this.view
               });
         }
      }
      
      private function onUpdateBuildingData(param1:Event) : void
      {
         this.update();
      }
      
      private function updateNewTalentTip() : void
      {
         var _loc2_:TDPlantStaticInfo = null;
         var _loc1_:Dto_PlantInfo = GameGloble.actorModel.getNewUnlockPlant();
         if(_loc1_)
         {
            _loc2_ = TDDataFactory.instance.getPlantInfoByID(_loc1_.plantId);
            this.view.addNewTalentTip(_loc2_.baseInfo.id);
         }
         else
         {
            this.view.removeNewTalentTip();
         }
      }
      
      private function updateNewCardSlotTip(param1:Event = null) : void
      {
         if(this.buildingType == CityConstant.Building_Myhome)
         {
            if(GameGloble.actorModel.hasNewFormationPos)
            {
               this.view.addNewCardSlotTip();
            }
            else
            {
               this.view.removeNewCardSlotTip();
            }
         }
      }
      
      private function updateNewLabTechTip() : void
      {
         if(this.labProxy.labData.isHaveNewTech)
         {
            this.view.addNewLabTechTip();
         }
         else
         {
            this.view.removeLabTechTip();
         }
      }
      
      private function onBuildNotice(param1:CommonEvent) : void
      {
         switch(param1.readCustomParam_Number("type"))
         {
            case E_City_BuildingType.E_City_BuildingType_Arena:
               if(this.buildingType == CityConstant.Building_Arena)
               {
                  this._hasNotice = true;
               }
               break;
            case E_City_BuildingType.E_City_BuildingType_Market:
               if(this.buildingType == CityConstant.Building_Farm)
               {
                  this._hasNotice = true;
               }
               break;
            case E_City_BuildingType.E_City_BuildingType_Mine:
               if(this.buildingType == CityConstant.Building_Bank)
               {
                  this._hasNotice = true;
               }
         }
         this.checkNotice();
      }
      
      private function onHideBuildNotice(param1:CommonEvent) : void
      {
         switch(param1.readCustomParam_Number("type"))
         {
            case E_City_BuildingType.E_City_BuildingType_Arena:
               if(this.buildingType == CityConstant.Building_Arena)
               {
                  this._hasNotice = false;
               }
               break;
            case E_City_BuildingType.E_City_BuildingType_Market:
               if(this.buildingType == CityConstant.Building_Farm)
               {
                  this._hasNotice = false;
               }
               break;
            case E_City_BuildingType.E_City_BuildingType_Mine:
               if(this.buildingType == CityConstant.Building_Bank)
               {
                  this._hasNotice = false;
               }
         }
         this.checkNotice();
      }
      
      private function getContentFromBG(param1:String) : MovieClip
      {
         var _loc2_:MovieClip = null;
         var _loc3_:Loader = null;
         if(this.view && this.view.bg && this.view.bg.mcHolder)
         {
            _loc3_ = this.view.bg.mcHolder as Loader;
            if(_loc3_ && _loc3_.content)
            {
               _loc2_ = _loc3_.content is DisplayObjectContainer ? (_loc3_.content as DisplayObjectContainer).getChildByName("mc") as MovieClip : null;
            }
         }
         return _loc2_;
      }
      
      private function checkNotice() : void
      {
         var _loc3_:TextFormat = null;
         if(!this.m_hasLoad)
         {
            return;
         }
         var _loc1_:MovieClip = this.getContentFromBG("mc");
         var _loc2_:TextField = !!_loc1_ ? _loc1_.getChildByName("desc_txt") as TextField : null;
         if(_loc1_ == null || _loc2_ == null)
         {
            return;
         }
         switch(this.buildingType)
         {
            case CityConstant.Building_Arena:
               break;
            case CityConstant.Building_Farm:
               if(_loc2_)
               {
                  _loc3_ = _loc2_.getTextFormat();
                  _loc2_.text = FontNormal.BUILD_NOTICE_MARKET;
                  _loc2_.setTextFormat(_loc3_);
                  _loc2_.visible = false;
               }
               break;
            case CityConstant.Building_Bank:
               if(_loc2_)
               {
                  _loc3_ = _loc2_.getTextFormat();
                  _loc2_.text = FontNormal.BUILD_NOTICE_BANK;
                  _loc2_.setTextFormat(_loc3_);
                  _loc2_.visible = false;
               }
         }
         if(this._hasNotice)
         {
            _loc1_.gotoAndStop(2);
            _loc2_.visible = true;
         }
         else
         {
            _loc1_.gotoAndStop(1);
            _loc2_.visible = false;
         }
      }
      
      override public function dispose() : void
      {
         if(this._topKingHead != null)
         {
            UtilsManager.removeFromContainer(this._topKingHead);
            this._topKingHead = null;
         }
         if(this._topKingName != null)
         {
            UtilsManager.removeFromContainer(this._topKingName);
            this._topKingName = null;
         }
         super.dispose();
      }
   }
}
