package com.qq.modules.city.view.components.newUI
{
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.constant.city.CityButtonConstant;
   import com.qq.display.QCanvas;
   import com.qq.modules.city.CityGlobals;
   import com.qq.templates.font.FontHKHB;
   import flash.display.MovieClip;
   
   public class NewCityLevelSelectBtn extends QCanvas
   {
       
      
      public var buttonBGMC:MovieClip;
      
      private var _newFlag:Image;
      
      public var button_normal:Button;
      
      public var button_spec:Button;
      
      private var _isHaveNew:Boolean;
      
      public function NewCityLevelSelectBtn()
      {
         super(NewCityLevelSelectBtnMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         id = CityButtonConstant.Name_TD;
         this.width = CityGlobals.Function_ButtonW;
         this.height = CityGlobals.Function_ButtonH;
         scrollRectEnabled = false;
         this.buttonBGMC = AssetManager.GetNewClass("City_UI_TD_BUTTON_BG") as MovieClip;
         addChild(this.buttonBGMC);
         this.button_normal = new Button();
         this.button_normal.x = 6;
         this.button_normal.y = 0;
         this.button_normal.width = 63;
         this.button_normal.height = 59;
         this.button_normal.styleName = ".City_Button_TD";
         addChild(this.button_normal);
         this.button_spec = new Button();
         this.button_spec.width = 59;
         this.button_spec.height = 59;
         this.button_spec.right = 6;
         this.button_spec.y = 0;
         this.button_spec.styleName = ".City_Button_Spec_TD";
         addChild(this.button_spec);
         this._newFlag = new Image();
         this._newFlag.top = 0;
         this._newFlag.left = 0;
         this._newFlag.source = AssetManager.GetNewClass("City_tipRedPointImg");
         this._newFlag.visible = false;
         this._newFlag.mouseChildren = false;
         this._newFlag.mouseEnabled = false;
         this.addChild(this._newFlag);
         var _loc1_:Label = new Label();
         _loc1_.styleName = ".TXT_HKHB_18_White_BEVEL_CENTER";
         _loc1_.text = FontHKHB.LEVEL;
         _loc1_.x = 0;
         _loc1_.width = CityGlobals.Function_ButtonW * 0.5 + 5;
         _loc1_.height = 25;
         _loc1_.bottom = 10;
         _loc1_.mouseEnabled = _loc1_.mouseChildren = false;
         addChild(_loc1_);
         var _loc2_:Label = new Label();
         _loc2_.styleName = ".TXT_HKHB_18_White_BEVEL_CENTER";
         _loc2_.text = FontHKHB.Challenge;
         _loc2_.x = CityGlobals.Function_ButtonW * 0.5 - 5;
         _loc2_.width = CityGlobals.Function_ButtonW * 0.5;
         _loc2_.height = 25;
         _loc2_.bottom = 10;
         _loc2_.mouseEnabled = _loc2_.mouseChildren = false;
         addChild(_loc2_);
      }
      
      public function get isHaveNew() : Boolean
      {
         return this._isHaveNew;
      }
      
      public function set isHaveNew(param1:Boolean) : void
      {
         this._isHaveNew = param1;
         this._newFlag.visible = this._isHaveNew;
      }
   }
}
