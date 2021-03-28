package com.qq.modules.dummy
{
   import PVZ.Cmd.Dto_IdNum;
   import PVZ.Cmd.Dto_Puppet_ExtractGroupInfo;
   import com.qq.modules.dummy.model.DummyDataFactory;
   import com.qq.modules.dummy.model.DummyZombieCallTemplate;
   import com.qq.utils.DateUtils;
   
   public class DummyZombieCallInfo
   {
       
      
      private var _dto:Dto_Puppet_ExtractGroupInfo;
      
      private var _nextFreeTime:Number;
      
      private var _template:DummyZombieCallTemplate;
      
      public function DummyZombieCallInfo()
      {
         super();
      }
      
      public function reset(param1:Dto_Puppet_ExtractGroupInfo) : void
      {
         this._dto = param1;
         this._template = DummyDataFactory.getInstance().getDummyCallTemplate(this._dto.groupId);
         if(this._dto != null && this._dto.hasFree)
         {
            this._nextFreeTime = DateUtils.getInstance().getServerTime() + this._dto.freeCd;
         }
         else
         {
            this._nextFreeTime = 0;
         }
      }
      
      public function get id() : int
      {
         if(this._dto != null)
         {
            return this._dto.groupId;
         }
         return 0;
      }
      
      public function get hasFree() : Boolean
      {
         if(this._dto != null)
         {
            return this._dto.hasFree;
         }
         return false;
      }
      
      public function get nextBonusTimes() : int
      {
         if(this._dto != null && this._template != null)
         {
            return this._template.maxExtractCount - this._dto.extractCount;
         }
         return 0;
      }
      
      public function get freeTimes() : int
      {
         var _loc1_:int = 0;
         if(this._dto != null)
         {
            if(this._dto.hasFree)
            {
               _loc1_ = DateUtils.getInstance().getInterval(this._nextFreeTime);
               if(_loc1_ <= 0)
               {
                  return 1;
               }
            }
         }
         return 0;
      }
      
      public function get freeCD() : int
      {
         var _loc1_:int = 0;
         if(this._dto != null)
         {
            if(this._dto.hasFree)
            {
               _loc1_ = DateUtils.getInstance().getInterval(this._nextFreeTime);
               if(_loc1_ > 0)
               {
                  return _loc1_;
               }
               return 0;
            }
         }
         return -1;
      }
      
      public function get needItem() : Dto_IdNum
      {
         if(this._template != null)
         {
            return this._template.needItem;
         }
         return null;
      }
      
      public function get needDiamond() : Dto_IdNum
      {
         if(this._template != null)
         {
            return this._template.needDiamond;
         }
         return null;
      }
      
      public function get getItem() : Dto_IdNum
      {
         if(this._template != null)
         {
            return this._template.getItem;
         }
         return null;
      }
      
      public function get desc() : String
      {
         if(this._template != null)
         {
            return this._template.desc;
         }
         return null;
      }
   }
}
