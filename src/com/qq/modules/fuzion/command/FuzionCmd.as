package com.qq.modules.fuzion.command
{
   import flash.display.DisplayObject;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class FuzionCmd
   {
       
      
      public function FuzionCmd()
      {
         super();
      }
      
      public static function enterFuzion() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FuzionCommand","enterFuzion",[]));
      }
      
      public static function showFuzionWin() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FuzionCommand","showFuzionWin",[]));
      }
      
      public static function openFuzionRwardPromptWin() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FuzionCommand","openFuzionRwardPromptWin",[]));
      }
      
      public static function showFuzion(param1:DisplayObject) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FuzionCommand","showFuzion",[param1]));
      }
      
      public static function getFuzionInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FuzionCommand","getFuzionInfo",[]));
      }
      
      public static function signUp() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FuzionCommand","signUp",[]));
      }
      
      public static function inspire() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FuzionCommand","inspire",[]));
      }
      
      public static function checkInspire() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FuzionCommand","checkInspire",[]));
      }
      
      public static function join() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FuzionCommand","join",[]));
      }
      
      public static function changeAutoJoin() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FuzionCommand","changeAutoJoin",[]));
      }
      
      public static function getFuzionEmbattle() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FuzionCommand","getFuzionEmbattle",[]));
      }
      
      public static function getRecorder() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FuzionCommand","getRecorder",[]));
      }
      
      public static function getRankList() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FuzionCommand","getRankList",[]));
      }
      
      public static function getReward() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FuzionCommand","getReward",[]));
      }
      
      public static function showReward() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FuzionCommand","showReward",[]));
      }
   }
}
