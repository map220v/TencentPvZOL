package com.qq.modules.main.command.modules
{
   import com.qq.utils.UrlManager;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   
   public class ModuleBattleCommand extends StrongRobotlegCommand
   {
       
      
      public function ModuleBattleCommand()
      {
         super();
      }
      
      public function start(param1:Object) : void
      {
         RobotlegModuleLoaderManager.impl.doModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleBattle.swf"),null,null,param1);
      }
      
      public function unload() : void
      {
         RobotlegModuleLoaderManager.impl.unloadModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleBattle.swf"));
      }
   }
}
