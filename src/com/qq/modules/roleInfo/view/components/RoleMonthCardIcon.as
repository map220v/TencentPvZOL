package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Image;
   import com.qq.modules.buy.command.BuyViewCmd;
   import com.qq.modules.buy.command.MonthCardCmd;
   import com.qq.modules.buy.model.vo.MonthCardRewardVO;
   import com.qq.utils.UrlManager;
   
   public class RoleMonthCardIcon extends RoleBuffIcon
   {
       
      
      private var img:Image;
      
      public var vos:Vector.<MonthCardRewardVO>;
      
      public function RoleMonthCardIcon()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.img = new Image();
         this.addChild(this.img);
         this.buttonMode = true;
      }
      
      override public function Dispose() : void
      {
         this.vos = null;
         super.Dispose();
      }
      
      public function setData(param1:Vector.<MonthCardRewardVO>) : Boolean
      {
         this.vos = param1;
         if(param1 && param1.length > 0)
         {
            if(param1[0].canGet)
            {
               this.toolTip = "月卡奖励可领取";
               this.img.source = UrlManager.getUrl(UrlManager.Url_RoleInfo,"month_can_and_ungot.swf");
            }
            else
            {
               this.toolTip = "今天月卡奖励已领取";
               this.img.source = UrlManager.getUrl(UrlManager.Url_RoleInfo,"month_can_and_got.png");
            }
            return true;
         }
         this.toolTip = "未激活月卡";
         this.img.source = UrlManager.getUrl(UrlManager.Url_RoleInfo,"month_cannot.png");
         return false;
      }
      
      public function click() : void
      {
         if(this.vos && this.vos.length > 0)
         {
            if(this.vos[0].canGet)
            {
               MonthCardCmd.showGetRewardWd();
            }
         }
         else
         {
            BuyViewCmd.openMallWnd();
         }
      }
   }
}
