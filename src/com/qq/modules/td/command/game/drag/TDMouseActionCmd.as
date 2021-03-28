package com.qq.modules.td.command.game.drag
{
   import flash.geom.Rectangle;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDMouseActionCmd
   {
       
      
      public function TDMouseActionCmd()
      {
         super();
      }
      
      public static function cleanMouseAction() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDMouseActionCommand","cleanMouseAction",[]));
      }
      
      public static function startUseShovel() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDMouseActionCommand","startUseShovel",[]));
      }
      
      public static function endUseShovel() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDMouseActionCommand","endUseShovel",[]));
      }
      
      public static function startCropPlant(param1:int, param2:String, param3:Rectangle = null, param4:Boolean = true) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDMouseActionCommand","startCropPlant",[param1,param2,param3,param4]));
      }
      
      public static function endCropPlant() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDMouseActionCommand","endCropPlant",[]));
      }
      
      public static function startChooseSkillArea(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDMouseActionCommand","startChooseSkillArea",[param1]));
      }
      
      public static function endChooseSkillArea() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDMouseActionCommand","endChooseSkillArea",[]));
      }
      
      public static function startLayEnergyTile(param1:uint, param2:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDMouseActionCommand","startLayEnergyTile",[param1,param2]));
      }
      
      public static function endLayEnergyTile() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDMouseActionCommand","endLayEnergyTile",[]));
      }
   }
}
