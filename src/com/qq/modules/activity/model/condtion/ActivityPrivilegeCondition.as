package com.qq.modules.activity.model.condtion
{
   import PVZ.Cmd.Dto_FlexibleActivityPlatformPrivilegeInfo;
   
   public class ActivityPrivilegeCondition
   {
       
      
      private var m_platformID:uint;
      
      private var m_diamondType:uint;
      
      private var m_diamondCondition:ActivityValueCondition;
      
      private var m_growLevelCondition:ActivityValueCondition;
      
      public function ActivityPrivilegeCondition(param1:Dto_FlexibleActivityPlatformPrivilegeInfo)
      {
         super();
         this.m_platformID = param1.iPlatformId;
         this.m_diamondType = param1.diamond;
         this.m_diamondCondition = ActivityValueCondition.createByCompare(param1.diamondLevel);
         this.m_growLevelCondition = ActivityValueCondition.createByCompare(param1.growLevel3366);
      }
      
      public function get diamondCondition() : ActivityValueCondition
      {
         return this.m_diamondCondition;
      }
      
      public function get growLevelCondition() : ActivityValueCondition
      {
         return this.m_growLevelCondition;
      }
      
      public function get platformID() : int
      {
         return this.m_platformID;
      }
      
      public function get diamondType() : int
      {
         return this.m_diamondType;
      }
   }
}
