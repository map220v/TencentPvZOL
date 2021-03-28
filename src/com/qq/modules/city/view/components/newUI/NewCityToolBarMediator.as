package com.qq.modules.city.view.components.newUI
{
   import asgui.core.UIComponent;
   import asgui.utils.StringUtil;
   import com.greensock.TweenMax;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.city.CityButtonConstant;
   import com.qq.display.ColorMatrix;
   import com.qq.display.QAlert;
   import com.qq.modules.activity.ActivityGlobal;
   import com.qq.modules.activity.model.ActivityProxy;
   import com.qq.modules.bag.BagGlobals;
   import com.qq.modules.bag.command.BagViewCmd;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.bag.model.BagService;
   import com.qq.modules.bag.model.vo.BagProxy;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.city.command.CityCmd;
   import com.qq.modules.city.command.CityProxyCmd;
   import com.qq.modules.city.model.vo.CityData;
   import com.qq.modules.dummy.command.DummyViewCmd;
   import com.qq.modules.exped.ExpedGlobal;
   import com.qq.modules.friend.command.FriendViewCmd;
   import com.qq.modules.guide.model.GuideUIData;
   import com.qq.modules.levelselect.LSGlobals;
   import com.qq.modules.mail.command.MailCmd;
   import com.qq.modules.main.command.CmdStoreProxyCmd;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.quest.command.QuestCmd;
   import com.qq.modules.recruitCard.command.RecruitCardCmd;
   import com.qq.modules.shop.command.ShopCmd;
   import com.qq.modules.shop.model.ShopTemplateFactory;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.UtilsManager;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   
   public class NewCityToolBarMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:NewCityToolBar;
      
      [Inject]
      public var cityData:CityData;
      
      [Inject]
      public var bagProxy:BagProxy;
      
      [Inject]
      public var bagService:BagService;
      
      [Inject]
      public var activityProxy:ActivityProxy;
      
      private var m_useRebuildFlag:Boolean = false;
      
      private var _waitAppearBtn:DisplayObjectContainer;
      
      private var _addButtonName:String;
      
      public function NewCityToolBarMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.setCityUIVisible,this.onSetCityUIVisible);
         addContextListener(CommandName.Guide_Add_QuestBtn,this.onGuideEvent);
         addContextListener(CommandName.Guide_Add_FubenBtn,this.onGuideEvent);
         addContextListener(CommandName.Guide_Add_Illustrations,this.onGuideEvent);
         addContextListener(CommandName.Guide_Add_Dummy,this.onGuideEvent);
         addContextListener(CommandName.Guide_Add_WorldMapBtn,this.onGuideEvent);
         addContextListener(CommandName.Guide_Add_ButtonEffect,this.onGuide_Add_ButtonEffect);
         addContextListener(BagGlobals.BAG_ITEM_GET_NEW,this.onGetNewItem);
         addContextListener(CommandName.Guide_Check_CityButton,this.onCheckCityButton);
         addContextListener(CommandName.CHANGE_DURABILITY,this.onDurabilityChanged);
         addContextListener(LSGlobals.LS_STAGE_INFO_UPDATED,this.onStageInfoHandler);
         addContextListener(CommandName.ChangeEnergy,this.onChangeEnergy);
         addContextListener(ActivityGlobal.EVENT_ACTIVITY_INIT,this.onActivityInit);
         addComponentListener(this.view.btnRepair,MouseEvent.CLICK,this.onBtnRepairClick);
         CityProxyCmd.requestCityDurability();
         CityProxyCmd.requestCurrentStageInfo(GameGloble.actorModel.actorLatestTDLevel.stageId);
      }
      
      override protected function initialized() : void
      {
         super.initialized();
         this.onActivityInit();
      }
      
      private function onChangeEnergy(param1:Event) : void
      {
         this.view.checkFubenNewFlag();
      }
      
      private function onActivityInit(param1:Event = null) : void
      {
         if(this.view.promotionFlag)
         {
            this.view.promotionFlag.visible = this.activityProxy.getGroupByViewType(ActivityGlobal.VIEW_TYPE_PROMOTION).length > 0;
         }
      }
      
      private function onBtnRepairClick(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:BagItemTemplate = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(GameGloble.actorModel.durability >= 100)
         {
            QAlert.Show(FontHKHB.EXPED_FULL_DURABILITY);
         }
         else if(GameGloble.actorModel.durabilityCoolDown > 0)
         {
            _loc2_ = Math.ceil(GameGloble.actorModel.durabilityCoolDown / 60);
            QAlert.Show(StringUtil.substitute(FontHKHB.EXPED_DURABILITY_CD,_loc2_));
         }
         else
         {
            _loc3_ = ExpedGlobal.rebuildItemTemplate;
            if((_loc4_ = this.bagProxy.getItemNumByItemID(_loc3_.id)) > 0)
            {
               this.useRebuild();
            }
            else
            {
               _loc5_ = ShopTemplateFactory.instance.getMallItemPriceByItemID(ExpedGlobal.rebuildItemTemplate.id);
               CmdStoreProxyCmd.buyByItemID(_loc3_.id,1,"",_loc5_,this.useRebuild);
            }
         }
      }
      
      private function useRebuild() : void
      {
         this.m_useRebuildFlag = true;
         this.bagService.useItem(ExpedGlobal.rebuildItemTemplate.id);
      }
      
      private function onCheckCityButton(param1:CommonEvent) : void
      {
         var _loc2_:String = param1.param as String;
         var _loc3_:UIComponent = this.view.GetChildById(_loc2_) as UIComponent;
         if(_loc3_)
         {
            this.sendButtonShowEvent(_loc3_);
         }
      }
      
      private function onStageInfoHandler(param1:CommonEvent) : void
      {
         var _loc2_:Boolean = Boolean(param1.param);
         this.view.levelSelectBtn.isHaveNew = _loc2_;
      }
      
      private function onDurabilityChanged(param1:CommonEvent) : void
      {
         var _loc3_:int = 0;
         this.view.updatedurability(GameGloble.actorModel.durability,GameGloble.actorModel.durabilityLimit);
         var _loc2_:int = this.bagProxy.getItemNumByItemID(ExpedGlobal.rebuildItemTemplate.id);
         if(_loc2_ > 0)
         {
            this.view.btnRepair.toolTip = FontNormal.EXPED_REBUILD_TIP;
         }
         else
         {
            _loc3_ = ShopTemplateFactory.instance.getMallItemPriceByItemID(ExpedGlobal.rebuildItemTemplate.id);
            this.view.btnRepair.toolTip = StringUtil.substitute(FontNormal.EXPED_REBUILD_NEED_BUY,_loc3_);
         }
         if(this.m_useRebuildFlag)
         {
            this.m_useRebuildFlag = false;
            CommonCmd.txtFly(StringUtil.substitute(FontNormal.EXPED_REBUILD_USE_SUCCESS,GameGloble.actorModel.durability));
         }
      }
      
      override protected function init() : void
      {
         var _loc1_:String = null;
         var _loc2_:DisplayObject = null;
         super.init();
         for each(_loc1_ in this.cityData.buttonList)
         {
            _loc2_ = this.view.addButton(_loc1_);
            this.sendButtonShowEvent(_loc2_ as UIComponent);
            addComponentListener(_loc2_,MouseEvent.CLICK,this.onClick,MouseEvent);
         }
         this.view.btnToBag.isHaveNew = this.bagProxy.isHaveNew;
      }
      
      private function onGetNewItem(param1:CommonEvent) : void
      {
         this.view.btnToBag.isHaveNew = true;
      }
      
      private function onSetCityUIVisible(param1:CommonEvent) : void
      {
         var _loc2_:Boolean = Boolean(param1.param);
         this.view.visible = _loc2_;
      }
      
      private function onClick(param1:Event) : void
      {
         var _loc2_:DisplayObject = param1.currentTarget as DisplayObject;
         switch(_loc2_.name)
         {
            case CityButtonConstant.Name_Friend:
               FriendViewCmd.zoom();
               break;
            case CityButtonConstant.Name_Quest:
               QuestCmd.openQuestWindow();
               break;
            case CityButtonConstant.Name_Fuben:
               GameFlowCmd.gotoFuben();
               break;
            case CityButtonConstant.Name_MAIL:
               MailCmd.openMailWin();
               break;
            case CityButtonConstant.Name_Bag:
               this.view.btnToBag.isHaveNew = false;
               BagViewCmd.start();
               break;
            case CityButtonConstant.Name_Dummy:
               DummyViewCmd.openWindow(0,false);
               break;
            case CityButtonConstant.Name_WorldMap:
               GameFlowCmd.gotoMap();
               break;
            case CityButtonConstant.Name_Shop:
               ShopCmd.openShop();
               break;
            case CityButtonConstant.Name_Illustrations:
               RecruitCardCmd.openRecruitCardWindow();
         }
      }
      
      private function onGuideEvent(param1:CommonEvent) : void
      {
         var _loc3_:String = null;
         var _loc2_:String = param1.readCustomParam_String("id");
         if(!GuideUIData.getInstance().isLock(_loc2_))
         {
            return;
         }
         GuideUIData.getInstance().unlock(_loc2_);
         switch(param1.type)
         {
            case CommandName.Guide_Add_QuestBtn:
               this._addButtonName = CityButtonConstant.Name_Quest;
               break;
            case CommandName.Guide_Add_FubenBtn:
               this._addButtonName = CityButtonConstant.Name_Fuben;
               break;
            case CommandName.Guide_Add_WorldMapBtn:
               this._addButtonName = CityButtonConstant.Name_WorldMap;
               break;
            case CommandName.Guide_Add_Illustrations:
               this._addButtonName = CityButtonConstant.Name_Illustrations;
               break;
            case CommandName.Guide_Add_Dummy:
               this._addButtonName = CityButtonConstant.Name_Dummy;
         }
         CityCmd.showNewButtonTip(this._addButtonName);
      }
      
      private function onGuide_Add_ButtonEffect(param1:CommonEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:DisplayObject = null;
         var _loc2_:String = param1.readCustomParam_String("id");
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:DisplayObject = this.view.addButton(_loc2_,true);
         this.cityData.addButton(_loc2_);
         var _loc4_:DisplayObjectContainer;
         if((_loc4_ = _loc3_ as DisplayObjectContainer) != null)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_.numChildren)
            {
               (_loc6_ = _loc4_.getChildAt(_loc5_)).visible = false;
               _loc5_++;
            }
            addComponentListener(_loc3_,MouseEvent.CLICK,this.onClick,MouseEvent);
            this._waitAppearBtn = _loc4_;
            setTimeout(this.apperaBtnEffect,500);
         }
      }
      
      private function apperaBtnEffect() : void
      {
         var _loc1_:Point = new Point(this._waitAppearBtn.width * 0.5,this._waitAppearBtn.height * 0.5);
         CommonCmd.playClassMcEffct("City_ButtonAppearEffect",_loc1_,this.onApperBtnEffect,this._waitAppearBtn);
      }
      
      private function onApperBtnEffect(param1:Event) : void
      {
         var _loc3_:int = 0;
         var _loc4_:ColorMatrix = null;
         var _loc5_:DisplayObject = null;
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.currentFrameLabel == "appear")
         {
            _loc3_ = 0;
            while(_loc3_ < this._waitAppearBtn.numChildren)
            {
               (_loc5_ = this._waitAppearBtn.getChildAt(_loc3_)).visible = true;
               _loc3_++;
            }
            (_loc4_ = new ColorMatrix()).setColorOffset(16777215);
            TweenMax.from(this._waitAppearBtn,0.5,{"colorMatrixFilter":{"matrix":_loc4_}});
         }
         if(_loc2_.currentFrame == _loc2_.totalFrames)
         {
            _loc2_.removeEventListener(Event.ENTER_FRAME,this.onApperBtnEffect);
            _loc2_.stop();
            UtilsManager.removeFromContainer(_loc2_);
            this.sendButtonShowEvent(this._waitAppearBtn as UIComponent);
            this._waitAppearBtn = null;
         }
      }
      
      private function sendButtonShowEvent(param1:UIComponent) : void
      {
         var _loc2_:String = null;
         if(param1)
         {
            switch(param1.id)
            {
               case CityButtonConstant.Name_TD:
                  _loc2_ = CityButtonConstant.TD_BUTTON_OPEN;
                  break;
               case CityButtonConstant.Name_Quest:
                  _loc2_ = CityButtonConstant.QUEST_BUTTON_OPEN;
                  break;
               case CityButtonConstant.Name_WorldMap:
                  _loc2_ = CityButtonConstant.WORLD_BUTTON_OPEN;
                  break;
               case CityButtonConstant.Name_Fuben:
                  _loc2_ = CityButtonConstant.ADVENTURE_BUTTON_OPEN;
            }
            if(_loc2_)
            {
               this.dispatch(new CommonEvent(_loc2_));
            }
         }
      }
      
      override public function dispose() : void
      {
         this._waitAppearBtn = null;
         super.dispose();
      }
   }
}
