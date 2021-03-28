package com.qq.modules.td.data.game.unit
{
   import com.qq.constant.td.TDConstant;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.utils.db.ClientDBTableName;
   
   public class TDNormalObjectData extends TDGameObjectData
   {
       
      
      public var objectStaticInfo:TDNormalObjectStaticInfo;
      
      public function TDNormalObjectData(param1:int, param2:int)
      {
         super(param1,param2);
      }
      
      override public function init() : void
      {
         staticInfo = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_ObjectInfo,unitType,TDNormalObjectStaticInfo);
         this.objectStaticInfo = staticInfo as TDNormalObjectStaticInfo;
         super.init();
         maxHp.set(this.objectStaticInfo.hp);
         curHp.set(this.objectStaticInfo.hp);
         if(staticInfo.hasParam(TDConstant.NormalObj_Param_AttackByPlant))
         {
            camp = TDConstant.TDCamp_Enemy;
         }
         this.initSpeed();
      }
      
      override protected function initSpeed() : void
      {
         super.initSpeed();
         if(staticInfo && staticInfo.hasParam(TDConstant.NormalObj_Param_SunDropSpeed))
         {
            _baseSpeedList[SPEED_SUNDROP] = staticInfo.getParam(TDConstant.NormalObj_Param_SunDropSpeed);
         }
      }
      
      override protected function getSortValue() : int
      {
         var _loc1_:int = this.objectStaticInfo.getParam(TDConstant.NormalObj_Param_DEPTH_ADD);
         return int(10000 + _loc1_);
      }
   }
}
