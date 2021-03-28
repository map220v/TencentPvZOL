package com.qq.modules.main.logic.initData
{
   import com.qq.GameGloble;
   import com.qq.modules.chat.command.ChatProxyCmd;
   import com.qq.modules.chat.model.ChatProxy;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import org.as3commons.logging.api.getLogger;
   
   public class InitChatTask extends BasicInitDataTask
   {
       
      
      public function InitChatTask(param1:Boolean = true)
      {
         super(InitDataManager.Init_ChatInfo,param1);
      }
      
      override public function start() : void
      {
         super.start();
         getLogger("loading").debug("Loading Chat Information");
         var _loc1_:ChatProxy = GameGloble.injector.getInstance(ChatProxy);
         _loc1_.init();
         ChatProxyCmd.getChatData();
         ChatProxyCmd.getBlackList();
      }
   }
}
