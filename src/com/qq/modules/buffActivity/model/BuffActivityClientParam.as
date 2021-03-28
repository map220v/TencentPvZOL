package com.qq.modules.buffActivity.model
{
   import asgui.serialization.json.JSON;
   import com.qq.modules.activity.model.ActivityCommonInfo;
   
   public class BuffActivityClientParam
   {
       
      
      private var m_icon:String;
      
      private var m_title:String;
      
      private var m_time:String;
      
      private var m_content:String;
      
      private var m_type:String;
      
      private var m_tip:String;
      
      private var m_activityCommonInfo:ActivityCommonInfo;
      
      public function BuffActivityClientParam(param1:ActivityCommonInfo)
      {
         var str:String = null;
         var obj:Object = null;
         var value:ActivityCommonInfo = param1;
         super();
         this.m_activityCommonInfo = value;
         try
         {
            str = value.clientParam;
            obj = asgui.serialization.json.JSON.deserialize(str);
            this.m_icon = obj["icon"];
            this.m_title = obj["title"];
            this.m_time = obj["time"];
            this.m_content = obj["content"];
            this.m_type = obj["type"];
            this.m_tip = obj["tip"];
         }
         catch(e:Error)
         {
            m_icon = "";
            m_title = "";
            m_time = "";
            m_content = "";
            m_content = "";
            m_tip = "";
         }
      }
      
      public function get icon() : String
      {
         return this.m_icon;
      }
      
      public function get title() : String
      {
         return this.m_title;
      }
      
      public function get time() : String
      {
         return this.m_time;
      }
      
      public function get type() : String
      {
         return this.m_type;
      }
      
      public function get content() : String
      {
         return this.m_content;
      }
      
      public function get tip() : String
      {
         return this.m_tip;
      }
      
      public function get activityCommonInfo() : ActivityCommonInfo
      {
         return this.m_activityCommonInfo;
      }
   }
}
