package com.qq.modules.dummy.model
{
   import com.qq.modules.dummy.model.templates.ce.DummyCombineNeedLevelTemplateCE;
   import com.qq.utils.UtilsManager;
   
   public class DummyCombineNeedLevelTemplate extends DummyCombineNeedLevelTemplateCE
   {
       
      
      private var _propList:Array;
      
      public function DummyCombineNeedLevelTemplate()
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
