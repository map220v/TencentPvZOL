package com.qq.modules.secondaryPassword.model
{
   import PVZ.Cmd.Cmd_Card_Recycle_CS;
   import PVZ.Cmd.Cmd_Item_RecycleDebris_CS;
   import PVZ.Cmd.Cmd_Item_SellItems_CS;
   import PVZ.Cmd.Cmd_Item_Use_CS;
   import PVZ.Cmd.Cmd_Nutrition_ExtractExpAll_CS;
   import PVZ.Cmd.Cmd_Nutrition_ExtractExp_CS;
   import PVZ.Cmd.Cmd_SecondPwd_Conditon_SC;
   import PVZ.Cmd.Cmd_SecondPwd_Info_SC;
   import PVZ.Cmd.Cmd_SecondPwd_InputPwd_SC;
   import PVZ.Cmd.Cmd_SecondPwd_Modify_SC;
   import PVZ.Cmd.Cmd_SecondPwd_NeedPwd_SC;
   import PVZ.Cmd.Cmd_SecondPwd_Reset_SC;
   import PVZ.Cmd.Cmd_SecondPwd_SetPwd_SC;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.debris.command.DebrisProxyCmd;
   import com.qq.modules.secondaryPassword.SecondaryPasswordConst;
   import com.qq.modules.secondaryPassword.command.SecondaryPasswordCmd;
   import com.tencent.protobuf.Message;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class SecondaryPasswordProxy extends BasicProxy
   {
       
      
      public var hasPassword:Boolean;
      
      private var m_conditions:Array;
      
      public var errorTimes:uint;
      
      public var bReset:Boolean;
      
      public var noInputSet:Boolean;
      
      public var resetTime:int;
      
      public var isExceed:Boolean;
      
      public var isFreeze:Boolean;
      
      public var inputNeedTag:Boolean;
      
      public function SecondaryPasswordProxy()
      {
         super();
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_SecondPwd_Info_SC.$MessageID,this.onCmd_SecondPwd_Info_SC],[Cmd_SecondPwd_SetPwd_SC.$MessageID,this.onCmd_SecondPwd_SetPwd_SC],[Cmd_SecondPwd_InputPwd_SC.$MessageID,this.onCmd_SecondPwd_InputPwd_SC],[Cmd_SecondPwd_Modify_SC.$MessageID,this.onCmd_SecondPwd_Modify_SC],[Cmd_SecondPwd_Reset_SC.$MessageID,this.onCmd_SecondPwd_Reset_SC],[Cmd_SecondPwd_Conditon_SC.$MessageID,this.onCmd_SecondPwd_Conditon_SC],[Cmd_SecondPwd_NeedPwd_SC.$MessageID,this.onCmd_SecondPwd_NeedPwd_SC]];
      }
      
      public function hasSelected(param1:int) : Boolean
      {
         return this.m_conditions.indexOf(param1) >= 0;
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
      
      private function onCmd_SecondPwd_Info_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_SecondPwd_Info_SC = param1.socketData as Cmd_SecondPwd_Info_SC;
         this.bReset = _loc2_.bReset;
         this.m_conditions = _loc2_.system;
         this.hasPassword = _loc2_.hasPwd;
         this.noInputSet = _loc2_.input;
         this.resetTime = _loc2_.resetTime;
         this.isExceed = _loc2_.isexceed;
         this.isFreeze = _loc2_.isfreeze;
         dispatch(new CommonEvent(SecondaryPasswordConst.GET_PASSWORD_INFO));
      }
      
      private function onCmd_SecondPwd_SetPwd_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_SecondPwd_SetPwd_SC = param1.socketData as Cmd_SecondPwd_SetPwd_SC;
         if(_loc2_.success)
         {
            dispatch(new CommonEvent(SecondaryPasswordConst.INPUT_PASSWORD_RIGHT));
            SecondaryPasswordCmd.getInfo();
         }
      }
      
      private function onCmd_SecondPwd_InputPwd_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:Message = null;
         var _loc4_:Cmd_Item_RecycleDebris_CS = null;
         var _loc2_:Cmd_SecondPwd_InputPwd_SC = param1.socketData as Cmd_SecondPwd_InputPwd_SC;
         this.errorTimes = _loc2_.times;
         if(_loc2_.right)
         {
            dispatch(new CommonEvent(SecondaryPasswordConst.INPUT_PASSWORD_RIGHT));
            _loc3_ = SecondaryPasswordProtocolCacher.instance.getProtocol();
            if(_loc3_ != null)
            {
               switch(_loc3_.$messageID)
               {
                  case Cmd_Item_SellItems_CS.$MessageID:
                     (_loc3_ as Cmd_Item_SellItems_CS).pwdtag = _loc2_.pwdtag;
                     break;
                  case Cmd_Card_Recycle_CS.$MessageID:
                     (_loc3_ as Cmd_Card_Recycle_CS).pwdtag = _loc2_.pwdtag;
                     break;
                  case Cmd_Nutrition_ExtractExp_CS.$MessageID:
                     (_loc3_ as Cmd_Nutrition_ExtractExp_CS).pwdtag = _loc2_.pwdtag;
                     break;
                  case Cmd_Nutrition_ExtractExpAll_CS.$MessageID:
                     (_loc3_ as Cmd_Nutrition_ExtractExpAll_CS).pwdtag = _loc2_.pwdtag;
                     break;
                  case Cmd_Item_Use_CS.$MessageID:
                     (_loc3_ as Cmd_Item_Use_CS).pwdtag = _loc2_.pwdtag;
                     break;
                  case Cmd_Item_RecycleDebris_CS.$MessageID:
                     _loc4_ = _loc3_ as Cmd_Item_RecycleDebris_CS;
                     if(!this.bReset && _loc2_.pwdtag > 0)
                     {
                        DebrisProxyCmd.doDebris(_loc4_.itemBaseId,_loc4_.num,true,_loc2_.pwdtag);
                        SecondaryPasswordProtocolCacher.instance.clearMsg();
                     }
                     return;
               }
               if(!this.bReset && _loc2_.pwdtag > 0)
               {
                  SecondaryPasswordCmd.resendSocketData(_loc3_);
               }
               SecondaryPasswordProtocolCacher.instance.clearMsg();
            }
         }
         else
         {
            dispatch(new CommonEvent(SecondaryPasswordConst.INPUT_PASSWORD_WRONG));
         }
         SecondaryPasswordCmd.getInfo();
      }
      
      private function onCmd_SecondPwd_Modify_SC(param1:SocketServiceEvent) : void
      {
         if(param1.retCode <= 0)
         {
            dispatch(new CommonEvent(SecondaryPasswordConst.UPDATE_PASSWORD_OK));
            SecondaryPasswordCmd.getInfo();
         }
      }
      
      private function onCmd_SecondPwd_Reset_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_SecondPwd_Reset_SC = param1.socketData as Cmd_SecondPwd_Reset_SC;
         this.bReset = _loc2_.bReset;
         if(param1.retCode <= 0)
         {
            dispatch(new CommonEvent(SecondaryPasswordConst.RESET_PASSWORD_OK));
            SecondaryPasswordCmd.getInfo();
         }
      }
      
      private function onCmd_SecondPwd_Conditon_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_SecondPwd_Conditon_SC = param1.socketData as Cmd_SecondPwd_Conditon_SC;
         this.m_conditions = _loc2_.system;
         SecondaryPasswordCmd.getInfo();
      }
      
      private function onCmd_SecondPwd_NeedPwd_SC(param1:SocketServiceEvent) : void
      {
         if(this.bReset)
         {
            if(this.isFreeze)
            {
               SecondaryPasswordCmd.openWindow(SecondaryPasswordConst.WINDOW_TYPE_FROZEN);
            }
            else
            {
               SecondaryPasswordCmd.openWindow(SecondaryPasswordConst.WINDOW_TYPE_RESET_CANCEL);
            }
         }
         else
         {
            this.inputNeedTag = true;
            SecondaryPasswordCmd.openWindow(SecondaryPasswordConst.WINDOW_TYPE_INPUT);
         }
      }
   }
}
