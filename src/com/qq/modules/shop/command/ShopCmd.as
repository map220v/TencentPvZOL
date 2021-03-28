package com.qq.modules.shop.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ShopCmd
   {
       
      
      public function ShopCmd()
      {
         super();
      }
      
      public static function openShop(param1:uint = 0, param2:uint = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ShopCommand","openShop",[param1,param2]));
      }
      
      public static function buyItemByItemID(param1:int, param2:Function = null, param3:Array = null, param4:int = 0, param5:Function = null, param6:Array = null, param7:int = 0, param8:int = 0, param9:int = 1, param10:Boolean = false, param11:Function = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ShopCommand","buyItemByItemID",[param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11]));
      }
      
      public static function getShopList() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ShopCommand","getShopList",[]));
      }
      
      public static function buyPromotion() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ShopCommand","buyPromotion",[]));
      }
      
      public static function onBuyOk(param1:String, param2:Function = null, param3:Array = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ShopCommand","onBuyOk",[param1,param2,param3]));
      }
   }
}
