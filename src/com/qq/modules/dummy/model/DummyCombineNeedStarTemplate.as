package com.qq.modules.dummy.model
{
   import com.qq.modules.dummy.model.templates.ce.DummyCombineNeedStarTemplateCE;
   import com.qq.utils.UtilsManager;
   
   public class DummyCombineNeedStarTemplate extends DummyCombineNeedStarTemplateCE
   {
       
      
      private var _propList:Array;
      
      public function DummyCombineNeedStarTemplate()
      {
         super();
      }
      
      public function getPropList() : Array
      {
         if(this._propList == null)
         {
            this._propList = UtilsManager.splitMulStr(propStr,";",":");
         }
         return this._propList;
      }
   }
}
