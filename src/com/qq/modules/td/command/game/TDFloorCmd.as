package com.qq.modules.td.command.game
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDFloorCmd
   {
       
      
      public function TDFloorCmd()
      {
         super();
      }
      
      public static function addPowerTile(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDFloorCommand","addPowerTile",[param1,param2,param3]));
      }
      
      public static function updatePath(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDFloorCommand","updatePath",[param1]));
      }
      
      public static function addLightAreaAfterWave(param1:int, param2:int, param3:int, param4:int, param5:int, param6:String = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDFloorCommand","addLightAreaAfterWave",[param1,param2,param3,param4,param5,param6]));
      }
      
      public static function removeLightAreaAfterWave(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDFloorCommand","removeLightAreaAfterWave",[param1]));
      }
   }
}
