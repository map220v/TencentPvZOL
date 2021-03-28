package com.qq.modules.bag.command
{
   import PVZ.Cmd.Cmd_Equip_SellAllClone_CS;
   import PVZ.Cmd.Cmd_Item_Exchange_CS;
   import PVZ.Cmd.Cmd_Item_SeeNewItems_CS;
   import PVZ.Cmd.Cmd_Item_SellItems_CS;
   import PVZ.Cmd.Cmd_Item_Use_CS;
   import com.qq.modules.bag.model.vo.BagProxy;
   import com.qq.modules.main.server.PvzSocketService;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class BagProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var server:PvzSocketService;
      
      [Inject]
      public var bagProxy:BagProxy;
      
      public function BagProxyCommand()
      {
         super();
      }
      
      public function useItem(param1:int, param2:int = 1) : void
      {
         var _loc3_:Cmd_Item_Use_CS = new Cmd_Item_Use_CS();
         _loc3_.itemId = param1;
         _loc3_.iNum = param2;
         this.server.sendMessage(_loc3_);
      }
      
      public function sellItem(param1:Array) : void
      {
         var _loc2_:Cmd_Item_SellItems_CS = new Cmd_Item_SellItems_CS();
         _loc2_.items = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function cleanNewFlag() : void
      {
         var _loc1_:Cmd_Item_SeeNewItems_CS = new Cmd_Item_SeeNewItems_CS();
         this.bagProxy.isHaveNew = false;
         this.server.sendMessage(_loc1_);
      }
      
      public function clearCloneEquipment() : void
      {
         var _loc1_:Cmd_Equip_SellAllClone_CS = new Cmd_Equip_SellAllClone_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function chooseReward(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:Cmd_Item_Exchange_CS;
         (_loc4_ = new Cmd_Item_Exchange_CS()).itemId = param1;
         _loc4_.exchangeItemId = param2;
         _loc4_.num = param3;
         this.server.sendMessage(_loc4_);
      }
   }
}
