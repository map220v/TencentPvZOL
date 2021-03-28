package com.qq.modules.commEmbattle.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class CommEmbattleProxyCmd
   {
       
      
      public function CommEmbattleProxyCmd()
      {
         super();
      }
      
      public static function getlineupFormation() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommEmbattleProxyCommand","getlineupFormation",[]));
      }
   }
}
