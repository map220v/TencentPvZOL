package com.qq.modules.roleInfo.privilege
{
   import asgui.controls.Image;
   import com.qq.modules.daily3366.command.Daily3366ViewCmd;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.UrlManager;
   import flash.events.MouseEvent;
   
   public class Privilege3366 extends PrivilegeBlueDiamond
   {
       
      
      private var m_icon:Image;
      
      public function Privilege3366()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.m_icon = new Image();
         this.m_icon.width = 16;
         this.m_icon.height = 15;
         this.addChild(this.m_icon);
      }
      
      override protected function onMouseClick(param1:MouseEvent) : void
      {
         if(param1.target == this.m_icon)
         {
            Daily3366ViewCmd.showDaily3366();
         }
         else
         {
            super.onMouseClick(param1);
         }
      }
      
      override public function set extraParam(param1:Object) : void
      {
         if(param1 > 0)
         {
            this.m_icon.source = UrlManager.getUrl(0,"image/3366/ICON.png");
            this.m_icon.visible = true;
            this.m_icon.toolTip = FontNormal.PRIVILEGE_3366;
         }
         else
         {
            this.m_icon.visible = false;
            this.m_icon.toolTip = null;
         }
         this.layout();
      }
      
      private function layout() : void
      {
         if(m_image.visible)
         {
            this.m_icon.x = m_image.width + 1;
         }
         else
         {
            this.m_icon.x = 0;
         }
      }
      
      override public function set privilege(param1:Object) : void
      {
         super.privilege = param1;
         this.layout();
      }
   }
}
