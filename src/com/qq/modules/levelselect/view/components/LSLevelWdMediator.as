package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Alert;
   import asgui.events.CloseEvent;
   import asgui.resources.AssetManager;
   import asgui.utils.StringUtil;
   import com.qq.constant.ItemID;
   import com.qq.data.DataCacheManager;
   import com.qq.display.QAlert;
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.guidePlus.GuideContext;
   import com.qq.modules.guidePlus.command.GuideViewCmd;
   import com.qq.modules.levelselect.command.LSProxyCmd;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.modules.levelselect.model.vo.LSLevelInfoVO;
   import com.qq.modules.levelselect.view.maps.LSAwardPlantIcon;
   import com.qq.modules.levelselect.view.maps.LSMapSunSmallIcon;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.constant.PrivilegeConst;
   import com.qq.modules.main.model.AddictInfo;
   import com.qq.modules.main.service.PrivilegeProxy;
   import com.qq.modules.td.data.game.unit.TDPlantBaseStaticInfo;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.db.ClientDBTableName;
   import flash.events.MouseEvent;
   
   public class LSLevelWdMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSLevelWd;
      
      [Inject]
      public var proxy:LSProxy;
      
      [Inject]
      public var privilegeProxy:PrivilegeProxy;
      
      public var vo:LSLevelInfoVO;
      
      private var _awardPlant:LSAwardPlantIcon;
      
      public function LSLevelWdMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         var _loc1_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:LSLevelAchivementIcon = null;
         var _loc8_:ItemVO = null;
         var _loc9_:TDPlantBaseStaticInfo = null;
         super.init();
         this.vo = this.proxy.getLevelInfo(this.view.levelId,this.view.subLevelId);
         this.view.title = FontHKHB.LEVEL + " " + this.vo.template.levelId + " - " + this.vo.template.subLevelId;
         this.view.firstCoin.text = "* " + StringUtil.substitute(FontHKHB.FIRST_COIN,this.vo.template.firstCoin);
         if(this.privilegeProxy.hasPrivilege(PrivilegeConst.PRIVILEGE_FUBEN_TD_COIN_ADD))
         {
            _loc3_ = this.privilegeProxy.getPrivilegeParamById(PrivilegeConst.PRIVILEGE_FUBEN_TD_COIN_ADD);
            _loc4_ = this.vo.template.bonusCoin * (_loc3_ * 0.0001);
            _loc5_ = this.vo.template.bonusCoin + "+" + _loc4_ + FontHKHB.BONUS_COIN_ARG;
            this.view.txtBonusCoin.text = "* " + StringUtil.substitute(FontHKHB.BONUS_COIN,_loc5_);
         }
         else
         {
            this.view.txtBonusCoin.text = "* " + StringUtil.substitute(FontHKHB.BONUS_COIN,this.vo.template.bonusCoin);
         }
         if(this.vo.template.achievementList.length == 1)
         {
            this.view.image_104.source = AssetManager.GetClass("LS_Select_Bt_BK1");
         }
         else
         {
            this.view.image_104.source = AssetManager.GetClass("LS_Select_Bt_BK");
         }
         _loc1_ = 0;
         while(_loc1_ < this.vo.template.achievementList.length)
         {
            _loc6_ = this.vo.template.achievementList[_loc1_][0];
            _loc7_ = new LSLevelAchivementIcon(_loc6_,_loc1_,this.vo.getAchievementUnlocked(_loc6_),this.vo.template);
            this.view.boxAch.addChild(_loc7_);
            _loc1_++;
         }
         var _loc2_:int = 0;
         if(this.vo.template.bonusExp > 0)
         {
            _loc2_++;
            this.view.panelRightBox.addChild(new LSMapSunSmallIcon(LSMapSunSmallIcon.TYPE_EXP,AddictInfo.getInstance().updateAddictRewardNum(ItemID.Exp,this.vo.template.bonusExp)));
         }
         if(this.vo.template.bonusItemVec.length > 0)
         {
            for each(_loc8_ in this.vo.template.bonusItemVec)
            {
               this.view.panelItemsBox.addChild(new LSMapSunSmallIcon(_loc8_.itemId,_loc8_.amount));
            }
         }
         switch(_loc2_)
         {
            case 0:
               this.view.l_x1.visible = this.view.l_x2.visible = false;
               break;
            case 1:
               this.view.l_x2.visible = false;
         }
         if(this.vo.template.bonusPlant > 0)
         {
            if((_loc9_ = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_PlantTypeInfo,this.vo.template.bonusPlant,TDPlantBaseStaticInfo)) != null)
            {
               this._awardPlant = new LSAwardPlantIcon();
               this._awardPlant.plantId = this.vo.template.bonusPlant;
               this.view.plantCav.addChild(this._awardPlant);
            }
         }
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         this.view.btnWinDebug.addEventListener(MouseEvent.CLICK,this.onClick);
         this.view.btnGo.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      protected function onClick(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         switch(e.currentTarget)
         {
            case this.view.btnGo:
               this.vo = this.proxy.getLevelInfo(this.view.levelId,this.view.subLevelId);
               if(this.vo.starsGot == this.vo.template.achievementList.length)
               {
                  var closeHandler:Function = function(param1:CloseEvent):void
                  {
                     if(param1.detail == Alert.YES)
                     {
                        GameFlowCmd.gotoTD(proxy.data.stageId,view.levelId,view.subLevelId);
                     }
                  };
                  QAlert.Show(FontNormal.LS_PLAY_PASSED_LEVEL_TIP,"",Alert.YES | Alert.NO,null,closeHandler);
               }
               else
               {
                  GameFlowCmd.gotoTD(this.proxy.data.stageId,this.view.levelId,this.view.subLevelId);
               }
               break;
            case this.view.btnWinDebug:
               LSProxyCmd.finishLevel(this.vo.stageId,this.vo.levelId,this.vo.subLevelId,1,[]);
         }
         this.view.Close();
      }
      
      override protected function initialized() : void
      {
         super.initialized();
         GuideViewCmd.changeContext(GuideContext.TD_SELECT_WINDOW);
      }
      
      override public function dispose() : void
      {
         if(this._awardPlant)
         {
            this._awardPlant.Dispose();
            this._awardPlant = null;
         }
         GuideViewCmd.changeContext(GuideContext.lastContext);
         super.dispose();
      }
   }
}
