package com.qq.modules.td.data.game.unit
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.utils.db.ClientDBTableName;
   
   public class TDBulletData extends TDGameObjectData
   {
       
      
      public var bulletStaticInfo:TDBulletStaticInfo;
      
      private var _param:Boolean;
      
      public function TDBulletData(param1:int, param2:int)
      {
         super(param1,param2);
      }
      
      override public function init() : void
      {
         staticInfo = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_BulletInfo,unitType,TDBulletStaticInfo);
         this.bulletStaticInfo = staticInfo as TDBulletStaticInfo;
         super.init();
         this.initSpeed();
      }
      
      override protected function initSpeed() : void
      {
         super.initSpeed();
         _baseSpeedList[SPEED_BULLET] = this.bulletStaticInfo.moveSpeed;
      }
   }
}
