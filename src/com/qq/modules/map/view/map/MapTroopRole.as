package com.qq.modules.map.view.map
{
   import asgui.blit.data.BlitDataManager;
   import asgui.blit.display.BlitClip;
   import asgui.blit.display.IBlitClip;
   import asgui.utils.LineMath;
   import com.qq.modules.map.MapGlobals;
   import com.qq.modules.mapinfo.model.vo.MapInfoWarHistoryVO;
   import com.qq.utils.UrlManager;
   import flash.display.Sprite;
   import flash.geom.Point;
   import org.allencuilib.map.interfaces.IMapRole;
   
   public class MapTroopRole extends Sprite implements IMapRole
   {
       
      
      public var vo:MapInfoWarHistoryVO;
      
      private var anim:IBlitClip;
      
      private var _hasDisposed:Boolean;
      
      public function MapTroopRole()
      {
         super();
         this.anim = new BlitClip();
         this.anim.dataProvider = BlitDataManager.GetBlitDataByUrl(UrlManager.getUrl(0,"swf/map/car2.swf"));
         this.anim.autoUpdatePosition = true;
         this.addChild(this.anim.asset);
      }
      
      public function Dispose() : void
      {
         if(parent)
         {
            parent.removeChild(this);
         }
         if(this.anim)
         {
            this.anim.Dispose();
            this.anim = null;
         }
         this._hasDisposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function loadVO(param1:MapInfoWarHistoryVO) : void
      {
         var _loc2_:int = 0;
         this.vo = param1;
         var _loc3_:Point = MapGlobals.cellToPoint(param1.getPosFrom());
         var _loc4_:Point = MapGlobals.cellToPoint(param1.getPosTo());
         var _loc5_:Number;
         if((_loc5_ = LineMath.Radian(_loc3_,_loc4_)) < 1 * Math.PI / 8)
         {
            _loc2_ = 4;
         }
         else if(_loc5_ < 3 * Math.PI / 8)
         {
            _loc2_ = 5;
         }
         else if(_loc5_ < 5 * Math.PI / 8)
         {
            _loc2_ = 6;
         }
         else if(_loc5_ < 7 * Math.PI / 8)
         {
            _loc2_ = 7;
         }
         else if(_loc5_ < 9 * Math.PI / 8)
         {
            _loc2_ = 0;
         }
         else if(_loc5_ < 11 * Math.PI / 8)
         {
            _loc2_ = 1;
         }
         else if(_loc5_ < 13 * Math.PI / 8)
         {
            _loc2_ = 2;
         }
         else if(_loc5_ < 15 * Math.PI / 8)
         {
            _loc2_ = 3;
         }
         else
         {
            _loc2_ = 4;
         }
         this.anim.currentFrame = _loc2_;
         this.anim.Render();
      }
      
      public function StageClickTo(param1:Vector.<Point>) : void
      {
      }
      
      public function get microTargets() : Vector.<Point>
      {
         return null;
      }
      
      public function StopMoving() : void
      {
      }
      
      public function GetPixelAt(param1:Number, param2:Number) : uint
      {
         return 0;
      }
      
      public function get targetX() : Number
      {
         return 0;
      }
      
      public function get targetY() : Number
      {
         return 0;
      }
      
      public function get depth() : int
      {
         return y + 300;
      }
      
      public function advanceTime() : void
      {
         var _loc1_:Point = this.vo.getCurrentCell();
         if(_loc1_ == null)
         {
            this.Dispose();
            return;
         }
         _loc1_ = MapGlobals.cellToPoint(_loc1_);
         this.x = _loc1_.x;
         this.y = _loc1_.y;
      }
   }
}
