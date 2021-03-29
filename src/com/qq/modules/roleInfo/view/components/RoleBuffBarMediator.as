package com.qq.modules.roleInfo.view.components
{
   import PVZ.Cmd.E_BuffType;
   import asgui.controls.Alert;
   import asgui.events.CloseEvent;
   import com.qq.CommandName;
   import com.qq.constant.ItemID;
   import com.qq.constant.city.CityButtonConstant;
   import com.qq.constant.city.CityConstant;
   import com.qq.display.QAlert;
   import com.qq.modules.arena.constant.ArenaConst;
   import com.qq.modules.arena.model.ArenaModel;
   import com.qq.modules.bag.model.BagService;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.battleLineup.constant.BattleLineupConst;
   import com.qq.modules.buy.model.MonthCardProxy;
   import com.qq.modules.buy.view.BuyGlobal;
   import com.qq.modules.city.model.vo.CityData;
   import com.qq.modules.guide.model.templates.GuideTemplateFactory;
   import com.qq.modules.healthDegree.command.HealthDegreeCmd;
   import com.qq.modules.main.command.CmdStoreProxyCmd;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.main.service.BuffProxy;
   import com.qq.modules.secondaryPassword.SecondaryPasswordConst;
   import com.qq.modules.secondaryPassword.command.SecondaryPasswordCmd;
   import com.qq.modules.secondaryPassword.model.SecondaryPasswordProxy;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class RoleBuffBarMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var roleProxy:ActorModel;
      
      [Inject]
      public var bagService:BagService;
      
      [Inject]
      public var buffProxy:BuffProxy;
      
      [Inject]
      public var cityData:CityData;
      
      [Inject]
      public var arenaData:ArenaModel;
      
      [Inject]
      public var monthCardProxy:MonthCardProxy;
      
      [Inject]
      public var secondaryPasswordProxy:SecondaryPasswordProxy;
      
      public function RoleBuffBarMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.update();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.ChangeLevel,this.onChangeLevel);
         addContextListener(CommandName.BUFF_CHANGED,this.onBUFF_CHANGED);
         addContextListener(CommandName.BUFF_GET_LIST_EVENT,this.refreshAvoidWar);
         addContextListener(BattleLineupConst.LINEUP_UPDATE,this.refreshHealth);
         addContextListener(ArenaConst.EVENT_UPDATE,this.refreshArena);
         addContextListener(BuyGlobal.MONTH_CARD_REWARD_LIST_UPDATED,this.refreshMonthCard);
         addContextListener(SecondaryPasswordConst.GET_PASSWORD_INFO,this.refreshSecondaryPassword);
      }
      
      private function onHealthClick(param1:MouseEvent) : void
      {
         HealthDegreeCmd.showHealthDegreeWins();
      }
      
      private function onMonthCardClick(param1:MouseEvent) : void
      {
         var _loc2_:RoleMonthCardIcon = this.view.getBuffIcon(RoleBuffBar.ICON_MONTH_CARD) as RoleMonthCardIcon;
         _loc2_.click();
      }
      
      private function onSecondaryPasswordClick(param1:MouseEvent) : void
      {
         SecondaryPasswordCmd.open();
      }
      
      private function onBUFF_CHANGED(param1:Event) : void
      {
         this.refreshAvoidWar();
         this.refreshCastle();
      }
      
      private function onAvoidWarClick(param1:MouseEvent) : void
      {
         var _loc2_:RoleAvoidWarIcon = this.view.getBuffIcon(RoleBuffBar.ICON_AVOID_WAR) as RoleAvoidWarIcon;
         if(_loc2_.buffVO)
         {
            if(_loc2_.buffVO.buffType == E_BuffType.E_BuffType_WarFree)
            {
               QAlert.Show("免战牌无法连续使用");
            }
            else
            {
               QAlert.Show("免战牌正在冷却中");
            }
         }
         else
         {
            QAlert.Show("是否使用免战牌？","",Alert.YES | Alert.NO,null,this.confirmUseAvoidWar);
         }
      }
      
      private function confirmUseAvoidWar(param1:CloseEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1.detail == Alert.YES)
         {
            _loc2_ = [ItemID.AVOID_WAR_ITEM,ItemID.AVOID_WAR_ADVANCE_ITEM];
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _loc4_ = _loc2_[_loc3_];
               if((_loc5_ = this.bagService.bagInfo.getItemNumByItemID(_loc4_)) > 0)
               {
                  this.bagService.useItem(_loc4_);
                  break;
               }
               if(_loc3_ + 1 == _loc2_.length)
               {
                  CmdStoreProxyCmd.buyByItemID(ItemID.AVOID_WAR_ITEM,1,"",0,this.bagService.useItem,[ItemID.AVOID_WAR_ITEM]);
               }
               _loc3_++;
            }
         }
      }
      
      private function update() : void
      {
         if(this.roleProxy.actorLevel >= GuideTemplateFactory.instance.getOpenButtonById(CityButtonConstant.ID_BUTTON_WORLD_MAP).openLv)
         {
            this.view.addBuffIcon(RoleBuffBar.ICON_AVOID_WAR);
            addComponentListener(this.view.getBuffIcon(RoleBuffBar.ICON_AVOID_WAR),MouseEvent.CLICK,this.onAvoidWarClick);
            this.view.addBuffIcon(RoleBuffBar.ICON_PLANT_HEALTH);
            addComponentListener(this.view.getBuffIcon(RoleBuffBar.ICON_PLANT_HEALTH),MouseEvent.CLICK,this.onHealthClick);
         }
         if(this.cityData.hasBuilding(CityConstant.Building_Arena))
         {
            this.view.addBuffIcon(RoleBuffBar.ICON_ARENA);
         }
         this.view.addBuffIcon(RoleBuffBar.ICON_CASTLE);
         this.view.addBuffIcon(RoleBuffBar.ICON_SECONDARY_PASSWORD);
         addComponentListener(this.view.getBuffIcon(RoleBuffBar.ICON_SECONDARY_PASSWORD),MouseEvent.CLICK,this.onSecondaryPasswordClick);
         this.view.addBuffIcon(RoleBuffBar.ICON_MONTH_CARD);
         addComponentListener(this.view.getBuffIcon(RoleBuffBar.ICON_MONTH_CARD),MouseEvent.CLICK,this.onMonthCardClick);
         this.refreshAvoidWar();
         this.refreshHealth();
         this.refreshArena();
         this.refreshMonthCard();
         this.refreshCastle();
         this.refreshSecondaryPassword();
      }
      
      private function onChangeLevel(param1:Event = null) : void
      {
         this.update();
      }
      
      private function refreshMonthCard(param1:Event = null) : void
      {
         var _loc2_:RoleMonthCardIcon = this.view.getBuffIcon(RoleBuffBar.ICON_MONTH_CARD) as RoleMonthCardIcon;
         _loc2_.visible = _loc2_.setData(this.monthCardProxy.rewards);
      }
      
      private function refreshCastle(param1:Event = null) : void
      {
         var _loc2_:RoleCastleIcon = this.view.getBuffIcon(RoleBuffBar.ICON_CASTLE) as RoleCastleIcon;
         _loc2_.setData(this.buffProxy.getBuffByType(E_BuffType.E_BuffType_Castle));
      }
      
      private function refreshAvoidWar(param1:Event = null) : void
      {
         if(!this.view.hasBuffIcon(RoleBuffBar.ICON_AVOID_WAR))
         {
            return;
         }
         var _loc2_:RoleAvoidWarIcon = this.view.getBuffIcon(RoleBuffBar.ICON_AVOID_WAR) as RoleAvoidWarIcon;
         if(this.buffProxy.getBuffByType(E_BuffType.E_BuffType_WarFree))
         {
            _loc2_.buffVO = this.buffProxy.getBuffByType(E_BuffType.E_BuffType_WarFree);
         }
         else if(this.buffProxy.getBuffByType(E_BuffType.E_BuffType_WarFreeCD))
         {
            _loc2_.buffVO = this.buffProxy.getBuffByType(E_BuffType.E_BuffType_WarFreeCD);
         }
         else
         {
            _loc2_.buffVO = null;
         }
      }
      
      private function refreshHealth(param1:Event = null) : void
      {
         if(!this.view.hasBuffIcon(RoleBuffBar.ICON_PLANT_HEALTH))
         {
            return;
         }
         var _loc2_:RoleHealthIcon = this.view.getBuffIcon(RoleBuffBar.ICON_PLANT_HEALTH) as RoleHealthIcon;
         _loc2_.minHealth = this.roleProxy.battleCardModel.minHealth;
      }
      
      private function refreshArena(param1:Event = null) : void
      {
         if(!this.view.hasBuffIcon(RoleBuffBar.ICON_ARENA))
         {
            return;
         }
         var _loc2_:RoleArenaIcon = this.view.getBuffIcon(RoleBuffBar.ICON_ARENA) as RoleArenaIcon;
         _loc2_.currentStatus = this.arenaData.curGrade;
      }
      
      private function refreshSecondaryPassword(param1:Event = null) : void
      {
         if(!this.view.hasBuffIcon(RoleBuffBar.ICON_SECONDARY_PASSWORD))
         {
            return;
         }
         var _loc2_:SecondaryPasswordIcon = this.view.getBuffIcon(RoleBuffBar.ICON_SECONDARY_PASSWORD) as SecondaryPasswordIcon;
         _loc2_.setData();
         if(this.secondaryPasswordProxy.hasPassword)
         {
            _loc2_.removeFlashEffect();
         }
         else
         {
            _loc2_.addFlashEffect();
         }
      }
      
      public function get view() : RoleBuffBar
      {
         return viewComponent as RoleBuffBar;
      }
   }
}
