package com.qq.modules.td.command.game
{
   import flash.geom.Point;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDGameObjectCmd
   {
       
      
      public function TDGameObjectCmd()
      {
         super();
      }
      
      public static function reviewZombie() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","reviewZombie",[]));
      }
      
      public static function removeReviewZombie() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","removeReviewZombie",[]));
      }
      
      public static function switchZombie(param1:*, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","switchZombie",[param1,param2]));
      }
      
      public static function addZombieToStageByPos(param1:Object, param2:Point, param3:Array = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","addZombieToStageByPos",[param1,param2,param3]));
      }
      
      public static function addPlant(param1:int, param2:Object, param3:Boolean = true, param4:String = null, param5:Boolean = false, param6:Boolean = false, param7:uint = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","addPlant",[param1,param2,param3,param4,param5,param6,param7]));
      }
      
      public static function showInitUnit() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","showInitUnit",[]));
      }
      
      public static function showLastProtecter() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","showLastProtecter",[]));
      }
      
      public static function addGameObjectByTDUnitInitVO(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","addGameObjectByTDUnitInitVO",[param1]));
      }
      
      public static function addGameObjectByPos(param1:int, param2:int, param3:int, param4:int, param5:Array = null, param6:Object = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","addGameObjectByPos",[param1,param2,param3,param4,param5,param6]));
      }
      
      public static function addGameObjectByColAndRow(param1:int, param2:int, param3:int, param4:int, param5:Array = null, param6:Object = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","addGameObjectByColAndRow",[param1,param2,param3,param4,param5,param6]));
      }
      
      public static function addNormalGameObjectByPos(param1:int, param2:int, param3:int, param4:Array = null, param5:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","addNormalGameObjectByPos",[param1,param2,param3,param4,param5]));
      }
      
      public static function addNormalGameObjectByColRow(param1:Object, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","addNormalGameObjectByColRow",[param1,param2,param3]));
      }
      
      public static function addNormalGameObjectByTile(param1:int, param2:Object, param3:Array = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","addNormalGameObjectByTile",[param1,param2,param3]));
      }
      
      public static function generateSun(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","generateSun",[param1,param2,param3,param4,param5]));
      }
      
      public static function generateSunBomb(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Number) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","generateSunBomb",[param1,param2,param3,param4,param5,param6]));
      }
      
      public static function addLootItem(param1:int, param2:int, param3:int, param4:Array = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","addLootItem",[param1,param2,param3,param4]));
      }
      
      public static function dropZombiePart(param1:Object, param2:Array, param3:int, param4:String = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","dropZombiePart",[param1,param2,param3,param4]));
      }
      
      public static function magnetArmor(param1:Object, param2:Array, param3:int, param4:String, param5:int, param6:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","magnetArmor",[param1,param2,param3,param4,param5,param6]));
      }
      
      public static function showSpecialSkillPanel(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","showSpecialSkillPanel",[param1,param2,param3]));
      }
      
      public static function hideSpeicalSkillPanel() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","hideSpeicalSkillPanel",[]));
      }
      
      public static function releaseSpecialSkill(param1:int, param2:Boolean = true) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","releaseSpecialSkill",[param1,param2]));
      }
      
      public static function addBlowZombie(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","addBlowZombie",[param1,param2,param3]));
      }
      
      public static function summonZombie(param1:int, param2:int, param3:int, param4:Boolean = true) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","summonZombie",[param1,param2,param3,param4]));
      }
      
      public static function summonZombieInArea(param1:Array, param2:int, param3:int, param4:Boolean = true) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","summonZombieInArea",[param1,param2,param3,param4]));
      }
      
      public static function popZombieInArea(param1:Array, param2:int, param3:int, param4:int, param5:int, param6:Array = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","popZombieInArea",[param1,param2,param3,param4,param5,param6]));
      }
      
      public static function throwPotatoToRoadTile(param1:Array, param2:Number, param3:Number) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","throwPotatoToRoadTile",[param1,param2,param3]));
      }
      
      public static function addConveyEffect(param1:Object, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","addConveyEffect",[param1,param2,param3]));
      }
      
      public static function removeMudsByColomn(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","removeMudsByColomn",[param1]));
      }
      
      public static function removeRoadById(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","removeRoadById",[param1]));
      }
      
      public static function addRoadById(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","addRoadById",[param1]));
      }
      
      public static function showQuickSand(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","showQuickSand",[param1]));
      }
      
      public static function portalZombie(param1:int, param2:int, param3:int, param4:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","portalZombie",[param1,param2,param3,param4]));
      }
      
      public static function addSeaSplashEffect(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","addSeaSplashEffect",[param1]));
      }
      
      public static function removeSeaSplashEffect(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","removeSeaSplashEffect",[param1]));
      }
      
      public static function destoryObjByTile(param1:int, param2:int, param3:Boolean = true, param4:Boolean = true, param5:Boolean = true) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","destoryObjByTile",[param1,param2,param3,param4,param5]));
      }
      
      public static function addSampleMower(param1:int, param2:Number, param3:Number) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","addSampleMower",[param1,param2,param3]));
      }
      
      public static function cleanAllSampleMower() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameObjectCommand","cleanAllSampleMower",[]));
      }
   }
}
