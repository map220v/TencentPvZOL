package com.qq.modules.mapinfo.view.components
{
   import PVZ.Cmd.E_RecallType;
   import PVZ.Cmd.E_TeamState;
   import PVZ.Cmd.E_WarResult;
   import PVZ.Cmd.E_WarTargetType;
   import PVZ.Cmd.E_WarType;
   import PVZ.Cmd.E_War_History;
   import asgui.controls.Alert;
   import asgui.controls.Button;
   import asgui.controls.Label;
   import asgui.core.IDisposable;
   import asgui.core.IListItemRenderer;
   import asgui.events.CloseEvent;
   import asgui.utils.StringUtil;
   import com.qq.constant.ItemID;
   import com.qq.display.QAlert;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.embattle.command.EmbattleCmd;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.map.MapGlobals;
   import com.qq.modules.map.command.MapViewCmd;
   import com.qq.modules.mapinfo.command.MapInfoProxyCmd;
   import com.qq.modules.mapinfo.model.vo.MapInfoRoleVO;
   import com.qq.modules.mapinfo.model.vo.MapInfoWarHistoryVO;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.UrlManager;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class MapInfoDetailItemRenderer extends MapInfoDetailItemRendererCE implements IListItemRenderer
   {
       
      
      private var timer:Timer;
      
      private var backSource:Object;
      
      private var showFunction:Boolean;
      
      private var btnReport:Button;
      
      private var btnCallback:Button;
      
      private var btnReinforce:Button;
      
      private var btnRecall:Button;
      
      private var btnSpeed:Button;
      
      private var isContent:Boolean;
      
      private var ifNameUesRoleName:Boolean = false;
      
      private var hasTimeEndRequest:Boolean;
      
      private var tabType:int;
      
      public var holder:MapInfoDetailWnd;
      
      public function MapInfoDetailItemRenderer(param1:Object = null, param2:Number = NaN, param3:Boolean = true)
      {
         this.showFunction = param3;
         this.backSource = param1;
         super();
         if(!isNaN(param2))
         {
            this.width = param2;
         }
      }
      
      override public function Dispose() : void
      {
         this.clearBtns();
         this.holder = null;
         if(this.timer)
         {
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER,this.timerHandler);
            this.timer = null;
         }
         super.Dispose();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.styleName = "Canvas";
         this.txtTime.SetStyle("textAlign","right");
         this.txtTime.mouseChildren = this.txtTime.mouseEnabled = false;
         this.timer = new Timer(1000);
         this.timer.addEventListener(TimerEvent.TIMER,this.timerHandler);
         this.timer.start();
         this.setBackSource(this.backSource);
      }
      
      public function setRoleInfoStyle() : void
      {
         box.removeChild(this.txtStatus);
         box.addChildAt(this.txtName,0);
         this.ifNameUesRoleName = true;
         txtName.width = 140;
         txtTarget.width = 140;
         imgIcon.width = 40;
      }
      
      public function setBackSource(param1:Object, param2:Boolean = true) : void
      {
         var _loc3_:Label = null;
         this.isContent = param2;
         if(param1 != null)
         {
            this.styleName = "Canvas";
            imgBack.source = param1;
         }
         if(param2)
         {
            this.setAllTxtStyleName("Label");
         }
         else
         {
            this.setAllTxtStyleName(".TXT_HKHB_13_Yellow");
            this.setAllTxtStyle("fontSize","14");
            this.setAllTxtStyle("textAlign","left");
            _loc3_ = new Label();
            _loc3_.x = 130;
            _loc3_.y = 6;
            _loc3_.width = 80;
            _loc3_.height = 24;
            _loc3_.text = FontHKHB.CTRL;
            _loc3_.styleName = ".TXT_HKHB_13_Yellow";
            boxBtns.addChild(_loc3_);
         }
      }
      
      private function setAllTxtStyleName(param1:String) : void
      {
         this.txtName.styleName = this.txtStatus.styleName = this.txtTarget.styleName = this.txtTime.styleName = this.txtAlliance.styleName = param1;
      }
      
      private function setAllTxtStyle(param1:String, param2:String) : void
      {
         this.txtName.SetStyle(param1,param2);
         this.txtStatus.SetStyle(param1,param2);
         this.txtTarget.SetStyle(param1,param2);
         this.txtTime.SetStyle(param1,param2);
         this.txtAlliance.SetStyle(param1,param2);
      }
      
      private function clearBtns() : void
      {
         while(boxBtns && this.boxBtns.numChildren)
         {
            (this.boxBtns.removeChildAt(0) as IDisposable).Dispose();
         }
         this.btnReport = null;
         this.btnSpeed = null;
         this.btnCallback = null;
         this.btnReinforce = null;
         this.btnRecall = null;
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(!this.isContent)
         {
            this.tabType = int(param1);
            if(E_War_History.E_War_History_Personal == this.tabType)
            {
               txtName.text = "镇长";
               txtAlliance.width = 1;
            }
            else
            {
               txtName.text = "攻方镇长";
               txtAlliance.width = 80;
            }
            return;
         }
         if(param1 == null)
         {
            this.visible = false;
            return;
         }
         this.visible = true;
         this.clearBtns();
         var _loc2_:MapInfoWarHistoryVO = param1 as MapInfoWarHistoryVO;
         this.tabType = _loc2_.tabType;
         if(_loc2_.roleInfo)
         {
            this.checkNameLink(this.txtName,_loc2_.roleInfo,!!this.ifNameUesRoleName ? _loc2_.roleInfo.getTargetFullName(true,true) : _loc2_.roleInfo.getTargetFullName(true,true));
         }
         if(_loc2_.targetInfo)
         {
            this.checkNameLink(this.txtTarget,_loc2_.targetInfo,!!this.ifNameUesRoleName ? _loc2_.targetInfo.getTargetFullName(true,true) : _loc2_.targetInfo.getTargetFullName(true,true));
         }
         this.txtStatus.text = _loc2_.teamStateLabel;
         this.txtTime.text = _loc2_.leftTimeString;
         this.txtTime.visible = !this.ifNameUesRoleName;
         if(_loc2_.roleInfo)
         {
            this.txtAlliance.text = _loc2_.roleInfo.allianceName;
         }
         this.txtStatus.SetStyle("color",_loc2_.teamStateColor);
         this.imgIcon.visible = _loc2_.warResult != 0;
         switch(_loc2_.warResult)
         {
            case E_WarResult.E_WarResult_Win:
               this.imgIcon.source = UrlManager.getUrl(0,"swf/mapinfo/win.png");
               break;
            case E_WarResult.E_WarResult_Fail:
               this.imgIcon.source = UrlManager.getUrl(0,"swf/mapinfo/lose.png");
         }
         if(E_War_History.E_War_History_Personal == this.tabType)
         {
            txtAlliance.width = 1;
            switch(_loc2_.teamState)
            {
               case E_TeamState.E_TeamState_Marching:
                  if(this.showFunction && _loc2_.roleInfo.isMe)
                  {
                     this.btnCallback = this.createButton(FontHKHB.MAP_INFO_CALLBACK);
                     this.btnSpeed = this.createButton(FontHKHB.MAP_INFO_SPEED);
                  }
                  break;
               case E_TeamState.E_TeamState_ReCalling:
               case E_TeamState.E_TeamState_Returning:
                  if(this.showFunction && _loc2_.roleInfo.isMe)
                  {
                     this.btnSpeed = this.createButton(FontHKHB.MAP_INFO_SPEED);
                  }
                  break;
               case E_TeamState.E_TeamState_Home:
                  break;
               case E_TeamState.E_TeamState_Guarding:
                  if(this.showFunction && _loc2_.roleInfo.isMe)
                  {
                     this.btnRecall = this.createButton(FontHKHB.MAP_INFO_RECALL);
                  }
            }
            if(this.showFunction && !this.btnCallback && !this.btnRecall)
            {
               this.btnCallback = this.createButton(FontHKHB.MAP_INFO_RECALL);
               this.btnCallback.enabled = false;
            }
            if(this.showFunction)
            {
               this.btnReport = this.createButton(FontHKHB.MAP_INFO_WATCH_REPORT);
               this.btnReport.enabled = _loc2_.hasReport;
            }
         }
         else
         {
            txtAlliance.width = 80;
            this.btnReinforce = this.createButton(FontHKHB.MAP_ROLE_ACTION_REINFORCE);
         }
         if(_loc2_.leftTime > 0)
         {
            this.timer.start();
         }
         else
         {
            this.timer.stop();
         }
         this.hasTimeEndRequest = false;
         this.updateTime();
      }
      
      private function checkNameLink(param1:Label, param2:MapInfoRoleVO, param3:String) : void
      {
         param1.text = param3;
         if(param2.isMe && param2.type == MapGlobals.MAP_CELL_TYPE_CITY)
         {
            param1.SetStyle("textDecoration","");
            param1.buttonMode = false;
         }
         else
         {
            param1.SetStyle("textDecoration","underline");
            param1.buttonMode = true;
            param1.data = param2;
            param1.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
         }
      }
      
      private function createButton(param1:String) : Button
      {
         var _loc2_:Button = new Button();
         _loc2_.label = param1;
         _loc2_.styleName = ".GreenButtonRect";
         _loc2_.width = 45;
         _loc2_.height = 20;
         _loc2_.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
         this.boxBtns.addChild(_loc2_);
         return _loc2_;
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         var _loc3_:MapInfoRoleVO = null;
         var _loc4_:BagItemTemplate = null;
         var _loc2_:MapInfoWarHistoryVO = data as MapInfoWarHistoryVO;
         switch(param1.currentTarget)
         {
            case this.btnReport:
               GameFlowCmd.queryReport(_loc2_.reportId);
               return;
            case this.txtName:
            case this.txtTarget:
               _loc3_ = (param1.currentTarget as Label).data as MapInfoRoleVO;
               if(_loc3_)
               {
                  MapViewCmd.cameraToCell(_loc3_.pos,_loc2_.areaId);
               }
               return;
            default:
               if(_loc2_.areaId != (this.holder.getMediator() as MapInfoDetailWndMediator).proxy.data.myAreaId)
               {
                  QAlert.Show("在不同地图，不能操作。");
                  return;
               }
               switch(param1.currentTarget)
               {
                  case this.btnCallback:
                     MapInfoProxyCmd.recallTeam(_loc2_.teamId);
                     break;
                  case this.btnRecall:
                     if(_loc2_.targetInfo.type == E_WarTargetType.E_WarTargetType_Mine)
                     {
                        MapInfoProxyCmd.doMineRecallTeam(_loc2_.targetInfo.pos.x,_loc2_.targetInfo.pos.y);
                     }
                     else if(_loc2_.targetInfo.type == E_WarTargetType.E_WarTargetType_City || _loc2_.targetInfo.type == E_WarTargetType.E_WarTargetType_Temple)
                     {
                        if(_loc2_.targetInfo.type == E_WarTargetType.E_WarTargetType_City && _loc2_.type == E_WarType.E_WarType_Reinforce)
                        {
                           MapInfoProxyCmd.recallTeam(_loc2_.teamId,E_RecallType.E_RecallType_Outpost);
                        }
                        else
                        {
                           MapInfoProxyCmd.recallTeam(_loc2_.teamId,E_RecallType.E_RecallType_Setout);
                        }
                     }
                     break;
                  case this.btnSpeed:
                     _loc4_ = ItemTemplateFactory.instance.getBagItemTemplateById(ItemID.TEAM_SPEED);
                     QAlert.Show(StringUtil.substitute(FontNormal.MAP_SPEED,_loc4_.name,int(_loc4_.useEffect.split(":")[1] / 100)),"",Alert.YES | Alert.NO,null,this.onSpeedConfirm);
                     break;
                  case this.btnReinforce:
                     if(_loc2_.targetInfo.type == E_WarTargetType.E_WarTargetType_Temple)
                     {
                        EmbattleCmd.embattleByMapFight(_loc2_.targetInfo.pos,EmbattleConst.MAP_CHILD_MODE_TEMPLE,E_WarType.E_WarType_Reinforce);
                     }
                     else if(_loc2_.targetInfo.type == E_WarTargetType.E_WarTargetType_Mine)
                     {
                        EmbattleCmd.embattleByMapFight(_loc2_.targetInfo.pos,EmbattleConst.MAP_CHILD_MODE_MINE,E_WarType.E_WarType_Reinforce);
                     }
                     else
                     {
                        EmbattleCmd.embattleByMapFight(_loc2_.targetInfo.pos,EmbattleConst.MAP_CHILD_MODE_NOMAL,E_WarType.E_WarType_Reinforce);
                     }
                     if(this.holder)
                     {
                        this.holder.Close();
                     }
               }
               return;
         }
      }
      
      private function onSpeedConfirm(param1:CloseEvent) : void
      {
         var _loc2_:MapInfoWarHistoryVO = null;
         if(param1.detail == Alert.YES)
         {
            _loc2_ = data as MapInfoWarHistoryVO;
            MapInfoProxyCmd.speedTeam(_loc2_.teamId);
         }
      }
      
      protected function timerHandler(param1:TimerEvent) : void
      {
         this.updateTime();
      }
      
      private function updateTime() : void
      {
         var _loc1_:MapInfoWarHistoryVO = data as MapInfoWarHistoryVO;
         if(_loc1_)
         {
            this.txtTime.text = _loc1_.leftTimeString;
         }
         else if(!this.hasTimeEndRequest)
         {
            this.hasTimeEndRequest = true;
         }
      }
   }
}
