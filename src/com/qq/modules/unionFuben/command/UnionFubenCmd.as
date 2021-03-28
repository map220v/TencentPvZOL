package com.qq.modules.unionFuben.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class UnionFubenCmd
   {
       
      
      public function UnionFubenCmd()
      {
         super();
      }
      
      public static function getUnionFubenChapter() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionFubenCommand","getUnionFubenChapter",[]));
      }
      
      public static function openUnionFubenWin() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionFubenCommand","openUnionFubenWin",[]));
      }
   }
}
