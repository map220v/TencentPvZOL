package com.qq.modules.levelselect.view.maps
{
   import asgui.containers.Canvas;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import com.qq.constant.ItemID;
   import com.qq.constant.bag.BagItemUtil;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.utils.UrlManager;
   
   public class LSMapSunSmallIcon extends Canvas
   {
      
      public static const TYPE_SUN:int = 1;
      
      public static const TYPE_EXP:int = 2;
       
      
      private var num:int;
      
      private var type:int;
      
      public function LSMapSunSmallIcon(param1:int, param2:int)
      {
         this.type = param1;
         this.num = param2;
         super();
      }
      
      override public function InitializeComponent() : void
      {
         var _loc3_:Label = null;
         super.InitializeComponent();
         this.width = 100;
         this.height = 27;
         var _loc1_:Image = new Image();
         this.addChild(_loc1_);
         switch(this.type)
         {
            case TYPE_EXP:
               this.toolTip = ItemTemplateFactory.instance.getBagItemName(ItemID.Exp);
               _loc1_.source = UrlManager.getUrl(0,"swf/ls/exp_26x27.swf");
               break;
            case TYPE_SUN:
               this.toolTip = ItemTemplateFactory.instance.getBagItemName(ItemID.Sun);
               _loc1_.source = UrlManager.getUrl(0,"swf/ls/sun_26x27.swf");
               break;
            default:
               _loc3_ = new Label();
               _loc3_.text = "*";
               _loc3_.styleName = ".TXT_Brown_Value_16";
               _loc3_.SetStyle("textShadowColor","#452B12");
               _loc3_.SetStyle("textShadowBlurX","4");
               _loc3_.SetStyle("textShadowBlurY","4");
               _loc3_.x = -20;
               _loc3_.y = 5;
               _loc3_.width = 48;
               _loc3_.height = 24;
               _loc3_.id = "l_x2";
               addChild(_loc3_);
               scrollRectEnabled = false;
               this.toolTip = ItemTemplateFactory.instance.getBagItemName(this.type);
               _loc1_.source = BagItemUtil.getBagItemImageSource(this.type);
               _loc1_.scaleX = _loc1_.scaleY = 0.5;
         }
         var _loc2_:Label = new Label();
         _loc2_.styleName = ".TXT_Brown_Value_16";
         _loc2_.SetStyle("textShadowColor","#432D04");
         _loc2_.SetStyle("textShadowBlurX","4");
         _loc2_.SetStyle("textShadowBlurY","4");
         _loc2_.text = " " + this.num;
         _loc2_.x = 30;
         _loc2_.vcenter = 0;
         _loc2_.height = 18;
         _loc2_.width = 100;
         this.addChild(_loc2_);
      }
   }
}
