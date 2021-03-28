package com.qq.modules.td.command
{
   import com.qq.CommandName;
   import com.qq.ScreenViewName;
   import com.qq.modules.basic.command.BasicCommand;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   
   public class TDStartLoadResCommand extends BasicCommand
   {
       
      
      [Inject]
      public var event:CommonEvent;
      
      public function TDStartLoadResCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         TDGameInfo.getInstance().isRunningGame = false;
         var _loc1_:Object = this.event.param;
         _loc1_.pageName = ScreenViewName.TDLoadView;
         CommandDispatcher.send(CommandName.Common_SwitchPage,this.event.param);
      }
   }
}
