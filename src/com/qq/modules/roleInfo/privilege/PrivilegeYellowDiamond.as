package com.qq.modules.roleInfo.privilege
{
   import PVZ.Cmd.E_DiamondType;
   import asgui.controls.Image;
   import com.qq.modules.main.model.PrivilegeDiamond;
   import com.qq.modules.yellowDiamond.command.YellowDiamondViewCmd;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.PrivilegeUtils;
   import com.qq.utils.UrlManager;
   import flash.events.MouseEvent;
   
   public class PrivilegeYellowDiamond extends PrivilegeIcon
   {
       
      
      public function PrivilegeYellowDiamond()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         m_image = new Image();
         m_image.width = 38;
         m_image.height = 26;
         this.addChild(m_image);
      }
      
      override protected function onMouseClick(param1:MouseEvent) : void
      {
         if(param1.target == m_image)
         {
            YellowDiamondViewCmd.openYellowDiamond();
         }
      }
      
      override public function set privilege(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:PrivilegeDiamond = param1 as PrivilegeDiamond;
         if(_loc2_ && PrivilegeUtils.hasYellowDiamond(_loc2_.tag))
         {
            _loc3_ = "image/yellowDiamond/";
            if(PrivilegeUtils.isYellowDiamondLuxury(_loc2_.tag))
            {
               _loc3_ += "luxury_";
            }
            else
            {
               _loc3_ += "normal_";
            }
            _loc3_ += _loc2_.getLevel(E_DiamondType.E_DiamondType_Yellow);
            if(PrivilegeUtils.isYellowDiamondYear(_loc2_.tag))
            {
               _loc3_ += "_year";
            }
            _loc3_ += ".png";
            m_image.source = UrlManager.getUrl(0,_loc3_);
            m_image.visible = true;
            m_image.toolTip = FontNormal.PRIVILEGE_YELLOW_DIAMOND;
         }
         else
         {
            m_image.visible = false;
            m_image.toolTip = null;
         }
      }
   }
}
