package com.qq.modules.levelselect.view.components
{
import asgui.controls.Image;
import asgui.core.IDisposable;
import asgui.utils.DisplayUtil;

import com.qq.display.QScrollableCanvas;
import com.qq.modules.levelselect.command.LSProxyCmd;
import com.qq.modules.levelselect.view.maps.LSMapLevelGate;
import com.qq.modules.levelselect.view.maps.LSMapLevelIcon;
import com.qq.modules.levelselect.view.maps.LSMapLevelRoad;
import com.qq.modules.main.command.CommonCmd;
import com.qq.utils.QDisplayUtil;
import com.qq.utils.UrlManager;

import flash.debugger.enterDebugger;
import flash.display.Loader;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.IEventDispatcher;

public class LSMapCt extends QScrollableCanvas
   {
       
      
      public var back:Image;
      
      private var img:Image;
      
      public var icons:Array;
      
      public var gates:Array;
      
      public var roads:Array;
      
      public var roadsForGate:Array;
      
      public var mc:MovieClip;
      
      public var uiTopLayer:Sprite;
      
      private var stageId:int;
      
      public function LSMapCt()
      {
         super(LSMapCtMediator);
         this.img.ifRemovePreChildWhenChangeSource = true;
         this.enableScale = true;
         this.scaleMin = 1;
      }
      
      public function setStage(param1:int) : void
      {
         if(this.stageId != param1)
         {
            this.clear();
            this.stageId = param1;
            this.img.source = UrlManager.getUrl(0,"swf/ls/stages/" + param1 + ".swf");
            this.back.source = UrlManager.getUrl(0,"swf/ls/back_2.jpg");
            if(this.img.mcHolder)
            {
               this.init((this.img.mcHolder as Loader).content as MovieClip);
            }
            else
            {
               this.img.addEventListener(Event.COMPLETE,this.imgCompleteHandler,false,0,true);
            }
            cameraTo(600,800,false);
            CommonCmd.showLoading();
         }
      }
      
      public function clear() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:LSMapLevelRoad = null;
         if(this.icons)
         {
            this.cleanArr(this.icons);
            this.icons = null;
         }
         if(this.gates)
         {
            this.cleanArr(this.gates);
            this.gates = null;
         }
         if(this.roads)
         {
            this.cleanArr(this.roads);
            this.roads = null;
         }
         if(this.roadsForGate)
         {
            this.cleanArr(this.roadsForGate);
            this.roadsForGate = null;
         }
         if(this.mc)
         {
            QDisplayUtil.unregisterView(this.mc.id);
            DisplayUtil.CleanMovieClip(this.mc);
            this.mc = null;
         }
         if(this.img && this.img.mcHolder is Loader)
         {
            (this.img.mcHolder as Loader).unloadAndStop();
         }
      }
      
      override public function Dispose() : void
      {
         this.clear();
         if(this.img)
         {
            this.removeChild(this.img);
            this.img.removeEventListener(Event.COMPLETE,this.imgCompleteHandler);
            this.img.Dispose();
            this.img = null;
         }
         if(this.back)
         {
            this.back.Dispose();
            this.back = null;
         }
         super.Dispose();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.left = 0;
         this.right = 0;
         this.top = 0;
         this.bottom = 0;
         this.back = new Image();
         this.back.scaleContent = true;
         this.back.maintainAspectRatio = false;
         this.back.left = 0;
         this.back.right = 0;
         this.back.top = 0;
         this.back.bottom = 0;
         this.addChild(this.back);
         this.img = new Image();
         this.img.name = "img";
         this.img.ifRemovePreChildWhenChangeSource = true;
         this.addChild(this.img);
         this.uiTopLayer = new Sprite();
         this.addChild(this.uiTopLayer);
      }
      
      private function init(param1:MovieClip) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:LSMapLevelIcon = null;
         var _loc7_:Array = null;
         var _loc8_:MovieClip = null;
         var _loc11_:Boolean = false;
         this.mc = param1;
         this.mc.id = "LSMapContent";
         QDisplayUtil.registerView(this.mc.id,this.mc);
         this.icons = [];
         this.gates = [];
         this.roads = [];
         this.roadsForGate = [];
         var _loc6_:int = param1.numChildren;
         var _loc9_:uint = 16777215;
         var _loc10_:uint = 0;
         _loc2_ = 0;
         while(_loc2_ < _loc6_)
         {
            _loc8_ = param1.getChildAt(_loc2_) as MovieClip;
            _loc11_ = false;
            if(_loc8_)
            {
               _loc7_ = _loc8_.name.split("_");
               switch(_loc7_[0])
               {
                  case "f":
                     if(this.icons[_loc7_[1]] == null)
                     {
                        this.icons[_loc7_[1]] = [];
                     }
                     this.icons[_loc7_[1]][_loc7_[2]] = new LSMapLevelIcon(_loc8_,this.stageId,_loc7_[1],_loc7_[2]);
                     _loc11_ = true;
                     break;
                  case "g":
                     if(this.gates[_loc7_[1]] == null)
                     {
                        this.gates[_loc7_[1]] = [];
                     }
                     this.gates[_loc7_[1]][_loc7_[2]] = new LSMapLevelGate(_loc8_,this.stageId,_loc7_[1],_loc7_[2]);
                     _loc11_ = true;
                     break;
                  case "r":
                     if(this.roads[_loc7_[1]] == null)
                     {
                        this.roads[_loc7_[1]] = [];
                     }
                     if(this.roads[_loc7_[1]][_loc7_[2]] == null)
                     {
                        this.roads[_loc7_[1]][_loc7_[2]] = [];
                     }
                     this.roads[_loc7_[1]][_loc7_[2]][_loc7_[3]] = new LSMapLevelRoad(_loc8_);
                     _loc11_ = true;
                     break;
                  case "rg":
                     if(this.roadsForGate[_loc7_[1]] == null)
                     {
                        this.roadsForGate[_loc7_[1]] = [];
                     }
                     if(this.roadsForGate[_loc7_[1]][_loc7_[2]] == null)
                     {
                        this.roadsForGate[_loc7_[1]][_loc7_[2]] = [];
                     }
                     this.roadsForGate[_loc7_[1]][_loc7_[2]][_loc7_[3]] = new LSMapLevelRoad(_loc8_);
                     _loc11_ = true;
               }
               if(_loc11_)
               {
                  if(_loc2_ < _loc9_)
                  {
                     _loc9_ = _loc2_;
                  }
                  if(_loc2_ > _loc10_)
                  {
                     _loc10_ = _loc2_;
                  }
               }
            }
            _loc2_++;
         }
         initScroll(this.img,-80,-150,-100,-100);
         if(this.stageId == 3)
         {
            initScroll(this.img,0,0,0,0);
         }
         LSProxyCmd.requestStageInfo(this.stageId);
      }
      
      private function cleanArr(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:* = undefined;
         var _loc3_:int = param1.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((_loc4_ = param1[_loc2_]) is Array)
            {
               this.cleanArr(_loc4_);
            }
            else if(_loc4_ is IDisposable)
            {
               (_loc4_ as IDisposable).Dispose();
            }
            _loc2_++;
         }
      }
      
      protected function imgCompleteHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.imgCompleteHandler);
         this.init(((param1.currentTarget as Image).mcHolder as Loader).content as MovieClip);
      }
      
      public function cameraToLevel(param1:int, param2:int) : void
      {
         if(this.icons[param1] == null)
         {
            return;
         }
         var _loc3_:LSMapLevelIcon = this.icons[param1][param2];
         if(_loc3_ == null)
         {
            return;
         }
         cameraTo(_loc3_.location.x,_loc3_.location.y);
      }
      
      public function getIconByLevel(param1:int, param2:int) : LSMapLevelIcon
      {
         if(this.icons[param1] == null)
         {
            return null;
         }
         return this.icons[param1][param2];
      }
      
      public function getRoadsByLevel(param1:int, param2:int) : Vector.<LSMapLevelRoad>
      {
         if(this.roads[param1] == null)
         {
            return null;
         }
         if(this.roads[param1][param2] == null)
         {
            return null;
         }
         return Vector.<LSMapLevelRoad>(this.roads[param1][param2]);
      }
      
      public function getRoadsFotGateByLevel(param1:int, param2:int) : Vector.<LSMapLevelRoad>
      {
         if(this.roadsForGate[param1] == null)
         {
            return null;
         }
         if(this.roadsForGate[param1][param2] == null)
         {
            return null;
         }
         return Vector.<LSMapLevelRoad>(this.roadsForGate[param1][param2]);
      }
      
      public function getGateByLevel(param1:int, param2:int) : LSMapLevelGate
      {
         if(this.gates[param1] == null)
         {
            return null;
         }
         return this.gates[param1][param2];
      }
   }
}
