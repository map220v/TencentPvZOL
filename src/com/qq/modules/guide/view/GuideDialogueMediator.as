package com.qq.modules.guide.view
{
   import com.qq.modules.guide.GuideGlobals;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.guide.model.vo.GuideSentenceVO;
   import com.qq.modules.guide.view.handlers.GuideRobotlegsEventHandler;
   import com.qq.modules.guide.view.handlers.GuideTargetEventHandler;
   import flash.events.Event;
   import org.as3commons.logging.api.getLogger;
   
   public class GuideDialogueMediator extends GuideDaveTalkCtMediator
   {
       
      
      public function GuideDialogueMediator()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this.addContextListener(GuideGlobals.GuideDialogueMediator_Close + "_" + view.id,this.onClosing);
         this.addContextListener(GuideGlobals.GuideDialogue_DoAct + "_" + view.id,this.onDoAct);
         this.addContextListener(GuideGlobals.GuideDialogue_Next + "_" + view.id,this.onNext);
         run();
      }
      
      private function onNext(param1:Event) : void
      {
         next();
      }
      
      private function onDoAct(param1:Event) : void
      {
         sentence.tryDoAct();
      }
      
      private function onClosing(param1:Event) : void
      {
         view.Close();
      }
      
      override public function update(param1:GuideSentenceVO) : void
      {
         if(view == null || view.hasDisposed)
         {
            return;
         }
         if(param1)
         {
            getLogger().info("引导::step:" + param1.name);
            if(param1.nextEventType != null)
            {
               if(param1.nextEventTarget != null)
               {
                  new GuideTargetEventHandler(param1.nextEventTarget,param1.nextEventType,nextDelay);
               }
               else
               {
                  new GuideRobotlegsEventHandler(param1.nextEventType,nextDelay);
               }
            }
            view.update(param1);
            if(param1.saveStep)
            {
               GuideCmd.setKey(view.obj.title,param1.name);
            }
            if(param1.killGuide)
            {
               GuideCmd.killGuide();
            }
            return;
         }
         getLogger().info("引导::退出");
         GuideCmd.exitGuide();
         if(view)
         {
            view.Close();
         }
      }
   }
}
