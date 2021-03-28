package com.qq.modules.equipment.model
{
   import PVZ.Cmd.Dto_EquipEffect;
   import PVZ.Cmd.Dto_EquipInfo;
   import com.qq.modules.equipment.EquipmentUtils;
   import com.qq.modules.equipment.model.templates.EquipmentItemTemplate;
   import com.qq.modules.speed.model.templates.SpeedTemplateFactory;
   import com.tencent.protobuf.Int64;
   
   public class EquipmentVO
   {
       
      
      private var m_cardUID:Int64;
      
      private var m_level:int;
      
      private var m_levelExp:int;
      
      private var m_rank:int;
      
      private var m_rankPercent:int;
      
      private var m_isClone:Boolean;
      
      private var m_property:EquipmentAttribute;
      
      private var m_score:int;
      
      private var m_speed:int;
      
      private var m_template:EquipmentItemTemplate;
      
      public function EquipmentVO()
      {
         super();
         this.m_property = new EquipmentAttribute();
      }
      
      public function set itemTID(param1:int) : void
      {
         this.m_template = EquipmentFactory.instance.getEquipmentItemByItemID(param1);
      }
      
      public function get star() : int
      {
         return EquipmentUtils.getStarByRank(this.rank);
      }
      
      public function get onUse() : Boolean
      {
         if(this.m_cardUID)
         {
            return this.m_cardUID.isZero() == false;
         }
         return false;
      }
      
      public function get template() : EquipmentItemTemplate
      {
         return this.m_template;
      }
      
      public function set cardUID(param1:Int64) : void
      {
         this.m_cardUID = param1;
      }
      
      public function get cardUID() : Int64
      {
         return this.m_cardUID;
      }
      
      public function get rank() : int
      {
         return this.m_rank;
      }
      
      public function set rank(param1:int) : void
      {
         this.m_rank = param1;
         this.m_score = EquipmentUtils.getScore(this);
      }
      
      public function get speed() : int
      {
         return this.m_speed;
      }
      
      public function get quality() : int
      {
         return EquipmentUtils.getQualityByRank(this.m_rank);
      }
      
      public function get rankPercent() : int
      {
         return this.m_rankPercent;
      }
      
      public function set rankPercent(param1:int) : void
      {
         this.m_rankPercent = param1;
      }
      
      public function get isClone() : Boolean
      {
         return this.m_isClone;
      }
      
      public function set isClone(param1:Boolean) : void
      {
         this.m_isClone = param1;
      }
      
      public function get levelExp() : int
      {
         return this.m_levelExp;
      }
      
      public function set levelExp(param1:int) : void
      {
         this.m_levelExp = param1;
      }
      
      public function get level() : int
      {
         return this.m_level;
      }
      
      public function set level(param1:int) : void
      {
         this.m_level = param1;
         this.m_score = EquipmentUtils.getScore(this);
         this.m_speed = SpeedTemplateFactory.instance.getSpeedForEquipment(param1);
      }
      
      public function get score() : int
      {
         return this.m_score;
      }
      
      public function get property() : EquipmentAttribute
      {
         return this.m_property;
      }
      
      public function updateByInfo(param1:Dto_EquipInfo) : void
      {
         var _loc2_:Dto_EquipEffect = null;
         this.cardUID = param1.iCardUId;
         this.rank = param1.quality;
         this.level = param1.level;
         this.levelExp = param1.exp;
         this.isClone = param1.isClone;
         this.rankPercent = param1.gradePercent;
         this.m_property.reset();
         for each(_loc2_ in param1.equipEffect)
         {
            this.m_property.setAttribute(_loc2_.iType,_loc2_.iValue);
         }
      }
   }
}
