package com.qq.utils
{
   import asgui.controls.Label;
   import asgui.styles.StyleDeclaration;
   import asgui.styles.StyleManager;
   import flash.filters.GlowFilter;
   import flash.filters.GradientBevelFilter;
   import flash.text.TextField;
   
   public class QStyleDecorating
   {
      
      private static var _label:Label;
       
      
      public function QStyleDecorating()
      {
         super();
      }
      
      public static function get label() : Label
      {
         if(_label == null)
         {
            _label = new Label();
         }
         return _label;
      }
      
      public static function updatingStyle() : void
      {
         var _loc1_:StyleDeclaration = StyleManager.GetStyleDeclaration(".TXT_HKHB_25_White_BEVEL",label);
         _loc1_.setTextFieldDisabledStyleExtend = _loc1_.setTextFieldDownStyleExtend = _loc1_.setTextFieldOverStyleExtend = _loc1_.setTextFieldStyleExtend = extend_TXT_HKHB_25_White_BEVEL;
         _loc1_ = StyleManager.GetStyleDeclaration(".TXT_HKHB_25_White_BEVEL_CENTER",label);
         _loc1_.setTextFieldDisabledStyleExtend = _loc1_.setTextFieldDownStyleExtend = _loc1_.setTextFieldOverStyleExtend = _loc1_.setTextFieldStyleExtend = extend_TXT_HKHB_25_White_BEVEL;
         _loc1_ = StyleManager.GetStyleDeclaration(".TXT_HKHB_30_White_BEVEL",label);
         _loc1_.setTextFieldDisabledStyleExtend = _loc1_.setTextFieldDownStyleExtend = _loc1_.setTextFieldOverStyleExtend = _loc1_.setTextFieldStyleExtend = extend_TXT_HKHB_30_White_BEVEL;
         _loc1_ = StyleManager.GetStyleDeclaration(".TXT_HKHB_50_White_BEVEL",label);
         _loc1_.setTextFieldDisabledStyleExtend = _loc1_.setTextFieldDownStyleExtend = _loc1_.setTextFieldOverStyleExtend = _loc1_.setTextFieldStyleExtend = extend_TXT_HKHB_50_White_BEVEL;
         _loc1_ = StyleManager.GetStyleDeclaration(".TXT_HKHB_50_White_BEVEL_CENTER",label);
         _loc1_.setTextFieldDisabledStyleExtend = _loc1_.setTextFieldDownStyleExtend = _loc1_.setTextFieldOverStyleExtend = _loc1_.setTextFieldStyleExtend = extend_TXT_HKHB_50_White_BEVEL;
         _loc1_ = StyleManager.GetStyleDeclaration(".TXT_HKHB_80_White_BEVEL",label);
         _loc1_.setTextFieldDisabledStyleExtend = _loc1_.setTextFieldDownStyleExtend = _loc1_.setTextFieldOverStyleExtend = _loc1_.setTextFieldStyleExtend = extend_TXT_HKHB_80_White_BEVEL;
         _loc1_ = StyleManager.GetStyleDeclaration(".TXT_HKHB_50_Gray_BEVEL",label);
         _loc1_.setTextFieldDisabledStyleExtend = _loc1_.setTextFieldDownStyleExtend = _loc1_.setTextFieldOverStyleExtend = _loc1_.setTextFieldStyleExtend = extend_TXT_HKHB_50_Gray_BEVEL;
         _loc1_ = StyleManager.GetStyleDeclaration(".TXT_HKHB_50_Gray_BEVEL_CENTER",label);
         _loc1_.setTextFieldDisabledStyleExtend = _loc1_.setTextFieldDownStyleExtend = _loc1_.setTextFieldOverStyleExtend = _loc1_.setTextFieldStyleExtend = extend_TXT_HKHB_50_Gray_BEVEL;
         _loc1_ = StyleManager.GetStyleDeclaration(".TXT_HKHB_80_Gray_BEVEL",label);
         _loc1_.setTextFieldDisabledStyleExtend = _loc1_.setTextFieldDownStyleExtend = _loc1_.setTextFieldOverStyleExtend = _loc1_.setTextFieldStyleExtend = extend_TXT_HKHB_80_Gray_BEVEL;
         _loc1_ = StyleManager.GetStyleDeclaration(".TXT_HKHB_80_Gray_BEVEL_CENTER",label);
         _loc1_.setTextFieldDisabledStyleExtend = _loc1_.setTextFieldDownStyleExtend = _loc1_.setTextFieldOverStyleExtend = _loc1_.setTextFieldStyleExtend = extend_TXT_HKHB_80_Gray_BEVEL;
         _loc1_ = StyleManager.GetStyleDeclaration(".TXT_HKHB_25_Gray_BEVEL",label);
         _loc1_.setTextFieldDisabledStyleExtend = _loc1_.setTextFieldDownStyleExtend = _loc1_.setTextFieldOverStyleExtend = _loc1_.setTextFieldStyleExtend = extend_TXT_HKHB_25_Gray_BEVEL;
         _loc1_ = StyleManager.GetStyleDeclaration(".TXT_HKHB_20_White_BEVEL_CENTER",label);
         _loc1_.setTextFieldDisabledStyleExtend = _loc1_.setTextFieldDownStyleExtend = _loc1_.setTextFieldOverStyleExtend = _loc1_.setTextFieldStyleExtend = extend_TXT_HKHB_25_White_BEVEL;
         _loc1_ = StyleManager.GetStyleDeclaration(".Label_MiniGame_CombatNum");
         _loc1_.setTextFieldDisabledStyleExtend = _loc1_.setTextFieldDownStyleExtend = _loc1_.setTextFieldOverStyleExtend = _loc1_.setTextFieldStyleExtend = extend_TXT_HKHB_35_Blue_BEVEL;
         _loc1_ = StyleManager.GetStyleDeclaration(".Label_MiniGame_Score");
         _loc1_.setTextFieldDisabledStyleExtend = _loc1_.setTextFieldDownStyleExtend = _loc1_.setTextFieldOverStyleExtend = _loc1_.setTextFieldStyleExtend = extend_TXT_HKHB_31_Yellow_BEVEL;
      }
      
      public static function extend_TXT_HKHB_25_White_BEVEL(param1:TextField) : void
      {
         var _loc2_:Array = param1.filters.concat();
         _loc2_.unshift(new GlowFilter(10066329,1,2,2,2,1,true));
         _loc2_.unshift(new GlowFilter(16777215,1,4,4,40));
         _loc2_.unshift(new GlowFilter(0,1,4,4,40));
         _loc2_.unshift(new GradientBevelFilter(2,243,[16777215,16763904,16739842],[1,0,1],[0,128,255],2,2,1));
         param1.filters = _loc2_;
         param1.cacheAsBitmap = true;
      }
      
      public static function extend_TXT_HKHB_30_White_BEVEL(param1:TextField) : void
      {
         var _loc2_:Array = param1.filters.concat();
         _loc2_.unshift(new GlowFilter(10066329,1,5,5,2,1,true));
         _loc2_.unshift(new GlowFilter(16777215,1,8,8,40));
         _loc2_.unshift(new GlowFilter(0,1,8,8,40));
         _loc2_.unshift(new GradientBevelFilter(5,243,[16777215,16763904,16739842],[1,0,1],[0,128,255],5,5,1));
         param1.filters = _loc2_;
         param1.cacheAsBitmap = true;
      }
      
      public static function extend_TXT_HKHB_50_White_BEVEL(param1:TextField) : void
      {
         var _loc2_:Array = param1.filters.concat();
         _loc2_.unshift(new GlowFilter(10066329,1,5,5,2,1,true));
         _loc2_.unshift(new GlowFilter(16777215,1,8,8,40));
         _loc2_.unshift(new GlowFilter(0,1,8,8,40));
         _loc2_.unshift(new GradientBevelFilter(5,243,[16777215,16763904,16739842],[1,0,1],[0,128,255],5,5,1));
         param1.filters = _loc2_;
         param1.cacheAsBitmap = true;
      }
      
      public static function extend_TXT_HKHB_80_White_BEVEL(param1:TextField) : void
      {
         var _loc2_:Array = param1.filters.concat();
         _loc2_.unshift(new GlowFilter(10066329,1,5,5,2,1,true));
         _loc2_.unshift(new GlowFilter(16777215,1,8,8,70));
         _loc2_.unshift(new GlowFilter(0,1,8,8,70));
         _loc2_.unshift(new GradientBevelFilter(5,243,[16777215,16763904,16739842],[1,0,1],[0,128,255],5,5,1));
         param1.filters = _loc2_;
         param1.cacheAsBitmap = true;
      }
      
      public static function extend_TXT_HKHB_35_Blue_BEVEL(param1:TextField) : void
      {
         var _loc2_:Array = param1.filters.concat();
         _loc2_.unshift(new GlowFilter(10066329,1,5,5,2,1,true));
         _loc2_.unshift(new GlowFilter(16777215,1,4,4,40));
         _loc2_.unshift(new GlowFilter(0,1,5,5,40));
         _loc2_.unshift(new GradientBevelFilter(2,243,[16777215,6750207,3381759],[1,0,1],[0,128,255],5,5,1));
         param1.filters = _loc2_;
         param1.cacheAsBitmap = true;
      }
      
      public static function extend_TXT_HKHB_31_Yellow_BEVEL(param1:TextField) : void
      {
         var _loc2_:Array = param1.filters.concat();
         _loc2_.unshift(new GlowFilter(10066329,1,5,5,2,1,true));
         _loc2_.unshift(new GlowFilter(16777215,1,4,4,40));
         _loc2_.unshift(new GlowFilter(0,1,6,6,40));
         _loc2_.unshift(new GradientBevelFilter(2,243,[12566463,16776960,16750848],[1,0,1],[0,128,255],5,5,1.5));
         param1.filters = _loc2_;
         param1.cacheAsBitmap = true;
      }
      
      public static function extend_TXT_HKHB_25_Gray_BEVEL(param1:TextField) : void
      {
         var _loc2_:Array = param1.filters.concat();
         _loc2_.unshift(new GlowFilter(10066329,1,1,1,2,1,true));
         _loc2_.unshift(new GlowFilter(16777215,1,2,2,40));
         _loc2_.unshift(new GlowFilter(0,1,3,3,40));
         _loc2_.unshift(new GradientBevelFilter(2,243,[16777215,10079487,2896711],[1,0,1],[0,128,255],2,2,1));
         param1.filters = _loc2_;
         param1.cacheAsBitmap = true;
      }
      
      public static function extend_TXT_HKHB_50_Gray_BEVEL(param1:TextField) : void
      {
         var _loc2_:Array = param1.filters.concat();
         _loc2_.unshift(new GlowFilter(10066329,1,5,5,2,1,true));
         _loc2_.unshift(new GlowFilter(16777215,1,8,8,40));
         _loc2_.unshift(new GlowFilter(0,1,8,8,40));
         _loc2_.unshift(new GradientBevelFilter(5,243,[16777215,26214,2896711],[1,0,1],[0,128,255],5,5,1));
         param1.filters = _loc2_;
         param1.cacheAsBitmap = true;
      }
      
      public static function extend_TXT_HKHB_80_Gray_BEVEL(param1:TextField) : void
      {
         var _loc2_:Array = param1.filters.concat();
         _loc2_.unshift(new GlowFilter(10066329,1,5,5,2,1,true));
         _loc2_.unshift(new GlowFilter(16777215,1,8,8,70));
         _loc2_.unshift(new GlowFilter(0,1,8,8,70));
         _loc2_.unshift(new GradientBevelFilter(5,243,[16777215,26214,2896711],[1,0,1],[0,128,255],5,5,1));
         param1.filters = _loc2_;
         param1.cacheAsBitmap = true;
      }
   }
}
