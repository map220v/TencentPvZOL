package com.qq.modules.map.model.templates
{
   import com.qq.modules.map.model.templates.ce.MapCellSkinTemplateCE;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MapCellSkinTemplate extends MapCellSkinTemplateCE
   {
       
      
      private var _rect:Rectangle;
      
      public function MapCellSkinTemplate()
      {
         super();
      }
      
      public function get rect() : Rectangle
      {
         if(this._rect == null)
         {
            this._rect = new Rectangle(x,y,width,height);
         }
         return this._rect;
      }
      
      public function contain(param1:Point, param2:Point) : Boolean
      {
         var _loc3_:Rectangle = this.rect.clone();
         _loc3_.offsetPoint(param1);
         return Boolean(_loc3_.containsPoint(param2));
      }
   }
}
