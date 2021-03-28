package com.qq.modules.main.command
{
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class CommonCmd
   {
       
      
      public function CommonCmd()
      {
         super();
      }
      
      public static function itemMove(param1:Array, param2:Point, param3:Point, param4:Boolean = false, param5:Function = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommonCommand","itemMove",[param1,param2,param3,param4,param5]));
      }
      
      public static function itemFly(param1:Array, param2:Boolean = false, param3:Point = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommonCommand","itemFly",[param1,param2,param3]));
      }
      
      public static function showLoading() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommonCommand","showLoading",[]));
      }
      
      public static function playClassMcEffct(param1:String, param2:Point = null, param3:Function = null, param4:DisplayObjectContainer = null, param5:Point = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommonCommand","playClassMcEffct",[param1,param2,param3,param4,param5]));
      }
      
      public static function playMovieClip(param1:MovieClip, param2:Point = null, param3:Function = null, param4:DisplayObjectContainer = null, param5:Point = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommonCommand","playMovieClip",[param1,param2,param3,param4,param5]));
      }
      
      public static function txtFly(param1:String, param2:Number = NaN, param3:Number = NaN, param4:int = 0, param5:String = null, param6:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommonCommand","txtFly",[param1,param2,param3,param4,param5,param6]));
      }
      
      public static function shotScreen() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommonCommand","shotScreen",[]));
      }
      
      public static function clearBlitDataAndCache() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommonCommand","clearBlitDataAndCache",[]));
      }
      
      public static function showConfirmWindow(param1:String, param2:Function = null, param3:Array = null, param4:Function = null, param5:Array = null, param6:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommonCommand","showConfirmWindow",[param1,param2,param3,param4,param5,param6]));
      }
      
      public static function confirmUseDiamond(param1:String, param2:int, param3:Function, param4:Function = null, param5:uint = 0, param6:Boolean = false, param7:Array = null, param8:Boolean = false, param9:int = -1, param10:int = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommonCommand","confirmUseDiamond",[param1,param2,param3,param4,param5,param6,param7,param8,param9,param10]));
      }
      
      public static function showDiamondNotEnough(param1:int, param2:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommonCommand","showDiamondNotEnough",[param1,param2]));
      }
      
      public static function addAfterBattleDoFunc(param1:Function, param2:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommonCommand","addAfterBattleDoFunc",[param1,param2]));
      }
      
      public static function useCoinCheck(param1:int, param2:Function, param3:Array = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommonCommand","useCoinCheck",[param1,param2,param3]));
      }
      
      public static function showBuyCoinPanel(param1:String = "") : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommonCommand","showBuyCoinPanel",[param1]));
      }
      
      public static function showBuyPhysicalPanel(param1:String = "") : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommonCommand","showBuyPhysicalPanel",[param1]));
      }
      
      public static function showVipConfirm(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommonCommand","showVipConfirm",[param1]));
      }
      
      public static function sendVipPaySuccess(param1:Object = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommonCommand","sendVipPaySuccess",[param1]));
      }
      
      public static function doQzoneSummerHoliday(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommonCommand","doQzoneSummerHoliday",[param1]));
      }
   }
}
