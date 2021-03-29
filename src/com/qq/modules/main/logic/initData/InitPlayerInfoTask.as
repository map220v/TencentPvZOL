package com.qq.modules.main.logic.initData
{
   import asgui.controls.Alert;
   import com.qq.GameGloble;
   import com.qq.display.QAlert;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
import com.qq.modules.main.model.test.TestActorSetup;
import com.qq.modules.main.server.ErrorHanderManager;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.utils.GameDataReport;
   import org.as3commons.logging.api.getLogger;
   
   public class InitPlayerInfoTask extends BasicInitDataTask
   {
       
      
      public function InitPlayerInfoTask(param1:Boolean = true)
      {
         super(InitDataManager.Init_PlayerInfo,param1);
      }
      
      override public function start() : void
      {
         super.start();
         getLogger("loading").debug("Loading Player Info");
         TestActorSetup.getInstance().createTestActor();
         /*var _loc1_:PvzSocketService = GameGloble.injector.getInstance(PvzSocketService);
         if(ExternalVars.UIN.data != 0 && (ExternalVars.SKEY != null && ExternalVars.SKEY.length > 0))
         {
            GameDataReport.getInstance().report(GameDataReport.Data_Start_Connect_Server);
            _loc1_.connect();
         }
         else
         {
            QAlert.Show("Login Failed","",Alert.OK,null,ErrorHanderManager.gotoHome);
         }*/
      }
   }
}
