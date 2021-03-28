package com.qq.modules.dummy.model
{
   import com.qq.modules.dummy.model.templates.ce.DummyZombieSkillTemplateCE;
   
   public class DummyZombieSkillTemplate extends DummyZombieSkillTemplateCE
   {
       
      
      private var _buffID:int = -1;
      
      public function DummyZombieSkillTemplate()
      {
         super();
      }
      
      public function get buffID() : int
      {
         var _loc1_:Array = null;
         if(this._buffID == -1)
         {
            _loc1_ = buffParam.split(":");
            if(_loc1_.length > 0)
            {
               this._buffID = _loc1_[0];
            }
         }
         return this._buffID;
      }
   }
}
