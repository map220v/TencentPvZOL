package com.qq.modules.roleInfo.view.components
{
   import PVZ.Cmd.E_BuffType;
   import asgui.controls.Image;
   import asgui.managers.ToolTipManager;
   import com.qq.modules.main.model.vo.BuffVO;
   import com.qq.utils.UrlManager;
   
   public class RoleAvoidWarIcon extends RoleBuffIcon
   {
       
      
      private var img:Image;
      
      private var _buffVO:BuffVO;
      
      public function RoleAvoidWarIcon()
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
      
      public function get buffVO() : BuffVO
      {
         return this._buffVO;
      }
      
      public function set buffVO(param1:BuffVO) : void
      {
         this._buffVO = param1;
         ToolTipManager.RegisterToolTip(this,null);
         if(this._buffVO)
         {
            if(this._buffVO.buffType == E_BuffType.E_BuffType_WarFree)
            {
               this.img.source = UrlManager.getUrl(UrlManager.Url_RoleInfo,"avoidWar1.png");
            }
            else if(this._buffVO.buffType == E_BuffType.E_BuffType_WarFreeCD)
            {
               this.img.source = UrlManager.getUrl(UrlManager.Url_RoleInfo,"avoidWar2.png");
            }
            ToolTipManager.RegisterToolTip(this,this._buffVO.buffID,BuffTooltip);
         }
         else
         {
            this.img.source = UrlManager.getUrl(UrlManager.Url_RoleInfo,"avoidWar3.png");
            ToolTipManager.RegisterToolTip(this,"现在可以使用免战");
         }
      }
      
      override public function Dispose() : void
      {
         ToolTipManager.RegisterToolTip(this,null);
         super.Dispose();
      }
   }
}
