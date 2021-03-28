package com.qq.modules.td.view.items.loot
{
   import com.greensock.TweenMax;
   import com.qq.CommandName;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.utils.UtilsManager;
   import flash.events.Event;
   
   public class TDLootCardViewMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDLootCardView;
      
      public function TDLootCardViewMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TDGameEvent_HideRewardItem,this.onHideRewardItem);
      }
      
      private function onHideRewardItem(param1:Event) : void
      {
         TweenMax.to(this.view,1,{
            "autoAlpha":0,
            "onComplete":this.onFinishFade
         });
      }
      
      private function onFinishFade() : void
      {
         UtilsManager.removeFromContainer(this.view);
      }
   }
}
