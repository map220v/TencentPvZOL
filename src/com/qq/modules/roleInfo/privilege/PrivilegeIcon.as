package com.qq.modules.roleInfo.privilege
{
   import asgui.controls.Image;
   import asgui.core.Container;
   import flash.events.MouseEvent;
   
   public class PrivilegeIcon extends Container
   {
       
      
      protected var m_needClick:Boolean;
      
      protected var m_image:Image;
      
      public function PrivilegeIcon()
      {
         super();
      }
      
      public static function create() : PrivilegeIcon
      {
         var _loc1_:PrivilegeIcon = null;
         switch(ExternalVars.PlatformFlag)
         {
            case ExternalVars.SFROM_3366:
               _loc1_ = new Privilege3366();
               break;
            case ExternalVars.SFROM_QQGAME:
               _loc1_ = new PrivilegeBlueDiamond();
               break;
            case ExternalVars.SFROM_QZONE:
               _loc1_ = new PrivilegeYellowDiamond();
               break;
            default:
               _loc1_ = new PrivilegeIcon();
         }
         return _loc1_;
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
      }
      
      public function set needClick(param1:Boolean) : void
      {
         if(this.m_needClick != param1)
         {
            if(param1)
            {
               this.addEventListener(MouseEvent.CLICK,this.onMouseClick);
            }
            else
            {
               this.removeEventListener(MouseEvent.CLICK,this.onMouseClick);
            }
         }
         this.m_needClick = param1;
         this.buttonMode = this.m_needClick;
      }
      
      protected function onMouseClick(param1:MouseEvent) : void
      {
      }
      
      public function set privilege(param1:Object) : void
      {
      }
      
      override public function Dispose() : void
      {
         if(this.m_needClick)
         {
            this.removeEventListener(MouseEvent.CLICK,this.onMouseClick);
         }
         super.Dispose();
      }
      
      public function set extraParam(param1:Object) : void
      {
      }
   }
}
