package com.qq.modules.map.model.templates
{
   import com.qq.modules.map.model.templates.ce.MapTempleTemplateCE;
   import flash.geom.Point;
   
   public class MapTempleTemplate extends MapTempleTemplateCE
   {
       
      
      private var m_ptPos:Point;
      
      private var m_ptPreviewPos:Point;
      
      public function MapTempleTemplate()
      {
         super();
      }
      
      public function getPos() : Point
      {
         var _loc1_:Array = null;
         if(!this.m_ptPos)
         {
            _loc1_ = pos.split(",");
            this.m_ptPos = new Point(_loc1_[0],_loc1_[1]);
         }
         return this.m_ptPos;
      }
      
      public function getPreviewPos() : Point
      {
         var _loc1_:Array = null;
         if(this.m_ptPreviewPos == null)
         {
            _loc1_ = previewPos.split(",");
            this.m_ptPreviewPos = new Point(_loc1_[0],_loc1_[1]);
         }
         return this.m_ptPreviewPos;
      }
      
      public function checkPos(param1:int, param2:int) : Boolean
      {
         return this.getPos().x == param1 && this.getPos().y == param2;
      }
   }
}
