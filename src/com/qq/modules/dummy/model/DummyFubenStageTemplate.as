package com.qq.modules.dummy.model
{
   import com.qq.modules.dummy.model.templates.ce.DummyFubenStageTemplateCE;
   
   public class DummyFubenStageTemplate extends DummyFubenStageTemplateCE
   {
       
      
      private var _lootItemIDList:Array;
      
      public function DummyFubenStageTemplate()
      {
         super();
      }
      
      public function getLootItemIDList() : Array
      {
         if(this._lootItemIDList == null)
         {
            this._lootItemIDList = lootItemStr.split(",");
         }
         return this._lootItemIDList;
      }
   }
}
