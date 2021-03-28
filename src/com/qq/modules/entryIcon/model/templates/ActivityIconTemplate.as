package com.qq.modules.entryIcon.model.templates
{
   import com.qq.modules.entryIcon.model.templates.ce.ActivityIconTemplateCE;
   
   public class ActivityIconTemplate extends ActivityIconTemplateCE
   {
       
      
      private var m_vecPolicy:Vector.<uint>;
      
      public function ActivityIconTemplate()
      {
         super();
      }
      
      public function get policy() : Vector.<uint>
      {
         var _loc1_:Array = null;
         var _loc2_:uint = 0;
         if(this.m_vecPolicy == null)
         {
            this.m_vecPolicy = new Vector.<uint>();
            _loc1_ = originalFlashPolicy.split(",");
            for each(_loc2_ in _loc1_)
            {
               this.m_vecPolicy.push(_loc2_);
            }
         }
         return this.m_vecPolicy;
      }
   }
}
