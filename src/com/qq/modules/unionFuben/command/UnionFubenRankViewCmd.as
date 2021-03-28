package com.qq.modules.unionFuben.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class UnionFubenRankViewCmd
   {
       
      
      public function UnionFubenRankViewCmd()
      {
         super();
      }
      
      public static function openRankWindow(param1:int = 1, param2:int = 1, param3:int = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionFubenRankViewCommand","openRankWindow",[param1,param2,param3]));
      }
   }
}
