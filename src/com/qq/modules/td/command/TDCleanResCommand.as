package com.qq.modules.td.command
{
   import com.qq.modules.td.logic.TDFactory;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDCleanResCommand extends StrongRobotlegCommand
   {
       
      
      public function TDCleanResCommand()
      {
         super();
      }
      
      public function cleanTDRes() : void
      {
         TDFactory.cleanAllRes();
      }
   }
}
