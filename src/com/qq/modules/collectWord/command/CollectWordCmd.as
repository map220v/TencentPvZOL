package com.qq.modules.collectWord.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class CollectWordCmd
   {
       
      
      public function CollectWordCmd()
      {
         super();
      }
      
      public static function getInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CollectWordCommand","getInfo",[]));
      }
      
      public static function exchange(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CollectWordCommand","exchange",[param1]));
      }
      
      public static function partSetOut() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CollectWordCommand","partSetOut",[]));
      }
      
      public static function allSetOut() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CollectWordCommand","allSetOut",[]));
      }
      
      public static function summonOne() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CollectWordCommand","summonOne",[]));
      }
      
      public static function summonTen() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CollectWordCommand","summonTen",[]));
      }
   }
}
