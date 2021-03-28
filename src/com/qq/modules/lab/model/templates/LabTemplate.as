package com.qq.modules.lab.model.templates
{
   import com.qq.modules.lab.model.templates.ce.LabTemplateCE;
   
   public class LabTemplate extends LabTemplateCE
   {
       
      
      public function LabTemplate()
      {
         super();
      }
      
      public function get upgradeCostArr() : Array
      {
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc1_:Array = [];
         var _loc2_:Array = upgradeCost.split(":");
         for each(_loc4_ in _loc2_)
         {
            _loc3_ = _loc4_.split(",");
            _loc1_.push({
               "id":_loc3_[0],
               "count":_loc3_[1]
            });
         }
         return _loc1_;
      }
      
      public function get unlockCostArr() : Array
      {
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc1_:Array = [];
         var _loc2_:Array = unlockCost.split(":");
         for each(_loc4_ in _loc2_)
         {
            _loc3_ = _loc4_.split(",");
            _loc1_.push({
               "id":_loc3_[0],
               "count":_loc3_[1]
            });
         }
         return _loc1_;
      }
      
      public function get simpleDesc() : String
      {
         var _loc1_:String = resultDescRemark.replace("全体上阵植物","");
         _loc1_ = _loc1_.replace("<font color=\"#0cef5c\">","");
         return _loc1_.replace("</font>","");
      }
   }
}
