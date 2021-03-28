package asgui.controls
{
   import asgui.core.IListItemRenderer;
   import asgui.core.UIComponent;
   import asgui.core.UIComponentGlobals;
   import asgui.resources.AssetManager;
   import asgui.strings.SS;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class Button extends UIComponent implements IListItemRenderer
   {
      
      public static const STYLE:String = "Button";
       
      
      protected var textField:TextField;
      
      protected var textFiledAutoSize:Boolean = false;
      
      private var m_lightMc:MovieClip;
      
      private var _label:String;
      
      private var labelChanged:Boolean = false;
      
      private var _coolDownTime:int = 0;
      
      private var coolDownUID:uint;
      
      private var _cache_enable:Boolean = true;
      
      private var textFieldHeight:int;
      
      public function Button()
      {
         this.mouseChildren = false;
         this.addEventListener(MouseEvent.CLICK,this.ClickHandler);
         this.textField = new TextField();
         this.textField.text = " ";
         this.addChild(this.textField);
         this.coolDownUID = 0;
         super();
         if(UIComponentGlobals.buttonUseButtonMode)
         {
            this.buttonMode = true;
         }
         styleDeclaration.SetTextFieldStyle(this.textField,this.textFiledAutoSize);
      }
      
      override public function Dispose() : void
      {
         clearTimeout(this.coolDownUID);
         this.removeEventListener(MouseEvent.CLICK,this.ClickHandler);
         if(this.m_lightMc)
         {
            this.hideLight();
            this.m_lightMc = null;
         }
         super.Dispose();
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
      
      override protected function $StyleChanged() : void
      {
         this.styleDeclaration.SetTextFieldStyle(this.textField,true);
         if(styleDeclaration.isButtontHeightSameTextHeight)
         {
            this.textFieldHeight = height;
         }
         else
         {
            this.textFieldHeight = this.textField.height + 4;
         }
         this.textField.autoSize = "none";
         super.$StyleChanged();
      }
      
      public function get label() : String
      {
         return this._label;
      }
      
      public function set label(param1:String) : void
      {
         if(this._label != param1)
         {
            if(param1 == null)
            {
               param1 = "";
            }
            this._label = param1;
            this.labelChanged = true;
            InvalidateProperties();
         }
      }
      
      public function get coolDownTime() : int
      {
         return this._coolDownTime;
      }
      
      public function set coolDownTime(param1:int) : void
      {
         if(this._coolDownTime != param1)
         {
            this._coolDownTime = param1;
         }
      }
      
      private function CoolDownFinish() : void
      {
         this.coolDownUID = 0;
         this.enabled = this._cache_enable;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         this._cache_enable = param1;
         if(this.coolDownUID != 0)
         {
            return;
         }
         super.enabled = param1;
         if(!param1 && this.m_lightMc != null)
         {
            this.hideLight();
         }
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1 is String)
         {
            this.label = param1 as String;
         }
         else if(data && data.hasOwnProperty(this.dataField))
         {
            this.label = data[dataField];
         }
      }
      
      private function ClickHandler(param1:MouseEvent) : void
      {
         if(!$enabledFunc)
         {
            param1.stopImmediatePropagation();
            return;
         }
         this.startCoolDown();
         this.OnClick(param1);
      }
      
      public function startCoolDown() : void
      {
         if(this.coolDownTime != 0)
         {
            super.enabled = false;
            if(this.m_lightMc != null)
            {
               this.hideLight();
            }
            this.coolDownUID = setTimeout(this.CoolDownFinish,this.coolDownTime);
         }
      }
      
      protected function OnClick(param1:MouseEvent) : void
      {
         if(UIComponentGlobals.buttonClickCallBack != null)
         {
            UIComponentGlobals.buttonClickCallBack(this);
         }
      }
      
      override public function ValidateSize() : void
      {
         if(invalidateSizeFlag)
         {
            if(this.textField != null)
            {
            }
         }
         super.ValidateSize();
      }
      
      override public function ValidateProperties() : void
      {
         if(this.labelChanged)
         {
            this.textField.text = SS.$(this.label);
            this.labelChanged = false;
            $Render();
         }
         super.ValidateProperties();
      }
      
      override public function ValidateSkin() : void
      {
         if(this.textField)
         {
            styleDeclaration.SetTextFieldStyle(this.textField,this.textFiledAutoSize);
         }
         super.ValidateSkin();
      }
      
      override protected function $DrawDisabled() : void
      {
         if(this.textField != null)
         {
            styleDeclaration.SetTextFieldDisabledStyle(this.textField);
            styleDeclaration.SetTextSizeDisabled(this.textField,this.lableWidth,this.lableHeight,this.lableX,this.lableY);
         }
      }
      
      override protected function $DrawDown() : void
      {
         if(this.textField != null)
         {
            styleDeclaration.SetTextFieldDownStyle(this.textField);
            styleDeclaration.SetTextSizeDown(this.textField,this.lableWidth,this.lableHeight,this.lableX,this.lableY);
         }
      }
      
      override protected function $DrawOver() : void
      {
         if(this.textField != null)
         {
            styleDeclaration.SetTextFieldOverStyle(this.textField);
            styleDeclaration.SetTextSizeOver(this.textField,this.lableWidth,this.lableHeight,this.lableX,this.lableY);
         }
      }
      
      override protected function $DrawNormal() : void
      {
         if(this.textField != null)
         {
            styleDeclaration.SetTextFieldStyle(this.textField,this.textFiledAutoSize);
            styleDeclaration.SetTextSize(this.textField,this.lableWidth,this.lableHeight,this.lableX,this.lableY);
         }
      }
      
      protected function get lableX() : int
      {
         return 0;
      }
      
      protected function get lableY() : int
      {
         return (this.height - this.lableHeight) / 2;
      }
      
      protected function get lableWidth() : int
      {
         return this.width - this.lableX;
      }
      
      protected function get lableHeight() : int
      {
         return this.textFieldHeight;
      }
      
      protected function get light() : MovieClip
      {
         if(this.m_lightMc == null)
         {
            this.m_lightMc = new MovieClip();//AssetManager.GetClass("btn_light_effect")() as MovieClip;
            this.m_lightMc.mouseChildren = this.m_lightMc.mouseEnabled = false;
            this.m_lightMc.stop();
         }
         return this.m_lightMc;
      }
      
      public function showLight() : void
      {
         this.addChild(this.light);
         this.light["mcMask"].width = this.width;
         this.light["mcMask"].height = this.height;
         this.light.play();
      }
      
      public function hideLight() : void
      {
         if(this.contains(this.light))
         {
            this.removeChild(this.light);
         }
         this.light.stop();
      }
   }
}
