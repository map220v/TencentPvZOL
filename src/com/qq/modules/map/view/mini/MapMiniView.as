package com.qq.modules.map.view.mini
{
   import asgui.core.Application;
   import asgui.core.IDisposable;
   import com.qq.modules.map.MapGlobals;
   import com.qq.modules.map.model.vo.MapBasicCellVO;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import org.allencuilib.map.MapStage;
   import org.allencuilib.map.events.MapTiledEvent;
   
   public class MapMiniView extends Sprite implements IDisposable
   {
       
      
      private var _hasDisposed:Boolean;
      
      private var map:MapStage;
      
      private var ct:Sprite;
      
      private var scaleForWidth:Number;
      
      private var scaleForHeight:Number;
      
      private var topRect:Shape;
      
      private var rectReal:Rectangle;
      
      private var rectMax:Rectangle;
      
      private var width2:int;
      
      private var height2:int;
      
      public function MapMiniView(param1:MapStage)
      {
         super();
         this.map = param1;
         param1.backgroud.addEventListener(MapTiledEvent.SCROLLING,this.onSCROLLING,false,0,true);
         this.ct = new Sprite();
         this.addChild(this.ct);
         this.topRect = new Shape();
         this.addChild(this.topRect);
         Application.application.addEventListener(Event.RESIZE,this.onRESIZE);
      }
      
      public function Dispose() : void
      {
         Application.application.removeEventListener(Event.RESIZE,this.onRESIZE);
         if(this.map)
         {
            if(this.map.backgroud)
            {
               this.map.backgroud.removeEventListener(MapTiledEvent.SCROLLING,this.onSCROLLING);
            }
            this.map = null;
         }
         this._hasDisposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      private function onSCROLLING(param1:Event) : void
      {
         this.updateScroll();
      }
      
      public function addCells(param1:Vector.<MapBasicCellVO>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:MapBasicCellVO = null;
         var _loc5_:MapMiniViewCell = null;
         var _loc2_:int = param1.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = param1[_loc3_]).isRealCell)
            {
               (_loc5_ = new MapMiniViewCell(_loc4_)).name = "cell_" + _loc4_.pos.x + "_" + _loc4_.pos.y;
               this.ct.addChild(_loc5_);
            }
            _loc3_++;
         }
         this.updateScroll();
      }
      
      public function removeCells(param1:Vector.<MapBasicCellVO>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:MapBasicCellVO = null;
         var _loc5_:MapMiniViewCell = null;
         var _loc2_:int = param1.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1[_loc3_];
            if(_loc5_ = this.ct.getChildByName("cell_" + _loc4_.pos.x + "_" + _loc4_.pos.y) as MapMiniViewCell)
            {
               this.ct.removeChild(_loc5_);
               _loc5_.Dispose();
            }
            _loc3_++;
         }
      }
      
      public function updateScroll() : void
      {
         var _loc3_:int = 0;
         var _loc4_:MapMiniViewCell = null;
         this.rectReal = MapGlobals.getViewPort(MapGlobals.MAP_VIEW_PORT_REAL_MAX,this.map.backgroud.scrollX,this.map.backgroud.scrollY);
         var _loc1_:Rectangle = MapGlobals.getViewPort(MapGlobals.MAP_VIEW_PORT_REAL_MAX,this.map.backgroud.scrollX,this.map.backgroud.scrollY);
         this.rectMax = MapGlobals.getViewPort(MapGlobals.MAP_VIEW_PORT_REQUEST_INNER,this.map.backgroud.scrollX,this.map.backgroud.scrollY);
         var _loc2_:int = this.ct.numChildren;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            (_loc4_ = this.ct.getChildAt(_loc3_) as MapMiniViewCell).updatePos(this.map.backgroud.scrollX + (this.rectMax.width - 3 * this.rectReal.width) / 2,this.map.backgroud.scrollY + (this.rectMax.height - 3 * this.rectReal.height) / 2,this.scaleForWidth * _loc1_.width / this.rectMax.width,this.scaleForHeight * _loc1_.height / this.rectMax.height);
            _loc3_++;
         }
      }
      
      public function updateResize() : void
      {
         var _loc1_:int = this.width2 * this.rectReal.width / this.rectMax.width;
         var _loc2_:int = this.height2 * this.rectReal.height / this.rectMax.height;
         this.topRect.graphics.clear();
         this.topRect.graphics.lineStyle(2,16777215,0.8);
         this.topRect.graphics.drawRect((this.width2 - _loc1_) / 2,(this.height2 - _loc2_) / 2,_loc1_,_loc2_);
      }
      
      public function setSize(param1:int, param2:int, param3:Number, param4:Number) : void
      {
         this.height2 = param2;
         this.width2 = param1;
         this.scaleForHeight = param4;
         this.scaleForWidth = param3;
         this.graphics.beginFill(0,0.5);
         this.graphics.drawRect(0,0,param1,param2);
         this.graphics.endFill();
         this.updateScroll();
         this.updateResize();
      }
      
      protected function onRESIZE(param1:Event) : void
      {
         this.updateScroll();
         this.updateResize();
      }
   }
}
