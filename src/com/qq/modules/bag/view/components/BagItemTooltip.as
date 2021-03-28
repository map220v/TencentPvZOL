package com.qq.modules.bag.view.components
{
   import asgui.containers.Canvas;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.Text;
   import asgui.controls.TextArea;
   import asgui.core.IDisposable;
   import asgui.core.IToolTip;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.utils.UrlManager;
   import com.tencent.protobuf.Int64;
   
   public class BagItemTooltip extends QCanvas implements IToolTip
   {
       
      
      public var txtName:Label;
      
      public var cStar:Canvas;
      
      public var imgCutOff:Image;
      
      public var txtAttr:Text;
      
      public var txtSuitAttr:Text;
      
      public var txtSuitInfo:Text;
      
      public var txtDesc:TextArea;
      
      public function BagItemTooltip(param1:Class = null, param2:Boolean = true)
      {
         super(BagItemTooltipMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 200;
         this.height = 300;
         this.styleName = "ToolTip";
         this.txtName = new Label();
         this.txtName.SetStyle("fontSize","16");
         this.txtName.SetStyle("textAlign","left");
         this.txtName.SetStyle("color","#FFFFFF");
         this.txtName.x = 5;
         this.txtName.y = 0;
         this.txtName.width = 150;
         this.txtName.height = 24;
         this.addChild(this.txtName);
         this.cStar = new Canvas();
         this.cStar.width = 90;
         this.cStar.height = 24;
         this.cStar.x = 80;
         this.cStar.y = 5;
         this.addChild(this.cStar);
         this.imgCutOff = new Image();
         this.imgCutOff.y = 25;
         this.imgCutOff.left = 0;
         this.imgCutOff.right = 0;
         this.addChild(this.imgCutOff);
         this.imgCutOff.source = AssetManager.GetClass("skin_battle_cutOff");
         this.txtAttr = new Text();
         this.txtAttr.SetStyle("fontSize","14");
         this.txtAttr.SetStyle("textAlign","left");
         this.txtAttr.SetStyle("color","#FFFFFF");
         this.txtAttr.x = 5;
         this.txtAttr.y = 30;
         this.txtAttr.width = 180;
         this.txtAttr.height = 60;
         this.addChild(this.txtAttr);
         this.txtSuitAttr = new Text();
         this.txtSuitAttr.x = 5;
         this.txtSuitAttr.width = 180;
         this.txtSuitAttr.height = 60;
         this.addChild(this.txtSuitAttr);
         this.txtSuitInfo = new Text();
         this.txtSuitInfo.x = 5;
         this.txtSuitInfo.width = 180;
         this.txtSuitInfo.height = 100;
         this.addChild(this.txtSuitInfo);
         this.txtDesc = new TextArea();
         this.txtDesc.x = 5;
         this.txtDesc.width = 180;
         this.txtDesc.height = 80;
         this.txtDesc.SetStyle("color","#EBB00C");
         this.txtDesc.horizontalScrollPolicy = "off";
         this.txtDesc.verticalScrollPolicy = "off";
         this.addChild(this.txtDesc);
      }
      
      public function set itemName(param1:String) : void
      {
         this.txtName.text = param1;
      }
      
      public function set starLv(param1:int) : void
      {
         var _loc2_:Image = null;
         this.clearStar();
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc2_ = new Image();
            _loc2_.scaleX = _loc2_.scaleY = 0.5;
            _loc2_.source = UrlManager.getUrl(0,"swf/card/star.png");
            _loc2_.x = (_loc3_ + 1) * this.cStar.width / (param1 + 1);
            this.cStar.addChild(_loc2_);
            _loc3_++;
         }
      }
      
      public function set equipAttr(param1:String) : void
      {
         this.txtAttr.text = param1;
      }
      
      public function set suitAttr(param1:String) : void
      {
         this.txtSuitAttr.text = param1;
      }
      
      public function set suitInfo(param1:String) : void
      {
         this.txtSuitInfo.text = param1;
      }
      
      private function clearStar() : void
      {
         if(this.cStar)
         {
            while(this.cStar.numChildren > 0)
            {
               (this.cStar.removeChildAt(0) as IDisposable).Dispose();
            }
         }
      }
      
      public function layout() : void
      {
         var _loc1_:int = this.txtAttr.y + this.txtAttr.textHeight + 15;
         this.txtSuitAttr.y = _loc1_;
         if(this.txtSuitAttr.text != "")
         {
            _loc1_ += this.txtSuitAttr.textHeight + 15;
         }
         this.txtSuitInfo.y = _loc1_;
         if(this.txtSuitInfo.text != "")
         {
            _loc1_ += this.txtSuitInfo.textHeight + 15;
         }
         this.txtDesc.y = _loc1_;
         this.txtDesc.height = (this.txtDesc.textField.numLines + 1) * 20;
         this.height = this.txtDesc.y + this.txtDesc.height + 10;
      }
      
      override public function Dispose() : void
      {
         this.clearStar();
         this.txtName = null;
         this.imgCutOff = null;
         this.cStar = null;
         this.txtAttr = null;
         super.Dispose();
      }
      
      public function get text() : Object
      {
         return null;
      }
      
      public function set text(param1:Object) : void
      {
         if(param1.slice(0,3) == "dto")
         {
            (getMediator() as BagItemTooltipMediator).updateDto(param1 as String);
         }
         else
         {
            (getMediator() as BagItemTooltipMediator).update(Int64.parseInt64(param1 as String));
         }
      }
   }
}
