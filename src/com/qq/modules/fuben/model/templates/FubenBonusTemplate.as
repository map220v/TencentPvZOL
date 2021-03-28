package com.qq.modules.fuben.model.templates
{
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.fuben.model.templates.ce.FubenBonusTemplateCE;
   import flash.geom.Point;
   
   public class FubenBonusTemplate extends FubenBonusTemplateCE
   {
       
      
      public function FubenBonusTemplate()
      {
         super();
      }
      
      public function getXyPoint() : Point
      {
         var _loc1_:Array = xy.split(",");
         return new Point(_loc1_[0],_loc1_[1]);
      }
      
      public function getNextDoorXyPoint() : Point
      {
         var _loc1_:Array = nextDoorXy.split(",");
         return new Point(_loc1_[0],_loc1_[1]);
      }
      
      public function getBonusItem() : ItemVO
      {
         var _loc1_:Array = bonus.split(":");
         return new ItemVO(_loc1_[0],_loc1_[1]);
      }
   }
}
