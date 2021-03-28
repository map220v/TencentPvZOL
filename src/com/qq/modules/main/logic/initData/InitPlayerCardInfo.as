package com.qq.modules.main.logic.initData
{
   import com.qq.GameGloble;
   import com.qq.modules.login.command.LoginServerCmd;
   import com.qq.modules.login.service.LoginService;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import org.as3commons.logging.api.getLogger;
   
   public class InitPlayerCardInfo extends BasicInitDataTask
   {
       
      
      public function InitPlayerCardInfo(param1:Boolean = true)
      {
         super(InitDataManager.Init_PlayerCard,param1);
      }
      
      override public function start() : void
      {
         super.start();
         getLogger("loading").debug("Loading Player Card Information");
         var _loc1_:LoginService = GameGloble.injector.getInstance(LoginService);
         _loc1_.getPlayerCardInfo();
         _loc1_.getPlayerBattleCardInfo();
         LoginServerCmd.requestVipInfo();
         _loc1_.getArenaInfo();
      }
   }
}
