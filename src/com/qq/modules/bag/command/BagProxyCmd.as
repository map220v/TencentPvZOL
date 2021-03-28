package com.qq.modules.bag.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class BagProxyCmd
   {
       
      
      public function BagProxyCmd()
      {
         super();
      }
      
      public static function useItem(param1:int, param2:int = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BagProxyCommand","useItem",[param1,param2]));
      }
      
      public static function sellItem(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BagProxyCommand","sellItem",[param1]));
      }
      
      public static function cleanNewFlag() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BagProxyCommand","cleanNewFlag",[]));
      }
      
      public static function clearCloneEquipment() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BagProxyCommand","clearCloneEquipment",[]));
      }
      
      public static function chooseReward(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BagProxyCommand","chooseReward",[param1,param2,param3]));
      }
   }
}
