package com.qq.modules.bag.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class BagViewCmd
   {
       
      
      public function BagViewCmd()
      {
         super();
      }
      
      public static function start(param1:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BagViewCommand","start",[param1]));
      }
      
      public static function unload() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BagViewCommand","unload",[]));
      }
      
      public static function showSellWindow(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BagViewCommand","showSellWindow",[param1]));
      }
      
      public static function showUseWindow(param1:int, param2:int = -1, param3:Function = null, param4:Array = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BagViewCommand","showUseWindow",[param1,param2,param3,param4]));
      }
      
      public static function showBatchUseResultWd(param1:int, param2:int, param3:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BagViewCommand","showBatchUseResultWd",[param1,param2,param3]));
      }
      
      public static function playBagItemOpenEffect(param1:uint, param2:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BagViewCommand","playBagItemOpenEffect",[param1,param2]));
      }
      
      public static function openChest(param1:uint, param2:Array, param3:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BagViewCommand","openChest",[param1,param2,param3]));
      }
      
      public static function openChooseBagWindow(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BagViewCommand","openChooseBagWindow",[param1]));
      }
      
      public static function openPuzzleSellWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BagViewCommand","openPuzzleSellWindow",[]));
      }
      
      public static function openPuzzleSellConfirmWindow(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BagViewCommand","openPuzzleSellConfirmWindow",[param1]));
      }
   }
}
