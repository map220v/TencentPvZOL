package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.modules.city.view.components.CityTopRightToolBar;
   import flash.display.MovieClip;
   
   public class NewRoleInfoPanel extends QCanvas
   {
       
      
      public var roleHead:RoleHead;
      
      public var roleValuePanel:RoleValueInfoPanelCE;
      
      public var expBar:MovieClip;
      
      public var label_exp:Label;
      
      public var physicalBar:MovieClip;
      
      public var label_physical:Label;
      
      public var roleBuffBar:RoleBuffBar;
      
      public var vipTipEffect:MovieClip;
      
      public function NewRoleInfoPanel()
      {
         super(NewRoleInfoPanelMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.roleValuePanel = new RoleValueInfoPanelCE();
         this.roleValuePanel.x = 90;
         this.roleValuePanel.image_vip_flag.buttonMode = true;
         addChild(this.roleValuePanel);
         this.roleHead = new RoleHead();
         this.roleHead.buttonMode = true;
         addChild(this.roleHead);
         this.expBar = AssetManager.instance.GetNewClass("ModuleRoleInfo_New_ExpBar") as MovieClip;
         this.expBar.x = 3;
         addChild(this.expBar);
         this.label_exp = new Label();
         this.label_exp.width = 30;
         this.label_exp.x = 6;
         this.label_exp.y = 46;
         this.label_exp.styleName = ".TXT_Normal_14_ThinBorder";
         this.label_exp.mouseChildren = false;
         this.label_exp.mouseEnabled = false;
         addChild(this.label_exp);
         this.physicalBar = AssetManager.instance.GetNewClass("ModuleRoleInfo_New_PhysicalBar") as MovieClip;
         this.physicalBar.x = 124;
         this.physicalBar.y = this.roleValuePanel.y + this.roleValuePanel.height - 3;
         addChild(this.physicalBar);
         this.label_physical = new Label();
         this.label_physical.styleName = ".TXT_HKHB_14_White_Gray_Center";
         this.label_physical.x = this.physicalBar.x;
         this.label_physical.y = this.physicalBar.y + 7;
         this.label_physical.width = this.physicalBar.width - 20;
         addChild(this.label_physical);
         this.roleBuffBar = new RoleBuffBar();
         this.roleBuffBar.x = 0;
         this.roleBuffBar.y = 93;
         addChild(this.roleBuffBar);
         var _loc1_:CityTopRightToolBar = new CityTopRightToolBar();
         _loc1_.x = this.physicalBar.x + this.physicalBar.width + 2;
         _loc1_.y = this.physicalBar.y;
         addChild(_loc1_);
      }
      
      public function setExp(param1:int, param2:int) : void
      {
         param1 = Math.min(param1,param2);
         var _loc3_:MovieClip = this.expBar["exp_value_bar"];
         if(_loc3_ != null)
         {
            _loc3_.height = int(param1 / param2 * 42);
         }
      }
      
      public function setPhysicalBar(param1:int, param2:int) : void
      {
         param1 = Math.min(param1,param2);
         var _loc3_:MovieClip = this.physicalBar["bar"];
         if(_loc3_ != null)
         {
            _loc3_.width = int(param1 / param2 * 272);
         }
      }
      
      override public function Dispose() : void
      {
         this.vipTipEffect = null;
         super.Dispose();
      }
   }
}
