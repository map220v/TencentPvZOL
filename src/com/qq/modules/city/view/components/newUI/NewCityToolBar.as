package com.qq.modules.city.view.components.newUI
{
   import asgui.containers.Canvas;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.ProgressBar;
   import asgui.controls.progresses.ProgressBarDirection;
   import asgui.controls.progresses.ProgressBarMode;
   import asgui.resources.AssetManager;
   import asgui.utils.StringUtil;
   import com.greensock.TweenMax;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.city.CityButtonConstant;
   import com.qq.display.QCanvas;
   import com.qq.modules.city.CityGlobals;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UrlManager;
   import flash.display.DisplayObject;
   
   public class NewCityToolBar extends QCanvas
   {
      
      public static const GAP:int = 2;
      
      public static const GAP_W:int = -9;
      
      public static const GAP_H:int = -9;
      
      private static const BAR_GAP:int = 140;
       
      
      public var btnToBag:NewCityBagButton;
      
      public var levelSelectBtn:NewCityLevelSelectBtn;
      
      private var _bottom_btnList:Array;
      
      private var _right_btnList:Array;
      
      private var _maxBottomBtn:int = 5;
      
      private var _maxRightBtn:int = 3;
      
      public var _createButtonFunctionMap:Array;
      
      private var m_durabilityBar:ProgressBar;
      
      private var m_btnRepair:Image;
      
      private var m_promotionFlag:Image;
      
      private var _fubenNewFlag:Image;
      
      public function NewCityToolBar()
      {
         super(NewCityToolBarMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this._bottom_btnList = new Array();
         this._right_btnList = new Array();
         width = (CityGlobals.New_ButtonW + GAP_W) * this._maxBottomBtn + BAR_GAP;
         height = (CityGlobals.Function_ButtonH + GAP) * this._maxRightBtn;
         bottom = 0;
         right = 0;
         this.initButton();
         this.scrollRectEnabled = false;
         this.initDurability();
      }
      
      private function initDurability() : void
      {
         this.m_durabilityBar = new ProgressBar();
         this.m_durabilityBar.styleName = ".ProgressBar_Town_Durability";
         this.m_durabilityBar.label = "";
         this.m_durabilityBar.mode = ProgressBarMode.MANUAL;
         this.m_durabilityBar.direction = ProgressBarDirection.TOP;
         this.m_durabilityBar.width = 32;
         this.m_durabilityBar.height = 96;
         this.m_durabilityBar.SetProgress(0,100);
         this.m_durabilityBar.value = 0;
         this.m_durabilityBar.right = CityGlobals.Function_ButtonW + GAP_W;
         this.m_durabilityBar.bottom = 0;
         this.addChild(this.m_durabilityBar);
         this.m_btnRepair = new Image();
         this.m_btnRepair.source = AssetManager.GetClass("city_durability_button");
         this.m_btnRepair.width = 31;
         this.m_btnRepair.height = 31;
         this.m_btnRepair.right = CityGlobals.Function_ButtonW + GAP_W;
         this.m_btnRepair.bottom = 96;
         this.m_btnRepair.buttonMode = true;
         this.addChild(this.m_btnRepair);
      }
      
      public function get btnRepair() : Image
      {
         return this.m_btnRepair;
      }
      
      private function initButton() : void
      {
         this._createButtonFunctionMap = new Array();
         this._createButtonFunctionMap[CityButtonConstant.Name_Quest] = this.addQuestListBtn;
         this._createButtonFunctionMap[CityButtonConstant.Name_Fuben] = this.addFubenBtn;
         this._createButtonFunctionMap[CityButtonConstant.Name_TD] = this.addLevelSelectBtn;
         this._createButtonFunctionMap[CityButtonConstant.Name_MAIL] = this.addMailBtn;
         this._createButtonFunctionMap[CityButtonConstant.Name_Bag] = this.addBagBtn;
         this._createButtonFunctionMap[CityButtonConstant.Name_WorldMap] = this.addWorldMapBtn;
         this._createButtonFunctionMap[CityButtonConstant.Name_Shop] = this.addShopBtn;
         this._createButtonFunctionMap[CityButtonConstant.Name_Friend] = this.addFriendBtn;
         this._createButtonFunctionMap[CityButtonConstant.Name_Illustrations] = this.addIllustrationsBtn;
         this._createButtonFunctionMap[CityButtonConstant.Name_Dummy] = this.addDummyBtn;
      }
      
      public function addButton(param1:String, param2:Boolean = false) : DisplayObject
      {
         var _loc4_:Canvas = null;
         var _loc6_:Array = null;
         var _loc7_:Canvas = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:DisplayObject = null;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         var _loc3_:Function = this._createButtonFunctionMap[param1];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_();
            if(this.hasOwnProperty(_loc4_.id))
            {
               this[_loc4_.id] = _loc4_;
            }
            (_loc7_ = new Canvas()).id = _loc4_.id;
            _loc7_.scrollRectEnabled = false;
            _loc7_.name = param1;
            _loc7_.id = param1;
            _loc7_.width = _loc4_.width;
            _loc7_.height = _loc4_.height;
            _loc7_.buttonMode = true;
            _loc7_.addChild(_loc4_);
            _loc4_ = _loc7_;
         }
         if(_loc4_ == null)
         {
            return null;
         }
         var _loc5_:int;
         if((_loc5_ = CityButtonConstant.getBtnListType(_loc4_.name)) == CityButtonConstant.City_Btn_Bottom)
         {
            _loc6_ = this._bottom_btnList;
         }
         else
         {
            _loc6_ = this._right_btnList;
         }
         _loc6_.push(_loc4_);
         addChild(_loc4_);
         if(param2)
         {
            _loc8_ = CityButtonConstant.getSortIndex(_loc4_.name);
            _loc9_ = 0;
            for each(_loc10_ in _loc6_)
            {
               if(_loc10_.name != _loc4_.name)
               {
                  if((_loc12_ = CityButtonConstant.getSortIndex(_loc10_.name)) < _loc8_)
                  {
                     if(_loc5_ == CityButtonConstant.City_Btn_Bottom)
                     {
                        TweenMax.to(_loc10_,0.2,{"x":_loc10_.x - CityGlobals.New_ButtonW});
                     }
                     else
                     {
                        TweenMax.to(_loc10_,0.2,{"y":_loc10_.y - CityGlobals.New_ButtonH});
                     }
                  }
                  else
                  {
                     _loc9_++;
                  }
               }
            }
            _loc11_ = this.getButtonPostion(_loc9_,_loc5_);
            _loc4_.x = _loc11_[0];
            _loc4_.y = _loc11_[1];
         }
         else
         {
            this.sortToolBar();
         }
         return _loc4_;
      }
      
      public function updatedurability(param1:int, param2:int) : void
      {
         var _loc3_:* = param1 / param2 * 100 >> 0;
         this.m_durabilityBar.value = _loc3_;
         this.m_durabilityBar.toolTip = StringUtil.substitute(FontNormal.CITY_DURABILITY_TIP,param1,param2);
      }
      
      private function getButtonPostion(param1:int, param2:int) : Array
      {
         var _loc3_:Array = new Array();
         if(param2 == CityButtonConstant.City_Btn_Bottom)
         {
            _loc3_[0] = width - (param1 + 1) * (CityGlobals.New_ButtonW + GAP_W) - BAR_GAP;
            _loc3_[1] = height - (CityGlobals.New_ButtonH - 8);
         }
         else
         {
            _loc3_[0] = width - (CityGlobals.Function_ButtonW - 5);
            _loc3_[1] = height - (param1 + 1) * (CityGlobals.Function_ButtonH + GAP_H);
         }
         return _loc3_;
      }
      
      private function sortToolBar() : void
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:DisplayObject = null;
         var _loc6_:Array = null;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:DisplayObject = null;
         var _loc10_:Array = null;
         var _loc1_:int = 0;
         var _loc2_:int = CityButtonConstant.Right_Sort_List.length - 1;
         while(_loc2_ >= 0)
         {
            _loc3_ = CityButtonConstant.Right_Sort_List[_loc2_];
            _loc4_ = CityButtonConstant.getBtnListType(_loc3_);
            if((_loc5_ = getChildByName(_loc3_)) != null)
            {
               _loc6_ = this.getButtonPostion(_loc1_,_loc4_);
               _loc5_.x = _loc6_[0];
               _loc5_.y = _loc6_[1];
               _loc1_++;
            }
            _loc2_--;
         }
         _loc1_ = 0;
         _loc2_ = CityButtonConstant.Bottom_Sort_List.length - 1;
         while(_loc2_ >= 0)
         {
            _loc7_ = CityButtonConstant.Bottom_Sort_List[_loc2_];
            _loc8_ = CityButtonConstant.getBtnListType(_loc7_);
            if((_loc9_ = getChildByName(_loc7_)) != null)
            {
               _loc10_ = this.getButtonPostion(_loc1_,_loc8_);
               _loc9_.x = _loc10_[0];
               _loc9_.y = _loc10_[1];
               _loc1_++;
            }
            _loc2_--;
         }
      }
      
      public function get promotionFlag() : Image
      {
         return this.m_promotionFlag;
      }
      
      override public function Dispose() : void
      {
         this._bottom_btnList = null;
         this._right_btnList = null;
         this._createButtonFunctionMap = null;
         super.Dispose();
      }
      
      public function addLevelSelectBtn() : DisplayObject
      {
         var _loc1_:NewCityLevelSelectBtn = new NewCityLevelSelectBtn();
         _loc1_.id = CityButtonConstant.Name_TD;
         return _loc1_;
      }
      
      public function addDummyBtn() : DisplayObject
      {
         var _loc1_:Canvas = null;
         _loc1_ = new Canvas();
         _loc1_.id = CityButtonConstant.Name_Dummy;
         _loc1_.scrollRectEnabled = false;
         _loc1_.width = CityGlobals.New_ButtonW;
         _loc1_.height = CityGlobals.New_ButtonH;
         var _loc2_:Image = new Image();
         _loc2_.source = CityButtonConstant.buttonResList[CityButtonConstant.Name_Dummy];
         _loc1_.addChild(_loc2_);
         var _loc3_:Label = new Label();
         _loc3_.styleName = ".TXT_HKHB_18_White_BEVEL_CENTER";
         _loc3_.text = FontHKHB.Dummy;
         _loc3_.left = _loc3_.right = 0;
         _loc3_.height = 25;
         _loc3_.bottom = 10;
         _loc3_.mouseEnabled = _loc3_.mouseChildren = false;
         _loc1_.addChild(_loc3_);
         return _loc1_;
      }
      
      public function addIllustrationsBtn() : DisplayObject
      {
         var _loc1_:Canvas = new Canvas();
         _loc1_.id = CityButtonConstant.Name_Illustrations;
         _loc1_.scrollRectEnabled = false;
         _loc1_.width = CityGlobals.New_ButtonW;
         _loc1_.height = CityGlobals.New_ButtonH;
         var _loc2_:Image = new Image();
         _loc2_.source = CityButtonConstant.buttonResList[CityButtonConstant.Name_Illustrations];
         _loc1_.addChild(_loc2_);
         var _loc3_:Label = new Label();
         _loc3_.styleName = ".TXT_HKHB_18_White_BEVEL_CENTER";
         _loc3_.text = FontHKHB.Illustrations;
         _loc3_.left = _loc3_.right = 0;
         _loc3_.height = 25;
         _loc3_.bottom = 10;
         _loc3_.mouseEnabled = _loc3_.mouseChildren = false;
         _loc1_.addChild(_loc3_);
         return _loc1_;
      }
      
      public function addFriendBtn() : DisplayObject
      {
         var _loc1_:Canvas = new Canvas();
         _loc1_.id = CityButtonConstant.Name_Friend;
         _loc1_.scrollRectEnabled = false;
         _loc1_.width = CityGlobals.New_ButtonW;
         _loc1_.height = CityGlobals.New_ButtonH;
         var _loc2_:Image = new Image();
         _loc2_.source = CityButtonConstant.buttonResList[CityButtonConstant.Name_Friend];
         _loc1_.addChild(_loc2_);
         var _loc3_:Label = new Label();
         _loc3_.styleName = ".TXT_HKHB_18_White_BEVEL_CENTER";
         _loc3_.text = FontHKHB.FRIEND;
         _loc3_.left = _loc3_.right = 0;
         _loc3_.height = 25;
         _loc3_.bottom = 10;
         _loc3_.mouseEnabled = _loc3_.mouseChildren = false;
         _loc1_.addChild(_loc3_);
         CommandDispatcher.send(CommandName.Quest_ShowRewardList);
         return _loc1_;
      }
      
      public function addQuestListBtn() : DisplayObject
      {
         var _loc1_:Canvas = new Canvas();
         _loc1_.id = CityButtonConstant.Name_Quest;
         _loc1_.scrollRectEnabled = false;
         _loc1_.width = CityGlobals.New_ButtonW;
         _loc1_.height = CityGlobals.New_ButtonH;
         var _loc2_:Image = new Image();
         _loc2_.source = CityButtonConstant.buttonResList[CityButtonConstant.Name_Quest];
         _loc1_.addChild(_loc2_);
         var _loc3_:Label = new Label();
         _loc3_.styleName = ".TXT_HKHB_18_White_BEVEL_CENTER";
         _loc3_.text = FontHKHB.QUEST;
         _loc3_.left = _loc3_.right = 0;
         _loc3_.height = 25;
         _loc3_.bottom = 10;
         _loc3_.mouseEnabled = _loc3_.mouseChildren = false;
         _loc1_.addChild(_loc3_);
         CommandDispatcher.send(CommandName.Quest_ShowRewardList);
         return _loc1_;
      }
      
      public function checkFubenNewFlag() : void
      {
         if(this._fubenNewFlag == null)
         {
            return;
         }
         this._fubenNewFlag.visible = GameGloble.actorModel.currEnergy >= 5;
      }
      
      public function addFubenBtn() : DisplayObject
      {
         var _loc1_:Canvas = new Canvas();
         _loc1_.id = CityButtonConstant.Name_Fuben;
         _loc1_.scrollRectEnabled = false;
         _loc1_.width = CityGlobals.Function_ButtonW;
         _loc1_.height = CityGlobals.Function_ButtonH;
         var _loc2_:Image = new Image();
         _loc2_.source = CityButtonConstant.buttonResList[CityButtonConstant.Name_Fuben];
         _loc1_.addChild(_loc2_);
         var _loc3_:Label = new Label();
         _loc3_.styleName = ".TXT_HKHB_18_White_BEVEL_CENTER";
         _loc3_.text = FontHKHB.FUBEN;
         _loc3_.left = _loc3_.right = 0;
         _loc3_.height = 25;
         _loc3_.bottom = 10;
         _loc3_.mouseEnabled = _loc3_.mouseChildren = false;
         _loc1_.addChild(_loc3_);
         this._fubenNewFlag = new Image();
         this._fubenNewFlag.top = 0;
         this._fubenNewFlag.left = 0;
         this._fubenNewFlag.source = AssetManager.GetNewClass("City_tipRedPointImg");
         this._fubenNewFlag.visible = false;
         this._fubenNewFlag.mouseChildren = false;
         this._fubenNewFlag.mouseEnabled = false;
         _loc1_.addChild(this._fubenNewFlag);
         this.checkFubenNewFlag();
         return _loc1_;
      }
      
      public function addMailBtn() : DisplayObject
      {
         var _loc1_:NewCityMailButton = new NewCityMailButton();
         _loc1_.id = "btnToMail";
         return _loc1_;
      }
      
      public function addBagBtn() : DisplayObject
      {
         var _loc1_:Canvas = new NewCityBagButton();
         _loc1_.id = "btnToBag";
         return _loc1_;
      }
      
      public function addWorldMapBtn() : DisplayObject
      {
         var _loc1_:Canvas = new Canvas();
         _loc1_.id = CityButtonConstant.Name_WorldMap;
         _loc1_.scrollRectEnabled = false;
         _loc1_.width = CityGlobals.Function_ButtonW;
         _loc1_.height = CityGlobals.Function_ButtonH;
         var _loc2_:Image = new Image();
         _loc2_.source = CityButtonConstant.buttonResList[CityButtonConstant.Name_WorldMap];
         _loc1_.addChild(_loc2_);
         var _loc3_:Label = new Label();
         _loc3_.styleName = ".TXT_HKHB_18_White_BEVEL_CENTER";
         _loc3_.text = FontHKHB.CITY_MAP;
         _loc3_.left = _loc3_.right = 0;
         _loc3_.height = 25;
         _loc3_.bottom = 10;
         _loc3_.mouseEnabled = _loc3_.mouseChildren = false;
         _loc1_.addChild(_loc3_);
         return _loc1_;
      }
      
      public function addShopBtn() : DisplayObject
      {
         var _loc1_:Canvas = new Canvas();
         _loc1_.id = CityButtonConstant.Name_Shop;
         _loc1_.scrollRectEnabled = false;
         _loc1_.width = CityGlobals.New_ButtonW;
         _loc1_.height = CityGlobals.New_ButtonH;
         var _loc2_:Image = new Image();
         _loc2_.source = CityButtonConstant.buttonResList[CityButtonConstant.Name_Shop];
         _loc1_.addChild(_loc2_);
         var _loc3_:Label = new Label();
         _loc3_.styleName = ".TXT_HKHB_18_White_BEVEL_CENTER";
         _loc3_.text = FontHKHB.CITY_SHOP;
         _loc3_.left = _loc3_.right = 0;
         _loc3_.height = 25;
         _loc3_.bottom = 10;
         _loc3_.mouseEnabled = _loc3_.mouseChildren = false;
         _loc1_.addChild(_loc3_);
         this.m_promotionFlag = new Image();
         this.m_promotionFlag.width = 81;
         this.m_promotionFlag.height = 44;
         this.m_promotionFlag.y = -3;
         this.m_promotionFlag.source = UrlManager.getUrl(0,"swf/activity/promotionFlag.swf");
         this.m_promotionFlag.mouseChildren = false;
         this.m_promotionFlag.mouseEnabled = false;
         this.m_promotionFlag.visible = false;
         _loc1_.addChild(this.m_promotionFlag);
         return _loc1_;
      }
   }
}
