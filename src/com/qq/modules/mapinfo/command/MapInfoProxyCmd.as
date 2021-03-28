package com.qq.modules.mapinfo.command
{
   import com.tencent.protobuf.Int64;
   import flash.geom.Point;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class MapInfoProxyCmd
   {
       
      
      public function MapInfoProxyCmd()
      {
         super();
      }
      
      public static function getInitInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","getInitInfo",[]));
      }
      
      public static function getDetailArmyHistory(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","getDetailArmyHistory",[param1]));
      }
      
      public static function relocateToArea(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","relocateToArea",[param1]));
      }
      
      public static function getSimplelArmyHistory() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","getSimplelArmyHistory",[]));
      }
      
      public static function doMineRecallTeam(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","doMineRecallTeam",[param1,param2]));
      }
      
      public static function changeShowNullCity(param1:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","changeShowNullCity",[param1]));
      }
      
      public static function declareWar(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","declareWar",[param1]));
      }
      
      public static function queryDeclareInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","queryDeclareInfo",[]));
      }
      
      public static function doDeclareWar(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","doDeclareWar",[param1]));
      }
      
      public static function recallTeam(param1:int, param2:int = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","recallTeam",[param1,param2]));
      }
      
      public static function returnAllyTeam(param1:Int64, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","returnAllyTeam",[param1,param2]));
      }
      
      public static function getMapCityCellDTO(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","getMapCityCellDTO",[param1]));
      }
      
      public static function getMapCityInfo(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","getMapCityInfo",[param1]));
      }
      
      public static function moveCityRandom() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","moveCityRandom",[]));
      }
      
      public static function doMoveCityRandom() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","doMoveCityRandom",[]));
      }
      
      public static function moveCityFix(param1:int, param2:Point) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","moveCityFix",[param1,param2]));
      }
      
      public static function getAllyTeamAtHome() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","getAllyTeamAtHome",[]));
      }
      
      public static function returnAllyTeamAtHome(param1:Int64, param2:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","returnAllyTeamAtHome",[param1,param2]));
      }
      
      public static function speedTeam(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoProxyCommand","speedTeam",[param1]));
      }
   }
}
