package com.qq.modules.city.view.components
{
   import asgui.containers.Canvas;
   import asgui.managers.LoaderManager;
   import com.qq.CommandName;
   import com.qq.managers.FilterManager;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.city.command.CityViewCmd;
   import com.qq.modules.city.model.vo.CityData;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.utils.UrlManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class CityMapViewMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:CityMapView;
      
      [Inject]
      public var cityData:CityData;
      
      private var _curCenterX:int;
      
      private var _curCenterY:int;
      
      private var timer:Timer;
      
      private var _appBuildingType:int;
      
      public function CityMapViewMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this._curCenterX = -1;
         this._curCenterY = -1;
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.City_MoveMapByCenter,this.onMoveMapByCenter,CommonEvent);
         addContextListener(CommandName.City_MoveMapByBuilding,this.onMoveMapByBuilding,CommonEvent);
         addContextListener(CommandName.City_ENABLE_MAP,this.onEnableMapScroll,CommonEvent);
         addContextListener(CommandName.City_InitBuilding,this.initBuilding,CommonEvent);
         addContextListener(CommandName.City_AddBuildingEffect,this.onAddBuildingEffect,CommonEvent);
         addContextListener(CommandName.ChangeBuilding,this.onChangeBuilding);
         addContextListener(CommandName.City_UpdateNewBuildingEffect,this.onUpdateNewBuildingEffect);
         addContextListener(CommandName.City_SET_BLUR,this.onSetBlur);
         addContextListener(CommandName.City_AddBuildingTip,this.onAddBuildingTip);
      }
      
      private function onChangeBuilding(param1:Event) : void
      {
         if(this.cityData.newBuildingList.length > 0)
         {
            if(this.timer == null)
            {
               this.timer = new Timer(500,0);
               this.timer.addEventListener(TimerEvent.TIMER,this.onBuildingEffectTimer);
            }
            if(!this.timer.running)
            {
               this.timer.start();
            }
         }
      }
      
      private function onBuildingEffectTimer(param1:Event) : void
      {
         this.onUpdateNewBuildingEffect(null);
      }
      
      private function onAddBuildingTip(param1:CommonEvent) : void
      {
         var _loc2_:Canvas = param1.param as Canvas;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.mouseChildren = false;
         _loc2_.mouseEnabled = false;
         this.view.buildingTipLayer.addChild(_loc2_);
      }
      
      private function onUpdateNewBuildingEffect(param1:Event) : void
      {
         var _loc2_:int = 0;
         if(this.cityData.newBuildingList.length > 0)
         {
            GameFlowCmd.lockScreen();
            _loc2_ = this.cityData.newBuildingList.shift();
            this.cityData.addBuilding(_loc2_);
            CityViewCmd.playAddBuildingAnimation(_loc2_);
         }
         else
         {
            if(this.timer != null)
            {
               this.timer.reset();
            }
            GameFlowCmd.unlockScreen();
         }
      }
      
      private function onSetBlur(param1:CommonEvent) : void
      {
         var _loc2_:Boolean = Boolean(param1.param);
         this.view.filters = !!_loc2_ ? [FilterManager.getBlur(10)] : [];
         if(_loc2_)
         {
            FilterManager.addMonoChrome(this.view,false);
         }
      }
      
      private function onAddBuildingEffect(param1:CommonEvent) : void
      {
         this._appBuildingType = param1.readCustomParam_Number("buildingType");
         this.preloadBuildingRes(this._appBuildingType);
      }
      
      private function preloadBuildingRes(param1:int) : void
      {
         LoaderManager.impl.addEventListener(Event.CLOSE,this.preloadCompleteHandler);
         LoaderManager.GetLoader(UrlManager.getInstance().getUrl(UrlManager.Url_CityBuilding,"building" + param1 + ".swf"));
         LoaderManager.GetLoader(UrlManager.getInstance().getUrl(UrlManager.Url_CityBuilding,"cityBuildingAppearEffect.swf"));
      }
      
      private function preloadCompleteHandler(param1:Event) : void
      {
         LoaderManager.impl.removeEventListener(Event.CLOSE,this.preloadCompleteHandler);
         var _loc2_:MovieClip = this.view.bg;
         var _loc3_:CityBuildingView = new CityBuildingView(_loc2_.getChildByName("c_" + this._appBuildingType) as MovieClip);
         _loc3_.name = _loc3_.id = "cityBuildingView_" + this._appBuildingType;
         var _loc4_:Array = this.view.getBuildingPosByType(this._appBuildingType);
         _loc3_.x = _loc4_[0];
         _loc3_.y = _loc4_[1];
         _loc3_.index = _loc4_[2];
         _loc3_.bgOffPos = this.view.getBuildingOffPosByType(this._appBuildingType);
         this.view.buildingLayer.addChild(_loc3_);
         _loc3_.reset([this._appBuildingType,false]);
         _loc3_.playNewBuildingEffect();
         this.updateBuildingDepth();
      }
      
      private function onMoveMapByCenter(param1:CommonEvent) : void
      {
         var _loc2_:int = param1.readCustomParam_Number("centerX");
         var _loc3_:int = param1.readCustomParam_Number("centerY");
         var _loc4_:Number = param1.readCustomParam_Number("scale");
         var _loc5_:Boolean = Boolean(param1.param.useTween);
         this.moveMapByCenter(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      private function onMoveMapByBuilding(param1:CommonEvent) : void
      {
         var _loc5_:CityBuildingView = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:int = param1.readCustomParam_Number("buildingType");
         var _loc3_:Number = param1.readCustomParam_Number("scale");
         var _loc4_:Array;
         if((_loc4_ = this.view.getBuildingPosByType(_loc2_)) != null)
         {
            _loc5_ = this.view.getBuildingByType(_loc2_);
            _loc6_ = _loc4_[0];
            _loc7_ = _loc4_[1];
            this.moveMapByCenter(_loc6_,_loc7_,_loc3_);
         }
      }
      
      private function onEnableMapScroll(param1:CommonEvent) : void
      {
         var _loc2_:Boolean = param1.readCustomParam("scrollEnable");
         var _loc3_:Boolean = param1.readCustomParam("mouseEnable");
         this.view.mouseEnabled = _loc3_;
         this.view.mouseChildren = _loc3_;
      }
      
      private function initBuilding(param1:CommonEvent) : void
      {
         var _loc6_:int = 0;
         var _loc7_:CityBuildingView = null;
         var _loc8_:Array = null;
         var _loc2_:MovieClip = this.view.bg;
         removeContextListener(CommandName.City_InitBuilding,this.initBuilding,CommonEvent);
         this.view.cleanBuilding();
         var _loc3_:Array = this.cityData.buildingList;
         var _loc4_:int = _loc3_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc3_[_loc5_];
            _loc7_ = new CityBuildingView(_loc2_.getChildByName("c_" + _loc6_) as MovieClip);
            _loc7_.name = _loc7_.id = "cityBuildingView_" + _loc6_;
            if((_loc8_ = this.view.getBuildingPosByType(_loc6_)) != null)
            {
               _loc7_.x = _loc8_[0];
               _loc7_.y = _loc8_[1];
               _loc7_.index = _loc8_[2];
               _loc7_.bgOffPos = this.view.getBuildingOffPosByType(_loc6_);
               this.view.buildingLayer.addChild(_loc7_);
               _loc7_.reset([_loc6_,true]);
               this.view.removeBuildTips(_loc6_);
            }
            _loc5_++;
         }
         this.updateBuildingDepth();
      }
      
      private function updateBuildingDepth() : void
      {
         var _loc2_:DisplayObject = null;
         var _loc1_:Array = new Array();
         var _loc3_:int = this.view.buildingLayer.numChildren;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.view.buildingLayer.getChildAt(_loc4_);
            if(_loc2_ is CityBuildingView)
            {
               _loc1_.push(_loc2_);
            }
            _loc4_++;
         }
         _loc1_.sortOn("index",Array.NUMERIC);
         for each(_loc2_ in _loc1_)
         {
            this.view.buildingLayer.addChild(_loc2_);
         }
      }
      
      override public function dispose() : void
      {
         if(this.timer != null)
         {
            this.timer.reset();
            this.timer.removeEventListener(TimerEvent.TIMER,this.onBuildingEffectTimer);
            this.timer = null;
         }
         this.view.cleanBuilding();
         super.dispose();
      }
      
      private function moveMapByCenter(param1:int, param2:int, param3:Number = NaN, param4:Boolean = true) : void
      {
         if(!isNaN(param3))
         {
            this.view.scaleTo(param3);
         }
         this.view.cameraTo(param1,param2,param4);
      }
   }
}
