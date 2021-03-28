package com.qq.modules.td.command.game
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDHurtPlantCmd
   {
       
      
      public function TDHurtPlantCmd()
      {
         super();
      }
      
      public static function firePlant(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDHurtPlantCommand","firePlant",[param1]));
      }
   }
}
