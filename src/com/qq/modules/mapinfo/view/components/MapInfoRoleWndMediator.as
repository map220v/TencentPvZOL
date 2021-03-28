package com.qq.modules.mapinfo.view.components
{
   import PVZ.Cmd.E_BuffType;
   import PVZ.Cmd.E_FriendStatus;
   import PVZ.Cmd.E_WarType;
   import asgui.controls.Alert;
   import asgui.controls.Button;
   import asgui.core.UIComponent;
   import asgui.events.CloseEvent;
   import asgui.managers.PopUpManager;
   import asgui.utils.StringUtil;
   import com.qq.CommandName;
   import com.qq.constant.ls.LSConstant;
   import com.qq.display.QAlert;
   import com.qq.display.QPopUpManagerImpl;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.chat.ChatGlobals;
   import com.qq.modules.city.command.CityViewCmd;
   import com.qq.modules.embattle.command.EmbattleCmd;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.friend.FriendGlobals;
   import com.qq.modules.friend.command.FriendProxyCmd;
   import com.qq.modules.friend.model.vo.FriendRoleVo;
   import com.qq.modules.login.command.LoginServerCmd;
   import com.qq.modules.mail.command.MailCmd;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.main.model.vo.BuffVO;
   import com.qq.modules.main.service.BuffProxy;
   import com.qq.modules.map.MapGlobals;
   import com.qq.modules.map.command.MapViewCmd;
   import com.qq.modules.map.model.vo.MapCityCellVO;
   import com.qq.modules.mapinfo.MapInfoGlobals;
   import com.qq.modules.mapinfo.command.MapInfoProxyCmd;
   import com.qq.modules.mapinfo.model.MapInfoProxy;
   import com.qq.modules.mapinfo.model.vo.MapInfoWarHistoryVO;
   import com.qq.modules.mapinfo.view.map.MapInfoDeclareWarCard;
   import com.qq.modules.mapinfo.view.map.MapInfoForbiddenWarCard;
   import com.qq.modules.union.command.UnionCmd;
   import com.qq.modules.union.command.UnionServiceCmd;
   import com.qq.modules.union.model.UnionModel;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.external.QExternalUtil;
   import com.tencent.protobuf.Int64;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class MapInfoRoleWndMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:MapInfoRoleWnd;
      
      [Inject]
      public var actorModel:ActorModel;
      
      [Inject]
      public var union:UnionModel;
      
      [Inject]
      public var buffProxy:BuffProxy;
      
      [Inject]
      public var actor:ActorModel;
      
      [Inject]
      public var mapInfoProxy:MapInfoProxy;
      
      private var btnDeclareWar:Button;
      
      private var btnAttack:Button;
      
      private var btnReinforce:Button;
      
      private var btnRetreat:Button;
      
      private var btnInviteAlliance:Button;
      
      private var btnFriend:Button;
      
      public function MapInfoRoleWndMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         super.init();
         addContextListener(MapGlobals.MAP_CELLS_IN_AREA_MODIFIED,this.onMAP_CELLS_IN_AREA_MODIFIED);
         addContextListener(MapInfoGlobals.MAP_INFO_ROLE_CELL_UPDATED,this.onMAP_INFO_ROLE_CELL_UPDATED);
         addContextListener(FriendGlobals.FRIEND_INVITE_SUCCEED,this.onFriendInviteSucceed);
         addComponentListener(this.view.button_my_word_save,MouseEvent.CLICK,this.onClickBtnMyWordSave);
         addComponentListener(this.view.txtAlliance,MouseEvent.CLICK,this.onOpenUnionInfo);
         addComponentListener(this.view.txtPos,MouseEvent.CLICK,this.clickHandler);
         addContextListener(ChatGlobals.CHAT_UPDATE_BLACK_LIST,this.onUpdateBlackList);
         addContextListener(CommandName.CHANGE_ROLE_SIGNATURE,this.onChangeRoleSigntrue);
         if(this.view.vo)
         {
            MapInfoProxyCmd.getMapCityInfo(this.view.vo.roleId);
            MapInfoProxyCmd.getMapCityCellDTO(this.view.vo.roleId);
         }
         else if(this.view.friendVo)
         {
            this.updateByFriendInfo(this.view.friendVo);
         }
         else
         {
            this.addContextListener(MapInfoGlobals.ROLE_DECLARE_SUCCESS,this.onDeclareSuccess);
            this.queryData();
         }
         if(this.view.challengeObj)
         {
            this.view.txtChallengeHonor.visible = this.view.img_challenge_back.visible = this.view.img_challenge_icon.visible = true;
            _loc1_ = this.view.challengeObj.stageId;
            _loc2_ = this.view.challengeObj.levelId;
            _loc3_ = this.view.challengeObj.subLevelId;
            this.view.txtChallengeHonor.text = LSConstant.STAGE_NAME_LIST[_loc1_ - 1] + _loc2_ + "-" + _loc3_ + "挑战关冠军";
         }
         else
         {
            this.view.txtChallengeHonor.visible = this.view.img_challenge_back.visible = this.view.img_challenge_icon.visible = false;
         }
      }
      
      private function onChangeRoleSigntrue(param1:CommonEvent) : void
      {
         var _loc2_:String = null;
         if(param1.param != null)
         {
            _loc2_ = String(param1.param);
         }
         this.view.textinput_my_word.text = _loc2_;
      }
      
      private function onClickBtnMyWordSave(param1:Event) : void
      {
         LoginServerCmd.saveMyWord(this.view.textinput_my_word.text);
      }
      
      private function onUpdateBlackList(param1:Event) : void
      {
         this.updateBlockInfo();
      }
      
      private function onOpenUnionInfo(param1:Event) : void
      {
         if(this.view.vo.allianceId != null && this.view.vo.allianceId.toNumber() > 0)
         {
            UnionCmd.showOtherUnionDetailInfo(this.view.vo.allianceId);
         }
      }
      
      private function onDeclareSuccess(param1:CommonEvent) : void
      {
         this.queryData();
      }
      
      private function queryData() : void
      {
         MapInfoProxyCmd.getMapCityCellDTO(this.view.roleId);
      }
      
      private function onMAP_INFO_ROLE_CELL_UPDATED(param1:CommonEvent) : void
      {
         this.view.vo = MapCityCellVO(param1.param);
         this.update();
      }
      
      private function onMAP_CELLS_IN_AREA_MODIFIED(param1:CommonEvent) : void
      {
         this.update();
      }
      
      private function onFriendInviteSucceed(param1:CommonEvent) : void
      {
         var _loc2_:Int64 = param1.param as Int64;
         if(_loc2_.compare(this.view.vo.roleId))
         {
            QAlert.Show(FontNormal.FRIEND_APPLY_SUCCEED);
         }
      }
      
      private function updateByFriendInfo(param1:FriendRoleVo) : void
      {
         var _loc2_:int = 0;
         var _loc3_:MapInfoDetailItemRenderer = null;
         var _loc4_:UIComponent = null;
         this.view.txtLevel.text = param1.level + "";
         this.view.txtName.text = param1.name;
         this.view.txtAlliance.text = QExternalUtil.queryServerName(param1.zoneId.toString());
         this.view.txtPos.text = "";
         this.view.imgRole.source = param1.icon;
         this.view.txtTip.text = StringUtil.substitute(FontNormal.MAP_FRIEND_LOGIN_TIP,QExternalUtil.queryServerName(param1.zoneId.toString()));
         while(this.view.boxBtns.numChildren)
         {
            _loc4_ = this.view.boxBtns.removeChildAt(0) as UIComponent;
            removeComponentListener(_loc4_,MouseEvent.CLICK,this.clickHandler);
            _loc4_.Dispose();
         }
         this.view.btnMail.visible = false;
         this.view.linkbutton_block.visible = false;
         this.view.linkbutton_not_block.visible = false;
         this.view.allianceIcon.visible = false;
         for each(_loc3_ in this.view.histories)
         {
            _loc3_.visible = false;
         }
      }
      
      private function update() : void
      {
         var _loc1_:int = 0;
         var _loc3_:UIComponent = null;
         var _loc4_:MapInfoDetailItemRenderer = null;
         if(this.view.vo == null)
         {
            return;
         }
         this.view.txtTip.visible = false;
         this.view.txtAlliance.text = this.view.vo.allianceName;
         this.view.txtLevel.text = this.view.vo.roleLevel + "";
         this.view.txtName.text = this.view.vo.roleName;
         this.view.txtPos.text = this.view.vo.getMapName(this.view.vo.area) + "（" + this.view.vo.pos.x + "，" + this.view.vo.pos.y + "）";
         this.view.imgRole.source = this.view.vo.roleIcon;
         while(this.view.boxBtns.numChildren)
         {
            _loc3_ = this.view.boxBtns.removeChildAt(0) as UIComponent;
            removeComponentListener(_loc3_,MouseEvent.CLICK,this.clickHandler);
            _loc3_.Dispose();
         }
         if(!this.view.vo.isMine && this.view.vo.isHaveCityInfo && this.view.vo.friendStatus != E_FriendStatus.E_FriendStatus_Friend)
         {
            this.btnFriend = this.createBtn(FontHKHB.MAP_ROLE_ACTION_INVITE_TO_FRIEND);
         }
         if(this.view.vo.canDeclareWar(this.union.playerUnionInfo.id))
         {
            this.btnDeclareWar = this.createBtn(FontHKHB.MAP_ROLE_ACTION_DECLARE_WAR);
            if(this.view.vo.roleLevel < 13 || this.actor.actorLevel < 13)
            {
               this.btnDeclareWar.enabled = false;
               this.btnDeclareWar.toolTip = "小镇13级开启世界地图后才可宣战！";
            }
         }
         if(this.view.vo.canAttack(this.union.playerUnionInfo.id))
         {
            this.btnAttack = this.createBtn(FontHKHB.MAP_ROLE_ACTION_ATTACT);
            this.btnAttack.enabled = this.hasTeamStandBy;
         }
         if(this.view.vo.canReinforce(this.union.playerUnionInfo.id))
         {
            this.btnReinforce = this.createBtn(FontHKHB.MAP_ROLE_ACTION_REINFORCE);
            this.btnReinforce.enabled = this.hasTeamStandBy;
         }
         if(this.view.vo.canRetreat(this.union.playerUnionInfo.id))
         {
            this.btnRetreat = this.createBtn(FontHKHB.MAP_ROLE_ACTION_RETREAT);
         }
         if(!this.view.vo.hasAlliance && this.union.hasAuthorizationForInvite())
         {
            this.btnInviteAlliance = this.createBtn(FontHKHB.MAP_ROLE_ACTION_INVITE_TO_ALLIANCE);
         }
         this.view.textinput_my_word.visible = true;
         if(this.view.vo.isMyCity())
         {
            this.view.button_my_word_save.visible = true;
            this.view.textinput_my_word.selectable = true;
            this.view.textinput_my_word.inputTooltip = "可输入您的个性签名，长度需在" + ServerConfigTemplateFactory.instance.iSignatureMaxLen + "字以内";
         }
         else
         {
            this.view.button_my_word_save.visible = false;
            this.view.textinput_my_word.selectable = false;
            this.view.textinput_my_word.inputTooltip = "TA还未设置个性签名";
         }
         this.view.textinput_my_word.text = this.view.vo.myWord;
         this.view.btnMail.visible = this.view.vo.canSendMail();
         var _loc2_:Vector.<MapInfoWarHistoryVO> = this.view.vo.getWarHistory();
         _loc1_ = 0;
         while(_loc1_ < this.view.histories.length)
         {
            (_loc4_ = this.view.histories[_loc1_]).data = _loc2_.length > _loc1_ ? _loc2_[_loc1_] : null;
            _loc1_++;
         }
         if(this.view.vo.isDeclaringWar())
         {
            this.view.boxBtns.addChild(new MapInfoDeclareWarCard(this.view.vo,this.update));
         }
         if(this.view.vo.hasWarForbid)
         {
            this.view.boxBtns.addChild(new MapInfoForbiddenWarCard(this.view.vo,this.update));
         }
         if(this.view.vo.guildFlag)
         {
            this.view.allianceIcon.change(this.view.vo.guildFlag);
         }
         else
         {
            this.view.allianceIcon.visible = false;
         }
         this.updateBlockInfo();
      }
      
      private function updateBlockInfo() : void
      {
         if(this.view.vo.canSendMail())
         {
            this.view.linkbutton_block.visible = !ChatGlobals.hasContainBlackList(this.view.vo.roleId);
            this.view.linkbutton_not_block.visible = !this.view.linkbutton_block.visible;
         }
         else
         {
            this.view.linkbutton_block.visible = this.view.linkbutton_not_block.visible = false;
         }
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.btnClose,MouseEvent.CLICK,this.clickHandler);
         addComponentListener(this.view.btnMail,MouseEvent.CLICK,this.clickHandler);
         addComponentListener(this.view.linkbutton_block,MouseEvent.CLICK,this.clickHandler);
         addComponentListener(this.view.linkbutton_not_block,MouseEvent.CLICK,this.clickHandler);
      }
      
      private function createBtn(param1:String) : Button
      {
         var _loc2_:Button = new Button();
         _loc2_.label = param1;
         _loc2_.styleName = ".GreenButton_Bigger";
         addComponentListener(_loc2_,MouseEvent.CLICK,this.clickHandler);
         this.view.boxBtns.addChild(_loc2_);
         return _loc2_;
      }
      
      public function get hasTeamStandBy() : Boolean
      {
         return this.actorModel.battleCardModel.getAttackBattleTeamAtHome().length > 0;
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         var vo:BuffVO = null;
         var e:MouseEvent = param1;
         switch(e.currentTarget)
         {
            case this.view.txtPos:
               MapViewCmd.cameraToCell(this.view.vo.pos,this.view.vo.area);
               break;
            case this.btnDeclareWar:
               MapInfoProxyCmd.declareWar(this.view.vo.roleId);
               break;
            case this.view.linkbutton_block:
               ChatGlobals.addIgnoreChat(this.view.vo.roleId,this.view.vo.roleName);
               break;
            case this.view.linkbutton_not_block:
               ChatGlobals.removeFromBlackList(this.view.vo.roleId);
               break;
            case this.btnAttack:
               if(this.hasTeamStandBy)
               {
                  vo = this.buffProxy.getBuffByType(E_BuffType.E_BuffType_WarFree);
                  if(vo)
                  {
                     QAlert.Show("进攻会去取消当前的免战状态，是否进攻？","",Alert.YES | Alert.NO,null,function(param1:CloseEvent):void
                     {
                        if(param1.detail == Alert.YES)
                        {
                           EmbattleCmd.embattleByMapFight(view.vo.pos,EmbattleConst.MAP_CHILD_MODE_NOMAL,E_WarType.E_WarType_Attack);
                           CityViewCmd.setTopRightToolBarVisible(false);
                           view.Close();
                        }
                     });
                  }
                  else if(this.mapInfoProxy.data.myAreaId != this.view.vo.area)
                  {
                     QAlert.Show(FontHKHB.EXPED_NO_AREA);
                  }
                  else
                  {
                     EmbattleCmd.embattleByMapFight(this.view.vo.pos,EmbattleConst.MAP_CHILD_MODE_NOMAL,E_WarType.E_WarType_Attack);
                     CityViewCmd.setTopRightToolBarVisible(false);
                     this.view.Close();
                  }
               }
               else
               {
                  QAlert.Show("当前没有可出征部队！");
               }
               break;
            case this.btnReinforce:
               if(this.hasTeamStandBy)
               {
                  if(this.view.vo.type == MapGlobals.MAP_CELL_TYPE_TEMPLE)
                  {
                     EmbattleCmd.embattleByMapFight(this.view.vo.pos,EmbattleConst.MAP_CHILD_MODE_TEMPLE,E_WarType.E_WarType_Reinforce);
                  }
                  else if(this.view.vo.type == MapGlobals.MAP_CELL_TYPE_MINE)
                  {
                     EmbattleCmd.embattleByMapFight(this.view.vo.pos,EmbattleConst.MAP_CHILD_MODE_MINE,E_WarType.E_WarType_Reinforce);
                  }
                  else
                  {
                     EmbattleCmd.embattleByMapFight(this.view.vo.pos,EmbattleConst.MAP_CHILD_MODE_NOMAL,E_WarType.E_WarType_Reinforce);
                  }
                  (PopUpManager.impl as QPopUpManagerImpl).closeAllVisibleComponents();
                  this.view.Close();
               }
               else
               {
                  QAlert.Show("当前没有可出征部队！");
               }
               break;
            case this.btnRetreat:
               break;
            case this.view.btnMail:
               MailCmd.openMailWin_write(this.view.vo.roleId,this.view.vo.roleName,this.view.vo.roleIcon);
               break;
            case this.view.btnClose:
               this.view.Close();
               break;
            case this.btnInviteAlliance:
               UnionServiceCmd.invitePlayer(this.view.vo.roleId);
               break;
            case this.btnFriend:
               FriendProxyCmd.applyInviteFriend(this.view.vo.roleId);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
