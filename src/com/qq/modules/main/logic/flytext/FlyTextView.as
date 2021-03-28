package com.qq.modules.main.logic.flytext
{
   import asgui.controls.Text;
   import com.qq.display.QCanvas;
   
   public class FlyTextView extends QCanvas
   {
      
      public static const FlyDistance:int = 150;
      
      public static const FlyWidth:int = 500;
       
      
      public var text:Text;
      
      public var flyType:int;
      
      public var txtStyleName:String;
      
      public function FlyTextView(param1:int, param2:String = null)
      {
         this.flyType = param1;
         this.txtStyleName = param2;
         super(FlyTextViewMediator);
      }
      
      override public function InitializeComponent() : void
      {
         this.mouseChildren = false;
         this.mouseEnabled = false;
         super.InitializeComponent();
         width = FlyWidth;
         this.text = new Text();
         this.text.width = FlyWidth;
         this.text.height = 50;
         switch(this.flyType)
         {
            case FlyTextType.FLY_TYPE_TRIGLE_FAILED:
               this.text.SetStyle("color","#ff0000");
               this.text.SetStyle("textShadowStrength","5");
               this.text.SetStyle("textShadowDistance","0");
               this.text.SetStyle("textShadowBlurX","5");
               this.text.SetStyle("textShadowBlurY","5");
               this.text.SetStyle("textShadowColor","#0b2645");
               this.text.SetStyle("textShadowAlpha","0.8");
               this.text.SetStyle("fontSize","20");
               this.text.SetStyle("fontWeight","bold");
               this.text.SetStyle("textAlign","center");
               break;
            case FlyTextType.FLY_TYPE_LAB_UPGRADE:
               this.text.SetStyle("color","#a7ff48");
               this.text.SetStyle("textShadowStrength","10");
               this.text.SetStyle("textShadowDistance","0");
               this.text.SetStyle("textShadowBlurX","2");
               this.text.SetStyle("textShadowBlurY","2");
               this.text.SetStyle("textShadowColor","#00c909");
               this.text.SetStyle("textShadowAlpha","0.75");
               this.text.SetStyle("fontSize","18");
               this.text.SetStyle("textAlign","center");
               break;
            case FlyTextType.FLY_TYPE_GOLD_EXCHANGE:
               this.text.styleName = ".TXT_HKHB_21_Yellow_Shadow";
               break;
            case FlyTextType.FLY_TYPE_QUEST:
               this.text.SetStyle("color","#a7ff48");
               this.text.SetStyle("textShadowStrength","10");
               this.text.SetStyle("textShadowDistance","0");
               this.text.SetStyle("textShadowBlurX","2");
               this.text.SetStyle("textShadowBlurY","2");
               this.text.SetStyle("textShadowColor","#0");
               this.text.SetStyle("textShadowAlpha","0.75");
               this.text.SetStyle("fontSize","25");
               this.text.SetStyle("textAlign","center");
               break;
            default:
               if(this.txtStyleName)
               {
                  this.text.styleName = this.txtStyleName;
               }
               else
               {
                  this.text.SetStyle("color","#00FFFF");
                  this.text.SetStyle("textShadowStrength","3");
                  this.text.SetStyle("textShadowDistance","0");
                  this.text.SetStyle("textShadowBlurX","3");
                  this.text.SetStyle("textShadowBlurY","3");
                  this.text.SetStyle("textShadowColor","#0");
                  this.text.SetStyle("textShadowAlpha","0.8");
                  this.text.SetStyle("fontSize","16");
                  this.text.SetStyle("fontWeight","bold");
                  this.text.SetStyle("textAlign","center");
               }
         }
         addChild(this.text);
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
