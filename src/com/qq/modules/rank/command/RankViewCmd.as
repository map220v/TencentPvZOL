package com.qq.modules.rank.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class RankViewCmd
   {
       
      
      public function RankViewCmd()
      {
         super();
      }
      
      public static function openRankWindow(param1:int = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RankViewCommand","openRankWindow",[param1]));
      }
   }
}
