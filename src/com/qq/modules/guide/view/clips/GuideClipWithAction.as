package com.qq.modules.guide.view.clips
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.guide.GuideGlobals;
   import com.qq.modules.sound.command.GuideSoundCmd;
   import com.qq.utils.CommandDispatcher;
   
   public class GuideClipWithAction extends GuideBaseClip
   {
       
      
      private var eventId:String;
      
      private var npcId:int;
      
      private var lastActionName:String;
      
      public function GuideClipWithAction(param1:*, param2:*, param3:String = "", param4:int = 0)
      {
         this.npcId = param4;
         this.eventId = param3;
         super(param1,param2);
      }
      
      public function setAction(param1:String) : void
      {
         this.lastActionName = param1;
         switch(param1)
         {
            case "DaveEnterAction":
               gotoAndPlay("anim_enter",this.onEnterEnd);
               CommandDispatcher.send(GuideGlobals.GuideDialogue_LockMouse + "_" + this.eventId);
               CommandDispatcher.send(GuideGlobals.GuideDialogue_HideTip + "_" + this.eventId);
               break;
            case "DaveBlahblahAction":
               if(this.npcId == 2300)
               {
                  GuideSoundCmd.crazeDaveTalk();
               }
               else
               {
                  GuideSoundCmd.winnieTalk();
               }
               CommandDispatcher.send(GuideGlobals.GuideDialogue_ShowTip + "_" + this.eventId);
               CommandDispatcher.send(GuideGlobals.GuideDialogue_LockMouse + "_" + this.eventId);
               gotoAndPlay("anim_mediumtalk",this.onBlahEnd,false);
               break;
            case "DaveLeaveAction":
               gotoAndPlay("anim_leave",this.onLeaveEnd,false);
               CommandDispatcher.send(GuideGlobals.GuideDialogue_LockMouse + "_" + this.eventId);
               break;
            case "DaveIdleAction":
               gotoAndPlay("anim_idle",this.onIdleEnd,true);
         }
      }
      
      override public function advanceFrames(param1:int = 1) : void
      {
         if(mc && mc.isPlaying)
         {
            if(mc.hasDisposed)
            {
               init(urlOrClass,clipIdOrChildIndex);
            }
            super.advanceFrames(param1);
         }
      }
      
      private function onIdleEnd() : void
      {
         CommandDispatcher.send(GuideGlobals.GuideDialogue_UnLockMouse + "_" + this.eventId);
      }
      
      private function onLeaveEnd() : void
      {
         CommandDispatcher.send(GuideGlobals.GuideDialogue_UnLockMouse + "_" + this.eventId);
         CommandDispatcher.send(GuideGlobals.GuideDialogue_DoAct + "_" + this.eventId);
         CommandDispatcher.send(GuideGlobals.GuideDialogue_Next + "_" + this.eventId);
         CommandDispatcher.send(CommandName.TD_ResumeTDGame);
         if(this.parent && this.parent.contains(this))
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onBlahEnd() : void
      {
         CommandDispatcher.send(GuideGlobals.GuideDialogue_UnLockMouse + "_" + this.eventId);
         this.setAction(TDConstant.DaveIdleAction);
         CommandDispatcher.send(GuideGlobals.GuideDialogue_DoAct + "_" + this.eventId);
      }
      
      private function onEnterEnd() : void
      {
         CommandDispatcher.send(GuideGlobals.GuideDialogue_ShowTip + "_" + this.eventId);
         CommandDispatcher.send(GuideGlobals.GuideDialogue_UnLockMouse + "_" + this.eventId);
         this.setAction(TDConstant.DaveBlahblahAction);
      }
   }
}
