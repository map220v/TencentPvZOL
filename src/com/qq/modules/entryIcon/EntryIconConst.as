package com.qq.modules.entryIcon
{
   import com.qq.modules.entryIcon.model.templates.ActivityIconTemplate;
   import com.qq.modules.entryIcon.model.templates.EntryIconTemplateFactory;
   import com.qq.modules.entryIcon.model.templates.SystemIconTemplate;
   import com.qq.modules.entryIcon.view.icon.BaseEntryIcon;
   
   public class EntryIconConst
   {
      
      public static const EVENT_ADD_ACTIVITY_ICON:String = "EVENT_ADD_ACTIVITY_ICON";
      
      public static const EVENT_REMOVE_ACTIVITY_ICON:String = "EVENT_REMOVE_ACTIVITY_ICON";
      
      public static const EVENT_ADD_SYSTEM_ICON:String = "EVENT_ADD_SYSTEM_ICON";
      
      public static const EVENT_REMOVE_SYSTEM_ICON:String = "EVENT_REMOVE_SYSTEM_ICON";
      
      public static const EVENT_ACTIVITY_EFFECT_CHANGE:String = "EVENT_ACTIVITY_EFFECT_CHANGE";
      
      public static const EVENT_SYSTEM_EFFECT_CHANGE:String = "EVENT_SYSTEM_EFFECT_CHANGE";
      
      public static const TYPE_ACTIVITY_ICON:int = 1;
      
      public static const TYPE_SYSTEM_ICON:int = 2;
      
      public static const GROUP_TYPE_NONE:int = 0;
      
      public static const GROUP_TYPE_PRIVILEGE:int = 1;
      
      public static const GROUP_TYPE_TD:int = 100;
      
      public static var m_system_showIconList:Array;
      
      public static var m_system_groupIconList:Array;
      
      public static var m_act_showIconList:Array;
      
      public static var m_act_groupIconList:Array;
       
      
      public function EntryIconConst()
      {
         super();
      }
      
      public static function getGroupIconViewByGroupID(param1:int, param2:int) : Array
      {
         var _loc3_:Array = null;
         var _loc5_:BaseEntryIcon = null;
         var _loc6_:ActivityIconTemplate = null;
         var _loc7_:SystemIconTemplate = null;
         var _loc4_:Array = new Array();
         if(param1 == TYPE_ACTIVITY_ICON)
         {
            _loc3_ = m_act_groupIconList;
         }
         else
         {
            _loc3_ = m_system_groupIconList;
         }
         for each(_loc5_ in _loc3_)
         {
            if(param1 == EntryIconConst.TYPE_ACTIVITY_ICON)
            {
               if((_loc6_ = EntryIconTemplateFactory.instance.getActivityIconTemplate(_loc5_.iconID)).groupID == param2)
               {
                  _loc4_.push(_loc5_);
               }
            }
            else if((_loc7_ = EntryIconTemplateFactory.instance.getSystemIconTemplate(_loc5_.iconID)).groupID == param2)
            {
               _loc4_.push(_loc5_);
            }
         }
         return _loc4_;
      }
   }
}
