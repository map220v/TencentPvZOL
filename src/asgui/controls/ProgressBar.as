package asgui.controls
{
   import asgui.controls.progresses.ProgressBarDirection;
   import asgui.controls.progresses.ProgressBarLabelPlacement;
   import asgui.controls.progresses.ProgressBarMode;
   import asgui.core.Align;
   import asgui.core.UIComponent;
   import asgui.styles.StyleManager;
   import asgui.styles.StyleSkin;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.text.TextField;
   
   public class ProgressBar extends UIComponent
   {
      
      public static const STYLE:String = "ProgressBar";
       
      
      protected var textField:TextField;
      
      protected var track:Shape;
      
      protected var bar:Shape;
      
      private var _direction:String = "right";
      
      private var _label:String = "loading %3%%";
      
      private var $labelPlacement:int;
      
      private var _labelPlacement = "HCENTER_VCENTER";
      
      private var _maximum:Number = 0;
      
      private var _minimum:Number = 0;
      
      private var _mode:String = "event";
      
      private var modeChanged:Boolean = false;
      
      private var _value:Number = 0;
      
      private var $viewValue:Number = 0;
      
      private var $viewValueInterval:Number = 0;
      
      protected var $trackSkin:StyleSkin;
      
      protected var $barSkin:StyleSkin;
      
      protected var $trackWidth:int;
      
      protected var $trackHeight:int;
      
      protected var $trackLeft:int;
      
      protected var $trackTop:int;
      
      protected var $barWidth:int;
      
      protected var $barHeight:int;
      
      protected var $barLeft:int;
      
      protected var $barTop:int;
      
      public function ProgressBar()
      {
         this.$labelPlacement = ProgressBarLabelPlacement.HCENTER_VCENTER;
         super();
         this.width = 200;
         this.height = 20;
         this.$labelPlacement = ProgressBarLabelPlacement.HCENTER_VCENTER;
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.track = new Shape();
         this.addChild(this.track);
         this.bar = new Shape();
         this.addChild(this.bar);
         this.textField = new TextField();
         this.addChild(this.textField);
      }
      
      override public function Dispose() : void
      {
         this.removeEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
         super.Dispose();
      }
      
      public function get direction() : String
      {
         return this._direction;
      }
      
      public function set direction(param1:String) : void
      {
         if(param1 == ProgressBarDirection.LEFT || param1 == ProgressBarDirection.RIGHT || param1 == ProgressBarDirection.TOP || param1 == ProgressBarDirection.BOTTOM)
         {
            this._direction = param1;
         }
         InvalidateProperties();
         InvalidateSize();
         InvalidateDisplayList();
         InvalidateSkin();
      }
      
      public function get label() : String
      {
         return this._label;
      }
      
      public function set label(param1:String) : void
      {
         if(this._label == param1)
         {
            return;
         }
         this._label = param1;
         InvalidateProperties();
      }
      
      public function get labelPlacement() : *
      {
         return this._labelPlacement;
      }
      
      public function set labelPlacement(param1:*) : void
      {
         this._labelPlacement = param1;
         if(param1 is String)
         {
            param1 = ProgressBarLabelPlacement[param1];
         }
         if(param1 == this.$labelPlacement)
         {
            return;
         }
         this.$labelPlacement = param1;
         InvalidateSize();
         InvalidateDisplayList();
      }
      
      public function get maximum() : Number
      {
         return this._maximum;
      }
      
      public function set maximum(param1:Number) : void
      {
         if(!isNaN(param1) && this._mode == ProgressBarMode.MANUAL && param1 != this._maximum)
         {
            this._maximum = param1;
            InvalidateProperties();
         }
      }
      
      public function get minimum() : Number
      {
         return this._minimum;
      }
      
      public function set minimum(param1:Number) : void
      {
         if(!isNaN(param1) && this._mode == ProgressBarMode.MANUAL && param1 != this._minimum)
         {
            this._minimum = param1;
            InvalidateProperties();
         }
      }
      
      public function get mode() : String
      {
         return this._mode;
      }
      
      public function set mode(param1:String) : void
      {
         if(param1 != this._mode)
         {
            this._mode = param1;
            this.modeChanged = true;
            InvalidateProperties();
         }
      }
      
      public function get value() : Number
      {
         return this._value;
      }
      
      public function set value(param1:Number) : void
      {
         if(!isNaN(param1) && this._mode == ProgressBarMode.MANUAL && this._value != param1)
         {
            InvalidateProperties();
            this._value = param1;
            if(styleDeclaration.barMotionFrames > 0)
            {
               this.$viewValueInterval = (param1 - this.$viewValue) / styleDeclaration.barMotionFrames;
            }
         }
      }
      
      public function SetProgress(param1:Number, param2:Number = 0, param3:Boolean = true) : void
      {
         if(this._mode == ProgressBarMode.MANUAL)
         {
            if(param2 != 0)
            {
               if(!param3)
               {
                  this.$viewValue = param1;
               }
               this.value = param1;
               this.minimum = 0;
               this.maximum = param2;
            }
         }
      }
      
      protected function $SetProgress(param1:Number, param2:Number) : void
      {
         var _loc4_:RegExp = null;
         var _loc8_:Number = NaN;
         if(param2 <= 0)
         {
            param1 = 0;
            param2 = 1;
         }
         else if(param1 > param2)
         {
            param1 = param2;
         }
         var _loc3_:String = this.label;
         _loc4_ = /%1% /g;
         _loc3_ = _loc3_.replace(_loc4_,int(param1));
         _loc4_ = /%2% /g;
         _loc3_ = _loc3_.replace(_loc4_,int(param2));
         _loc4_ = /%3% /g;
         _loc3_ = _loc3_.replace(_loc4_,int(100 * param1 / param2));
         _loc4_ = /%4% /g;
         _loc3_ = _loc3_.replace(_loc4_,int(param2 - param1));
         var _loc5_:int = this.textField.width;
         var _loc6_:int = this.textField.height;
         this.textField.text = _loc3_;
         if(_loc5_ != this.textField.width || _loc6_ != this.textField.height)
         {
            InvalidateSize();
         }
         var _loc7_:Boolean = false;
         _loc8_ = width - styleDeclaration.trackPaddingLeft - styleDeclaration.trackPaddingRight - styleDeclaration.paddingLeft - styleDeclaration.paddingRight;
         if(this.$trackWidth != _loc8_)
         {
            this.$trackWidth = _loc8_;
            _loc7_ = true;
         }
         _loc8_ = height - styleDeclaration.trackPaddingTop - styleDeclaration.trackPaddingBottom - styleDeclaration.paddingTop - styleDeclaration.paddingBottom;
         if(this.$trackHeight != _loc8_)
         {
            this.$trackHeight = _loc8_;
            _loc7_ = true;
         }
         _loc8_ = styleDeclaration.trackPaddingLeft + styleDeclaration.paddingLeft;
         if(this.$trackLeft != _loc8_)
         {
            this.$trackLeft = _loc8_;
            _loc7_ = true;
         }
         _loc8_ = styleDeclaration.trackPaddingTop + styleDeclaration.paddingTop;
         if(this.$trackTop != _loc8_)
         {
            this.$trackTop = _loc8_;
            _loc7_ = true;
         }
         _loc8_ = width - styleDeclaration.barPaddingLeft - styleDeclaration.barPaddingRight - styleDeclaration.paddingLeft - styleDeclaration.paddingRight;
         if(this.direction == ProgressBarDirection.LEFT || this.direction == ProgressBarDirection.RIGHT)
         {
            _loc8_ *= param1 / param2;
         }
         if(this.$barWidth != _loc8_)
         {
            this.$barWidth = _loc8_;
            _loc7_ = true;
         }
         _loc8_ = height - styleDeclaration.barPaddingTop - styleDeclaration.barPaddingBottom - styleDeclaration.paddingTop - styleDeclaration.paddingBottom;
         if(this.direction == ProgressBarDirection.TOP || this.direction == ProgressBarDirection.BOTTOM)
         {
            _loc8_ *= param1 / param2;
         }
         if(this.$barHeight != _loc8_)
         {
            this.$barHeight = _loc8_;
            _loc7_ = true;
         }
         if(this.direction == ProgressBarDirection.LEFT)
         {
            _loc8_ = width - styleDeclaration.barPaddingRight - this.$barWidth - styleDeclaration.paddingRight;
         }
         else
         {
            _loc8_ = styleDeclaration.barPaddingLeft + styleDeclaration.paddingLeft;
         }
         if(this.$barLeft != _loc8_)
         {
            this.$barLeft = _loc8_;
            _loc7_ = true;
         }
         if(this.direction == ProgressBarDirection.TOP)
         {
            _loc8_ = height - styleDeclaration.barPaddingBottom - this.$barHeight - styleDeclaration.paddingBottom;
         }
         else
         {
            _loc8_ = styleDeclaration.barPaddingTop + styleDeclaration.paddingTop;
         }
         if(this.$barTop != _loc8_)
         {
            this.$barTop = _loc8_;
            _loc7_ = true;
         }
         if(_loc7_)
         {
            this.$Render();
         }
      }
      
      override public function ValidateProperties() : void
      {
         if(invalidatePropertiesFlag)
         {
            if(styleDeclaration.barMotionFrames <= 0)
            {
               this.$viewValue = this.value;
            }
            else
            {
               this.removeEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
               this.addEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
            }
            this.$SetProgress(this.$viewValue,this.maximum - this.minimum);
         }
         super.ValidateProperties();
      }
      
      override public function ValidateSize() : void
      {
         if(invalidateSizeFlag)
         {
            switch(this.$labelPlacement & Align.H)
            {
               case Align.LEFT:
                  this.textField.x = styleDeclaration.paddingLeft;
                  break;
               case Align.RIGHT:
                  this.textField.x = width - this.textField.width - styleDeclaration.paddingRight;
                  break;
               case Align.HCENTER:
                  this.textField.x = (width - this.textField.width) / 2;
            }
            switch(this.$labelPlacement & Align.V)
            {
               case Align.BOTTOM:
                  this.textField.y = height - this.textField.height - styleDeclaration.paddingBottom;
                  break;
               case Align.TOP:
                  this.textField.y = styleDeclaration.paddingTop;
                  break;
               case Align.VCENTER:
                  this.textField.y = (height - this.textField.height) / 2;
            }
         }
         super.ValidateSize();
      }
      
      override public function ValidateSkin() : void
      {
         if(invalidateSkinFlag)
         {
            this.$trackSkin = StyleManager.GetStyleSkin(styleDeclaration.trackSkin);
            this.$barSkin = StyleManager.GetStyleSkin(styleDeclaration.barSkin);
            styleDeclaration.SetTextFieldStyle(this.textField);
         }
         super.ValidateSkin();
      }
      
      override protected function $Render() : void
      {
         super.$Render();
         if(this.$trackSkin)
         {
            this.track.x = this.$trackLeft;
            this.track.y = this.$trackTop;
            this.$trackSkin.Draw(this.track.graphics,this.$trackWidth,this.$trackHeight);
         }
         if(this.$barSkin)
         {
            this.bar.x = this.$barLeft;
            this.bar.y = this.$barTop;
            this.$barSkin.Draw(this.bar.graphics,this.$barWidth,this.$barHeight);
         }
      }
      
      private function EnterFrameHandler(param1:Event) : void
      {
         this.$viewValue += this.$viewValueInterval;
         if(this.$viewValueInterval == 0 || this.$viewValueInterval > 0 && this.$viewValue > this.value || this.$viewValueInterval < 0 && this.$viewValue < this.value)
         {
            this.$viewValue = this.value;
            this.removeEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
         }
         this.$SetProgress(this.$viewValue,this.maximum - this.minimum);
      }
      
      override protected function $DrawDisabled() : void
      {
         if(this.textField != null)
         {
            this.styleDeclaration.SetTextFieldDisabledStyle(this.textField);
         }
      }
      
      override protected function $DrawDown() : void
      {
         if(this.textField != null)
         {
            this.styleDeclaration.SetTextFieldDownStyle(this.textField);
         }
      }
      
      override protected function $DrawOver() : void
      {
         if(this.textField != null)
         {
            this.styleDeclaration.SetTextFieldOverStyle(this.textField);
         }
      }
      
      override protected function $DrawNormal() : void
      {
         if(this.textField != null)
         {
            this.styleDeclaration.SetTextFieldStyle(this.textField);
         }
      }
   }
}
