package com.qq.modules.qzoneShare.command
{
   import PVZ.Cmd.Cmd_Qzone_QueryShareList_CS;
   import PVZ.Cmd.Cmd_Qzone_SendShareMsg_CS;
   import PVZ.Cmd.Dto_ShareInfo;
   import PVZ.Cmd.E_QzoneShareType;
   import asgui.controls.Button;
   import asgui.managers.PopUpManager;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.qzoneShare.model.QZoneShareProxy;
   import com.qq.modules.qzoneShare.model.templates.QZoneShareTempFactory;
   import com.qq.modules.qzoneShare.model.templates.ce.QZoneShareTemplate;
   import com.qq.modules.qzoneShare.view.QZoneShareBtnTip;
   import com.qq.modules.qzoneShare.view.QZoneShareMsgWindow;
   import com.qq.templates.font.FontHKHB;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class QZoneShareCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var qzoneShareProxy:QZoneShareProxy;
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      public function QZoneShareCommand()
      {
         super();
      }
      
      public function getQZoneShareState() : void
      {
         var _loc1_:Cmd_Qzone_QueryShareList_CS = null;
         if(ExternalVars.PlatformFlag == ExternalVars.SFROM_QZONE && this.qzoneShareProxy.isOpen)
         {
            _loc1_ = new Cmd_Qzone_QueryShareList_CS();
            this.pvzService.sendMessage(_loc1_);
         }
      }
      
      public function checkTDShareMsg(param1:int, param2:uint, param3:uint, param4:uint, param5:Button, param6:Function) : void
      {
         var _loc7_:int = this.qzoneShareProxy.checkTDShareMsg(param1,param2,param3,param4);
         this.showPvzSharePanel(_loc7_,param5,param6);
      }
      
      public function checkFBShareMsg(param1:int, param2:uint, param3:Button, param4:Function) : void
      {
         var _loc5_:int = this.qzoneShareProxy.checkFBShareMsg(param1,param2);
         this.showPvzSharePanel(_loc5_,param3,param4);
      }
      
      public function checkFriendPvPShareMsg(param1:Button, param2:Array, param3:Function) : void
      {
         var _loc4_:uint = this.qzoneShareProxy.checkFriendPvPShareMsg();
         if(this.showPvzSharePanel(_loc4_,param1,param3))
         {
            this.qzoneShareProxy.descParam = param2;
         }
      }
      
      public function checkTalentShareMsg(param1:int, param2:Button, param3:Function) : void
      {
         var _loc4_:uint = this.qzoneShareProxy.checkTalentShareMsg(param1);
         this.showPvzSharePanel(_loc4_,param2,param3);
      }
      
      public function checkCardShareMsg(param1:uint, param2:uint, param3:Button, param4:Function) : void
      {
         var _loc5_:uint = this.qzoneShareProxy.checkCardShareMsg(param1,param2);
         this.qzoneShareProxy.shareType = E_QzoneShareType.E_QzoneShareType_Card;
         this.qzoneShareProxy.cardId = param1;
         this.showPvzSharePanel(_loc5_,param3,param4);
      }
      
      public function checkLabMakeShareMsg(param1:Button, param2:Function) : void
      {
         var _loc3_:uint = this.qzoneShareProxy.checkLabMakeShareMsg();
         this.showPvzSharePanel(_loc3_,param1,param2);
      }
      
      public function checkSignInShareMsg(param1:Button, param2:Function) : void
      {
         var _loc3_:uint = this.qzoneShareProxy.checkSignInShareMsg();
         this.showPvzSharePanel(_loc3_,param1,param2);
      }
      
      private function showPvzSharePanel(param1:uint, param2:Button, param3:Function) : Boolean
      {
         var _loc4_:Dto_ShareInfo = null;
         var _loc5_:QZoneShareMsgWindow = null;
         if(param1 != 0)
         {
            if((_loc4_ = this.qzoneShareProxy.getShareInfo(param1)) && _loc4_.leftTimes > 0 && this.qzoneShareProxy.shareLeftTimes > 0)
            {
               this.qzoneShareProxy.curShareId = param1;
               this.qzoneShareProxy.backFunc = param3;
               if(param2)
               {
                  param2.label = FontHKHB.QZONE_SHARE_LABEL;
                  this.initShareBtn(param2);
               }
               else
               {
                  _loc5_ = new QZoneShareMsgWindow();
                  PopUpManager.AddPopUp(_loc5_,null,true);
                  QZoneShareCmd.initShareBtn(_loc5_.btn_share);
               }
               return true;
            }
            return false;
         }
         if(Boolean(param3))
         {
            param3();
         }
         return false;
      }
      
      public function initShareBtn(param1:Button) : void
      {
         var _loc2_:QZoneShareBtnTip = new QZoneShareBtnTip();
         PopUpManager.AddPopUp(_loc2_,null,false,false);
         _loc2_.data = param1;
      }
      
      public function sendQZoneShareMsg() : void
      {
         var _loc1_:Cmd_Qzone_SendShareMsg_CS = new Cmd_Qzone_SendShareMsg_CS();
         _loc1_.shareId = this.qzoneShareProxy.curShareId;
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function operateShareBtn(param1:Button, param2:uint) : void
      {
      }
      
      public function showQZoneShareMsg(param1:int, param2:Array = null) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         this.qzoneShareProxy.curShareId = param1;
         var _loc3_:QZoneShareTemplate = QZoneShareTempFactory.instance.getQZoneShareTempById(param1);
         var _loc4_:String = _loc3_.desc;
         if(param2)
         {
            _loc5_ = param2.length;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc4_ = _loc4_.replace(new RegExp("\\{" + _loc6_ + "\\}","g"),param2[_loc6_]);
               _loc6_++;
            }
         }
         this.sendQZoneShareMsg();
      }
   }
}
