package com.qq.modules.dummy.model
{
   import com.qq.modules.dummy.model.templates.ce.DummyActiveSkillInfoTemplateCE;
   import com.qq.utils.UtilsManager;
   
   public class DummyActiveSkillInfoTemplate extends DummyActiveSkillInfoTemplateCE
   {
       
      
      private var _needItemList:Array;
      
      public function DummyActiveSkillInfoTemplate()
      {
         super();
      }
      
      public function getNeedItemList() : Array
      {
         if(this._needItemList == null)
         {
            this._needItemList = new Array();
            this._needItemList = UtilsManager.splitMulStr(needItems,";",":");
         }
         return this._needItemList;
      }
   }
}
