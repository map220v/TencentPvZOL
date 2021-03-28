package com.qq.modules.city.view.components.newUI
{
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   
   public class NewCityMailButtonMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:NewCityMailButton;
      
      public function NewCityMailButtonMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         this.addContextListener(CommandName.ChangeMail,this.onChangeMail);
      }
      
      override protected function initialized() : void
      {
         super.initialized();
         this.updateState();
      }
      
      private function updateState() : void
      {
         var _loc1_:int = GameGloble.actorModel.newSysMailNum + GameGloble.actorModel.newUserMailNum;
         if(_loc1_ > 0)
         {
            this.view.showTag = true;
         }
         else
         {
            this.view.showTag = false;
         }
      }
      
      private function onChangeMail(param1:CommonEvent) : void
      {
         this.updateState();
      }
   }
}
