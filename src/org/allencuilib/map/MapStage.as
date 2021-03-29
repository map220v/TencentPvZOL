package org.allencuilib.map
{
   import asgui.core.IDisposable;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import org.allencuilib.map.effects.MapEffectStage;
   import org.allencuilib.map.events.IMapEventsListener;
   import org.allencuilib.map.events.MapRoleEvent;
   import org.allencuilib.map.events.MapStageEvent;
   import org.allencuilib.map.interfaces.IEveryModeMapBackground;
   import org.allencuilib.map.interfaces.IMapBackground;
   import org.allencuilib.map.interfaces.IMapRole;
   import org.allencuilib.map.interfaces.IPathFinder;
   import org.allencuilib.map.roles.MapRoleStage;
   import org.allencuilib.map.scroll.IMapScrollEffect;
   import org.allencuilib.map.scroll.NoneMapScrollEffect;
   import org.allencuilib.map.tiled.display.TiledBackgroundDrawMode;
   
   public class MapStage extends Sprite implements IDisposable
   {
       
      
      private var rolesInBackgroud:Boolean;
      
      public var clickForMove:Boolean = true;
      
      private var stageWidth:int;
      
      private var stageHeight:int;
      
      private var _backgroud:IMapBackground;
      
      private var _roleStage:MapRoleStage;
      
      private var _backEffectStage:MapEffectStage;
      
      private var _topEffectStage:MapEffectStage;
      
      public var backLayer:Sprite;
      
      public var topLayer:Sprite;
      
      public var mouseScorllX:Number = 0;
      
      public var mouseScorllY:Number = 0;
      
      public var lastOverRole:IMapRole;
      
      private var listeners:Vector.<IMapEventsListener>;
      
      private var _disposed:Boolean;
      
      private var _mapStageScrollMode:int;
      
      private var _mapStageScrollMode2:int;
      
      private var _pathFinder:IPathFinder;
      
      public var scrollEffect:IMapScrollEffect;
      
      public function MapStage(param1:int, param2:int, param3:IMapBackground, param4:Boolean = false, param5:int = 1, param6:int = 1)
      {
         this.listeners = new Vector.<IMapEventsListener>();
         this.scrollEffect = new NoneMapScrollEffect();
         super();
         this.rolesInBackgroud = param4;
         this._backgroud = param3;
         this.addChild(this._backgroud as DisplayObject);
         this.backLayer = new Sprite();
         this.addChild(this.backLayer);
         this._backEffectStage = new MapEffectStage();
         this.addChild(this._backEffectStage);
         this._roleStage = new MapRoleStage();
         this._roleStage.addEventListener(MapRoleEvent.POSITION_CHANGED,this.MainRolePositionChangeHandler);
         this.addChild(this._roleStage);
         this._topEffectStage = new MapEffectStage();
         this.addChild(this._topEffectStage);
         this.topLayer = new Sprite();
         this.addChild(this.topLayer);
         this.SetStageSize(param1,param2,param5,param6);
      }
      
      public function Dispose() : void
      {
         if(this.hasDisposed)
         {
            return;
         }
         this.RemoveAllEventsListener();
         this.scrollEffect.Dispose();
         this.scrollEffect = null;
         this._roleStage.removeEventListener(MapRoleEvent.POSITION_CHANGED,this.MainRolePositionChangeHandler);
         this._backgroud.Dispose();
         this._backgroud = null;
         this._roleStage.Dispose();
         this._roleStage = null;
         this._backEffectStage.Dispose();
         this._backEffectStage = null;
         this._topEffectStage.Dispose();
         this._topEffectStage = null;
         this._disposed = true;
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get mapStageScrollMode() : int
      {
         return this._mapStageScrollMode;
      }
      
      public function set mapStageScrollMode(param1:int) : void
      {
         this._mapStageScrollMode = param1;
      }
      
      public function get mapStageScrollMode2() : int
      {
         return this._mapStageScrollMode2;
      }
      
      public function set mapStageScrollMode2(param1:int) : void
      {
         this._mapStageScrollMode2 = param1;
      }
      
      public function SetStageSize(param1:int, param2:int, param3:int = 1, param4:int = 1) : void
      {
         this.stageWidth = param1;
         this.stageHeight = param2;
         this._mapStageScrollMode = param3;
         this._mapStageScrollMode2 = param4;
         switch(param4)
         {
            case MapStageScrollMode2.STAGE_SCROLL_RECT:
               this.backgroud.autoScroll = false;
               break;
            case MapStageScrollMode2.LAYERS_SCROLL_RECT:
               this.backgroud.autoScroll = true;
               this.scrollRect = null;
               break;
            case MapStageScrollMode2.LAYERS_XY:
               this.backgroud.autoScroll = false;
               this.scrollRect = new Rectangle(0,0,param1,param2);
         }
         this.backgroud.SetStageSize(param1,param2);
         this.CheckScroll();
      }
      
      public function AddRole(param1:IMapRole) : void
      {
         this.roleStage.AddRole(param1);
      }
      
      public function AddEventsListener(param1:IMapEventsListener, param2:Boolean = true) : IMapEventsListener
      {
         this.listeners.push(param1);
         if(param2)
         {
            param1.StartListen(this);
         }
         return param1;
      }
      
      public function RemoveEventsListener(param1:IMapEventsListener) : IMapEventsListener
      {
         var _loc2_:int = 0;
         var _loc3_:IMapEventsListener = null;
         _loc2_ = 0;
         while(_loc2_ < this.listeners.length)
         {
            _loc3_ = this.listeners[_loc2_] as IMapEventsListener;
            if(_loc3_ == param1)
            {
               _loc3_.StopListen();
               this.listeners.splice(_loc2_,1);
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function RemoveAllEventsListener() : void
      {
         while(this.listeners.length > 0)
         {
            this.listeners.splice(0,1)[0].StopListen();
         }
      }
      
      public function get minLockX() : int
      {
         return this.backgroud.minScrollX + this.stageWidth / 2;
      }
      
      public function get minLockY() : int
      {
         return this.backgroud.minScrollY + this.stageHeight / 2;
      }
      
      public function get maxLockX() : int
      {
         return this.backgroud.maxScrollX + this.stageWidth / 2;
      }
      
      public function get maxLockY() : int
      {
         return this.backgroud.maxScrollY + this.stageHeight / 2;
      }
      
      public function get backgroud() : IMapBackground
      {
         return this._backgroud;
      }
      
      public function get roleStage() : MapRoleStage
      {
         return this._roleStage;
      }
      
      public function get backEffectStage() : MapEffectStage
      {
         return this._backEffectStage;
      }
      
      public function get topEffectStage() : MapEffectStage
      {
         return this._topEffectStage;
      }
      
      public function get pathFinder() : IPathFinder
      {
         return this._pathFinder;
      }
      
      public function set pathFinder(param1:IPathFinder) : void
      {
         this._pathFinder = param1;
      }
      
      public function get selectedRole() : IMapRole
      {
         return this.lastOverRole;
      }
      
      public function set selectedRole(param1:IMapRole) : void
      {
         this.lastOverRole = param1;
      }
      
      public function MainRoleMoveTo(param1:Point) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Point = this.backgroud.CoordToTile(new Point(this.roleStage.mainRole.x,this.roleStage.mainRole.y));
         var _loc4_:Vector.<Point> = new Vector.<Point>();
         if(this.pathFinder)
         {
            _loc4_ = this.pathFinder.CalcPaths(_loc3_,param1);
         }
         else
         {
            _loc4_.push(param1);
         }
         _loc2_ = 0;
         while(_loc2_ < _loc4_.length)
         {
            _loc4_[_loc2_] = this.backgroud.TileToCoord(_loc4_[_loc2_]);
            _loc2_++;
         }
         if(this.roleStage.mainRole)
         {
            this.roleStage.mainRole.StageClickTo(_loc4_);
            this.dispatchEvent(new MapRoleEvent(MapRoleEvent.MAIN_ROLE_MOVE_TO));
         }
      }
      
      private function MainRolePositionChangeHandler(param1:MapRoleEvent) : void
      {
         if(this.mapStageScrollMode == MapStageScrollMode.MAIN_ROLE_CENTER)
         {
            this.CheckScroll(true);
         }
         this.CheckRoleInBackground();
      }
      
      private function CheckRoleInBackground() : void
      {
         var _loc1_:Vector.<IMapRole> = null;
         var _loc2_:int = 0;
         var _loc3_:IEveryModeMapBackground = null;
         var _loc4_:DisplayObject = null;
         var _loc5_:Point = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:DisplayObjectContainer = null;
         if(this.rolesInBackgroud && this.backgroud.drawMode == TiledBackgroundDrawMode.EVERY)
         {
            _loc1_ = this.roleStage.roles;
            _loc3_ = this.backgroud as IEveryModeMapBackground;
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               _loc4_ = _loc1_[_loc2_] as DisplayObject;
               _loc5_ = this.backgroud.CoordToTile(new Point(_loc4_.x,_loc4_.y));
               _loc6_ = int(_loc5_.x / this.backgroud.data.xLength);
               _loc7_ = int(_loc5_.y / this.backgroud.data.yLength);
               if((_loc8_ = _loc3_.GetTiledPlot(_loc6_ * this.backgroud.data.height + _loc7_)) != null && _loc8_ != _loc4_.parent)
               {
                  _loc8_.addChild(_loc4_);
               }
               _loc2_++;
            }
         }
      }
      
      public function CheckScroll(param1:Boolean = false) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         if(this.mapStageScrollMode == MapStageScrollMode.MAIN_ROLE_CENTER && this.roleStage.mainRole)
         {
            _loc4_ = this.roleStage.mainRole.x;
            _loc5_ = this.roleStage.mainRole.y;
            _loc2_ = _loc4_;
            _loc3_ = _loc5_;
            if(_loc2_ < this.minLockX)
            {
               _loc2_ = this.backgroud.minScrollX;
            }
            else if(_loc2_ > this.maxLockX)
            {
               _loc2_ = this.backgroud.maxScrollX;
            }
            else
            {
               _loc2_ = _loc4_ - this.stageWidth / 2;
            }
            if(_loc3_ < this.minLockY)
            {
               _loc3_ = this.backgroud.minScrollY;
            }
            else if(_loc3_ > this.maxLockY)
            {
               _loc3_ = this.backgroud.maxScrollY;
            }
            else
            {
               _loc3_ = _loc5_ - this.stageHeight / 2;
            }
         }
         else if(this.mapStageScrollMode == MapStageScrollMode.MOUSE_DOWN_SCROLL)
         {
            if(this.mouseScorllX < this.backgroud.minScrollX)
            {
               this.mouseScorllX = this.backgroud.minScrollX;
            }
            else if(this.mouseScorllX > this.backgroud.maxScrollX)
            {
               this.mouseScorllX = this.backgroud.maxScrollX;
            }
            if(this.mouseScorllY < this.backgroud.minScrollY)
            {
               this.mouseScorllY = this.backgroud.minScrollY;
            }
            else if(this.mouseScorllY > this.backgroud.maxScrollY)
            {
               this.mouseScorllY = this.backgroud.maxScrollY;
            }
            _loc4_ = this.mouseScorllX;
            _loc5_ = this.mouseScorllY;
            _loc2_ = _loc4_;
            _loc3_ = _loc5_;
         }
         if(!isNaN(_loc2_) && !isNaN(_loc3_))
         {
            if(param1)
            {
               this.CameraTo(_loc2_,_loc3_);
            }
            else
            {
               this.$CameraTo(_loc2_,_loc3_);
            }
         }
      }
      
      public function CameraTo(param1:Number, param2:Number) : void
      {
         if(param1 < this.backgroud.minScrollX)
         {
            param1 = this.backgroud.minScrollX;
         }
         else if(param1 > this.backgroud.maxScrollX)
         {
            param1 = this.backgroud.maxScrollX;
         }
         if(param2 < this.backgroud.minScrollY)
         {
            param2 = this.backgroud.minScrollY;
         }
         else if(param2 > this.backgroud.maxScrollY)
         {
            param2 = this.backgroud.maxScrollY;
         }
         this.scrollEffect.CameraTo(this.$CameraTo,this.backgroud.scrollX,this.backgroud.scrollY,param1,param2);
      }
      
      public function $CameraTo(param1:Number, param2:Number) : void
      {
         this.mouseScorllX = param1;
         this.mouseScorllY = param2;
         var _loc3_:Rectangle = new Rectangle(param1,param2,this.stageWidth,this.stageHeight);
         switch(this.mapStageScrollMode2)
         {
            case MapStageScrollMode2.STAGE_SCROLL_RECT:
               if(this.scrollRect == null || !this.scrollRect.equals(_loc3_))
               {
                  this.scrollRect = _loc3_;
               }
               this.backgroud.scrollX = _loc3_.x;
               this.backgroud.scrollY = _loc3_.y;
               this.backgroud.ValidateView();
               break;
            case MapStageScrollMode2.LAYERS_SCROLL_RECT:
               if(this.roleStage.scrollRect == null || !this.roleStage.scrollRect.equals(_loc3_))
               {
                  this.roleStage.scrollRect = _loc3_;
               }
               if(this.backEffectStage.scrollRect == null || !this.backEffectStage.scrollRect.equals(_loc3_))
               {
                  this.backEffectStage.scrollRect = _loc3_;
               }
               if(this.topEffectStage.scrollRect == null || !this.topEffectStage.scrollRect.equals(_loc3_))
               {
                  this.topEffectStage.scrollRect = _loc3_;
               }
               if(this.topLayer.scrollRect == null || !this.topLayer.scrollRect.equals(_loc3_))
               {
                  this.topLayer.scrollRect = _loc3_;
               }
               if(this.backLayer.scrollRect == null || !this.backLayer.scrollRect.equals(_loc3_))
               {
                  this.backLayer.scrollRect = _loc3_;
               }
               this.backgroud.scrollX = _loc3_.x;
               this.backgroud.scrollY = _loc3_.y;
               this.backgroud.ValidateView();
               break;
            case MapStageScrollMode2.LAYERS_XY:
               this.roleStage.x = -_loc3_.x;
               this.roleStage.y = -_loc3_.y;
               this.backEffectStage.x = -_loc3_.x;
               this.backEffectStage.y = -_loc3_.y;
               this.topEffectStage.x = -_loc3_.x;
               this.topEffectStage.y = -_loc3_.y;
               this.topLayer.x = -_loc3_.x;
               this.topLayer.y = -_loc3_.y;
               this.backLayer.x = -_loc3_.x;
               this.backLayer.y = -_loc3_.y;
               this.backgroud.x = -_loc3_.x;
               this.backgroud.y = -_loc3_.y;
               this.backgroud.scrollX = _loc3_.x;
               this.backgroud.scrollY = _loc3_.y;
               this.backgroud.ValidateView();
         }
         var _loc4_:MapStageEvent;
         (_loc4_ = new MapStageEvent(MapStageEvent.SCROLLING)).scrollRect = _loc3_;
         this.dispatchEvent(_loc4_);
      }
   }
}
