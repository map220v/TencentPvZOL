package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import com.qq.display.QCanvas;
   import com.qq.utils.UrlManager;
   
   public class LSMainIcon extends QCanvas
   {
       
      
      public var img:Image;
      
      public var txtNum:Label;
      
      public var txtName:Label;
      
      public var name2:String;
      
      public var color:String;
      
      public var type:int;
      
      public function LSMainIcon(param1:String, param2:String, param3:int = 0)
      {
         this.type = param3;
         this.color = param2;
         this.name2 = param1;
         super(LSMainIconMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 70;
         this.height = 60;
         this.img = new Image();
         this.img.hcenter = 0;
         this.img.source = UrlManager.getUrl(0,"swf/icons/main_ui/star.swf");
         this.addChild(this.img);
         this.txtNum = new Label();
         this.txtNum.styleName = ".TXT_Panel_Title";
         this.txtNum.SetStyle("color","#ff0000");
         this.txtNum.width = 40;
         this.txtNum.height = 20;
         this.txtNum.right = 0;
         this.txtNum.y = 20;
         this.addChild(this.txtNum);
         this.txtName = new Label();
         this.txtName.styleName = ".TXT_Panel_Title";
         this.txtName.SetStyle("color",this.color);
         this.txtName.text = this.name2;
         this.txtName.top = 36;
         this.txtName.right = 0;
         this.txtName.left = 0;
         this.addChild(this.txtName);
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
