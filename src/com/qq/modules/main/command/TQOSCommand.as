package com.qq.modules.main.command
{
   import com.qq.GameGloble;
   import com.qq.utils.tqos.TQOSUtils;
   import flash.system.Capabilities;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TQOSCommand extends StrongRobotlegCommand
   {
       
      
      public function TQOSCommand()
      {
         super();
      }
      
      public function report_TD_performence(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:String = GameGloble.actorModel.roleId.toString();
         var _loc8_:String = GameGloble.actorModel.actorName;
         var _loc9_:String = !!GameGloble.isStalingMode ? "1" : "0";
         var _loc10_:String = "";
         var _loc11_:String = GameGloble.stage.stageWidth + "x" + GameGloble.stage.stageHeight;
         var _loc12_:String = int(param5 / (param6 * 0.001)).toString();
         TQOSUtils.getInstance().report_TD_performence(_loc7_,_loc9_,_loc10_,_loc11_,_loc12_,Capabilities.os,Capabilities.version);
      }
   }
}
