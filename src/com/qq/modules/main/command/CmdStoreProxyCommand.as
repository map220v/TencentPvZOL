package com.qq.modules.main.command
{
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.main.server.StoreService;
   import com.qq.modules.shop.model.ShopTemplateFactory;
   import com.qq.modules.shop.model.templates.ce.ShopItemTemplateCE;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class CmdStoreProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var server:PvzSocketService;
      
      [Inject]
      public var storeSev:StoreService;
      
      public function CmdStoreProxyCommand()
      {
         super();
      }
      
      public function buyByItemID(param1:int, param2:int = 1, param3:String = "", param4:uint = 0, param5:Function = null, param6:Array = null, param7:int = 0, param8:Boolean = false) : Boolean
      {
         this.storeSev.init();
         var _loc9_:ShopItemTemplateCE;
         if((_loc9_ = ShopTemplateFactory.instance.getMallItemTemplateByItemID(param1)) == null)
         {
            return false;
         }
         this.buyByShopID(_loc9_.id,param2,param3,param4,param5,param6,param7,param8);
         return true;
      }
      
      public function buyByShopID(param1:int, param2:int = 1, param3:String = "", param4:uint = 0, param5:Function = null, param6:Array = null, param7:int = 0, param8:Boolean = false) : void
      {
         this.storeSev.init();
         this.storeSev.buyItemWithBackFunc(param3,param1,param2,param4,param5,param6,param7,param8);
      }
   }
}
