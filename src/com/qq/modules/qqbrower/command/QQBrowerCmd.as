package com.qq.modules.qqbrower.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class QQBrowerCmd
   {
       
      
      public function QQBrowerCmd()
      {
         super();
      }
      
      public static function showMainWd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QQBrowerCommand","showMainWd",[]));
      }
      
      public static function getInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QQBrowerCommand","getInfo",[]));
      }
      
      public static function takeExclusiveGift(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QQBrowerCommand","takeExclusiveGift",[param1]));
      }
   }
}
