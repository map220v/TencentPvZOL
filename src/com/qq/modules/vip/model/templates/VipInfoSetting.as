package com.qq.modules.vip.model.templates
{
   import PVZ.Cmd.Dto_IdNum;
   import com.qq.modules.vip.model.templates.ce.VipInfoCE;
   import tencent.data.ArgData;
   
   public class VipInfoSetting extends VipInfoCE
   {
       
      
      private var _privilegeList:Vector.<ArgData>;
      
      private var _weekRewardVec:Vector.<Dto_IdNum>;
      
      public function VipInfoSetting()
      {
         super();
      }
      
      public function get privilegeList() : Vector.<ArgData>
      {
         if(this._privilegeList == null)
         {
            this._privilegeList = ArgData.createVectorByString(_privilegeString);
         }
         return this._privilegeList;
      }
      
      public function getValue(param1:uint) : Array
      {
         var _loc3_:ArgData = null;
         var _loc2_:Vector.<ArgData> = this.privilegeList;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.head_int == param1)
            {
               return _loc3_.arg;
            }
         }
         return null;
      }
      
      public function get weekRewardVec() : Vector.<Dto_IdNum>
      {
         var _loc1_:Vector.<ArgData> = null;
         var _loc2_:Dto_IdNum = null;
         var _loc3_:int = 0;
         if(!this._weekRewardVec)
         {
            this._weekRewardVec = new Vector.<Dto_IdNum>();
            if(weekReward)
            {
               _loc1_ = ArgData.createVectorByString(weekReward);
               _loc3_ = 0;
               while(_loc3_ < _loc1_.length)
               {
                  _loc2_ = new Dto_IdNum();
                  _loc2_.id = _loc1_[_loc3_].head_int;
                  _loc2_.num = _loc1_[_loc3_].arg[0];
                  this._weekRewardVec.push(_loc2_);
                  _loc3_++;
               }
            }
         }
         return this._weekRewardVec;
      }
   }
}
