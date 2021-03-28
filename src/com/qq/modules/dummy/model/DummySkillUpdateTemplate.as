package com.qq.modules.dummy.model
{
   import com.qq.modules.dummy.model.templates.ce.DummySkillUpdateTemplateCE;
   
   public class DummySkillUpdateTemplate extends DummySkillUpdateTemplateCE
   {
       
      
      private var _needItemList:Array;
      
      public function DummySkillUpdateTemplate()
      {
         super();
      }
      
      public function get needItemList() : Array
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         if(this._needItemList == null)
         {
            this._needItemList = new Array();
            _loc1_ = _needItemStr.split(";");
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc5_ = (_loc4_ = _loc1_[_loc3_]).split(":");
               this._needItemList.push(_loc5_);
               _loc3_++;
            }
         }
         return this._needItemList;
      }
   }
}
