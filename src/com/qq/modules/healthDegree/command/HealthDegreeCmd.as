package com.qq.modules.healthDegree.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class HealthDegreeCmd
   {
       
      
      public function HealthDegreeCmd()
      {
         super();
      }
      
      public static function showHealthDegreeWins() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("HealthDegreeCommand","showHealthDegreeWins",[]));
      }
   }
}
