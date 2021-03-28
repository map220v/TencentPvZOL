package com.qq.modules.guide
{
   public final class GuideGlobals
   {
      
      public static const GuideDialogueMediator_Close:String = "GuideDialogueMediator_Close";
      
      public static const GuideDialogue_ShowTip:String = "GuideDialogue_ShowTip";
      
      public static const GuideDialogue_HideTip:String = "GuideDialogue_HideTip";
      
      public static const GuideDialogue_DoAct:String = "GuideDialogue_DoAct";
      
      public static const GuideDialogue_Next:String = "GuideDialogue_Next";
      
      public static const GuideDialogue_LockMouse:String = "GuideDialogue_LockMouse";
      
      public static const GuideDialogue_UnLockMouse:String = "GuideDialogue_UnLockMouse";
      
      private static var s_full_screen_count:int;
       
      
      public function GuideGlobals()
      {
         super();
      }
      
      public static function set FULL_SCREEN_COUNT(param1:int) : void
      {
         s_full_screen_count = param1 >= 0 ? int(param1) : 0;
      }
      
      public static function get FULL_SCREEN_COUNT() : int
      {
         return s_full_screen_count;
      }
   }
}
