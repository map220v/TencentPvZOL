package com.qq.modules.main.command
{
   import PVZ.Cmd.Cmd_PayShop_GetFlagList_CS;
   import PVZ.Cmd.Cmd_PayShop_SaveFlag_CS;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.main.service.ShortcutPayProxy;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class ShortcutPayProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      [Inject]
      public var shortcutProxy:ShortcutPayProxy;
      
      public function ShortcutPayProxyCommand()
      {
         super();
      }
      
      public function setShortcutPayTip(param1:int, param2:Boolean) : void
      {
         this.shortcutProxy.setFlag(param1,param2);
         var _loc3_:Cmd_PayShop_SaveFlag_CS = new Cmd_PayShop_SaveFlag_CS();
         _loc3_.flag = this.shortcutProxy.flags;
         this.pvzService.sendMessage(_loc3_);
      }
      
      public function setShortcutAllTrue(param1:Array) : void
      {
         this.shortcutProxy.flags = param1;
         var _loc2_:Cmd_PayShop_SaveFlag_CS = new Cmd_PayShop_SaveFlag_CS();
         _loc2_.flag = this.shortcutProxy.flags;
         this.pvzService.sendMessage(_loc2_);
      }
      
      public function setShortcutAllFalse() : void
      {
         this.shortcutProxy.flags = [];
         var _loc1_:Cmd_PayShop_SaveFlag_CS = new Cmd_PayShop_SaveFlag_CS();
         _loc1_.flag = this.shortcutProxy.flags;
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function getShortcutPay() : void
      {
         var _loc1_:Cmd_PayShop_GetFlagList_CS = new Cmd_PayShop_GetFlagList_CS();
         this.pvzService.sendMessage(_loc1_);
      }
   }
}
