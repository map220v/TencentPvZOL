package com.qq.modules.dummy.model
{
   import com.qq.modules.dummy.model.templates.ce.DummyCombineTemplateCE;
   
   public class DummyCombineTemplate extends DummyCombineTemplateCE
   {
       
      
      private var _dummyIDList:Array;
      
      public function DummyCombineTemplate()
      {
         super();
      }
      
      public function getDummyIDList() : Array
      {
         if(this._dummyIDList == null)
         {
            this._dummyIDList = _combineStr.split(",");
         }
         return this._dummyIDList;
      }
   }
}
