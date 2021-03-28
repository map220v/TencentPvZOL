package com.qq.tooltip
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.TextArea;
   import asgui.core.IToolTip;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.modules.bag.ItemQualityType;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.bag.model.templates.ce.BagItemTemplateCE;
   import com.qq.templates.font.FontHKHB;
   
   public class ItemTooltip extends QCanvas implements IToolTip
   {
       
      
      public var _data:Object;
      
      public var nameTxt:Label;
      
      public var propName:TextArea;
      
      public function ItemTooltip()
      {
         super(null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 220;
         this.height = 120;
         this.styleName = "ToolTip";
         this.nameTxt = new Label();
         addChild(this.nameTxt);
         this.nameTxt.left = 0;
         this.nameTxt.right = 0;
         this.nameTxt.height = 20;
         this.nameTxt.styleName = ".TXT_Panel_Title";
         this.nameTxt.SetStyle("textAlign","left");
         var _loc1_:Image = new Image();
         addChild(_loc1_);
         _loc1_.source = AssetManager.GetClass("skin_battle_cutOff");
         _loc1_.y = this.nameTxt.y + this.nameTxt.height;
         _loc1_.left = 0;
         _loc1_.right = 10;
         this.propName = new TextArea();
         addChild(this.propName);
         this.propName.SetStyle("color","#EBB00C");
         this.propName.left = 0;
         this.propName.right = 0;
         this.propName.text = FontHKHB.BATTLE_CARD_PROP;
         this.propName.y = _loc1_.y + 10;
         this.propName.horizontalScrollPolicy = "off";
         this.propName.verticalScrollPolicy = "off";
      }
      
      public function update() : void
      {
         var _loc1_:int = int(this._data);
         var _loc2_:BagItemTemplateCE = ItemTemplateFactory.instance.getBagItemTemplateById(_loc1_);
         if(_loc2_)
         {
            this.nameTxt.text = _loc2_.name;
            this.nameTxt.SetStyle("color",ItemQualityType.getQualityColor(_loc2_.quality));
            this.propName.htmlText = _loc2_.desc;
         }
         this.propName.height = (this.propName.textField.numLines + 1) * 20;
         this.height = this.propName.y + this.propName.height + 20;
      }
      
      public function get text() : Object
      {
         return this._data;
      }
      
      public function set text(param1:Object) : void
      {
         this._data = param1;
         this.update();
      }
   }
}
