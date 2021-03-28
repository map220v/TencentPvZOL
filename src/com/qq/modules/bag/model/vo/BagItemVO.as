package com.qq.modules.bag.model.vo
{
   import PVZ.Cmd.Dto_EquipInfo;
   import PVZ.Cmd.Dto_ItemInfo;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.equipment.model.EquipmentVO;
   import com.tencent.protobuf.Int64;
   
   public class BagItemVO
   {
       
      
      private var m_uid:Int64;
      
      private var m_itemID:int;
      
      private var m_count:int;
      
      private var m_equipmentVO:EquipmentVO;
      
      private var m_template:BagItemTemplate;
      
      private var m_originalEquipment:Dto_EquipInfo;
      
      public function BagItemVO(param1:Int64, param2:int)
      {
         super();
         this.m_uid = param1;
         this.itemID = param2;
      }
      
      public static function createByItemInfo(param1:Dto_ItemInfo) : BagItemVO
      {
         var _loc2_:BagItemVO = new BagItemVO(param1.uid,param1.id);
         _loc2_.count = param1.num;
         _loc2_.updateByEquipInfo(param1.equip);
         return _loc2_;
      }
      
      public function get template() : BagItemTemplate
      {
         return this.m_template;
      }
      
      public function get uid() : Int64
      {
         return this.m_uid;
      }
      
      public function get itemID() : int
      {
         return this.m_itemID;
      }
      
      public function set count(param1:int) : void
      {
         this.m_count = param1;
      }
      
      public function get count() : int
      {
         return this.m_count;
      }
      
      public function get equipmentVO() : EquipmentVO
      {
         return this.m_equipmentVO;
      }
      
      public function updateByEquipInfo(param1:Dto_EquipInfo) : void
      {
         if(param1)
         {
            if(this.m_equipmentVO == null)
            {
               this.m_equipmentVO = new EquipmentVO();
               this.m_equipmentVO.itemTID = this.m_itemID;
            }
            this.m_equipmentVO.updateByInfo(param1);
         }
         else
         {
            this.m_equipmentVO = null;
         }
         this.m_originalEquipment = param1;
      }
      
      public function set itemID(param1:int) : void
      {
         this.m_itemID = param1;
         this.m_template = ItemTemplateFactory.instance.getBagItemTemplateById(this.m_itemID);
         if(this.m_equipmentVO)
         {
            this.m_equipmentVO.itemTID = this.m_itemID;
         }
      }
      
      public function get sellPrice() : Number
      {
         if(this.m_template == null)
         {
            return 0;
         }
         if(this.m_originalEquipment != null && this.m_originalEquipment.isClone)
         {
            return 0;
         }
         return this.m_template.sellPrice;
      }
      
      public function clone() : BagItemVO
      {
         var _loc1_:BagItemVO = new BagItemVO(this.uid,this.itemID);
         _loc1_.count = this.count;
         _loc1_.updateByEquipInfo(this.m_originalEquipment);
         return _loc1_;
      }
   }
}
