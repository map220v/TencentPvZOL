package com.qq.modules.main.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class CmdStoreProxyCmd
   {
       
      
      public function CmdStoreProxyCmd()
      {
         super();
      }
      
      public static function buyByItemID(param1:int, param2:int = 1, param3:String = "", param4:uint = 0, param5:Function = null, param6:Array = null, param7:int = 0, param8:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CmdStoreProxyCommand","buyByItemID",[param1,param2,param3,param4,param5,param6,param7,param8]));
      }
      
      public static function buyByShopID(param1:int, param2:int = 1, param3:String = "", param4:uint = 0, param5:Function = null, param6:Array = null, param7:int = 0, param8:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CmdStoreProxyCommand","buyByShopID",[param1,param2,param3,param4,param5,param6,param7,param8]));
      }
   }
}
