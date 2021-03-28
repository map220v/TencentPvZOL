package com.qq.modules.yetiTD.model.templates.ce
{
   import com.qq.utils.UtilsManager;
   
   public class YetiTDModeTemplate extends YetiTDModeTemplateCE
   {
       
      
      private var _wishArr:Array;
      
      public function YetiTDModeTemplate()
      {
         super();
      }
      
      public function get wishArr() : Array
      {
         if(!this._wishArr)
         {
            this._wishArr = UtilsManager.splitMulStr(wishStr,";",":");
         }
         return this._wishArr;
      }
      
      public function getCostByNum(param1:int) : int
      {
         var _loc2_:Array = diamondCostStr.split(",");
         return int(_loc2_[param1 - 1]);
      }
   }
}
