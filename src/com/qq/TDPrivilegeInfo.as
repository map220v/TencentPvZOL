package com.qq
{
   public class TDPrivilegeInfo
   {
      
      private static var _instance:TDPrivilegeInfo;
       
      
      public var hasTDPrivilege:Boolean;
      
      public var privilegeRemainTime:int;
      
      public var unlockPlantIDList:Array;
      
      public function TDPrivilegeInfo()
      {
         this.unlockPlantIDList = new Array();
         super();
      }
      
      public static function getInstance() : TDPrivilegeInfo
      {
         if(_instance == null)
         {
            _instance = new TDPrivilegeInfo();
         }
         return _instance;
      }
   }
}
