package com.qq.modules.city.view.components
{
   import asgui.controls.Image;
   import asgui.core.Application;
   import asgui.managers.ToolTipManager;
   import asgui.resources.AssetManager;
   import com.qq.display.QScrollableCanvas;
   import com.qq.modules.city.model.templates.BuildingTemplateFactory;
   import com.qq.modules.city.model.templates.ce.BuildingTemplateCE;
   import com.qq.templates.font.FontNormal;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import tencent.base.utils.StringUtil;
   
   public class CityMapView extends QScrollableCanvas
   {
      
      public static const MapW:int = 2100;
      
      public static const MapH:int = 900;
      
      private static var _buildingPosList:Array;
      
      private static var _isReadBuildPos:Boolean;
      
      private static var _buildingOffPosList:Array;
       
      
      public var buildingLayer:Sprite;
      
      public var buildingTipLayer:Sprite;
      
      public var overringBuilding:CityBuildingView;
      
      public var bulidingTipList:Array;
      
      public var bg:MovieClip;
      
      public function CityMapView()
      {
         super(CityMapViewMediator);
      }
      
      override public function InitializeComponent() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:DisplayObject = null;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:BuildingTemplateCE = null;
         var _loc10_:String = null;
         var _loc11_:MovieClip = null;
         var _loc12_:Array = null;
         var _loc13_:BuildingTemplateCE = null;
         var _loc14_:DisplayObject = null;
         super.InitializeComponent();
         var _loc1_:Image = new Image();
         _loc1_.id = "mapBg";
         _loc1_.width = MapW;
         _loc1_.height = MapH;
         addChild(_loc1_);
         _loc1_.source = AssetManager.instance.GetClass("CityMap_BG");
         width = MapW;
         height = MapH;
         this.bg = _loc1_.mcHolder as MovieClip;
         this.bulidingTipList = new Array();
         if(!_isReadBuildPos)
         {
            _buildingPosList = new Array();
            _buildingOffPosList = new Array();
         }
         var _loc2_:Vector.<DisplayObject> = new Vector.<DisplayObject>();
         if(this.bg != null)
         {
            _loc3_ = this.bg.numChildren;
            _loc4_ = 0;
            while(_loc4_ < this.bg.numChildren)
            {
               if((_loc7_ = (_loc6_ = (_loc5_ = this.bg.getChildAt(_loc4_)).name).indexOf("buildingTip")) != -1)
               {
                  _loc8_ = int(_loc6_.substr("buildingTip".length));
                  if((_loc9_ = BuildingTemplateFactory.instance.getBuilding(_loc8_)) != null)
                  {
                     this.bulidingTipList.push(_loc5_);
                     _loc10_ = StringUtil.substitute(FontNormal.City_BuildingTip,_loc9_.name,_loc9_.unlockRoleLv);
                     ToolTipManager.impl.RegisterToolTip(_loc5_,_loc10_);
                     if((_loc11_ = _loc5_ as MovieClip) != null)
                     {
                        _loc11_.alpha = 0;
                        _loc11_.buttonMode = true;
                     }
                  }
               }
               else if((_loc12_ = _loc5_.name.split("_"))[0] == "b")
               {
                  _loc2_.push(_loc5_);
                  if(!_isReadBuildPos)
                  {
                     if((_loc13_ = BuildingTemplateFactory.instance.getBuilding(_loc12_[1])) != null)
                     {
                        _buildingPosList[_loc12_[1]] = [_loc5_.x,_loc5_.y,_loc13_.order];
                        if(_loc5_ is DisplayObjectContainer)
                        {
                           if((_loc14_ = DisplayObjectContainer(_loc5_).getChildByName("offsetPoint")) is MovieClip)
                           {
                              _buildingOffPosList[_loc12_[1]] = new Point(_loc14_.x,_loc14_.y);
                           }
                        }
                     }
                  }
               }
               else if(_loc12_[0] == "c")
               {
                  _loc5_.visible = false;
               }
               _loc4_++;
            }
            _isReadBuildPos = true;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            this.bg.removeChild(_loc2_[_loc4_]);
            _loc4_++;
         }
         _loc2_ = null;
         this.buildingLayer = new Sprite();
         this.buildingLayer.name = "buildingLayer";
         addChild(this.buildingLayer);
         this.buildingTipLayer = new Sprite();
         this.buildingTipLayer.name = "buildingTipLayer";
         this.buildingTipLayer.mouseChildren = false;
         this.buildingTipLayer.mouseEnabled = false;
         addChild(this.buildingTipLayer);
         initScroll(this);
         this.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOutHandler,false,0,true);
      }
      
      private function onRollOver(param1:MouseEvent) : void
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         if(_loc2_ != null)
         {
            _loc2_.alpha = 1;
         }
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         var _loc2_:DisplayObject = param1.currentTarget as DisplayObject;
         if(_loc2_ != null)
         {
            _loc2_.alpha = 0;
            _loc2_.filters = null;
         }
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:CityBuildingViewMediator = null;
         if(this.overringBuilding)
         {
            _loc2_ = this.overringBuilding.getMediator() as CityBuildingViewMediator;
            _loc2_.onClick(param1);
            param1.stopImmediatePropagation();
         }
      }
      
      protected function mouseMoveHandler(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc4_:CityBuildingViewMediator = null;
         var _loc5_:CityBuildingView = null;
         var _loc6_:Boolean = false;
         var _loc3_:int = this.buildingLayer.numChildren;
         _loc2_ = _loc3_ - 1;
         while(_loc2_ >= 0)
         {
            if(_loc6_ = (_loc5_ = this.buildingLayer.getChildAt(_loc2_) as CityBuildingView).hitTestPoint(Application.application.mouseX,Application.application.mouseY,true))
            {
               if(this.overringBuilding != _loc5_)
               {
                  if(this.overringBuilding)
                  {
                     (_loc4_ = this.overringBuilding.getMediator() as CityBuildingViewMediator).onOut();
                  }
                  this.overringBuilding = _loc5_;
                  (_loc4_ = this.overringBuilding.getMediator() as CityBuildingViewMediator).onOver();
               }
               break;
            }
            _loc2_--;
         }
         if(_loc2_ == -1 && this.overringBuilding)
         {
            (_loc4_ = this.overringBuilding.getMediator() as CityBuildingViewMediator).onOut();
            this.overringBuilding = null;
         }
         super.enterFrameHandler(param1);
      }
      
      private function rollOutHandler(param1:Event) : void
      {
         var _loc2_:CityBuildingViewMediator = null;
         if(this.overringBuilding)
         {
            _loc2_ = this.overringBuilding.getMediator() as CityBuildingViewMediator;
            if(_loc2_)
            {
               _loc2_.onOut();
            }
            this.overringBuilding = null;
         }
      }
      
      public function getBuildingPosByType(param1:int) : Array
      {
         return _buildingPosList[param1];
      }
      
      public function getBuildingOffPosByType(param1:int) : Point
      {
         return _buildingOffPosList[param1];
      }
      
      public function cleanBuilding() : void
      {
         var _loc1_:CityBuildingView = null;
         while(this.buildingLayer.numChildren > 0)
         {
            _loc1_ = this.buildingLayer.removeChildAt(0) as CityBuildingView;
            if(_loc1_ != null)
            {
               _loc1_.Dispose();
            }
         }
      }
      
      public function getBuildingByType(param1:int) : CityBuildingView
      {
         var _loc2_:int = 0;
         var _loc4_:CityBuildingView = null;
         var _loc3_:int = this.buildingLayer.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((_loc4_ = this.buildingLayer.getChildAt(_loc2_) as CityBuildingView).type == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function removeBuildTips(param1:int) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.bulidingTipList.length)
         {
            _loc2_ = this.bulidingTipList[_loc3_];
            if(_loc2_.name == "buildingTip" + param1)
            {
               ToolTipManager.impl.RegisterToolTip(_loc2_,null);
               _loc2_.removeEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
               _loc2_.removeEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
               this.bulidingTipList.splice(_loc3_,1);
               if(_loc2_.parent && _loc2_.parent.contains(_loc2_))
               {
                  _loc2_.parent.removeChild(_loc2_);
               }
            }
            _loc3_++;
         }
      }
      
      override public function Dispose() : void
      {
         var _loc1_:DisplayObject = null;
         this.removeEventListener(MouseEvent.CLICK,this.clickHandler);
         this.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutHandler);
         if(this.bulidingTipList != null)
         {
            while(this.bulidingTipList.length > 0)
            {
               _loc1_ = this.bulidingTipList.pop();
               if(_loc1_ != null)
               {
                  ToolTipManager.impl.RegisterToolTip(_loc1_,null);
                  _loc1_.removeEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
                  _loc1_.removeEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
               }
            }
            this.bulidingTipList = null;
         }
         this.bg = null;
         super.Dispose();
      }
   }
}
