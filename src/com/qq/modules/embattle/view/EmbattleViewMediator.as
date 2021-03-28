package com.qq.modules.embattle.view
{
   import PVZ.Cmd.Dto_CardPosInfo;
   import PVZ.Cmd.E_BuffType;
   import PVZ.Cmd.E_TeamStatus;
   import asgui.containers.HBox;
   import asgui.containers.VBox;
   import asgui.controls.Alert;
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.core.UIComponentGlobals;
   import asgui.events.CloseEvent;
   import asgui.managers.DragManager;
   import asgui.resources.AssetManager;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.roleInfo.RoleInfoConst;
   import com.qq.display.QAlert;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.battleLineup.constant.BattleLineupConst;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.card.model.vo.CardItemVO;
   import com.qq.modules.city.command.CityViewCmd;
   import com.qq.modules.dummy.command.DummyViewCmd;
   import com.qq.modules.embattle.command.EmbattleCmd;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.embattle.model.EmbattleModel;
   import com.qq.modules.embattle.service.EmbattleService;
   import com.qq.modules.embattle.view.comps.FormationBtn;
   import com.qq.modules.embattle.view.comps.FormationTreasureBtn;
   import com.qq.modules.expedition.command.ExpeditionViewCmd;
   import com.qq.modules.friend.command.FriendViewCmd;
   import com.qq.modules.healthDegree.command.HealthDegreeCmd;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.BattleLineupCardSkillTemplate;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.modules.main.model.vo.BattleCardFormationVO;
   import com.qq.modules.main.model.vo.BuffVO;
   import com.qq.modules.main.service.BuffProxy;
   import com.qq.modules.mapinfo.command.MapInfoViewCmd;
   import com.qq.modules.nutritionExchange.command.NutritionExchangeViewCmd;
   import com.qq.modules.sound.command.UISoundCmd;
   import com.qq.modules.treasure.constant.TreasureConstant;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import tencent.base.utils.StringUtil;
   
   public class EmbattleViewMediator extends BasicScreenMediator
   {
      
      private static const ARY_CALL_BACK:Array = [EmbattleConst.MODE_TREASURE_SEARCH,EmbattleConst.MODE_TREASURE_SNATCH,EmbattleConst.MODE_ARENA,EmbattleConst.MODE_LADDER_DEF,EmbattleConst.MODE_UNION_COMPETITION,EmbattleConst.MODE_HOLE_DEF,EmbattleConst.MODE_TOP_KING,EmbattleConst.MODE_EXPEDITION,EmbattleConst.MODE_SuperArena_Defence];
       
      
      public var embattleMode:int;
      
      [Inject]
      public var embattleService:EmbattleService;
      
      [Inject]
      public var buffProxy:BuffProxy;
      
      private var land:MovieClip;
      
      private var landOver:Boolean = false;
      
      private var home:MovieClip;
      
      private var homeOver:Boolean = false;
      
      public function EmbattleViewMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.closeBtn,MouseEvent.CLICK,this.closeHandler);
         addComponentListener(this.view.leaderBtn,MouseEvent.CLICK,this.setLeaderHandler);
         addComponentListener(this.view.btnStart,MouseEvent.CLICK,this.startWarHandler);
         addComponentListener(this.view.btn_armyInfo,MouseEvent.CLICK,this.showArmyInfoHandler);
         addComponentListener(this.view.btnRecover,MouseEvent.CLICK,this.fixHpHandler);
         addComponentListener(this.view.btnHealth,MouseEvent.CLICK,this.healthHandler);
         addComponentListener(this.view.btnNutrition,MouseEvent.CLICK,this.nutritionClick);
         addComponentListener(this.view.btnDummy,MouseEvent.CLICK,this.dummyClick);
         addContextListener(BattleLineupConst.LINEUP_UPDATE,this.updateHandler);
         addContextListener(EmbattleConst.EMBATTLE_WAR_STARTED,this.warStartedHandler);
         addContextListener(EmbattleConst.EMBATTLE_WAR_TIME_UPDATE,this.warTimeUpdateHandler);
         addComponentListener(GameGloble.stage,Event.RESIZE,this.resizeHandler);
         addContextListener(EmbattleConst.EMBATTLE_ZOOM_IN,this.zoomInHandler);
         addContextListener(CommandName.EMBATTLE_NEED_REFRESH,this.needRefresh);
         addContextListener(CommandName.ChangeLevel,this.onLevelChange);
      }
      
      private function onLevelChange(param1:Event) : void
      {
         this.refreshBtnUI();
      }
      
      override protected function init() : void
      {
         var _loc1_:int = 0;
         var _loc2_:FormationBtn = null;
         var _loc3_:int = 0;
         var _loc4_:Vector.<BattleCardFormationVO> = null;
         var _loc5_:Label = null;
         super.init();
         this.embattleMode = EmbattleModel.getInstance().embattleMode;
         GameGloble.actorModel.checkIfOpenDaySatisfiedToUIFromTemplate(this.view.btnNutrition,ServerConfigTemplateFactory.instance.getEntryTemplateNutrition());
         if(!this.view.formationBox)
         {
            if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_TREASURE_SEARCH || EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_TREASURE_SNATCH || EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_FUZION || EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_UNION_COMPETITION)
            {
               this.view.formationBox = new HBox();
               this.view.formationBox.SetStyle("horizontalGap","10");
               this.view.formationBox.x = 60;
               this.view.formationBox.y = -30;
               this.view.formationBox.width = 540;
               this.view.formationBox.height = 50;
               this.view.topBox.addChild(this.view.formationBox);
            }
            else
            {
               this.view.formationBox = new VBox();
               this.view.formationBox.x = 60;
               this.view.formationBox.width = 300;
               this.view.formationBox.height = 400;
               this.view.rightBox.addChild(this.view.formationBox);
            }
         }
         if(this.view.formationBox.numChildren == 0)
         {
            _loc1_ = 0;
            while(_loc1_ < GameGloble.actorModel.battleCardModel.teamMaxNum)
            {
               if(this.embattleMode == EmbattleConst.MODE_TREASURE_SEARCH || this.embattleMode == EmbattleConst.MODE_TREASURE_SNATCH || this.embattleMode == EmbattleConst.MODE_FUZION || this.embattleMode == EmbattleConst.MODE_UNION_COMPETITION)
               {
                  _loc2_ = new FormationTreasureBtn();
               }
               else
               {
                  _loc2_ = new FormationBtn();
                  addComponentListener(_loc2_.defendBtn,MouseEvent.CLICK,this.onDefendClick);
               }
               _loc2_.id = "fBtn_" + _loc1_;
               this.view.formationBox.addChild(_loc2_);
               _loc2_.visible = false;
               _loc2_.setLabel((_loc1_ + 1).toString());
               addComponentListener(_loc2_,MouseEvent.CLICK,this.viewFormationHandler);
               _loc1_++;
            }
         }
         this.view.btn_armyInfo.visible = false;
         this.view.img_armyInfo.visible = false;
         this.view.btnHealth.visible = false;
         this.view.btnStart.visible = false;
         this.view.btnRecover.visible = false;
         this.view.healthRecoverSetting.visible = false;
         switch(this.embattleMode)
         {
            case EmbattleConst.MODE_HOME:
               this.view.btnHealth.visible = true;
               this.view.btn_armyInfo.visible = true;
               this.view.img_armyInfo.visible = true;
               this.view.healthRecoverSetting.visible = true;
               this.view.healthRecoverSetting.reset();
               break;
            case EmbattleConst.MODE_MAP:
               this.view.btnHealth.visible = true;
               this.view.btnStart.visible = true;
               this.view.healthRecoverSetting.visible = true;
               this.view.healthRecoverSetting.reset();
               break;
            case EmbattleConst.MODE_ARENA:
            case EmbattleConst.MODE_LADDER_DEF:
            case EmbattleConst.MODE_UNION_COMPETITION:
               if(EmbattleModel.getInstance().canFight)
               {
                  this.view.btnStart.visible = true;
               }
               else
               {
                  this.view.btnStart.visible = false;
                  this.view.closeBtn.setLabel(FontHKHB.TXT_RETURN);
               }
               break;
            case EmbattleConst.MODE_TREASURE_SEARCH:
               if(TreasureConstant.isCreatHouse)
               {
                  addComponentListener(this.view.ck_extraChoose,MouseEvent.CLICK,this.onExtraClickCheckBox);
                  this.view.ck_extraChoose.selected = TreasureConstant.onlySameUnionJoin;
                  this.view.ck_extraChoose.label = "只与盟友寻宝（要求联盟3级）";
                  this.view.ck_extraChoose.visible = true;
               }
               this.view.btnStart.visible = true;
               this.view.closeBtn.txt.text = FontHKHB.TXT_RETURN;
               break;
            case EmbattleConst.MODE_WORLD_BOSS:
            case EmbattleConst.MODE_TREASURE_SNATCH:
            case EmbattleConst.MODE_TRIAL_ROAD_NORMAL:
            case EmbattleConst.MODE_TRIAL_ROAD_HARD:
            case EmbattleConst.MODE_LADDER_DEF:
               this.view.btnStart.visible = true;
               this.view.closeBtn.txt.text = FontHKHB.TXT_RETURN;
               break;
            case EmbattleConst.MODE_TOP_KING:
            case EmbattleConst.MODE_SuperArena_Defence:
               this.view.btnStart.visible = true;
               this.view.btnStart.txt.text = FontHKHB.BAPTIZE_SAVE;
               this.view.closeBtn.txt.text = FontHKHB.TXT_RETURN;
               break;
            case EmbattleConst.MODE_HOLE_DEF:
               this.view.btnStart.visible = true;
               this.view.closeBtn.txt.text = FontHKHB.HOLE_RETURN;
               this.view.imgCurse.visible = true;
               this.view.txtCurse.visible = true;
               break;
            case EmbattleConst.MODE_FUZION:
               this.view.btnStart.visible = false;
               this.view.closeBtn.txt.text = FontHKHB.TXT_RETURN;
               break;
            case EmbattleConst.MODE_ZOMBIE_ISLAND:
            case EmbattleConst.MODE_ZOMBIE_ADV_ISLAND:
               this.view.btnStart.visible = true;
               this.view.closeBtn.txt.text = FontHKHB.TXT_RETURN;
               break;
            case EmbattleConst.MODE_EXPEDITION:
               this.view.btnStart.visible = true;
               this.view.btnStart.txt.text = FontHKHB.FUZION_NO_SIGN;
               this.view.closeBtn.txt.text = FontHKHB.TXT_RETURN;
               ExpeditionViewCmd.addSignUpDefenceChoosePanel(this.view);
         }
         if(this.view.btn_armyInfo.visible == false)
         {
            this.view.imgDeck.x = this.view.txt_powerData.x + this.view.txt_powerData.width + 10;
            this.view.imgCurse.x = this.view.imgDeck.x + 30;
         }
         else if(this.view.txt_warTimeCostData.visible)
         {
            this.view.imgDeck.x = this.view.txt_warTimeCostData.x + this.view.btn_armyInfo.width - 50;
            this.view.imgCurse.x = this.view.imgDeck.x + 30;
         }
         else
         {
            this.view.imgDeck.x = this.view.btn_armyInfo.x + this.view.btn_armyInfo.width + 10;
            this.view.imgCurse.x = this.view.imgDeck.x + 30;
         }
         if(this.embattleMode == EmbattleConst.MODE_HOME || this.embattleMode == EmbattleConst.MODE_MAP)
         {
            _loc3_ = 0;
            _loc4_ = GameGloble.actorModel.battleCardModel.getAttackBattleTeam();
            _loc1_ = 0;
            while(_loc1_ < _loc4_.length)
            {
               if(!_loc4_[_loc1_].isDefenceTeam)
               {
                  _loc2_ = this.view.formationBox.getChildAt(_loc3_) as FormationBtn;
                  _loc2_.visible = true;
                  _loc2_.data = _loc4_[_loc1_].teamId;
                  _loc2_.defendBtn.data = _loc4_[_loc1_].teamId;
                  _loc3_++;
               }
               _loc1_++;
            }
         }
         if(this.embattleMode == EmbattleConst.MODE_TREASURE_SEARCH || this.embattleMode == EmbattleConst.MODE_TREASURE_SNATCH)
         {
            _loc1_ = 0;
            while(_loc1_ < 3)
            {
               _loc2_ = this.view.formationBox.getChildAt(_loc1_) as FormationBtn;
               _loc2_.visible = true;
               _loc2_.data = _loc1_ + 1;
               _loc1_++;
            }
         }
         if(this.embattleMode == EmbattleConst.MODE_UNION_COMPETITION)
         {
            _loc1_ = 0;
            while(_loc1_ < 2)
            {
               _loc2_ = this.view.formationBox.getChildAt(_loc1_) as FormationBtn;
               _loc2_.visible = true;
               _loc2_.data = _loc1_ + 1;
               _loc1_++;
            }
            (_loc5_ = new Label()).text = FontHKHB.UNION_COMPETITION_EMBATTLE_TIP;
            _loc5_.width = 290;
            _loc5_.height = 60;
            _loc5_.x = 220;
            _loc5_.y = -30;
            _loc5_.styleName = ".TXT_HKHB_21_Yellow_Shadow";
            _loc5_.SetStyle("textAlign","left");
            this.view.topBox.addChild(_loc5_);
         }
         FriendViewCmd.zoomIn();
      }
      
      override protected function initialized() : void
      {
         super.initialized();
         this.updateHandler();
         this.warTimeUpdateHandler();
         this.refreshBtnUI();
      }
      
      private function refreshBtnUI() : void
      {
         this.view.btnDummy.visible = GameGloble.actorModel.checkIfOpenDaySatisfiedFromTemplate(ServerConfigTemplateFactory.instance.getEntryDummy());
         this.view.btnNutrition.visible = GameGloble.actorModel.checkIfOpenDaySatisfiedFromTemplate(ServerConfigTemplateFactory.instance.getEntryTemplateNutrition());
      }
      
      private function needRefresh(param1:CommonEvent) : void
      {
         this.embattleService.getFormation();
      }
      
      protected function showArmyInfoHandler(param1:MouseEvent) : void
      {
         MapInfoViewCmd.showDetailWnd();
      }
      
      private function nutritionClick(param1:MouseEvent) : void
      {
         NutritionExchangeViewCmd.openWindow();
      }
      
      private function dummyClick(param1:MouseEvent) : void
      {
         DummyViewCmd.openWindow();
      }
      
      protected function fixHpHandler(param1:MouseEvent) : void
      {
         var clickHandler:Function = null;
         var event:MouseEvent = param1;
         clickHandler = function(param1:CloseEvent):void
         {
            if(param1.detail == Alert.OK)
            {
               if(embattleMode == EmbattleConst.MODE_HOME)
               {
                  embattleService.fixHP(GameGloble.actorModel.battleCardModel.defaultFormationVo.teamId);
               }
            }
         };
         if(this.embattleMode == EmbattleConst.MODE_HOME)
         {
            if(GameGloble.actorModel.battleCardModel.defaultFormationVo.dto.recoverHpCost == 0)
            {
               QAlert.Show("植物血量全满，无需治疗!");
               return;
            }
            QAlert.Show("补满血量需要消耗 " + GameGloble.actorModel.battleCardModel.defaultFormationVo.dto.recoverHpCost + "金币。","",Alert.OK | Alert.NO,null,clickHandler);
         }
      }
      
      protected function healthHandler(param1:MouseEvent) : void
      {
         HealthDegreeCmd.showHealthDegreeWins();
      }
      
      private function warTimeUpdateHandler(param1:Event = null) : void
      {
         this.view.txt_warTimeCostData.text = StringUtil.getLeftTime_Hour_Min_SecString(EmbattleModel.getInstance().warTimeCost);
      }
      
      private function warStartedHandler(param1:Event) : void
      {
         this.closeHandler(null);
      }
      
      protected function startWarHandler(param1:MouseEvent) : void
      {
         var vo:BuffVO = null;
         var event:MouseEvent = param1;
         if(GameGloble.actorModel.battleCardModel.defaultEmbattleCardNum == 0 && (this.embattleMode == EmbattleConst.MODE_WORLD_BOSS || this.embattleMode == EmbattleConst.MODE_MAP))
         {
            QAlert.Show("至少需要一个植物才能出征!");
            return;
         }
         if(this.embattleMode == EmbattleConst.MODE_WORLD_BOSS && GameGloble.actorModel.battleCardModel.isTeamOut(GameGloble.actorModel.battleCardModel.defaultFormationVo.dto.teamId))
         {
            QAlert.Show("该队伍已经出征！");
            return;
         }
         if(ARY_CALL_BACK.indexOf(this.embattleMode) >= 0)
         {
            if(GameGloble.actorModel.battleCardModel.getEmbattleCardNum(this.embattleMode) == 0)
            {
               QAlert.Show("阵上不能没有植物!");
               return;
            }
            switch(this.embattleMode)
            {
               case EmbattleConst.MODE_TREASURE_SEARCH:
                  EmbattleModel.getInstance().onBattleBackParam = [TreasureConstant.onlySameUnionJoin];
            }
            if(Boolean(EmbattleModel.getInstance().onBattleBackFunc))
            {
               this.closeHandler(null);
               if(EmbattleModel.getInstance().onBattleBackParam)
               {
                  EmbattleModel.getInstance().onBattleBackFunc.apply(this,EmbattleModel.getInstance().onBattleBackParam);
               }
               else
               {
                  EmbattleModel.getInstance().onBattleBackFunc();
               }
               EmbattleModel.getInstance().onBattleBackFunc = null;
               EmbattleModel.getInstance().onBattleBackParam = null;
               return;
            }
         }
         else
         {
            if(GameGloble.actorModel.battleCardModel.getTargetVo(this.embattleMode).dto.isDefend)
            {
               QAlert.Show(FontNormal.EMBLATT_DEFEND_NOT_OUT);
               return;
            }
            vo = this.buffProxy.getBuffByType(E_BuffType.E_BuffType_WarFree);
            if(vo)
            {
               QAlert.Show("本次出征会去取消当前的免战状态，是否出征？","",Alert.YES | Alert.NO,null,function(param1:CloseEvent):void
               {
                  if(param1.detail == Alert.YES)
                  {
                     embattleService.startWar();
                  }
               });
            }
            else
            {
               this.embattleService.startWar();
            }
         }
      }
      
      protected function onDefendClick(param1:MouseEvent) : void
      {
         var _loc2_:Button = null;
         if(param1.target is Button)
         {
            _loc2_ = param1.target as Button;
            if(GameGloble.actorModel.battleCardModel.getDefendTeamId() != 0)
            {
               this.embattleService.cancelDefendTeam(GameGloble.actorModel.battleCardModel.getDefendTeamId());
            }
            else
            {
               this.embattleService.setDefendTeam(_loc2_.data as uint);
            }
         }
      }
      
      protected function viewFormationHandler(param1:MouseEvent) : void
      {
         var _loc2_:uint = 0;
         if(param1.target is SimpleButton)
         {
            _loc2_ = (param1.currentTarget as FormationBtn).data as uint;
            if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_TREASURE_SEARCH)
            {
               GameGloble.actorModel.battleCardModel.setFormationTeamId(EmbattleConst.MODE_TREASURE_SEARCH,_loc2_);
               this.view.btnStart.enabled = !GameGloble.actorModel.battleCardModel.searchTeamIsUsed(_loc2_);
               eventDispatcher.dispatchEvent(new Event(BattleLineupConst.LINEUP_UPDATE));
            }
            else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_TREASURE_SNATCH)
            {
               GameGloble.actorModel.battleCardModel.setFormationTeamId(EmbattleConst.MODE_TREASURE_SNATCH,_loc2_);
               this.view.btnStart.enabled = !GameGloble.actorModel.battleCardModel.snatchTeamIsUsed(_loc2_);
               eventDispatcher.dispatchEvent(new Event(BattleLineupConst.LINEUP_UPDATE));
            }
            else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_FUZION)
            {
               GameGloble.actorModel.battleCardModel.setFormationTeamId(EmbattleConst.MODE_FUZION,_loc2_);
               eventDispatcher.dispatchEvent(new Event(BattleLineupConst.LINEUP_UPDATE));
            }
            else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_UNION_COMPETITION)
            {
               GameGloble.actorModel.battleCardModel.setFormationTeamId(EmbattleConst.MODE_UNION_COMPETITION,_loc2_);
               this.view.btnStart.enabled = !GameGloble.actorModel.battleCardModel.snatchTeamIsUsed(_loc2_);
               eventDispatcher.dispatchEvent(new Event(BattleLineupConst.LINEUP_UPDATE));
            }
            else
            {
               GameGloble.actorModel.battleCardModel.defaultTeamId = _loc2_;
               this.embattleService.setDefaultFormation(_loc2_);
            }
            this.updateHandler();
         }
      }
      
      private function addedToCityHandler(param1:Event) : void
      {
         this.land = EmbattleModel.getInstance().cityBuilding.getChildByName("land") as MovieClip;
         this.home = EmbattleModel.getInstance().cityBuilding.getChildByName("home") as MovieClip;
      }
      
      private function zoomInHandler(param1:Event) : void
      {
         EmbattleModel.getInstance().cityBuilding.addChild(this.view.topBox);
         EmbattleModel.getInstance().cityBuilding.addChild(this.view.bottomBox);
         EmbattleModel.getInstance().cityBuilding.addChild(this.view.rightBox);
         if(!this.view.cardListView)
         {
            if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_TREASURE_SEARCH || EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_TREASURE_SNATCH)
            {
               this.view.cardListView = new EmbattleTreasureCardListView();
            }
            else
            {
               this.view.cardListView = new EmbattleCardListView();
            }
         }
         EmbattleModel.getInstance().cityBuilding.addChild(this.view.cardListView);
         switch(this.embattleMode)
         {
            case EmbattleConst.MODE_ARENA:
               this.view.topBox.x = 640;
               this.view.topBox.y = 200;
               this.view.bottomBox.x = 640;
               this.view.bottomBox.y = 660;
               this.view.rightBox.x = 1100;
               this.view.rightBox.y = 240;
               this.view.cardListView.x = 290;
               this.view.cardListView.y = 210;
               this.view.btnStart.x = 0;
               break;
            case EmbattleConst.MODE_ZOMBIE_ISLAND:
            case EmbattleConst.MODE_ZOMBIE_ADV_ISLAND:
            case EmbattleConst.MODE_TRIAL_ROAD_NORMAL:
            case EmbattleConst.MODE_TRIAL_ROAD_HARD:
            case EmbattleConst.MODE_LADDER_DEF:
            case EmbattleConst.MODE_UNION_COMPETITION:
            case EmbattleConst.MODE_FUZION:
            case EmbattleConst.MODE_TREASURE_SNATCH:
            case EmbattleConst.MODE_TREASURE_SEARCH:
            case EmbattleConst.MODE_HOLE_DEF:
            case EmbattleConst.MODE_TOP_KING:
            case EmbattleConst.MODE_EXPEDITION:
            case EmbattleConst.MODE_SuperArena_Defence:
               this.view.topBox.x = 640;
               this.view.topBox.y = 170;
               this.view.bottomBox.x = 640;
               this.view.bottomBox.y = 660;
               this.view.rightBox.x = 1060;
               this.view.rightBox.y = 240;
               this.view.cardListView.x = 290;
               this.view.cardListView.y = 210;
               this.view.btnStart.x = 0;
               break;
            default:
               this.view.topBox.x = EmbattleModel.getInstance().cityBuilding.width - this.view.topBox.width - 200;
               this.view.topBox.y = 320;
               this.view.bottomBox.x = this.view.topBox.x - 30;
               this.view.bottomBox.y = EmbattleModel.getInstance().cityBuilding.height - this.view.bottomBox.height - 250;
               this.view.rightBox.x = this.view.topBox.x + 330;
               this.view.rightBox.y = this.view.topBox.y + 60;
               this.view.cardListView.x = this.view.topBox.x - this.view.cardListView.width - 50;
               this.view.cardListView.y = this.view.topBox.y + 20;
         }
         if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_HOME)
         {
            if(EmbattleModel.getInstance().cityBuildingMouseCtr != null)
            {
               EmbattleModel.getInstance().cityBuildingMouseCtr.setEnable(false);
            }
         }
      }
      
      protected function resizeHandler(param1:Event) : void
      {
         var _loc2_:Point = null;
         if(EmbattleModel.getInstance().cityBuilding && EmbattleModel.getInstance().isCityBuildingZoomOut)
         {
            _loc2_ = new Point();
            switch(this.embattleMode)
            {
               case EmbattleConst.MODE_ARENA:
               case EmbattleConst.MODE_ZOMBIE_ISLAND:
               case EmbattleConst.MODE_ZOMBIE_ADV_ISLAND:
               case EmbattleConst.MODE_HOLE_DEF:
               case EmbattleConst.MODE_TOP_KING:
               case EmbattleConst.MODE_EXPEDITION:
               case EmbattleConst.MODE_SuperArena_Defence:
                  _loc2_.x = (GameGloble.stage.stageWidth - EmbattleModel.getInstance().cityBuilding.width) * 0.5;
                  _loc2_.y = (GameGloble.stage.stageHeight - EmbattleModel.getInstance().cityBuilding.height) * 0.5;
                  _loc2_.x = _loc2_.x > 0 ? Number(0) : Number(_loc2_.x);
                  _loc2_.y = _loc2_.y > 0 ? Number(0) : Number(_loc2_.y);
                  break;
               case EmbattleConst.MODE_HOME:
               case EmbattleConst.MODE_WORLD_BOSS:
                  _loc2_.x = (GameGloble.stage.stageWidth - EmbattleModel.getInstance().cityBuilding.width) * 0.5 - 230;
                  _loc2_.y = (GameGloble.stage.stageHeight - EmbattleModel.getInstance().cityBuilding.height) * 0.5;
            }
            EmbattleModel.getInstance().cityBuilding.x = _loc2_.x;
            EmbattleModel.getInstance().cityBuilding.y = _loc2_.y;
         }
      }
      
      private function updateHandler(param1:Event = null) : void
      {
         UIComponentGlobals.layoutManager.AdddDelayFuncCallOnce(this.update);
      }
      
      private function update() : void
      {
         var _loc5_:FormationBtn = null;
         var _loc11_:Dto_CardPosInfo = null;
         var _loc12_:Vector.<BattleCardFormationVO> = null;
         var _loc13_:int = 0;
         if(!this.view || this.view.hasDisposed)
         {
            return;
         }
         this.view.data_leaderSkill.text = "[]";
         this.view.dec_leaderSkill.text = "";
         this.view.txt_powerData.text = GameGloble.actorModel.battleCardModel.getTargetVo(this.embattleMode).totalPower.toString();
         this.view.txtSpeed.text = GameGloble.actorModel.battleCardModel.getTargetVo(this.embattleMode).totalSpeed.toString();
         var _loc1_:int = GameGloble.actorModel.levelTemplate.battleCardMax;
         this.view.txt_embattlePlantData.text = GameGloble.actorModel.battleCardModel.getTargetVo(this.embattleMode).cardNum + "/" + _loc1_;
         var _loc2_:int = _loc1_ >= RoleInfoConst.MAX_EMBATTLE_CARD_NUM ? int(_loc1_) : int(_loc1_ + 1);
         var _loc3_:int = GameGloble.actorModel.getFirstActorLevelByCardNum(_loc2_);
         if(_loc1_ < RoleInfoConst.MAX_EMBATTLE_CARD_NUM)
         {
            this.view.txt_embattlePlantData.toolTip = StringUtil.substitute(FontNormal.EMBATTLE_PLANT_MAX,_loc3_,_loc2_);
         }
         else
         {
            this.view.txt_embattlePlantData.toolTip = FontNormal.EMBATTLE_PLANT_MAXII;
         }
         var _loc4_:CardItemVO = GameGloble.actorModel.battleCardModel.getBattleCardFullInfo(GameGloble.actorModel.battleCardModel.getTargetVo(this.embattleMode).dto.leaderUid);
         this.view.txt_warTimeCostData.visible = this.view.txt_warTimeCost.visible = false;
         if(this.embattleMode == EmbattleConst.MODE_MAP)
         {
            this.view.txt_warTimeCostData.visible = this.view.txt_warTimeCost.visible = true;
         }
         if(this.view.txt_warTimeCostData.visible)
         {
            this.view.imgDeck.x = this.view.txt_warTimeCostData.x + this.view.btn_armyInfo.width - 50;
            this.view.imgCurse.x = this.view.imgDeck.x + 30;
         }
         else
         {
            this.view.imgDeck.x = this.view.btn_armyInfo.x + this.view.btn_armyInfo.width + 10;
            this.view.imgCurse.x = this.view.imgDeck.x + 30;
         }
         this.view.btnRecover.visible = false;
         if(this.embattleMode == EmbattleConst.MODE_HOME)
         {
            this.view.btnRecover.visible = true;
         }
         if(this.embattleMode == EmbattleConst.MODE_HOME || this.embattleMode == EmbattleConst.MODE_MAP)
         {
            _loc12_ = GameGloble.actorModel.battleCardModel.getAttackBattleTeam();
            _loc13_ = 0;
            while(_loc13_ < _loc12_.length)
            {
               (_loc5_ = this.view.formationBox.getChildAt(_loc13_) as FormationBtn).selected = false;
               if(_loc5_.data == GameGloble.actorModel.battleCardModel.defaultTeamId)
               {
                  _loc5_.selected = true;
               }
               _loc5_.setDefendState(GameGloble.actorModel.battleCardModel.getDefendTeamId(),_loc12_[_loc13_].dto.status == E_TeamStatus.E_TeamStatus_out);
               _loc5_.out = _loc12_[_loc13_].dto.status == E_TeamStatus.E_TeamStatus_out ? true : false;
               _loc13_++;
            }
         }
         var _loc6_:int = 0;
         if(this.embattleMode == EmbattleConst.MODE_TREASURE_SEARCH || this.embattleMode == EmbattleConst.MODE_TREASURE_SNATCH || this.embattleMode == EmbattleConst.MODE_FUZION)
         {
            _loc6_ = 0;
            while(_loc6_ < 3)
            {
               (_loc5_ = this.view.formationBox.getChildAt(_loc6_) as FormationBtn).selected = false;
               if(this.embattleMode == EmbattleConst.MODE_TREASURE_SEARCH && _loc5_.data == GameGloble.actorModel.battleCardModel.getFormationTeamId(EmbattleConst.MODE_TREASURE_SEARCH))
               {
                  _loc5_.selected = true;
               }
               if(this.embattleMode == EmbattleConst.MODE_TREASURE_SNATCH && _loc5_.data == GameGloble.actorModel.battleCardModel.getFormationTeamId(EmbattleConst.MODE_TREASURE_SNATCH))
               {
                  _loc5_.selected = true;
               }
               if(this.embattleMode == EmbattleConst.MODE_FUZION && _loc5_.data == GameGloble.actorModel.battleCardModel.getFormationTeamId(EmbattleConst.MODE_FUZION))
               {
                  _loc5_.selected = true;
               }
               _loc5_.out = false;
               _loc6_++;
            }
         }
         if(this.embattleMode == EmbattleConst.MODE_UNION_COMPETITION)
         {
            _loc6_ = 0;
            while(_loc6_ < 3)
            {
               (_loc5_ = this.view.formationBox.getChildAt(_loc6_) as FormationBtn).selected = false;
               if(this.embattleMode == EmbattleConst.MODE_UNION_COMPETITION && _loc5_.data == GameGloble.actorModel.battleCardModel.getFormationTeamId(EmbattleConst.MODE_UNION_COMPETITION))
               {
                  _loc5_.selected = true;
               }
               _loc5_.out = false;
               _loc6_++;
            }
         }
         if(_loc4_ == null)
         {
            return;
         }
         var _loc7_:BattleLineupCardTemp = SettingsModel.instance.battleCardSettings.getBattleCardTempById(_loc4_.cardId);
         var _loc8_:BattleLineupCardSkillTemplate = BattleLineupTemplateFactory.instance.getBattleLineupCardSkillTemplateById(_loc7_.leaderSkillId);
         this.view.data_leaderSkill.text = "[" + _loc8_.name + "]";
         this.view.dec_leaderSkill.text = _loc8_.desc;
         var _loc9_:BattleCardFormationVO = GameGloble.actorModel.battleCardModel.getTargetVo(this.embattleMode);
         var _loc10_:Array = [];
         for each(_loc11_ in _loc9_.dto.cardPos)
         {
            if(_loc11_ && _loc11_.uid)
            {
               if(_loc4_ = GameGloble.actorModel.battleCardModel.getBattleCardFullInfo(_loc11_.uid))
               {
                  _loc10_.push(_loc4_.cardId);
               }
            }
         }
         this.view.imgDeck.toolTip = _loc10_;
         if(CardTemplateFactory.instance.hasActiveSomeDeck(_loc10_))
         {
            this.view.imgDeck.source = AssetManager.GetClass("Embattle_UI_Icon_Deck");
         }
         else
         {
            this.view.imgDeck.source = AssetManager.GetClass("Embattle_UI_Icon_Deck_Disable");
         }
      }
      
      protected function setLeaderHandler(param1:MouseEvent) : void
      {
         var _loc2_:Image = new Image();
         _loc2_.source = AssetManager.GetClass("City_embattle_leader_icon2");
         DragManager.DoDrag(this.view,param1,_loc2_,-_loc2_.width * 0.5,-_loc2_.height * 0.5,1);
         UISoundCmd.leader_medal_pickup();
      }
      
      protected function closeHandler(param1:MouseEvent) : void
      {
         if(param1)
         {
            EmbattleModel.getInstance().onBattleBackFunc = null;
            EmbattleModel.getInstance().onBattleBackParam = null;
         }
         if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_HOME)
         {
            if(EmbattleModel.getInstance().cityBuildingMouseCtr != null)
            {
               EmbattleModel.getInstance().cityBuildingMouseCtr.setEnable(true);
            }
         }
         this.view.Dispose();
         EmbattleCmd.zoomOutCityHomeView(EmbattleModel.getInstance().cityBuildingMouseCtr != null);
         CityViewCmd.setTopRightToolBarVisible(true);
         if(Boolean(EmbattleModel.getInstance().onBattleCloseFunc))
         {
            if(EmbattleModel.getInstance().onBattleCloseParam)
            {
               EmbattleModel.getInstance().onBattleCloseFunc.apply(this,EmbattleModel.getInstance().onBattleCloseParam);
            }
            else
            {
               EmbattleModel.getInstance().onBattleCloseFunc();
            }
            EmbattleModel.getInstance().onBattleCloseFunc = null;
            EmbattleModel.getInstance().onBattleCloseParam = null;
         }
      }
      
      private function onExtraClickCheckBox(param1:Event) : void
      {
         switch(this.embattleMode)
         {
            case EmbattleConst.MODE_TREASURE_SEARCH:
               if(!GameGloble.unionModel.playerUnionInfo.isVaild())
               {
                  QAlert.Show(TreasureConstant.TREASURE_DIABLE_FIND_UNION_MEMBER_BUTTON_TIP);
                  this.view.ck_extraChoose.selected = false;
                  return;
               }
               if(GameGloble.unionModel.playerUnionInfo.level < ServerConfigTemplateFactory.instance.iTreasureOnlySameGuildLevelLimit)
               {
                  QAlert.Show("您的联盟还未达到要求等级");
                  this.view.ck_extraChoose.selected = false;
                  return;
               }
               TreasureConstant.onlySameUnionJoin = this.view.ck_extraChoose.selected;
               break;
         }
      }
      
      public function get view() : EmbattleView
      {
         return this.viewComponent as EmbattleView;
      }
   }
}
