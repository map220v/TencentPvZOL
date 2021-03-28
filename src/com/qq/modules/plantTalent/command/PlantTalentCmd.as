package com.qq.modules.plantTalent.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class PlantTalentCmd
   {
       
      
      public function PlantTalentCmd()
      {
         super();
      }
      
      public static function getTalentList(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("PlantTalentCommand","getTalentList",[param1]));
      }
      
      public static function studyTalent(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("PlantTalentCommand","studyTalent",[param1]));
      }
      
      public static function openPlantAdvancedWindow(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("PlantTalentCommand","openPlantAdvancedWindow",[param1]));
      }
      
      public static function addLinkGuide(param1:int, param2:Array = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("PlantTalentCommand","addLinkGuide",[param1,param2]));
      }
   }
}
