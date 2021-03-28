package com.qq.modules.city.command
{
   import asgui.managers.PopUpManager;
   import com.qq.CommandName;
   import com.qq.modules.city.view.CityNewButtonAppearWindow;
   import com.qq.utils.CommandDispatcher;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class CityCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "CityCommand";
       
      
      public function CityCommand()
      {
         super();
      }
      
      public function initBuilding() : void
      {
      }
      
      public function moveMapByCenter(param1:int, param2:int, param3:Boolean) : void
      {
         CommandDispatcher.send(CommandName.City_MoveMapByCenter,{
            "centerX":param1,
            "centerY":param2,
            "isTween":param3
         });
      }
      
      public function showNewButtonTip(param1:String) : void
      {
         var _loc2_:CityNewButtonAppearWindow = new CityNewButtonAppearWindow();
         PopUpManager.AddPopUp(_loc2_,null,true);
         _loc2_.reset(param1);
      }
   }
}
