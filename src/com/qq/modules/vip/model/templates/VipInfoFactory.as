package com.qq.modules.vip.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.main.model.templates.PrivilegeTemplateFactory;
   import com.qq.modules.main.model.templates.ce.PrivilegeConditoinCE;
   import com.qq.modules.main.model.templates.ce.PrivilegeInfoCE;
   import com.qq.modules.vip.constant.VipConst;
   import com.qq.modules.vip.model.templates.ce.VipBuyCountTemplateCE;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.db.ClientDBTableName;
   import org.as3commons.logging.api.getLogger;
   import tencent.base.utils.StringUtil;
   import tencent.data.ArgData;
   
   public class VipInfoFactory
   {
      
      private static var _instance:VipInfoFactory;
       
      
      private var _vipInfoList:Vector.<VipInfoSetting>;
      
      private var m_vecVipBuyCount:Vector.<VipBuyCountTemplateCE>;
      
      public function VipInfoFactory()
      {
         super();
         this._vipInfoList = Vector.<VipInfoSetting>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_VipInfo,VipInfoSetting));
         this.m_vecVipBuyCount = Vector.<VipBuyCountTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_VIP_BUY_COUNT,VipBuyCountTemplateCE));
      }
      
      public static function get instance() : VipInfoFactory
      {
         if(_instance == null)
         {
            _instance = new VipInfoFactory();
         }
         return _instance;
      }
      
      public function getVipInfoNum() : int
      {
         return this._vipInfoList.length;
      }
      
      public function getVipInfoByIndex(param1:int) : VipInfoSetting
      {
         return this._vipInfoList[param1 - 1];
      }
      
      public function getVipInfoById(param1:int) : VipInfoSetting
      {
         var _loc2_:int = this._vipInfoList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this._vipInfoList[_loc3_].id == param1)
            {
               return this._vipInfoList[_loc3_];
            }
            _loc3_++;
         }
         getLogger().warn("无法找到对应的vip配置!");
         return null;
      }
      
      public function getVipName(param1:int) : String
      {
         var _loc2_:VipInfoSetting = this.getVipInfoById(param1);
         return !!_loc2_ ? _loc2_.name : "";
      }
      
      public function getVipPrivilegeInfoById(param1:int) : PrivilegeInfoCE
      {
         return PrivilegeTemplateFactory.instance.getPrivilegeTempById(param1);
      }
      
      public function getVipPrivilegeArgData(param1:uint, param2:int) : ArgData
      {
         var _loc3_:VipInfoSetting = this.getVipInfoByIndex(param1);
         var _loc4_:int = _loc3_.privilegeList.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if(_loc3_.privilegeList[_loc5_].head_int == param2)
            {
               return _loc3_.privilegeList[_loc5_] as ArgData;
            }
            _loc5_++;
         }
         return null;
      }
      
      public function getEnergyVipAdd(param1:int) : int
      {
         var _loc2_:VipInfoSetting = this.getVipInfoById(param1);
         if(!_loc2_)
         {
            return 0;
         }
         var _loc3_:int = _loc2_.privilegeList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_.privilegeList[_loc4_].head == VipConst.VIP_ROLE_ENERGY.toString())
            {
               return Number(_loc2_.privilegeList[_loc4_].arg[0]);
            }
            _loc4_++;
         }
         return 0;
      }
      
      public function getCoinVipAdd(param1:int) : int
      {
         var _loc2_:VipInfoSetting = this.getVipInfoById(param1);
         var _loc3_:int = _loc2_.privilegeList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_.privilegeList[_loc4_].head == VipConst.VIP_FUBEN_TD_COIN_ADD.toString())
            {
               return Number(_loc2_.privilegeList[_loc4_].arg[0]);
            }
            _loc4_++;
         }
         return 0;
      }
      
      public function getFubenFightTimeVipAdd(param1:int) : int
      {
         var _loc2_:VipInfoSetting = this.getVipInfoById(param1);
         var _loc3_:int = _loc2_.privilegeList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_.privilegeList[_loc4_].head == VipConst.VIP_FUBEN_SWEEP_TIME.toString())
            {
               return Number(_loc2_.privilegeList[_loc4_].arg[0]);
            }
            _loc4_++;
         }
         return 0;
      }
      
      public function getXiaojinlongFightTimeVipAdd(param1:int) : int
      {
         var _loc2_:VipInfoSetting = this.getVipInfoById(param1);
         var _loc3_:int = _loc2_.privilegeList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_.privilegeList[_loc4_].head == VipConst.VIP_TD_XIAO_JIN_LONG.toString())
            {
               return Number(_loc2_.privilegeList[_loc4_].arg[0]);
            }
            _loc4_++;
         }
         return 0;
      }
      
      public function getPhyscialGetNum(param1:int) : int
      {
         var _loc2_:VipInfoSetting = this.getVipInfoById(param1);
         var _loc3_:int = _loc2_.privilegeList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_.privilegeList[_loc4_].head == VipConst.VIP_PHYSICAL_GET.toString())
            {
               return Number(_loc2_.privilegeList[_loc4_].arg[0]);
            }
            _loc4_++;
         }
         return 0;
      }
      
      public function getPrivilegeVipMaxLevelName(param1:uint, param2:Boolean = false) : String
      {
         var _loc3_:int = this._vipInfoList.length;
         var _loc4_:String = "";
         var _loc5_:uint;
         if((_loc5_ = this.getPrivilegeVipMaxLevelIndex(param1)) != 0)
         {
            if(param2)
            {
               _loc4_ = this.getVipShortName(_loc5_);
            }
            else
            {
               _loc4_ = this.getVipName(_loc5_);
            }
         }
         return _loc4_;
      }
      
      public function getPrivilegeVipMinLevelName(param1:uint, param2:Boolean = false) : String
      {
         var _loc3_:int = this._vipInfoList.length;
         var _loc4_:String = "";
         var _loc5_:uint;
         if((_loc5_ = this.getPrivilegeVipMinLevelInfoByID(param1)) != 0)
         {
            if(param2)
            {
               _loc4_ = this.getVipShortName(_loc5_);
            }
            else
            {
               _loc4_ = this.getVipName(_loc5_);
            }
         }
         return _loc4_;
      }
      
      public function getPrivilegeVipMaxLevelIndex(param1:uint) : int
      {
         var _loc6_:ArgData = null;
         var _loc7_:int = 0;
         var _loc2_:int = this._vipInfoList.length;
         var _loc3_:uint = 0;
         var _loc4_:Number = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            if(this._vipInfoList[_loc5_].vipType == 1)
            {
               _loc7_ = 0;
               while(_loc7_ < this._vipInfoList[_loc5_].privilegeList.length)
               {
                  if(this._vipInfoList[_loc5_].privilegeList[_loc7_].head_int == param1)
                  {
                     if(this._vipInfoList[_loc5_].privilegeList[_loc7_].arg[0] >= _loc4_)
                     {
                        _loc3_ = this._vipInfoList[_loc5_].id;
                        _loc4_ = this._vipInfoList[_loc5_].privilegeList[_loc7_].arg[0];
                     }
                  }
                  _loc7_++;
               }
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function getPrivilegeVipMinLevelInfoByID(param1:uint) : int
      {
         var _loc2_:VipInfoSetting = this.getPrivilegeVipMinLevelTemplate(param1);
         if(_loc2_)
         {
            return _loc2_.id;
         }
         return 0;
      }
      
      public function getPrivilegeVipMinLevelTemplate(param1:uint) : VipInfoSetting
      {
         var _loc4_:int = 0;
         var _loc2_:int = this._vipInfoList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this._vipInfoList[_loc3_].vipType == 1)
            {
               _loc4_ = 0;
               while(_loc4_ < this._vipInfoList[_loc3_].privilegeList.length)
               {
                  if(this._vipInfoList[_loc3_].privilegeList[_loc4_].head_int == param1)
                  {
                     return this._vipInfoList[_loc3_];
                  }
                  _loc4_++;
               }
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getVipPrivilegeDesc(param1:uint, param2:uint) : String
      {
         var _loc5_:PrivilegeInfoCE = null;
         var _loc3_:ArgData = this.getVipPrivilegeArgData(param1,param2);
         var _loc4_:String = "";
         if(_loc3_)
         {
            _loc5_ = this.getVipPrivilegeInfoById(param2);
            _loc4_ = StringUtil.substitute(_loc5_.desc,StringUtil.substitute(_loc5_.unit,int(_loc3_.arg[0])));
         }
         return _loc4_;
      }
      
      public function getPrivilegeConditionDesc(param1:uint, param2:Boolean = false) : String
      {
         var _loc3_:String = "";
         var _loc4_:PrivilegeConditoinCE;
         if((_loc4_ = PrivilegeTemplateFactory.instance.getPrivilegeConditionById(param1)) != null)
         {
            _loc3_ = StringUtil.substitute(FontHKHB.VIP_PRIVILEGE_NEED_LEVEL_TIP,_loc4_.needLv);
         }
         var _loc5_:String = VipInfoFactory.instance.getPrivilegeVipMinLevelName(param1,param2);
         return _loc3_.concat("\n",StringUtil.substitute(FontHKHB.VIP_PRIVILEGE_NEED_VIP_TIP,_loc5_));
      }
      
      public function getVipShortName(param1:int) : String
      {
         return "VIP" + param1;
      }
      
      public function getBuyCountCost(param1:int, param2:int) : int
      {
         var _loc3_:VipBuyCountTemplateCE = this.getBuyCountTemplate(param1,param2);
         if(_loc3_)
         {
            return _loc3_.diamond;
         }
         return 0;
      }
      
      public function getBuyCountTemplate(param1:int, param2:int) : VipBuyCountTemplateCE
      {
         var _loc3_:VipBuyCountTemplateCE = null;
         for each(_loc3_ in this.m_vecVipBuyCount)
         {
            if(_loc3_.type == param1 && _loc3_.count == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
   }
}
