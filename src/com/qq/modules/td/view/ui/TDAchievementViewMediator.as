package com.qq.modules.td.view.ui
{
   import com.qq.CommandName;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.logic.trigger.events.TriggerEvent;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   
   public class TDAchievementViewMediator extends BasicScreenMediator
   {
       
      
      public function TDAchievementViewMediator()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         CommandDispatcher._dispatcher.addEventListener(TriggerEvent.TRIGGER_CREATE,this.achievementCreateHandler);
         CommandDispatcher._dispatcher.addEventListener(CommandName.TDGameEvent_RestartGame,this.restartGameHandler);
      }
      
      private function restartGameHandler(param1:Event) : void
      {
         while(this.view.ctBox.numChildren > 0)
         {
            this.view.ctBox.removeChildAt(0);
         }
      }
      
      private function achievementCreateHandler(param1:TriggerEvent) : void
      {
         var _loc2_:TDAchievementCt = param1.params[0] as TDAchievementCt;
         this.view.ctBox.addChild(_loc2_);
      }
      
      override public function dispose() : void
      {
         while(this.view.ctBox.numChildren > 0)
         {
            this.view.ctBox.removeChildAt(0);
         }
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TDGameEvent_RestartGame,this.restartGameHandler);
         CommandDispatcher._dispatcher.removeEventListener(TriggerEvent.TRIGGER_CREATE,this.achievementCreateHandler);
         super.dispose();
      }
      
      public function get view() : TDAchievementView
      {
         return this.viewComponent as TDAchievementView;
      }
   }
}
