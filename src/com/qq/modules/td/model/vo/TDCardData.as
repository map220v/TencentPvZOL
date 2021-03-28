package com.qq.modules.td.model.vo
{
   import PVZ.Cmd.Dto_FriendInfo;
   import PVZ.Cmd.Dto_PlantInfo;
   import com.qq.GameGloble;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.logic.TDCropUtil;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.utils.data.PData;
   import com.tencent.protobuf.Int64;
   import org.as3commons.logging.api.getLogger;
   
   public class TDCardData
   {
      
      public static const CARD_SOURCE_NORMAL:int = 0;
      
      public static const CARD_SOURCE_FRIEND:int = 1;
      
      public static const CARD_SOURCE_VIP:int = 2;
      
      public static const CARD_CHOOSE_POS_NONE:int = 0;
      
      public static const CARD_CHOOSE_POS_ORIGINAL:int = 1;
      
      public static const CARD_CHOOSE_POS_EXTERN:int = 2;
       
      
      private var _lastTime:Number = -1;
      
      public var cardRefreshDuration:int;
      
      public var plantStaticInfo:TDPlantStaticInfo;
      
      public var plantInfo:Dto_PlantInfo;
      
      private var _price:PData;
      
      private var _id:String;
      
      public var isCoolDown:Boolean;
      
      private var _friendInfoData:Dto_FriendInfo;
      
      private var _friendCardInfo:TDFriendCardInfo;
      
      public var cardSourceType:int;
      
      public var isCanUse:Boolean;
      
      public var choosePos:int;
      
      public function TDCardData(param1:Dto_PlantInfo, param2:TDFriendCardInfo = null)
      {
         super();
         this._friendCardInfo = param2;
         if(this._friendCardInfo == null)
         {
            this._friendInfoData = new Dto_FriendInfo();
            this._friendInfoData.roleId = GameGloble.actorModel.roleId;
         }
         else
         {
            this._friendInfoData = param2.friendInfo;
         }
         this.plantStaticInfo = TDDataFactory.instance.getPlantInfoByID(param1.plantId);
         this.plantInfo = param1;
         this._price = new PData();
         if(this.plantStaticInfo != null)
         {
            this._price.set(TDCropUtil.getPlantSunCost(this.plantStaticInfo));
            this.cardRefreshDuration = TalentManager.instance.getPlantCardCoolTime(this.plantStaticInfo);
            this.cardRefreshDuration += TalentManager.instance.getPlugPlantDieCardCoolTime(this.plantStaticInfo);
         }
         else
         {
            getLogger().error("can\'t get plant staticInfo by type:  " + param1);
         }
         this._id = param1.plantId + "_" + this._friendInfoData.roleId.toString();
         this.isCoolDown = false;
      }
      
      public function setCoolDown(param1:int) : void
      {
         this._lastTime = param1;
         if(this._lastTime == -1)
         {
            this.isCoolDown = false;
         }
         else
         {
            this.isCoolDown = true;
         }
      }
      
      public function getCoolDownTime() : int
      {
         return this._lastTime;
      }
      
      public function get roleId() : Int64
      {
         return this._friendInfoData.roleId;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get price() : int
      {
         return this._price.get();
      }
      
      public function updatePrice() : void
      {
         this._price.set(TDCropUtil.getPlantSunCost(this.plantStaticInfo));
      }
      
      public function get talentData() : Array
      {
         if(this._friendInfoData == null)
         {
            return null;
         }
         return this._friendCardInfo.talentInfo;
      }
      
      public function get friendInfoData() : Dto_FriendInfo
      {
         return this._friendInfoData;
      }
   }
}
