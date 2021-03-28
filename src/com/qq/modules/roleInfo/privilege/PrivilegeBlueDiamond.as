package com.qq.modules.roleInfo.privilege
{
   import PVZ.Cmd.E_DiamondType;
   import asgui.controls.Image;
   import com.qq.modules.activity.command.blueVip.BlueVipCmd;
   import com.qq.modules.main.model.PrivilegeDiamond;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.PrivilegeUtils;
   import com.qq.utils.UrlManager;
   import flash.events.MouseEvent;
   
   public class PrivilegeBlueDiamond extends PrivilegeIcon
   {
       
      
      public function PrivilegeBlueDiamond()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         m_image = new Image();
         m_image.width = 32;
         m_image.height = 15;
         this.addChild(m_image);
      }
      
      override protected function onMouseClick(param1:MouseEvent) : void
      {
         if(param1.target == m_image)
         {
            BlueVipCmd.openBlueVipWindow();
         }
      }
      
      override public function set privilege(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:PrivilegeDiamond = param1 as PrivilegeDiamond;
         if(_loc2_ && PrivilegeUtils.hasBlueDiamond(_loc2_.tag))
         {
            _loc3_ = "image/blueDiamond/";
            if(PrivilegeUtils.isBlueDiamondLuxury(_loc2_.tag))
            {
               _loc3_ += "luxury_";
            }
            else
            {
               _loc3_ += "normal_";
            }
            _loc3_ += _loc2_.getLevel(E_DiamondType.E_DiamondType_Blue);
            if(PrivilegeUtils.isBlueDiamondYear(_loc2_.tag))
            {
               _loc3_ += "_year";
               m_image.width = 32;
            }
            else
            {
               m_image.width = 16;
            }
            _loc3_ += ".png";
            m_image.source = UrlManager.getUrl(0,_loc3_);
            m_image.visible = true;
            m_image.toolTip = FontNormal.PRIVILEGE_BLUE_DIAMOND;
         }
         else
         {
            m_image.visible = false;
            m_image.toolTip = null;
         }
      }
   }
}
