package com.qq.modules.main.logic.initData
{
   import PVZ.Cmd.SetoutTimesType;
   import com.qq.modules.exped.command.ExpedProxyCmd;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import com.qq.modules.mapinfo.command.MapInfoProxyCmd;
   import com.qq.utils.update.DataUpdateManager;
   import org.as3commons.logging.api.getLogger;
   
   public class InitMapInfoTask extends BasicInitDataTask
   {
       
      
      public function InitMapInfoTask(param1:Boolean = true)
      {
         super(InitDataManager.Init_MapInfo,param1);
      }
      
      override public function start() : void
      {
         super.start();
         getLogger("loading").debug("Loading Player Map Information");
         MapInfoProxyCmd.getInitInfo();
         MapInfoProxyCmd.queryDeclareInfo();
         ExpedProxyCmd.queryTimes(SetoutTimesType.SetoutTimesType_City);
         DataUpdateManager.getInstance().addUpdateHandler(DataUpdateManager.ID_Exped,ExpedProxyCmd.queryTimes,[SetoutTimesType.SetoutTimesType_City]);
         DataUpdateManager.getInstance().addUpdateHandler(DataUpdateManager.ID_Declare,MapInfoProxyCmd.queryDeclareInfo);
      }
   }
}
