package com.qq.modules.entryIcon.model
{
   import com.qq.modules.entryIcon.EntryIconConst;
   import com.qq.modules.entryIcon.model.templates.ActivityIconTemplate;
   import com.qq.modules.entryIcon.model.templates.EntryIconTemplateFactory;
   
   public class ActivityIconVO extends EntryIconVO
   {
       
      
      private var m_template:ActivityIconTemplate;
      
      public function ActivityIconVO(param1:int, param2:Function = null, param3:Array = null, param4:Boolean = false)
      {
         super(param1,param2,param3,param4);
      }
      
      public function get template() : ActivityIconTemplate
      {
         if(this.m_template == null)
         {
            this.m_template = EntryIconTemplateFactory.instance.getActivityIconTemplate(id);
         }
         return this.m_template;
      }
      
      override public function get order() : Number
      {
         if(this.template)
         {
            return this.template.order;
         }
         return 0;
      }
      
      override public function get type() : int
      {
         return EntryIconConst.TYPE_ACTIVITY_ICON;
      }
      
      override public function get desc() : String
      {
         if(this.template)
         {
            return this.template.desc;
         }
         return super.desc;
      }
      
      public function get iconURL() : String
      {
         if(this.template)
         {
            return this.template.iconUrl;
         }
         return "";
      }
      
      override public function hasPolicy(param1:int) : Boolean
      {
         if(this.template)
         {
            return this.template.policy.indexOf(param1) >= 0;
         }
         return false;
      }
      
      public function get hasGroup() : Boolean
      {
         return this.template.groupID > 0;
      }
   }
}
