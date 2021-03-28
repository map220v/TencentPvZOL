package com.qq.modules.guide.model
{
   import PVZ.Cmd.Cmd_Guide_GetKeys_SC;
   import PVZ.Cmd.Cmd_Guide_SetKey_SC;
   import PVZ.Cmd.Cmd_Guide_SkipSome_SC;
   import PVZ.Cmd.Cmd_Guide_SyncFinishId_SC;
   import PVZ.Cmd.Dto_Guide_Key;
   import com.qq.SceneCenter;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.guidePlus.GuideConst;
   import com.qq.modules.main.logic.initData.InitDataManager;
   import com.qq.utils.CommandDispatcher;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class GuideProxy extends BasicProxy
   {
       
      
      private const m_data:GuideData = new GuideData();
      
      public function GuideProxy()
      {
         super();
      }
      
      public function get data() : GuideData
      {
         return this.m_data;
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init();
      }
      
      public function setKey(param1:String, param2:String) : void
      {
         this.m_data.keys[param1] = param2;
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_Guide_GetKeys_SC.$MessageID,this.onCmd_Guide_GetKeys_SC],[Cmd_Guide_SetKey_SC.$MessageID,this.onCmd_Guide_SetKey_SC],[Cmd_Guide_SyncFinishId_SC.$MessageID,this.onCmd_Guide_SyncFinishId_SC],[Cmd_Guide_SkipSome_SC.$MessageID,this.onCmd_Guide_SkipSome_SC]];
      }
      
      private function onCmd_Guide_GetKeys_SC(param1:SocketServiceEvent) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Dto_Guide_Key = null;
         var _loc2_:Cmd_Guide_GetKeys_SC = param1.socketData as Cmd_Guide_GetKeys_SC;
         this.m_data.waitList = _loc2_.openId;
         var _loc3_:Array = _loc2_.keyList;
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_];
            this.m_data.keys[_loc5_.key] = _loc5_.value;
            _loc4_++;
         }
         InitDataManager.getInstance().finishTask(InitDataManager.Init_PlayerGuideInfo);
      }
      
      private function onCmd_Guide_SetKey_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Guide_SetKey_SC = param1.socketData as Cmd_Guide_SetKey_SC;
         this.m_data.keys[_loc2_.key.key] = _loc2_.key.value;
      }
      
      private function onCmd_Guide_SyncFinishId_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Guide_SyncFinishId_SC = param1.socketData as Cmd_Guide_SyncFinishId_SC;
         GuideCmd.checkProgressGuide(SceneCenter.getInstance().currentScene);
      }
      
      private function onCmd_Guide_SkipSome_SC(param1:SocketServiceEvent) : void
      {
         CommandDispatcher.send(GuideConst.SKIP_SOME);
      }
   }
}
