package com.qq.modules.entryIcon.model
{
   import flash.utils.Dictionary;
   import org.robotlegs.mvcs.Actor;
   
   public class EntryIconModel extends Actor
   {
      
      private static const TYPE_ACTIVITY:int = 1;
      
      private static const TYPE_SYSTEM:int = 2;
       
      
      private var m_vecSysIconID:Vector.<uint>;
      
      private var m_vecActIconID:Vector.<uint>;
      
      private var m_dicIcon:Dictionary;
      
      public function EntryIconModel()
      {
         super();
         this.m_vecSysIconID = new Vector.<uint>();
         this.m_vecActIconID = new Vector.<uint>();
         this.m_dicIcon = new Dictionary();
      }
      
      public function addActivityIcon(param1:uint, param2:Function = null, param3:Array = null, param4:Boolean = false) : Boolean
      {
         if(this.m_vecActIconID.indexOf(param1) < 0)
         {
            this.m_vecActIconID.push(param1);
            this.m_dicIcon[this.getActivityKey(param1)] = new ActivityIconVO(param1,param2,param3,param4);
            return true;
         }
         return false;
      }
      
      public function getAllActivityIcon() : Vector.<ActivityIconVO>
      {
         var _loc2_:String = null;
         var _loc3_:uint = 0;
         var _loc1_:Vector.<ActivityIconVO> = new Vector.<ActivityIconVO>();
         for each(_loc3_ in this.m_vecActIconID)
         {
            _loc2_ = this.getActivityKey(_loc3_);
            if(this.m_dicIcon.hasOwnProperty(_loc2_))
            {
               _loc1_.push(this.m_dicIcon[_loc2_]);
            }
         }
         return _loc1_;
      }
      
      public function getActivityIcon(param1:int) : ActivityIconVO
      {
         return this.getIcon(param1,TYPE_ACTIVITY);
      }
      
      private function getIcon(param1:int, param2:int) : *
      {
         var _loc3_:String = null;
         switch(param2)
         {
            case TYPE_ACTIVITY:
               _loc3_ = this.getActivityKey(param1);
               break;
            case TYPE_SYSTEM:
               _loc3_ = this.getSystemKey(param1);
         }
         if(this.m_dicIcon.hasOwnProperty(_loc3_))
         {
            return this.m_dicIcon[_loc3_];
         }
         return null;
      }
      
      public function getSystemIcon(param1:int) : SystemIconVO
      {
         return this.getIcon(param1,TYPE_SYSTEM);
      }
      
      public function getAllSystemIcon() : Vector.<SystemIconVO>
      {
         var _loc2_:String = null;
         var _loc3_:uint = 0;
         var _loc1_:Vector.<SystemIconVO> = new Vector.<SystemIconVO>();
         for each(_loc3_ in this.m_vecSysIconID)
         {
            _loc2_ = this.getSystemKey(_loc3_);
            if(this.m_dicIcon.hasOwnProperty(_loc2_))
            {
               _loc1_.push(this.m_dicIcon[_loc2_]);
            }
         }
         return _loc1_;
      }
      
      public function hasActivityIcon(param1:int) : Boolean
      {
         return this.m_vecActIconID.indexOf(param1) >= 0;
      }
      
      public function hasSystemIcon(param1:int) : Boolean
      {
         return this.m_vecSysIconID.indexOf(param1) >= 0;
      }
      
      public function removeActivityIcon(param1:uint) : Boolean
      {
         return this.removeIcon(param1,TYPE_ACTIVITY);
      }
      
      private function getSystemKey(param1:uint) : String
      {
         return "sys_" + param1;
      }
      
      public function addSystemIcon(param1:uint, param2:Function = null, param3:Array = null, param4:Boolean = false) : Boolean
      {
         if(this.m_vecSysIconID.indexOf(param1) < 0)
         {
            this.m_vecSysIconID.push(param1);
            this.m_dicIcon[this.getSystemKey(param1)] = new SystemIconVO(param1,param2,param3,param4);
            return true;
         }
         return false;
      }
      
      public function getSystemIconByGroupID(param1:int) : Vector.<EntryIconVO>
      {
         var _loc3_:String = null;
         var _loc4_:uint = 0;
         var _loc5_:SystemIconVO = null;
         var _loc2_:Vector.<EntryIconVO> = new Vector.<EntryIconVO>();
         for each(_loc4_ in this.m_vecSysIconID)
         {
            if((_loc5_ = this.getSystemIcon(_loc4_)).template.groupID == param1)
            {
               _loc3_ = this.getSystemKey(_loc4_);
               if(this.m_dicIcon.hasOwnProperty(_loc3_))
               {
                  _loc2_.push(this.m_dicIcon[_loc3_]);
               }
            }
         }
         return _loc2_;
      }
      
      public function removeSystemIcon(param1:uint) : Boolean
      {
         return this.removeIcon(param1,TYPE_SYSTEM);
      }
      
      private function removeIcon(param1:uint, param2:int) : Boolean
      {
         var _loc3_:Vector.<uint> = null;
         var _loc4_:String = null;
         switch(param2)
         {
            case TYPE_ACTIVITY:
               _loc3_ = this.m_vecActIconID;
               _loc4_ = this.getActivityKey(param1);
               break;
            case TYPE_SYSTEM:
               _loc3_ = this.m_vecSysIconID;
               _loc4_ = this.getSystemKey(param1);
         }
         var _loc5_:int;
         if((_loc5_ = _loc3_.indexOf(param1)) >= 0)
         {
            _loc3_.splice(_loc5_,1);
            delete this.m_dicIcon[_loc4_];
            return true;
         }
         return false;
      }
      
      private function getActivityKey(param1:uint) : String
      {
         return "act_" + param1;
      }
   }
}
