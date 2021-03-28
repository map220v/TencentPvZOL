package com.qq.modules.td.view.ui
{
   import asgui.managers.PopUpManager;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.guidePlus.GuideContext;
   import com.qq.modules.guidePlus.command.GuideViewCmd;
   import com.qq.utils.UtilsManager;
   import flash.events.Event;
   
   public class TDTimeTunnelEffectViewMediater extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDTimeTunnelEffectView;
      
      public function TDTimeTunnelEffectViewMediater()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.mc,Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      override protected function initialized() : void
      {
         super.initialized();
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         if(this.view.mc.currentFrame == this.view.mc.totalFrames)
         {
            this.view.mc.stop();
            removeComponentListener(this.view.mc,Event.ENTER_FRAME,this.onEnterFrame);
            UtilsManager.removeFromContainer(this.view.mc);
            this.leave();
         }
      }
      
      private function leave() : void
      {
         PopUpManager.RemovePopUp(this.view);
         dispose();
         GuideViewCmd.changeContext(GuideContext.TD_SELECT);
      }
   }
}
