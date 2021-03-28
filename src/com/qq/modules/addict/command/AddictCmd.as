package com.qq.modules.addict.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class AddictCmd
   {
       
      
      public function AddictCmd()
      {
         super();
      }
      
      public static function loginCheckState() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("AddictCommand","loginCheckState",[]));
      }
      
      public static function showAddictInfo(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("AddictCommand","showAddictInfo",[param1]));
      }
   }
}
