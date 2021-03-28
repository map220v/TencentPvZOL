package com.qq.modules.recruitCard.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class RecruitCardCmd
   {
       
      
      public function RecruitCardCmd()
      {
         super();
      }
      
      public static function openRecruitCardWindow(param1:int = -1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RecruitCardCommand","openRecruitCardWindow",[param1]));
      }
      
      public static function openTDAvatarCardWinds(param1:int = -1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RecruitCardCommand","openTDAvatarCardWinds",[param1]));
      }
   }
}
