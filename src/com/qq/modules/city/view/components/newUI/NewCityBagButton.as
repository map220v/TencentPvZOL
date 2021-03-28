package com.qq.modules.city.view.components.newUI
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.constant.city.CityButtonConstant;
   import com.qq.display.QCanvas;
   import com.qq.modules.city.CityGlobals;
   import com.qq.templates.font.FontHKHB;
   
   public class NewCityBagButton extends QCanvas
   {
       
      
      private var _newFlag:Image;
      
      private var _isHaveNew:Boolean;
      
      public function NewCityBagButton(param1:Class = null)
      {
         super(param1);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.scrollRectEnabled = false;
         this.width = CityGlobals.New_ButtonW;
         this.height = CityGlobals.New_ButtonH;
         var _loc1_:Image = new Image();
         _loc1_.source = CityButtonConstant.buttonResList[CityButtonConstant.Name_Bag];
         this.addChild(_loc1_);
         var _loc2_:Label = new Label();
         _loc2_.styleName = ".TXT_HKHB_18_White_BEVEL_CENTER";
         _loc2_.text = FontHKHB.CITY_BAG;
         _loc2_.left = _loc2_.right = 0;
         _loc2_.height = 25;
         _loc2_.bottom = 10;
         _loc2_.mouseEnabled = _loc2_.mouseChildren = false;
         this.addChild(_loc2_);
         this._newFlag = new Image();
         this._newFlag.top = 0;
         this._newFlag.left = 0;
         this._newFlag.source = AssetManager.GetNewClass("City_tipRedPointImg");
         this._newFlag.mouseChildren = false;
         this._newFlag.mouseEnabled = false;
         this.addChild(this._newFlag);
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
