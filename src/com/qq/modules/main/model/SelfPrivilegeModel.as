package com.qq.modules.main.model
{
   import PVZ.Cmd.Dto_VipInfo;
   import PVZ.Cmd.E_DiamondType;
   import com.qq.modules.vip.model.templates.VipInfoFactory;
   import com.qq.modules.vip.model.templates.VipInfoSetting;
   import com.qq.utils.DateUtils;
   
   public class SelfPrivilegeModel
   {
       
      
      private var _vipCardId:uint = 0;
      
      private var _vipEndDate:uint;
      
      private var _vipGotGift:Boolean;
      
      private var _vipGotPhysical:uint;
      
      private var _flag:uint;
      
      private var m_growLevel:uint;
      
      private var m_privilegeVO:PrivilegeDiamond;
      
      private var _vipInfo:Dto_VipInfo;
      
      private var m_vipGotTicket:uint;
      
      public function SelfPrivilegeModel()
      {
         super();
      }
      
      public function get vipInfo() : Dto_VipInfo
      {
         return this._vipInfo;
      }
      
      public function set vipInfo(param1:Dto_VipInfo) : void
      {
         this._vipInfo = param1;
         if(param1)
         {
            this.vipCardId = param1.cardId;
            this.vipGotGift = param1.gotGift;
            this.vipEndTime = param1.endTime;
            this.vipGotPhysical = param1.todayEnergy;
            this.m_vipGotTicket = param1.todayTicket;
         }
         else
         {
            this.vipCardId = 0;
         }
      }
      
      public function getVipCost(param1:uint) : int
      {
         return 0;
      }
      
      public function get yellowLevel() : int
      {
         if(this.m_privilegeVO)
         {
            return this.m_privilegeVO.getLevel(E_DiamondType.E_DiamondType_Yellow);
         }
         return 0;
      }
      
      public function get vipGotGift() : Boolean
      {
         return this._vipGotGift;
      }
      
      public function set vipGotGift(param1:Boolean) : void
      {
         this._vipGotGift = param1;
      }
      
      public function get vipEndTime() : uint
      {
         return this._vipEndDate;
      }
      
      public function set vipEndTime(param1:uint) : void
      {
         this._vipEndDate = param1;
      }
      
      public function get vipCardId() : uint
      {
         return this._vipCardId;
      }
      
      public function get vipLevel() : uint
      {
         if(this._vipCardId == 0)
         {
            return 0;
         }
         var _loc1_:VipInfoSetting = VipInfoFactory.instance.getVipInfoById(this._vipCardId);
         return _loc1_.level;
      }
      
      public function set vipCardId(param1:uint) : void
      {
         this._vipCardId = param1;
      }
      
      public function get isExperience() : Boolean
      {
         return this._vipCardId > 3;
      }
      
      public function set vipGotPhysical(param1:uint) : void
      {
         this._vipGotPhysical = param1;
      }
      
      public function set vipGotTicket(param1:uint) : void
      {
         this.m_vipGotTicket = param1;
      }
      
      public function get vipGotTicket() : uint
      {
         return this.m_vipGotTicket;
      }
      
      public function get vipGotPhysical() : uint
      {
         return this._vipGotPhysical;
      }
      
      public function isRepay() : Boolean
      {
         if(!this.hasVip())
         {
            return false;
         }
         if(this._vipEndDate - DateUtils.getInstance().getServerTime() < 3600 * 24 * 3)
         {
            return true;
         }
         return false;
      }
      
      public function hasVip() : Boolean
      {
         return this.vipCardId != 0;
      }
      
      public function isSetDigit(param1:uint) : Boolean
      {
         if(param1 == (param1 & this._flag))
         {
            return true;
         }
         return false;
      }
      
      public function setDigit(param1:uint) : void
      {
         if(false == this.isSetDigit(param1))
         {
            this._flag |= param1;
         }
      }
      
      public function removeDigit(param1:uint) : void
      {
         if(true == this.isSetDigit(param1))
         {
            this._flag &= ~param1;
         }
      }
      
      public function set vipFlag(param1:uint) : void
      {
         this._flag = param1;
      }
      
      public function get vipFlag() : uint
      {
         return this._flag;
      }
      
      public function set growLevel(param1:uint) : void
      {
         this.m_growLevel = param1;
      }
      
      public function get growLevel() : uint
      {
         return this.m_growLevel;
      }
      
      public function get privilegeDiamond() : PrivilegeDiamond
      {
         return this.m_privilegeVO;
      }
      
      public function set privilegeDiamond(param1:PrivilegeDiamond) : void
      {
         this.m_privilegeVO = param1;
      }
   }
}
