package com.qq.modules.main.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class BuffProxyCmd
   {
       
      
      public function BuffProxyCmd()
      {
         super();
      }
      
      public static function getBuffList() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BuffProxyCommand","getBuffList",[]));
      }
   }
}
