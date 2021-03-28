package org.allencuilib.map.tiled.graphics
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import org.allencuilib.map.tiled.tmx.TmxObject;
   import org.allencuilib.map.tiled.tmx.TmxObjectgroup;
   
   public class TiledObjectData
   {
       
      
      public var color:uint;
      
      public var groupName:String;
      
      public var name:String;
      
      public var type:String;
      
      public var x:int;
      
      public var y:int;
      
      public var width:int;
      
      public var height:int;
      
      public var gid:int;
      
      public var cellX:Number;
      
      public var cellY:Number;
      
      public var cellWidth:int;
      
      public var cellHeight:int;
      
      public var properties:Object;
      
      public function TiledObjectData()
      {
         super();
      }
      
      public function LoadTmxObjectgroup(param1:TmxObjectgroup) : void
      {
         this.color = param1.color;
         this.groupName = param1.name;
      }
      
      public function LoadTmxObject(param1:TmxObject) : void
      {
         this.height = param1.height;
         this.name = param1.name;
         this.properties = param1.properties;
         this.type = param1.type;
         this.width = param1.width;
         this.x = param1.x;
         this.y = param1.y;
         this.gid = param1.gid;
         this.cellX = param1.cellX;
         this.cellY = param1.cellY;
         this.cellWidth = param1.cellWidth;
         this.cellHeight = param1.cellHeight;
      }
      
      public function GetDrawDataVector(param1:Function = null) : Vector.<Number>
      {
         var _loc2_:Point = new Point(this.x,this.y);
         var _loc3_:Point = new Point(this.x + this.width,this.y);
         var _loc4_:Point = new Point(this.x + this.width,this.y + this.height);
         var _loc5_:Point = new Point(this.x,this.y + this.height);
         if(param1 != null)
         {
            _loc2_ = param1(_loc2_);
            _loc3_ = param1(_loc3_);
            _loc4_ = param1(_loc4_);
            _loc5_ = param1(_loc5_);
         }
         var _loc6_:Vector.<Number>;
         (_loc6_ = new Vector.<Number>(10,true))[0] = _loc2_.x;
         _loc6_[1] = _loc2_.y;
         _loc6_[2] = _loc3_.x;
         _loc6_[3] = _loc3_.y;
         _loc6_[4] = _loc4_.x;
         _loc6_[5] = _loc4_.y;
         _loc6_[6] = _loc5_.x;
         _loc6_[7] = _loc5_.y;
         _loc6_[8] = _loc2_.x;
         _loc6_[9] = _loc2_.y;
         return _loc6_;
      }
      
      public function get rect() : Rectangle
      {
         return new Rectangle(this.x,this.y,this.width,this.height);
      }
      
      public function clone() : TiledObjectData
      {
         var _loc1_:TiledObjectData = new TiledObjectData();
         _loc1_.height = this.height;
         _loc1_.name = this.name;
         _loc1_.properties = this.properties;
         _loc1_.type = this.type;
         _loc1_.width = this.width;
         _loc1_.x = this.x;
         _loc1_.y = this.y;
         _loc1_.gid = this.gid;
         _loc1_.cellX = this.cellX;
         _loc1_.cellY = this.cellY;
         _loc1_.cellWidth = this.cellWidth;
         _loc1_.cellHeight = this.cellHeight;
         return _loc1_;
      }
      
      public function LoadTiledPlotData(param1:TiledPlotData) : void
      {
         if(this.type == null || this.type.length == 0)
         {
            this.type = param1.properties.Get("type");
         }
      }
   }
}
