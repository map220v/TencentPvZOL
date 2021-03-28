package com.qq.modules.friend.model.vo
{
   import PVZ.Cmd.Dto_FriendInfo;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.basic.modle.vo.FriendIDVO;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.modules.td.data.game.unit.TDPlantBaseStaticInfo;
   import com.qq.utils.db.ClientDBTableName;
   
   public class FriendRoleVo extends FriendIDVO
   {
       
      
      private var _tdPlantTemplate:TDPlantBaseStaticInfo;
      
      private var _pvpPlantTemplate:BattleLineupCardTemp;
      
      public function FriendRoleVo()
      {
         super();
      }
      
      override public function load(param1:Dto_FriendInfo, param2:Boolean = false) : void
      {
         super.load(param1,param2);
         this._tdPlantTemplate = null;
         this._pvpPlantTemplate = null;
      }
      
      public function get plantId() : int
      {
         if(dto)
         {
            return dto.plantInfo.plantId;
         }
         return 0;
      }
      
      public function get avatarId() : int
      {
         if(dto)
         {
            return dto.plantInfo.avatarId;
         }
         return 0;
      }
      
      public function get tdPlantTemplate() : TDPlantBaseStaticInfo
      {
         if(this._tdPlantTemplate == null)
         {
            this._tdPlantTemplate = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_PlantTypeInfo,this.plantId,TDPlantBaseStaticInfo);
         }
         return this._tdPlantTemplate;
      }
      
      public function get pvpPlantTemplate() : BattleLineupCardTemp
      {
         if(this._pvpPlantTemplate == null)
         {
            this._pvpPlantTemplate = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateByTdPlantId(this.plantId);
         }
         return this._pvpPlantTemplate;
      }
   }
}
