package com.qq.modules.td.command
{
   import com.qq.CommandName;
   import com.qq.modules.basic.command.BasicCommand;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.utils.CommandDispatcher;
   
   public class StartTDGameCommand extends BasicCommand
   {
       
      
      [Inject]
      public var event:CommonEvent;
      
      public function StartTDGameCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         CommandDispatcher.send(CommandName.TD_CleanTDGameRes);
         CommandDispatcher.send(CommandName.TD_StartLoadRes,this.event.param);
      }
   }
}
