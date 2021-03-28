package com.qq.modules.td.command.game
{
   import flash.geom.Rectangle;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDExplodeCmd
   {
       
      
      public function TDExplodeCmd()
      {
         super();
      }
      
      public static function explodeForPlant(param1:Object, param2:int = 9999, param3:Boolean = true, param4:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDExplodeCommand","explodeForPlant",[param1,param2,param3,param4]));
      }
      
      public static function plantExplodeDamage(param1:Object, param2:Rectangle, param3:int = 9999, param4:Boolean = false, param5:Boolean = false, param6:Boolean = true, param7:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDExplodeCommand","plantExplodeDamage",[param1,param2,param3,param4,param5,param6,param7]));
      }
   }
}
