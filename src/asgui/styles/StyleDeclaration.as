package asgui.styles
{
   import asgui.core.Align;
   import asgui.logger.AsguiLogger;
   import asgui.utils.StringUtil;
   import flash.filters.DropShadowFilter;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class StyleDeclaration
   {
       
      
      private var styles:Array;
      
      public var name:String;
      
      public var extendsName:String;
      
      public var inherited:StyleDeclaration;
      
      private const __________Skin:int = 0;
      
      private const __________global:int = 0;
      
      private const __________text:int = 0;
      
      public var setTextFieldStyleExtend:Function;
      
      public var setTextFieldOverStyleExtend:Function;
      
      public var setTextFieldDownStyleExtend:Function;
      
      public var setTextFieldDisabledStyleExtend:Function;
      
      private const __________background:int = 0;
      
      private const __________Container:int = 0;
      
      private const __________Panel:int = 0;
      
      private const __________Window:int = 0;
      
      private const __________ScrollBar:int = 0;
      
      private const __________Slider:int = 0;
      
      private const __________Pager:int = 0;
      
      private const __________List:int = 0;
      
      private const __________ComboBox:int = 0;
      
      private const __________ProgressBar:int = 0;
      
      private const __________Tab:int = 0;
      
      private const __________Modal:int = 0;
      
      private const __________Alert:int = 0;
      
      public function StyleDeclaration(param1:String = null, param2:Array = null)
      {
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         this.styles = [];
         super();
         if(param1 == null)
         {
            return;
         }
         this.name = param1;
         if(param2 == null)
         {
            AsguiLogger.Warn(this,param1 + " CSS has\'t defined");
            return;
         }
         this.extendsName = param2[0];
         var _loc3_:String = param2[1];
         var _loc4_:Array = _loc3_.split(";");
         _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_ = _loc4_[_loc5_].toString().split(":");
            this.styles[_loc6_[0]] = _loc6_[1];
            _loc5_++;
         }
      }
      
      public function SetInheritForInstance(param1:StyleDeclaration) : void
      {
         this.inherited = param1;
      }
      
      public function SetStyleForInstance(param1:String, param2:String) : void
      {
         this.styles[param1] = param2;
      }
      
      public function GetStyle(param1:String) : *
      {
         if(this.styles[param1] != null)
         {
            return this.styles[param1];
         }
         if(this.inherited != null)
         {
            return this.inherited.GetStyle(param1);
         }
         return null;
      }
      
      public function SetStyle(param1:String, param2:String) : void
      {
         this.styles[param1] = param2;
      }
      
      private function GetSkinInfo(param1:String) : StyleSkinInfo
      {
         return StyleManager.impl.GetSkinInfo(param1);
      }
      
      private function GetColor(param1:String) : int
      {
         if(param1 == null || param1 == "null")
         {
            return -1;
         }
         var _loc2_:String = "0x" + param1.replace("#","");
         return int(int(_loc2_));
      }
      
      private function GetAlpha(param1:String) : Number
      {
         var _loc2_:Number = NaN;
         if(param1 == null)
         {
            _loc2_ = 1;
         }
         else
         {
            _loc2_ = Number(param1);
         }
         return _loc2_;
      }
      
      private function GetBoolean(param1:String) : Boolean
      {
         var _loc2_:String = StringUtil.trim(param1);
         if(_loc2_ == "true")
         {
            return true;
         }
         if(_loc2_ == "false")
         {
            return false;
         }
         return Boolean(_loc2_);
      }
      
      public function GetStyleName(param1:String) : String
      {
         return "";
      }
      
      public function get hasOverSkin() : Boolean
      {
         return this.overSkin != null;
      }
      
      public function get hasDownSkin() : Boolean
      {
         return this.downSkin != null;
      }
      
      public function get hasDisabledSkin() : Boolean
      {
         return this.disabledSkin != null;
      }
      
      public function get hasNormalSkin() : Boolean
      {
         return this.normalSkin != null;
      }
      
      public function get hasBrokenSkin() : Boolean
      {
         return this.brokenSkin != null;
      }
      
      public function get overSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("overSkin"));
      }
      
      public function get downSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("downSkin"));
      }
      
      public function get disabledSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("disabledSkin"));
      }
      
      public function get normalSkin() : StyleSkinInfo
      {
         var _loc1_:StyleSkinInfo = this.GetSkinInfo(this.GetStyle("upSkin"));
         if(_loc1_ != null)
         {
            return _loc1_;
         }
         return this.GetSkinInfo(this.GetStyle("borderSkin"));
      }
      
      public function get brokenSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("brokenSkin"));
      }
      
      public function get editableDownSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("editableDownSkin"));
      }
      
      public function get editableOverSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("editableOverSkin"));
      }
      
      public function get editableUpSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("editableUpSkin"));
      }
      
      public function get editableDisabledSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("editableDisabledSkin"));
      }
      
      public function get selectedDownSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("selectedDownSkin"));
      }
      
      public function get selectedOverSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("selectedOverSkin"));
      }
      
      public function get selectedNormalSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("selectedUpSkin"));
      }
      
      public function get selectedDisabledSkin() : StyleSkinInfo
      {
         var _loc1_:StyleSkinInfo = this.GetSkinInfo(this.GetStyle("selectedDisabledSkin"));
         if(_loc1_ != null)
         {
            return _loc1_;
         }
         return this.GetSkinInfo(this.GetStyle("borderSkin"));
      }
      
      public function get trackSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("trackSkin"));
      }
      
      public function get barSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("barSkin"));
      }
      
      public function get cellSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("cellSkin"));
      }
      
      public function get headerCellSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("headerCellSkin"));
      }
      
      public function get backgroundColor() : uint
      {
         return this.GetColor(this.GetStyle("backgroundColor"));
      }
      
      public function get backgroundAlpha() : Number
      {
         return this.GetAlpha(this.GetStyle("backgroundAlpha"));
      }
      
      public function get borderThickness() : int
      {
         return this.GetStyle("borderThickness");
      }
      
      public function get borderAlpha() : Number
      {
         return this.GetAlpha(this.GetStyle("borderAlpha"));
      }
      
      public function get borderColor() : uint
      {
         return this.GetColor(this.GetStyle("borderColor"));
      }
      
      public function get textLeading() : int
      {
         var _loc1_:Object = this.GetStyle("textLeading");
         if(_loc1_ == null)
         {
            return 255;
         }
         return int(_loc1_);
      }
      
      public function get textLetterSpacing() : Number
      {
         var _loc1_:Object = this.GetStyle("textLetterSpacing");
         if(_loc1_ == null)
         {
            return -1;
         }
         return Number(_loc1_);
      }
      
      public function get textPaddingLeft() : int
      {
         return this.GetStyle("textPaddingLeft");
      }
      
      public function get textPaddingTop() : int
      {
         return this.GetStyle("textPaddingTop");
      }
      
      public function get textPaddingRight() : int
      {
         return this.GetStyle("textPaddingRight");
      }
      
      public function get textPaddingBottom() : int
      {
         return this.GetStyle("textPaddingBottom");
      }
      
      public function get textOverPaddingLeft() : int
      {
         return this.GetStyle("textOverPaddingLeft");
      }
      
      public function get textOverPaddingTop() : int
      {
         return this.GetStyle("textOverPaddingTop");
      }
      
      public function get textOverPaddingRight() : int
      {
         return this.GetStyle("textOverPaddingRight");
      }
      
      public function get textOverPaddingBottom() : int
      {
         return this.GetStyle("textOverPaddingBottom");
      }
      
      public function get textDownPaddingLeft() : int
      {
         return this.GetStyle("textDownPaddingLeft");
      }
      
      public function get textDownPaddingTop() : int
      {
         return this.GetStyle("textDownPaddingTop");
      }
      
      public function get textDownPaddingRight() : int
      {
         return this.GetStyle("textDownPaddingRight");
      }
      
      public function get textDownPaddingBottom() : int
      {
         return this.GetStyle("textDownPaddingBottom");
      }
      
      public function get textDisabledPaddingLeft() : int
      {
         return this.GetStyle("textDisabledPaddingLeft");
      }
      
      public function get textDisabledPaddingTop() : int
      {
         return this.GetStyle("textDisabledPaddingTop");
      }
      
      public function get textDisabledPaddingRight() : int
      {
         return this.GetStyle("textDisabledPaddingRight");
      }
      
      public function get textDisabledPaddingBottom() : int
      {
         return this.GetStyle("textDisabledPaddingBottom");
      }
      
      public function get textSelectedPaddingLeft() : int
      {
         return this.GetStyle("textSelectedPaddingLeft");
      }
      
      public function get textSelectedPaddingTop() : int
      {
         return this.GetStyle("textSelectedPaddingTop");
      }
      
      public function get textSelectedPaddingRight() : int
      {
         return this.GetStyle("textSelectedPaddingRight");
      }
      
      public function get textSelectedPaddingBottom() : int
      {
         return this.GetStyle("textSelectedPaddingBottom");
      }
      
      public function SetTextSize(param1:TextField, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0) : void
      {
         if(param2 > 0)
         {
            param1.x = this.textPaddingLeft + param4;
            param1.width = param2 - this.textPaddingLeft - this.textPaddingRight;
         }
         if(param3 > 0)
         {
            param1.y = this.textPaddingTop + param5;
            param1.height = param3 - this.textPaddingTop - this.textPaddingBottom;
         }
      }
      
      public function SetTextSizeDown(param1:TextField, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0) : void
      {
         if(param2 > 0)
         {
            param1.x = this.textDownPaddingLeft + param4;
            param1.width = param2 - this.textDownPaddingLeft - this.textDownPaddingRight;
         }
         if(param3 > 0)
         {
            param1.y = this.textDownPaddingTop + param5;
            param1.height = param3 - this.textDownPaddingTop - this.textDownPaddingBottom;
         }
      }
      
      public function SetTextSizeOver(param1:TextField, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0) : void
      {
         if(param2 > 0)
         {
            param1.x = this.textOverPaddingLeft + param4;
            param1.width = param2 - this.textOverPaddingLeft - this.textOverPaddingRight;
         }
         if(param3 > 0)
         {
            param1.y = this.textOverPaddingTop + param5;
            param1.height = param3 - this.textOverPaddingTop - this.textOverPaddingBottom;
         }
      }
      
      public function SetTextSizeSelected(param1:TextField, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0) : void
      {
         if(param2 > 0)
         {
            param1.x = this.textSelectedPaddingLeft + param4;
            param1.width = param2 - this.textSelectedPaddingLeft - this.textSelectedPaddingRight;
         }
         if(param3 > 0)
         {
            param1.y = this.textSelectedPaddingTop + param5;
            param1.height = param3 - this.textSelectedPaddingTop - this.textSelectedPaddingBottom;
         }
      }
      
      public function SetTextSizeDisabled(param1:TextField, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0) : void
      {
         if(param2 > 0)
         {
            param1.x = this.textDisabledPaddingLeft + param4;
            param1.width = param2 - this.textDisabledPaddingLeft - this.textDisabledPaddingRight;
         }
         if(param3 > 0)
         {
            param1.y = this.textDisabledPaddingTop + param5;
            param1.height = param3 - this.textDisabledPaddingTop - this.textDisabledPaddingBottom;
         }
      }
      
      public function get textFormat() : TextFormat
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.bold = this.fontWeight == "bold";
         _loc1_.align = this.textAlign;
         if(this.fontFamily)
         {
            _loc1_.font = this.fontFamily;
         }
         if(this.fontSize != 0)
         {
            _loc1_.size = this.fontSize;
         }
         if(this.textLeading != 255)
         {
            _loc1_.leading = this.textLeading;
         }
         if(this.textLetterSpacing != -1)
         {
            _loc1_.letterSpacing = this.textLetterSpacing;
         }
         if(this.textDecoration == "underline")
         {
            _loc1_.underline = true;
         }
         else
         {
            _loc1_.underline = false;
         }
         return _loc1_;
      }
      
      public function get headerTextFormat() : TextFormat
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.bold = this.headerFontWeight == "bold";
         _loc1_.align = this.headerTextAlign;
         if(this.headerFontFamily)
         {
            _loc1_.font = this.headerFontFamily;
         }
         if(this.fontSize != 0)
         {
            _loc1_.size = this.fontSize;
         }
         if(this.headerTextDecoration == "underline")
         {
            _loc1_.underline = true;
         }
         else
         {
            _loc1_.underline = false;
         }
         return _loc1_;
      }
      
      public function get overTextFormat() : TextFormat
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.bold = this.textOverFontWeight == "bold";
         _loc1_.align = this.textAlign;
         if(this.textRollOverFontSize != 0)
         {
            _loc1_.size = this.textRollOverFontSize;
         }
         if(this.textRollOverDecoration == "underline")
         {
            _loc1_.underline = true;
         }
         else
         {
            _loc1_.underline = false;
         }
         return _loc1_;
      }
      
      public function get downTextFormat() : TextFormat
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.bold = this.textDownFontWeight == "bold";
         _loc1_.align = this.textAlign;
         if(this.textDownFontSize != 0)
         {
            _loc1_.size = this.textDownFontSize;
         }
         if(this.textDownDecoration == "underline")
         {
            _loc1_.underline = true;
         }
         else
         {
            _loc1_.underline = false;
         }
         return _loc1_;
      }
      
      public function get disableTextFormat() : TextFormat
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.bold = this.textDisableFontWeight == "bold";
         _loc1_.align = this.textAlign;
         if(this.textDisableFontSize != 0)
         {
            _loc1_.size = this.textDisableFontSize;
         }
         if(this.textDisableDecoration == "underline")
         {
            _loc1_.underline = true;
         }
         else
         {
            _loc1_.underline = false;
         }
         return _loc1_;
      }
      
      public function get selectedTextFormat() : TextFormat
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.bold = this.textSelectedFontWeight == "bold";
         _loc1_.align = this.textAlign;
         if(this.textSelectedFontSize != 0)
         {
            _loc1_.size = this.textSelectedFontSize;
         }
         if(this.textSelectedDecoration == "underline")
         {
            _loc1_.underline = true;
         }
         else
         {
            _loc1_.underline = false;
         }
         return _loc1_;
      }
      
      public function get overSelectedTextFormat() : TextFormat
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.bold = this.textOverSelectedFontWeight == "bold";
         _loc1_.align = this.textAlign;
         if(this.textOverSelectedFontSize != 0)
         {
            _loc1_.size = this.textOverSelectedFontSize;
         }
         if(this.textOverSelectedDecoration == "underline")
         {
            _loc1_.underline = true;
         }
         else
         {
            _loc1_.underline = false;
         }
         return _loc1_;
      }
      
      public function get downSelectedTextFormat() : TextFormat
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.bold = this.textDownSelectedFontWeight == "bold";
         _loc1_.align = this.textAlign;
         if(this.textDownSelectedFontSize != 0)
         {
            _loc1_.size = this.textDownSelectedFontSize;
         }
         if(this.textDownSelectedDecoration == "underline")
         {
            _loc1_.underline = true;
         }
         else
         {
            _loc1_.underline = false;
         }
         return _loc1_;
      }
      
      public function get disableSelectedTextFormat() : TextFormat
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.bold = this.textDisableSelectedFontWeight == "bold";
         _loc1_.align = this.textAlign;
         if(this.textDisableSelectedFontSize != 0)
         {
            _loc1_.size = this.textDisableSelectedFontSize;
         }
         if(this.textDisableSelectedDecoration == "underline")
         {
            _loc1_.underline = true;
         }
         else
         {
            _loc1_.underline = false;
         }
         return _loc1_;
      }
      
      public function get textAlign() : String
      {
         var _loc1_:String = this.GetStyle("textAlign");
         if(!_loc1_ || _loc1_.length == 0)
         {
            return TextFormatAlign.LEFT;
         }
         return _loc1_;
      }
      
      public function get autoSize() : String
      {
         return TextFieldAutoSize.LEFT;
      }
      
      public function get color() : uint
      {
         return this.GetColor(this.GetStyle("color"));
      }
      
      public function get fontFamily() : String
      {
         return this.GetStyle("fontFamily");
      }
      
      public function get embedFonts() : Boolean
      {
         return this.GetBoolean(this.GetStyle("embedFonts"));
      }
      
      public function get headerFontFamily() : String
      {
         return this.GetStyle("headerFontFamily");
      }
      
      public function get headerEmbedFonts() : Boolean
      {
         return this.GetBoolean(this.GetStyle("headerEmbedFonts"));
      }
      
      public function get fontWeight() : String
      {
         return this.GetStyle("fontWeight");
      }
      
      public function get textOverFontWeight() : String
      {
         return this.GetStyle("textOverFontWeight");
      }
      
      public function get textDownFontWeight() : String
      {
         return this.GetStyle("textDownFontWeight");
      }
      
      public function get textDisableFontWeight() : String
      {
         return this.GetStyle("textDisableFontWeight");
      }
      
      public function get fontSize() : int
      {
         var _loc1_:int = this.GetStyle("fontSize");
         if(_loc1_ > 0)
         {
            return _loc1_;
         }
         return 12;
      }
      
      public function get textDecoration() : String
      {
         return this.GetStyle("textDecoration");
      }
      
      public function get textShadowStrength() : int
      {
         return this.GetStyle("textShadowStrength");
      }
      
      public function get textShadowDistance() : int
      {
         return this.GetStyle("textShadowDistance");
      }
      
      public function get textShadowBlurX() : int
      {
         return this.GetStyle("textShadowBlurX");
      }
      
      public function get textShadowBlurY() : int
      {
         return this.GetStyle("textShadowBlurY");
      }
      
      public function get textShadowColor() : uint
      {
         return this.GetColor(this.GetStyle("textShadowColor"));
      }
      
      public function get textShadowAlpha() : Number
      {
         return this.GetAlpha(this.GetStyle("textShadowAlpha"));
      }
      
      public function get textRollOverColor() : uint
      {
         return this.GetColor(this.GetStyle("textRollOverColor"));
      }
      
      public function get textRollOverFontSize() : int
      {
         return this.GetStyle("textRollOverFontSize");
      }
      
      public function get textRollOverDecoration() : String
      {
         return this.GetStyle("textRollOverDecoration");
      }
      
      public function get textRollOverShadowStrength() : int
      {
         return this.GetStyle("textRollOverShadowStrength");
      }
      
      public function get textRollOverShadowDistance() : int
      {
         return this.GetStyle("textRollOverShadowDistance");
      }
      
      public function get textRollOverShadowBlurX() : int
      {
         return this.GetStyle("textRollOverShadowBlurX");
      }
      
      public function get textRollOverShadowBlurY() : int
      {
         return this.GetStyle("textRollOverShadowBlurY");
      }
      
      public function get textRollOverShadowColor() : uint
      {
         return this.GetColor(this.GetStyle("textRollOverShadowColor"));
      }
      
      public function get textRollOverShadowAlpha() : Number
      {
         return this.GetAlpha(this.GetStyle("textRollOverShadowAlpha"));
      }
      
      public function get textDisableColor() : uint
      {
         return this.GetColor(this.GetStyle("textDisableColor"));
      }
      
      public function get textDisableFontSize() : int
      {
         return this.GetStyle("textDisableFontSize");
      }
      
      public function get textDisableDecoration() : String
      {
         return this.GetStyle("textDisableDecoration");
      }
      
      public function get textDisableShadowStrength() : int
      {
         return this.GetStyle("textDisableShadowStrength");
      }
      
      public function get textDisableShadowDistance() : int
      {
         return this.GetStyle("textDisableShadowDistance");
      }
      
      public function get textDisableShadowBlurX() : int
      {
         return this.GetStyle("textDisableShadowBlurX");
      }
      
      public function get textDisableShadowBlurY() : int
      {
         return this.GetStyle("textDisableShadowBlurY");
      }
      
      public function get textDisableShadowColor() : uint
      {
         return this.GetColor(this.GetStyle("textDisableShadowColor"));
      }
      
      public function get textDisableShadowAlpha() : Number
      {
         return this.GetAlpha(this.GetStyle("textDisableShadowAlpha"));
      }
      
      public function get textSelectedColor() : uint
      {
         return this.GetColor(this.GetStyle("textSelectedColor"));
      }
      
      public function get textSelectedFontSize() : int
      {
         return this.GetStyle("textSelectedFontSize");
      }
      
      public function get textSelectedDecoration() : String
      {
         return this.GetStyle("textSelectedDecoration");
      }
      
      public function get textSelectedShadowStrength() : int
      {
         return this.GetStyle("textSelectedShadowStrength");
      }
      
      public function get textSelectedShadowDistance() : int
      {
         return this.GetStyle("textSelectedShadowDistance");
      }
      
      public function get textSelectedShadowBlurX() : int
      {
         return this.GetStyle("textSelectedShadowBlurX");
      }
      
      public function get textSelectedShadowBlurY() : int
      {
         return this.GetStyle("textSelectedShadowBlurY");
      }
      
      public function get textSelectedShadowColor() : uint
      {
         return this.GetColor(this.GetStyle("textSelectedShadowColor"));
      }
      
      public function get textSelectedShadowAlpha() : Number
      {
         return this.GetAlpha(this.GetStyle("textSelectedShadowAlpha"));
      }
      
      public function get textSelectedFontWeight() : String
      {
         return this.GetStyle("textSelectedFontWeight");
      }
      
      public function get textOverSelectedColor() : uint
      {
         return this.GetColor(this.GetStyle("textOverSelectedColor"));
      }
      
      public function get textOverSelectedFontSize() : int
      {
         return this.GetStyle("textOverSelectedFontSize");
      }
      
      public function get textOverSelectedDecoration() : String
      {
         return this.GetStyle("textOverSelectedDecoration");
      }
      
      public function get textOverSelectedShadowStrength() : int
      {
         return this.GetStyle("textOverSelectedShadowStrength");
      }
      
      public function get textOverSelectedShadowDistance() : int
      {
         return this.GetStyle("textOverSelectedShadowDistance");
      }
      
      public function get textOverSelectedShadowBlurX() : int
      {
         return this.GetStyle("textOverSelectedShadowBlurX");
      }
      
      public function get textOverSelectedShadowBlurY() : int
      {
         return this.GetStyle("textOverSelectedShadowBlurY");
      }
      
      public function get textOverSelectedShadowColor() : uint
      {
         return this.GetColor(this.GetStyle("textOverSelectedShadowColor"));
      }
      
      public function get textOverSelectedShadowAlpha() : Number
      {
         return this.GetAlpha(this.GetStyle("textOverSelectedShadowAlpha"));
      }
      
      public function get textOverSelectedFontWeight() : String
      {
         return this.GetStyle("textOverSelectedFontWeight");
      }
      
      public function get textDownSelectedColor() : uint
      {
         return this.GetColor(this.GetStyle("textDownSelectedColor"));
      }
      
      public function get textDownSelectedFontSize() : int
      {
         return this.GetStyle("textDownSelectedFontSize");
      }
      
      public function get textDownSelectedDecoration() : String
      {
         return this.GetStyle("textDownSelectedDecoration");
      }
      
      public function get textDownSelectedShadowStrength() : int
      {
         return this.GetStyle("textDownSelectedShadowStrength");
      }
      
      public function get textDownSelectedShadowDistance() : int
      {
         return this.GetStyle("textDownSelectedShadowDistance");
      }
      
      public function get textDownSelectedShadowBlurX() : int
      {
         return this.GetStyle("textDownSelectedShadowBlurX");
      }
      
      public function get textDownSelectedShadowBlurY() : int
      {
         return this.GetStyle("textDownSelectedShadowBlurY");
      }
      
      public function get textDownSelectedShadowColor() : uint
      {
         return this.GetColor(this.GetStyle("textDownSelectedShadowColor"));
      }
      
      public function get textDownSelectedShadowAlpha() : Number
      {
         return this.GetAlpha(this.GetStyle("textDownSelectedShadowAlpha"));
      }
      
      public function get textDownSelectedFontWeight() : String
      {
         return this.GetStyle("textDownSelectedFontWeight");
      }
      
      public function get textDisableSelectedColor() : uint
      {
         return this.GetColor(this.GetStyle("textDisableSelectedColor"));
      }
      
      public function get textDisableSelectedFontSize() : int
      {
         return this.GetStyle("textDisableSelectedFontSize");
      }
      
      public function get textDisableSelectedDecoration() : String
      {
         return this.GetStyle("textDisableSelectedDecoration");
      }
      
      public function get textDisableSelectedShadowStrength() : int
      {
         return this.GetStyle("textDisableSelectedShadowStrength");
      }
      
      public function get textDisableSelectedShadowDistance() : int
      {
         return this.GetStyle("textDisableSelectedShadowDistance");
      }
      
      public function get textDisableSelectedShadowBlurX() : int
      {
         return this.GetStyle("textDisableSelectedShadowBlurX");
      }
      
      public function get textDisableSelectedShadowBlurY() : int
      {
         return this.GetStyle("textDisableSelectedShadowBlurY");
      }
      
      public function get textDisableSelectedShadowColor() : uint
      {
         return this.GetColor(this.GetStyle("textDisableSelectedShadowColor"));
      }
      
      public function get textDisableSelectedShadowAlpha() : Number
      {
         return this.GetAlpha(this.GetStyle("textDisableSelectedShadowAlpha"));
      }
      
      public function get textDisableSelectedFontWeight() : String
      {
         return this.GetStyle("textDisableSelectedFontWeight");
      }
      
      public function get textDownColor() : int
      {
         return this.GetColor(this.GetStyle("textDownColor"));
      }
      
      public function get textDownFontSize() : int
      {
         return this.GetStyle("textDownFontSize");
      }
      
      public function get textDownDecoration() : String
      {
         return this.GetStyle("textDownDecoration");
      }
      
      public function get textDownShadowStrength() : int
      {
         return this.GetStyle("textDownShadowStrength");
      }
      
      public function get textDownShadowDistance() : int
      {
         return this.GetStyle("textDownShadowDistance");
      }
      
      public function get textDownShadowBlurX() : int
      {
         return this.GetStyle("textDownShadowBlurX");
      }
      
      public function get textDownShadowBlurY() : int
      {
         return this.GetStyle("textDownShadowBlurY");
      }
      
      public function get textDownShadowColor() : uint
      {
         return this.GetColor(this.GetStyle("textDownShadowColor"));
      }
      
      public function get textDownShadowAlpha() : Number
      {
         return this.GetAlpha(this.GetStyle("textDownShadowAlpha"));
      }
      
      public function SetHeaderTextFieldStyle(param1:TextField) : void
      {
         param1.multiline = false;
         param1.background = false;
         param1.mouseEnabled = false;
         param1.textColor = this.headerColor;
         param1.embedFonts = this.headerEmbedFonts;
         var _loc2_:TextFormat = this.headerTextFormat;
         _loc2_.bold = true;
         param1.defaultTextFormat = _loc2_;
         if(this.textShadowStrength > 0)
         {
            param1.filters = [new DropShadowFilter(this.textShadowDistance,45,this.textShadowColor,this.textShadowAlpha,this.textShadowBlurX,this.textShadowBlurY,this.textShadowStrength)];
         }
         else
         {
            param1.filters = [];
         }
      }
      
      public function SetTextFieldStyle(param1:TextField, param2:Boolean = true) : void
      {
         param1.multiline = false;
         param1.background = false;
         param1.mouseEnabled = false;
         if(param2)
         {
            param1.autoSize = this.textAlign;
         }
         param1.textColor = this.color;
         param1.defaultTextFormat = this.textFormat;
         param1.embedFonts = this.embedFonts;
         param1.setTextFormat(param1.defaultTextFormat);
         if(param1.embedFonts)
         {
            param1.antiAliasType = AntiAliasType.ADVANCED;
         }
         if(this.textShadowStrength > 0)
         {
            param1.filters = [new DropShadowFilter(this.textShadowDistance,45,this.textShadowColor,this.textShadowAlpha,this.textShadowBlurX,this.textShadowBlurY,this.textShadowStrength)];
         }
         else
         {
            param1.filters = [];
         }
         if(this.setTextFieldStyleExtend != null)
         {
            this.setTextFieldStyleExtend(param1);
         }
      }
      
      public function SetTextFieldOverStyle(param1:TextField) : void
      {
         param1.textColor = this.textRollOverColor;
         param1.defaultTextFormat = this.overTextFormat;
         param1.setTextFormat(param1.defaultTextFormat);
         if(this.textRollOverShadowStrength > 0)
         {
            param1.filters = [new DropShadowFilter(this.textRollOverShadowDistance,45,this.textRollOverShadowColor,this.textRollOverShadowAlpha,this.textRollOverShadowBlurX,this.textRollOverShadowBlurY,this.textRollOverShadowStrength)];
         }
         else
         {
            param1.filters = [];
         }
         if(this.setTextFieldOverStyleExtend != null)
         {
            this.setTextFieldOverStyleExtend(param1);
         }
      }
      
      public function SetTextFieldDownStyle(param1:TextField) : void
      {
         param1.textColor = this.textDownColor;
         param1.defaultTextFormat = this.downTextFormat;
         param1.setTextFormat(param1.defaultTextFormat);
         if(this.textDownShadowStrength > 0)
         {
            param1.filters = [new DropShadowFilter(this.textDownShadowDistance,45,this.textDownShadowColor,this.textDownShadowAlpha,this.textDownShadowBlurX,this.textDownShadowBlurY,this.textDownShadowStrength)];
         }
         else
         {
            param1.filters = [];
         }
         if(this.setTextFieldDownStyleExtend != null)
         {
            this.setTextFieldDownStyleExtend(param1);
         }
      }
      
      public function SetTextFieldDisabledStyle(param1:TextField) : void
      {
         param1.textColor = this.textDisableColor;
         param1.defaultTextFormat = this.disableTextFormat;
         param1.setTextFormat(param1.defaultTextFormat);
         if(this.textDisableShadowStrength > 0)
         {
            param1.filters = [new DropShadowFilter(this.textDisableShadowDistance,45,this.textDisableShadowColor,this.textDisableShadowAlpha,this.textDisableShadowBlurX,this.textDisableShadowBlurY,this.textDisableShadowStrength)];
         }
         else
         {
            param1.filters = [];
         }
         if(this.setTextFieldDisabledStyleExtend != null)
         {
            this.setTextFieldDisabledStyleExtend(param1);
         }
      }
      
      public function SetTextFieldSelectedStyle(param1:TextField) : void
      {
         param1.textColor = this.textSelectedColor;
         param1.defaultTextFormat = this.selectedTextFormat;
         param1.setTextFormat(param1.defaultTextFormat);
         if(this.textSelectedShadowStrength > 0)
         {
            param1.filters = [new DropShadowFilter(this.textSelectedShadowDistance,45,this.textSelectedShadowColor,this.textSelectedShadowAlpha,this.textSelectedShadowBlurX,this.textSelectedShadowBlurY,this.textSelectedShadowStrength)];
         }
         else
         {
            param1.filters = [];
         }
      }
      
      public function SetTextFieldOverSelectedStyle(param1:TextField) : void
      {
         param1.textColor = this.textOverSelectedColor;
         param1.defaultTextFormat = this.overSelectedTextFormat;
         param1.setTextFormat(param1.defaultTextFormat);
         if(this.textOverSelectedShadowStrength > 0)
         {
            param1.filters = [new DropShadowFilter(this.textOverSelectedShadowDistance,45,this.textOverSelectedShadowColor,this.textOverSelectedShadowAlpha,this.textOverSelectedShadowBlurX,this.textOverSelectedShadowBlurY,this.textOverSelectedShadowStrength)];
         }
         else
         {
            param1.filters = [];
         }
      }
      
      public function SetTextFieldDownSelectedStyle(param1:TextField) : void
      {
         param1.textColor = this.textDownSelectedColor;
         param1.defaultTextFormat = this.downSelectedTextFormat;
         param1.setTextFormat(param1.defaultTextFormat);
         if(this.textDownSelectedShadowStrength > 0)
         {
            param1.filters = [new DropShadowFilter(this.textDownSelectedShadowDistance,45,this.textDownSelectedShadowColor,this.textDownSelectedShadowAlpha,this.textDownSelectedShadowBlurX,this.textDownSelectedShadowBlurY,this.textDownSelectedShadowStrength)];
         }
         else
         {
            param1.filters = [];
         }
      }
      
      public function SetTextFieldDisabledSelectedStyle(param1:TextField) : void
      {
         param1.textColor = this.textDisableSelectedColor;
         param1.defaultTextFormat = this.disableSelectedTextFormat;
         param1.setTextFormat(param1.defaultTextFormat);
         if(this.textDisableSelectedShadowStrength > 0)
         {
            param1.filters = [new DropShadowFilter(this.textDisableSelectedShadowDistance,45,this.textDisableSelectedShadowColor,this.textDisableSelectedShadowAlpha,this.textDisableSelectedShadowBlurX,this.textDisableSelectedShadowBlurY,this.textDisableSelectedShadowStrength)];
         }
         else
         {
            param1.filters = [];
         }
      }
      
      public function SetTextInputStyle(param1:TextField) : void
      {
         param1.multiline = false;
         param1.textColor = this.color;
         param1.wordWrap = false;
         var _loc2_:TextFormat = this.textFormat;
         _loc2_.color = this.color;
         param1.defaultTextFormat = _loc2_;
         param1.embedFonts = this.embedFonts;
         param1.setTextFormat(param1.defaultTextFormat);
         if(this.textShadowStrength > 0)
         {
            param1.filters = [new DropShadowFilter(0,45,this.textShadowColor,this.textShadowAlpha,this.textShadowBlurX,this.textShadowBlurY,this.textShadowStrength)];
         }
         else
         {
            param1.filters = [];
         }
      }
      
      public function SetAreaTextFieldStyle(param1:TextField, param2:Boolean = true) : void
      {
         param1.multiline = param2;
         param1.background = false;
         param1.mouseEnabled = true;
         param1.wordWrap = param2;
         param1.textColor = this.color;
         param1.defaultTextFormat = this.textFormat;
         param1.embedFonts = this.embedFonts;
         param1.setTextFormat(param1.defaultTextFormat);
         if(this.textShadowStrength > 0)
         {
            param1.filters = [new DropShadowFilter(0,45,this.textShadowColor,this.textShadowAlpha,this.textShadowBlurX,this.textShadowBlurY,this.textShadowStrength)];
         }
         else
         {
            param1.filters = [];
         }
      }
      
      public function SetTextStyle(param1:TextField, param2:Boolean = true) : void
      {
         param1.multiline = param2;
         param1.background = false;
         param1.mouseEnabled = false;
         param1.wordWrap = param2;
         param1.textColor = this.color;
         param1.defaultTextFormat = this.textFormat;
         param1.embedFonts = this.embedFonts;
         param1.setTextFormat(param1.defaultTextFormat);
         if(this.textShadowStrength > 0)
         {
            param1.filters = [new DropShadowFilter(0,45,this.textShadowColor,this.textShadowAlpha,this.textShadowBlurX,this.textShadowBlurY,this.textShadowStrength)];
         }
         else
         {
            param1.filters = [];
         }
      }
      
      public function get backgroundDisabledColor() : int
      {
         return this.GetColor(this.GetStyle("backgroundDisabledColor"));
      }
      
      public function get disabledOverlayAlpha() : Number
      {
         return this.GetStyle("disabledOverlayAlpha");
      }
      
      public function get verticalScrollBarStyleName() : String
      {
         return this.GetStyle("verticalScrollBarStyleName");
      }
      
      public function get horizontalScrollBarStyleName() : String
      {
         return this.GetStyle("horizontalScrollBarStyleName");
      }
      
      public function get horizontalAlign() : int
      {
         var _loc1_:String = this.GetStyle("horizontalAlign");
         switch(_loc1_)
         {
            case "left":
               return Align.LEFT;
            case "center":
            case "middle":
               return Align.HCENTER;
            case "right":
               return Align.RIGHT;
            default:
               return Align.LEFT;
         }
      }
      
      public function get verticalAlign() : int
      {
         var _loc1_:String = this.GetStyle("verticalAlign");
         switch(_loc1_)
         {
            case "top":
               return Align.TOP;
            case "center":
            case "middle":
               return Align.VCENTER;
            case "bottom":
               return Align.BOTTOM;
            default:
               return Align.TOP;
         }
      }
      
      public function get paddingTop() : int
      {
         return this.GetStyle("paddingTop");
      }
      
      public function get paddingLeft() : int
      {
         return this.GetStyle("paddingLeft");
      }
      
      public function get paddingRight() : int
      {
         return this.GetStyle("paddingRight");
      }
      
      public function get paddingBottom() : int
      {
         return this.GetStyle("paddingBottom");
      }
      
      public function get headerHeight() : int
      {
         return this.GetStyle("headerHeight");
      }
      
      public function get headerAlign() : String
      {
         var _loc1_:String = this.GetStyle("headerAlign");
         if(_loc1_ == null)
         {
            _loc1_ = "center";
         }
         return _loc1_;
      }
      
      public function get headerBackgroundSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("headerBackgroundSkin"));
      }
      
      public function get footerHeight() : int
      {
         return this.GetStyle("footerHeight");
      }
      
      public function get footerBackgroundSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("footerBackgroundSkin"));
      }
      
      public function get closeStyleName() : String
      {
         return this.GetStyle("closeStyleName");
      }
      
      public function get headerPaddingRight() : int
      {
         return this.GetStyle("headerPaddingRight");
      }
      
      public function get headerHorizontalGap() : int
      {
         return this.GetStyle("headerHorizontalGap");
      }
      
      public function get headerPaddingTop() : int
      {
         return this.GetStyle("headerPaddingTop");
      }
      
      public function get headerPaddingLeft() : int
      {
         return this.GetStyle("headerPaddingLeft");
      }
      
      public function get scrollBarDownArrowStyleName() : String
      {
         return this.GetStyle("scrollBarDownArrowStyleName");
      }
      
      public function get scrollBarUpArrowStyleName() : String
      {
         return this.GetStyle("scrollBarUpArrowStyleName");
      }
      
      public function get scrollBarThumbStyleName() : String
      {
         return this.GetStyle("scrollBarThumbStyleName");
      }
      
      public function get scrollBarThumbWidth() : int
      {
         var _loc1_:int = this.GetStyle("scrollBarThumbWidth");
         if(_loc1_ == 0)
         {
            return 15;
         }
         return _loc1_;
      }
      
      public function get scrollBarThumbX() : int
      {
         var _loc1_:int = this.GetStyle("scrollBarThumbX");
         if(_loc1_ == 0)
         {
            return 0;
         }
         return _loc1_;
      }
      
      public function get scrollBarThumbY() : int
      {
         var _loc1_:int = this.GetStyle("scrollBarThumbY");
         if(_loc1_ == 0)
         {
            return 0;
         }
         return _loc1_;
      }
      
      public function get scrollBarPaddingRight() : int
      {
         var _loc1_:int = this.GetStyle("scrollBarPaddingRight");
         if(_loc1_ == 0)
         {
            return 0;
         }
         return _loc1_;
      }
      
      public function get scrollBarPaddingBottom() : int
      {
         var _loc1_:int = this.GetStyle("scrollBarPaddingBottom");
         if(_loc1_ == 0)
         {
            return 0;
         }
         return _loc1_;
      }
      
      public function get scrollBarArrowWidth() : int
      {
         return int(this.GetStyle("scrollBarArrowWidth"));
      }
      
      public function get scrollBarArrowHeight() : int
      {
         return int(this.GetStyle("scrollBarArrowHeight"));
      }
      
      public function get scrollBarWidth() : int
      {
         var _loc1_:int = this.GetStyle("scrollBarWidth");
         if(_loc1_ <= 0)
         {
            _loc1_ = 15;
         }
         return _loc1_;
      }
      
      public function get trackHighlightSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("trackHighlightSkin"));
      }
      
      public function get dataTipPrecision() : int
      {
         return int(this.GetStyle("dataTipPrecision"));
      }
      
      public function get thumbStyleName() : String
      {
         return this.GetStyle("thumbStyleName");
      }
      
      public function get dataTipPlacement() : String
      {
         return this.GetStyle("dataTipPlacement");
      }
      
      public function get dataTipOffset() : int
      {
         return this.GetStyle("dataTipOffset");
      }
      
      public function get showTrackHighlight() : Boolean
      {
         return this.GetBoolean(this.GetStyle("showTrackHighlight"));
      }
      
      public function get prevButtonStyleName() : String
      {
         return this.GetStyle("prevButtonStyleName");
      }
      
      public function get nextButtonStyleName() : String
      {
         return this.GetStyle("nextButtonStyleName");
      }
      
      public function get verticalGap() : int
      {
         return this.GetStyle("verticalGap");
      }
      
      public function get horizontalGap() : int
      {
         return this.GetStyle("horizontalGap");
      }
      
      public function get verticalGridLineColor() : uint
      {
         return this.GetColor(this.GetStyle("verticalGridLineColor"));
      }
      
      public function get horizontalGridLineColor() : uint
      {
         return this.GetColor(this.GetStyle("horizontalGridLineColor"));
      }
      
      public function get verticalGridLines() : Boolean
      {
         return this.GetBoolean(this.GetStyle("verticalGridLines"));
      }
      
      public function get horizontalGridLines() : Boolean
      {
         return this.GetBoolean(this.GetStyle("horizontalGridLines"));
      }
      
      public function get headerColor() : uint
      {
         return this.GetColor(this.GetStyle("headerColor"));
      }
      
      public function get headerFontWeight() : String
      {
         return this.GetStyle("headerFontWeight");
      }
      
      public function get headerTextDecoration() : String
      {
         return this.GetStyle("headerTextDecoration");
      }
      
      public function get headerTextAlign() : String
      {
         return this.GetStyle("headerTextAlign");
      }
      
      public function get headerLines() : Boolean
      {
         return this.GetBoolean(this.GetStyle("headerLines"));
      }
      
      public function get headerGap() : int
      {
         return this.GetStyle("headerGap");
      }
      
      public function get headerLineColor() : uint
      {
         return this.GetColor(this.GetStyle("headerLineColor"));
      }
      
      public function get rollOverColor() : uint
      {
         return this.GetColor(this.GetStyle("rollOverColor"));
      }
      
      public function get selectionColor() : uint
      {
         return this.GetColor(this.GetStyle("selectionColor"));
      }
      
      public function get dataEditableBackgroundColor() : uint
      {
         return this.GetColor(this.GetStyle("dataEditableBackgroundColor"));
      }
      
      public function get dataEditableBackgroundAlpha() : Number
      {
         var _loc1_:* = this.GetStyle("dataEditableBackgroundAlpha");
         if(_loc1_ == null)
         {
            _loc1_ = 1;
         }
         return _loc1_;
      }
      
      public function get oddLineBackgroundColor() : uint
      {
         return this.GetColor(this.GetStyle("oddLineBackgroundColor"));
      }
      
      public function get oddLineBackgroundAlpha() : Number
      {
         return this.GetAlpha(this.GetStyle("oddLineBackgroundAlpha"));
      }
      
      public function get evenLineBackgroundColor() : uint
      {
         return this.GetColor(this.GetStyle("evenLineBackgroundColor"));
      }
      
      public function get evenLineBackgroundAlpha() : Number
      {
         return this.GetAlpha(this.GetStyle("evenLineBackgroundAlpha"));
      }
      
      public function get lineSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("lineSkin"));
      }
      
      public function get oddLineSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("oddLineSkin"));
      }
      
      public function get evenLineSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("evenLineSkin"));
      }
      
      public function get rollOverLineSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("rollOverLineSkin"));
      }
      
      public function get selectionLineSkin() : StyleSkinInfo
      {
         return this.GetSkinInfo(this.GetStyle("selectionLineSkin"));
      }
      
      public function get dropdownStyleName() : String
      {
         return this.GetStyle("dropdownStyleName");
      }
      
      public function get dropdownRowHeight() : int
      {
         return this.GetStyle("dropdownRowHeight");
      }
      
      public function get textInputStyleName() : int
      {
         return this.GetStyle("textInputStyleName");
      }
      
      public function get trackPaddingTop() : int
      {
         return this.GetStyle("trackPaddingTop");
      }
      
      public function get trackPaddingLeft() : int
      {
         return this.GetStyle("trackPaddingLeft");
      }
      
      public function get trackPaddingRight() : int
      {
         return this.GetStyle("trackPaddingRight");
      }
      
      public function get trackPaddingBottom() : int
      {
         return this.GetStyle("trackPaddingBottom");
      }
      
      public function get barPaddingTop() : int
      {
         return this.GetStyle("barPaddingTop");
      }
      
      public function get barPaddingLeft() : int
      {
         return this.GetStyle("barPaddingLeft");
      }
      
      public function get barPaddingRight() : int
      {
         return this.GetStyle("barPaddingRight");
      }
      
      public function get barPaddingBottom() : int
      {
         return this.GetStyle("barPaddingBottom");
      }
      
      public function get barMotionFrames() : int
      {
         return this.GetStyle("barMotionFrames");
      }
      
      public function get tabWidth() : int
      {
         return this.GetStyle("tabWidth");
      }
      
      public function get tabBarStyleName() : String
      {
         return this.GetStyle("tabBarStyleName");
      }
      
      public function get tabStyleName() : String
      {
         return this.GetStyle("tabStyleName");
      }
      
      public function get modalTransparencyColor() : int
      {
         return this.GetColor(this.GetStyle("modalTransparencyColor"));
      }
      
      public function get modalTransparency() : Number
      {
         return this.GetStyle("modalTransparency");
      }
      
      public function get alertButtonContainerHeight() : int
      {
         return this.GetStyle("alertButtonContainerHeight");
      }
      
      public function get isButtontHeightSameTextHeight() : Boolean
      {
         return this.GetStyle("isButtontHeightSameTextHeight") == 1;
      }
   }
}
