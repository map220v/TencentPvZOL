package com.qq.modules.buy.command
{
   import PVZ.Cmd.Cmd_PayShop_GetDayTicketList_CS;
   import PVZ.Cmd.Cmd_PayShop_GetDayTicket_CS;
   import PVZ.Cmd.Cmd_PayShop_GetGiftTicketList_CS;
   import PVZ.Cmd.Cmd_PayShop_GetGiftTicket_CS;
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.buy.model.MonthCardProxy;
   import com.qq.modules.buy.model.vo.DailyCardRewardVO;
   import com.qq.modules.buy.model.vo.MonthCardRewardVO;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.onlineReward.command.OnlineRewardCmd;
   import com.qq.templates.font.FontHKHB;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class MonthCardCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var netService:PvzSocketService;
      
      [Inject]
      public var proxy:MonthCardProxy;
      
      public function MonthCardCommand()
      {
         super();
      }
      
      public function queryInfo() : void
      {
         this.requestMonthCardInfo();
         this.queryDailyCardInfo();
      }
      
      private function requestMonthCardInfo() : void
      {
         var _loc1_:Cmd_PayShop_GetDayTicketList_CS = new Cmd_PayShop_GetDayTicketList_CS();
         this.netService.sendMessage(_loc1_);
      }
      
      private function queryDailyCardInfo() : void
      {
         var _loc1_:Cmd_PayShop_GetGiftTicketList_CS = new Cmd_PayShop_GetGiftTicketList_CS();
         this.netService.sendMessage(_loc1_);
      }
      
      public function getDailyCardReward() : void
      {
         var _loc2_:Cmd_PayShop_GetGiftTicket_CS = null;
         var _loc1_:Vector.<DailyCardRewardVO> = this.proxy.dailyRewards;
         if(_loc1_.length > 0)
         {
            _loc2_ = new Cmd_PayShop_GetGiftTicket_CS();
            _loc2_.goodsId = _loc1_[0].id;
            this.netService.sendMessage(_loc2_);
         }
      }
      
      public function getReward() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Cmd_PayShop_GetDayTicket_CS = null;
         var _loc1_:Vector.<MonthCardRewardVO> = this.proxy.rewards;
         if(_loc1_.length > 0)
         {
            _loc2_ = _loc1_[0].goodsId;
            _loc3_ = new Cmd_PayShop_GetDayTicket_CS();
            _loc3_.goodsId = _loc2_;
            this.netService.sendMessage(_loc3_);
         }
      }
      
      public function showGetRewardWd() : void
      {
         var _loc3_:int = 0;
         var _loc1_:Vector.<MonthCardRewardVO> = this.proxy.rewards;
         var _loc2_:Vector.<ItemVO> = new Vector.<ItemVO>(_loc1_.length);
         while(_loc3_ < _loc2_.length)
         {
            _loc2_[_loc3_] = _loc1_[_loc3_].getItem();
            _loc3_++;
         }
         var _loc4_:ItemVO = _loc2_[0];
         OnlineRewardCmd.popupOnlineRewardTakeWindow(_loc2_,this.getReward,FontHKHB.MONTH_CARD_PACKAGE_TITLE,FontHKHB.MONTH_CARD_PACKAGE_DESC_TO_RECEIVE.replace("{0}",_loc4_.template.name));
      }
   }
}
