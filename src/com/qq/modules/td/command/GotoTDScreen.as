package com.qq.modules.td.command
{
   import com.qq.CommandName;
   import com.qq.ScreenViewName;
   import com.qq.modules.basic.command.BasicCommand;
   import com.qq.utils.CommandDispatcher;
   
   public class GotoTDScreen extends BasicCommand
   {
       
      
      public function GotoTDScreen()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:Object = new Object();
         _loc1_.pageName = ScreenViewName.TDBGView;
         CommandDispatcher.send(CommandName.Common_SwitchPage,_loc1_);
      }
   }
}
