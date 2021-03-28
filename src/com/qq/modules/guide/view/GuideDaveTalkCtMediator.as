package com.qq.modules.guide.view
{
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.guide.GuideGlobals;
   import com.qq.modules.guide.model.vo.GuideSentenceVO;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class GuideDaveTalkCtMediator extends BasicScreenMediator
   {
       
      
      public var sentence:GuideSentenceVO;
      
      private var timeout:uint;
      
      private var lastIndex:int;
      
      private var mouseEnabled:Boolean = true;
      
      public function GuideDaveTalkCtMediator()
      {
         super();
      }
      
      public function get view() : GuideDaveTalkCt
      {
         return getViewComponent() as GuideDaveTalkCt;
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this.addContextListener(GuideGlobals.GuideDialogue_ShowTip + "_" + this.view.id,this.onShowTip);
         this.addContextListener(GuideGlobals.GuideDialogue_HideTip + "_" + this.view.id,this.onHideTip);
         this.addContextListener(GuideGlobals.GuideDialogue_LockMouse + "_" + this.view.id,this.onLockMouse);
         this.addContextListener(GuideGlobals.GuideDialogue_UnLockMouse + "_" + this.view.id,this.onUnLockMouse);
         this.view.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
         this.run();
      }
      
      override public function onRemove() : void
      {
         super.onRemove();
         if(this.view)
         {
            this.view.removeEventListener(MouseEvent.CLICK,this.clickHandler);
         }
         this.sentence = null;
      }
      
      public function gotoAndPlay(param1:String) : void
      {
         if(this.view.obj == null)
         {
            return;
         }
         this.sentence = this.view.obj.getSentence(param1);
         this.update(this.sentence);
      }
      
      public function run() : void
      {
         this.nextDelay();
      }
      
      public function nextDelay() : void
      {
         clearTimeout(this.timeout);
         this.timeout = setTimeout(this.next,100);
      }
      
      public function next() : void
      {
         if(this.view == null || this.view.obj == null)
         {
            return;
         }
         this.sentence = this.view.obj.getNextSentence();
         this.update(this.sentence);
      }
      
      public function update(param1:GuideSentenceVO) : void
      {
         if(param1 == null)
         {
            this.view.Close();
            return;
         }
         this.view.update(param1);
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         if(!this.view || this.view.hasDisposed)
         {
            return;
         }
         if(!this.mouseEnabled)
         {
            if(!this.sentence || !this.sentence.passable)
            {
               return;
            }
            if(this.view.objView)
            {
               this.view.objView.advanceFrames(150);
            }
            return;
         }
         this.next();
      }
      
      public function onUnLockMouse(param1:Event) : void
      {
         this.mouseEnabled = true;
         this.view.txtClick.visible = true;
      }
      
      public function onLockMouse(param1:Event) : void
      {
         this.mouseEnabled = false;
         this.view.txtClick.visible = false;
      }
      
      private function onHideTip(param1:Event) : void
      {
         this.view.bubble.alpha = 0;
      }
      
      private function onShowTip(param1:Event) : void
      {
         this.view.bubble.alpha = 1;
      }
   }
}
