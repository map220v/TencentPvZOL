package com.qq.modules.embattle.view
{
   import PVZ.Cmd.Dto_CardPosInfo;
   import asgui.events.DragEvent;
   import asgui.managers.ToolTipManager;
   import com.qq.GameGloble;
   import com.qq.display.BaseCardItem;
   import com.qq.display.EmbattlePlant;
   import com.qq.display.QAlert;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.battleLineup.constant.BattleLineupConst;
   import com.qq.modules.card.model.vo.CardItemVO;
   import com.qq.modules.embattle.command.EmbattleDragCmd;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.embattle.model.EmbattleModel;
   import com.qq.modules.embattle.service.EmbattleService;
   import com.qq.modules.embattle.view.comps.CardItemForHoleDef;
   import com.qq.modules.embattle.view.comps.CardItemForOnlyTeam;
   import com.qq.modules.embattle.view.comps.CardItemForSimpleTeam;
   import com.qq.modules.embattle.view.comps.CardItemForTreasureSearch;
   import com.qq.modules.embattle.view.comps.CardItemForTreasureSnatch;
   import com.qq.modules.embattle.view.comps.CardItemForUnionCompetition;
   import com.qq.modules.embattle.view.comps.CardItemForZombieIsland;
   import com.qq.modules.embattle.view.comps.DragableCard;
   import com.qq.modules.login.service.LoginService;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.net.PvzUtil;
   import com.qq.templates.font.FontNormal;
   import com.qq.tooltip.PlantCardToolTip;
   import com.qq.tooltip.PlantZombieCardToolTip;
   import com.tencent.protobuf.Int64Util;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   
   public class EmbattleCardListViewMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var embattleService:EmbattleService;
      
      [Inject]
      public var loginService:LoginService;
      
      private var cacheSelectedCardItem:BaseCardItem;
      
      private var maxOnePageCardNum:int = 16;
      
      public var embattleMode:int;
      
      private var isClick:Boolean = false;
      
      public function EmbattleCardListViewMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         var _loc1_:DragableCard = null;
         super.init();
         this.embattleMode = EmbattleModel.getInstance().embattleMode;
         var _loc2_:int = 0;
         while(_loc2_ < this.maxOnePageCardNum)
         {
            _loc1_ = this.createCardByType(this.embattleMode);
            this.view.cardBox.addChild(_loc1_);
            _loc1_.id = _loc2_.toString();
            _loc2_++;
         }
         this.view.pageBar.currentPage = 1;
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.pageBar,Event.CHANGE,this.pageChangeHandler);
         addComponentListener(this.view,DragEvent.DRAG_DROP,this.dragDropHandler);
         addContextListener(EmbattleConst.EMBATTLE_START_DRAG,this.startDragHandler);
         addContextListener(BattleLineupConst.LINEUP_UPDATE,this.update);
      }
      
      override protected function initialized() : void
      {
         super.initialized();
         this.update();
      }
      
      protected function dragCompleteHandler(param1:Event) : void
      {
         EmbattleModel.getInstance().isPlantDraging = false;
      }
      
      protected function dragDropHandler(param1:DragEvent) : void
      {
         var _loc2_:Dto_CardPosInfo = null;
         var _loc3_:int = 0;
         if(param1.dragInitiator is EmbattlePlant)
         {
            _loc2_ = (param1.dragInitiator as Object).data as Dto_CardPosInfo;
            _loc3_ = this.embattleService.setLineup(GameGloble.actorModel.battleCardModel.getBattleCardFullInfo(_loc2_.uid),0,null,0);
            if(_loc3_ == 4)
            {
               QAlert.Show(FontNormal.EMBATTLE_NO_PLANT);
            }
         }
      }
      
      private function createCardByType(param1:int) : DragableCard
      {
         var _loc2_:DragableCard = null;
         switch(param1)
         {
            case EmbattleConst.MODE_ZOMBIE_ISLAND:
            case EmbattleConst.MODE_ZOMBIE_ADV_ISLAND:
               _loc2_ = new CardItemForZombieIsland();
               break;
            case EmbattleConst.MODE_ARENA:
            case EmbattleConst.MODE_TOP_KING:
            case EmbattleConst.MODE_EXPEDITION:
               _loc2_ = new CardItemForSimpleTeam(param1);
               break;
            case EmbattleConst.MODE_TREASURE_SEARCH:
               _loc2_ = new CardItemForTreasureSearch();
               break;
            case EmbattleConst.MODE_TREASURE_SNATCH:
               _loc2_ = new CardItemForTreasureSnatch();
               break;
            case EmbattleConst.MODE_LADDER_DEF:
            case EmbattleConst.MODE_SuperArena_Defence:
               _loc2_ = new CardItemForOnlyTeam();
               break;
            case EmbattleConst.MODE_UNION_COMPETITION:
               _loc2_ = new CardItemForUnionCompetition();
               break;
            case EmbattleConst.MODE_HOLE_DEF:
               _loc2_ = new CardItemForHoleDef();
               break;
            default:
               _loc2_ = new DragableCard();
         }
         return _loc2_;
      }
      
      protected function get cardList() : Vector.<CardItemVO>
      {
         return GameGloble.actorModel.battleCardModel.battleCardList;
      }
      
      public function update(param1:Event = null) : void
      {
         var _loc8_:BaseCardItem = null;
         var _loc11_:CardItemVO = null;
         var _loc12_:BattleLineupCardTemp = null;
         var _loc2_:Vector.<CardItemVO> = PvzUtil.sortCardArr(this.cardList);
         var _loc3_:int = _loc2_.length;
         var _loc4_:int = Math.ceil(_loc3_ / this.maxOnePageCardNum);
         this.view.pageBar.totalPage = _loc4_;
         var _loc6_:int;
         var _loc5_:int;
         if((_loc6_ = (_loc5_ = this.maxOnePageCardNum * (this.view.pageBar.currentPage - 1)) + this.maxOnePageCardNum) > _loc3_)
         {
            _loc6_ = _loc3_;
         }
         var _loc7_:int = 0;
         var _loc9_:int = _loc5_;
         while(_loc9_ < _loc6_)
         {
            _loc11_ = _loc2_[_loc9_] as CardItemVO;
            _loc8_ = this.view.cardBox.GetChildById(_loc7_.toString()) as BaseCardItem;
            _loc12_ = SettingsModel.instance.battleCardSettings.getBattleCardTempById(_loc11_.cardId);
            _loc8_.setData(_loc11_,_loc12_);
            _loc8_.setCardStatus(GameGloble.actorModel.battleCardModel.getCardStatus(_loc11_.uid),_loc11_.uid);
            _loc8_.data = _loc11_;
            _loc8_.visible = true;
            _loc8_.enabled = true;
            if(this.embattleMode != EmbattleConst.MODE_ZOMBIE_ISLAND && this.embattleMode != EmbattleConst.MODE_ZOMBIE_ADV_ISLAND)
            {
               _loc8_.toolTip = _loc11_;
               _loc8_.toolTipClass = PlantCardToolTip;
            }
            else
            {
               _loc8_.toolTip = _loc11_;
               _loc8_.toolTipClass = PlantZombieCardToolTip;
            }
            _loc7_++;
            _loc9_++;
         }
         var _loc10_:int = _loc7_;
         while(_loc10_ < this.maxOnePageCardNum)
         {
            (_loc8_ = this.view.cardBox.GetChildById(_loc10_.toString()) as BaseCardItem).visible = false;
            _loc8_.enabled = false;
            _loc8_.toolTip = null;
            _loc10_++;
         }
         dispatch(new CommonEvent(BattleLineupConst.BATTLE_LINEUP_ACTIVE_DECK_UPDATE));
      }
      
      protected function pageChangeHandler(param1:Event) : void
      {
         this.update();
      }
      
      protected function mouseDownHandler(param1:MouseEvent) : void
      {
         if(!EmbattleModel.getInstance().isCityBuildingZoomOut)
         {
            return;
         }
         if(param1.type == MouseEvent.MOUSE_DOWN)
         {
            this.isClick = false;
            setTimeout(this.startDragSelf,100,param1);
            return;
         }
         if(param1.type == MouseEvent.CLICK)
         {
            this.isClick = true;
         }
         this.startDragSelf(param1);
      }
      
      private function startDragSelf(param1:MouseEvent) : void
      {
         var _loc2_:BaseCardItem = param1.currentTarget as BaseCardItem;
         var _loc3_:CardItemVO = _loc2_.data as CardItemVO;
         if(EmbattleModel.getInstance().dragingCardId && Int64Util.isEqual(_loc3_.uid,EmbattleModel.getInstance().dragingCardId))
         {
            EmbattleModel.getInstance().dragingCardId = null;
            return;
         }
         if(_loc2_.visible)
         {
            EmbattleDragCmd.startCardDrag(_loc2_,param1);
         }
      }
      
      private function startDragHandler(param1:Event) : void
      {
         var _loc2_:BaseCardItem = null;
         var _loc5_:CardItemVO = null;
         if(this.cacheSelectedCardItem)
         {
            this.cacheSelectedCardItem.selected = false;
         }
         this.view.cardBox.enabled = false;
         var _loc3_:int = this.view.cardBox.numChildren;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.view.cardBox.getChildAt(_loc4_) as BaseCardItem;
            if(_loc2_.visible)
            {
               _loc5_ = _loc2_.data as CardItemVO;
               if(Int64Util.isEqual(_loc5_.uid,EmbattleModel.getInstance().dragingCardId))
               {
                  _loc2_.selected = true;
                  this.cacheSelectedCardItem = _loc2_;
                  return;
               }
            }
            _loc4_++;
         }
      }
      
      public function get view() : EmbattleCardListView
      {
         return this.viewComponent as EmbattleCardListView;
      }
      
      override public function dispose() : void
      {
         var _loc1_:DragableCard = null;
         while(this.view.cardBox.numChildren > 0)
         {
            _loc1_ = this.view.cardBox.getChildAt(0) as DragableCard;
            ToolTipManager.RegisterToolTip(_loc1_,null);
            _loc1_.Dispose();
         }
         if(this.cacheSelectedCardItem)
         {
            this.cacheSelectedCardItem = null;
         }
         super.dispose();
      }
   }
}
