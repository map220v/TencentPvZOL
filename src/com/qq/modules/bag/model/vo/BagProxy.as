package com.qq.modules.bag.model.vo
{
   import PVZ.Cmd.Dto_ItemInfo;
   import com.qq.GameGloble;
   import com.qq.constant.ItemID;
   import com.qq.modules.bag.BagGlobals;
   import com.qq.modules.bag.ItemType;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.equipment.EquipmentUtils;
   import com.qq.modules.equipment.model.templates.EquipmentItemTemplate;
   import com.tencent.protobuf.Int64;
   import org.robotlegs.mvcs.Actor;
   
   public class BagProxy extends Actor
   {
       
      
      private var m_aryAll:Array;
      
      private var _newItemsArr:Array;
      
      private var _isHaveNew:Boolean;
      
      private var m_isHaveChange:Boolean;
      
      private var m_vecItem:Vector.<BagItemVO>;
      
      public function BagProxy()
      {
         this._newItemsArr = [];
         super();
      }
      
      public function getCurBagNum() : int
      {
         var _loc4_:Array = null;
         var _loc5_:BagItemVO = null;
         var _loc1_:int = 0;
         var _loc2_:Array = [this.m_aryAll];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if((_loc4_ = _loc2_[_loc3_]) != null)
            {
               for each(_loc5_ in _loc4_)
               {
                  if(_loc5_.equipmentVO == null)
                  {
                     _loc1_++;
                  }
                  else if(!_loc5_.equipmentVO.onUse)
                  {
                     _loc1_++;
                  }
               }
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function getIsNew(param1:Int64) : Boolean
      {
         return this._newItemsArr.hasOwnProperty(param1.toString());
      }
      
      public function set newItemsArr(param1:Array) : void
      {
         var _loc2_:Int64 = null;
         if(param1.length > 0)
         {
            for each(_loc2_ in param1)
            {
               this._newItemsArr[_loc2_.toString()] = true;
            }
            this.isHaveNew = true;
         }
      }
      
      public function get isHaveNew() : Boolean
      {
         return this._isHaveNew;
      }
      
      public function set isHaveNew(param1:Boolean) : void
      {
         this._isHaveNew = param1;
         if(!this._isHaveNew)
         {
            this._newItemsArr = [];
         }
         else
         {
            dispatch(new CommonEvent(BagGlobals.BAG_ITEM_GET_NEW));
         }
      }
      
      public function get allItems() : Vector.<BagItemVO>
      {
         var _loc1_:BagItemVO = null;
         if(this.m_vecItem == null || this.m_isHaveChange)
         {
            this.m_vecItem = new Vector.<BagItemVO>();
            for each(_loc1_ in this.m_aryAll)
            {
               this.m_vecItem.push(_loc1_);
            }
         }
         this.m_isHaveChange = false;
         return this.m_vecItem;
      }
      
      public function initItems(param1:Array) : void
      {
         var _loc2_:BagItemVO = null;
         var _loc3_:Dto_ItemInfo = null;
         this.m_aryAll = [];
         for each(_loc3_ in param1)
         {
            this.addItem(this.createItem(_loc3_));
         }
      }
      
      private function createItem(param1:Dto_ItemInfo) : BagItemVO
      {
         var _loc2_:BagItemVO = BagItemVO.createByItemInfo(param1);
         if(param1.hasTableInfo)
         {
            ItemTemplateFactory.instance.addBagItemTemplate(param1.tableInfo);
         }
         return _loc2_;
      }
      
      private function addItem(param1:BagItemVO) : void
      {
         if(this.m_aryAll && param1.template != null)
         {
            this.m_aryAll[param1.uid] = param1;
         }
      }
      
      private function removeItem(param1:Int64) : void
      {
         if(this.m_aryAll)
         {
            delete this.m_aryAll[param1];
         }
      }
      
      public function updateItem(param1:Dto_ItemInfo) : void
      {
         var _loc2_:BagItemVO = null;
         var _loc3_:Boolean = false;
         if(param1.num <= 0)
         {
            this.removeItem(param1.uid);
         }
         else
         {
            _loc2_ = this.getItemByUID(param1.uid);
            _loc3_ = false;
            if(_loc2_ == null)
            {
               _loc2_ = this.createItem(param1);
               _loc3_ = true;
               this.addItem(_loc2_);
            }
            else
            {
               if(param1.num > _loc2_.count)
               {
                  _loc3_ = true;
               }
               _loc2_.count = param1.num;
               _loc2_.updateByEquipInfo(param1.equip);
            }
            if(_loc3_)
            {
               this._newItemsArr[param1.uid.toString()] = true;
               this.isHaveNew = true;
            }
            this.m_isHaveChange = true;
         }
      }
      
      public function getItemByUID(param1:Int64) : BagItemVO
      {
         var _loc2_:BagItemVO = null;
         if(this.m_aryAll)
         {
            _loc2_ = this.m_aryAll[param1];
         }
         return _loc2_;
      }
      
      public function getItemNumByType(param1:int) : int
      {
         var _loc3_:BagItemVO = null;
         var _loc2_:int = 0;
         for each(_loc3_ in this.m_aryAll)
         {
            if(_loc3_.template.type == param1)
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
      
      public function getItemNumByItemID(param1:uint) : int
      {
         var _loc3_:BagItemVO = null;
         if(param1 == ItemID.Coin)
         {
            return GameGloble.actorModel.actorCoin;
         }
         if(param1 == ItemID.FriendPoint)
         {
            return GameGloble.actorModel.friendPoint;
         }
         if(param1 == ItemID.GiftDiamond1)
         {
            return GameGloble.actorModel.giftDiamond;
         }
         if(param1 == ItemID.GiftDiamond2)
         {
            return GameGloble.actorModel.giftDiamond;
         }
         if(param1 == ItemID.GoldDiamond)
         {
            return GameGloble.actorModel.goldDiamond;
         }
         if(param1 == ItemID.DummySkillPoint)
         {
            return GameGloble.actorModel.dummySkillPoint;
         }
         if(param1 == ItemID.DummyEnergy)
         {
            return GameGloble.actorModel.dummyFubenEnergy;
         }
         if(param1 == ItemID.Prestige)
         {
            return GameGloble.actorModel.prestige;
         }
         var _loc2_:int = 0;
         var _loc4_:Array = this.m_aryAll;
         for each(_loc3_ in _loc4_)
         {
            if(_loc3_ && _loc3_.itemID == param1)
            {
               _loc2_ += _loc3_.count;
            }
         }
         return _loc2_;
      }
      
      public function isHaveAllItems(param1:Array) : Boolean
      {
         var _loc2_:Object = null;
         for each(_loc2_ in param1)
         {
            if(this.getItemNumByItemID(_loc2_.id) < _loc2_.count)
            {
               return false;
            }
         }
         return true;
      }
      
      public function getItemsByItemID(param1:uint) : Vector.<BagItemVO>
      {
         var _loc4_:BagItemVO = null;
         var _loc2_:Vector.<BagItemVO> = new Vector.<BagItemVO>();
         var _loc3_:Array = this.m_aryAll;
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.itemID == param1)
            {
               _loc2_.push(_loc4_);
            }
         }
         return _loc2_;
      }
      
      public function getItemsByType(param1:Array = null, param2:Array = null, param3:Array = null, param4:Boolean = false) : Vector.<BagItemVO>
      {
         var _loc6_:Boolean = false;
         var _loc7_:BagItemVO = null;
         var _loc5_:Vector.<BagItemVO> = new Vector.<BagItemVO>();
         for each(_loc7_ in this.m_aryAll)
         {
            _loc6_ = true;
            if(param1 != null && param1.indexOf(_loc7_.template.mainType))
            {
               _loc6_ = false;
            }
            else if(param2 != null && param2.indexOf(_loc7_.template.type) < 0)
            {
               _loc6_ = false;
            }
            else if(param3 != null && param3.indexOf(_loc7_.template.subType) < 0)
            {
               _loc6_ = false;
            }
            else if(param4)
            {
               if(_loc7_.equipmentVO && _loc7_.equipmentVO.onUse)
               {
                  _loc6_ = false;
               }
            }
            if(_loc6_)
            {
               _loc5_.push(_loc7_);
            }
         }
         return _loc5_;
      }
      
      public function getPuzzleItem() : Vector.<BagItemVO>
      {
         var _loc2_:BagItemVO = null;
         var _loc1_:Vector.<BagItemVO> = new Vector.<BagItemVO>();
         for each(_loc2_ in this.m_aryAll)
         {
            if(_loc2_.template.type == ItemType.TYPE_PUZZLE)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function getEquipByPosition(param1:int, param2:int, param3:Boolean = false) : Vector.<BagItemVO>
      {
         var _loc6_:EquipmentItemTemplate = null;
         var _loc7_:BagItemVO = null;
         var _loc4_:Vector.<BagItemVO> = new Vector.<BagItemVO>();
         var _loc5_:Vector.<BagItemVO> = this.getItemsByType(null,[ItemType.TYPE_EQUIP],null,param3);
         for each(_loc7_ in _loc5_)
         {
            if((_loc6_ = _loc7_.equipmentVO.template).position == param1)
            {
               if(_loc6_.plantType == 0 || _loc6_.plantType == param2)
               {
                  _loc4_.push(_loc7_);
               }
            }
         }
         return _loc4_;
      }
      
      public function getEquipmentByPositionInBag(param1:int, param2:int) : Vector.<BagItemVO>
      {
         var _loc5_:EquipmentItemTemplate = null;
         var _loc6_:BagItemVO = null;
         var _loc3_:Vector.<BagItemVO> = new Vector.<BagItemVO>();
         var _loc4_:Vector.<BagItemVO> = this.getItemsByType(null,[ItemType.TYPE_EQUIP],null,false);
         for each(_loc6_ in _loc4_)
         {
            if(_loc6_.equipmentVO.onUse == false)
            {
               if((_loc5_ = _loc6_.equipmentVO.template).position == param1)
               {
                  if(_loc5_.plantType == 0 || _loc5_.plantType == param2)
                  {
                     _loc3_.push(_loc6_);
                  }
               }
            }
         }
         return _loc3_;
      }
      
      public function getAllEquipment(param1:Boolean = true) : Vector.<BagItemVO>
      {
         var _loc2_:Vector.<BagItemVO> = null;
         var _loc4_:BagItemVO = null;
         var _loc3_:Vector.<BagItemVO> = this.getItemsByType(null,[ItemType.TYPE_EQUIP],null,false);
         if(param1)
         {
            _loc2_ = new Vector.<BagItemVO>();
            for each(_loc4_ in _loc3_)
            {
               if(_loc4_.equipmentVO.isClone == false)
               {
                  _loc2_.push(_loc4_);
               }
            }
         }
         else
         {
            _loc2_ = _loc3_;
         }
         return _loc2_;
      }
      
      public function getAllCloneEquipment(param1:Boolean = true) : Vector.<BagItemVO>
      {
         var _loc4_:BagItemVO = null;
         var _loc2_:Vector.<BagItemVO> = new Vector.<BagItemVO>();
         var _loc3_:Vector.<BagItemVO> = this.getItemsByType(null,[ItemType.TYPE_EQUIP],null,param1);
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.equipmentVO.isClone)
            {
               _loc2_.push(_loc4_);
            }
         }
         return _loc2_;
      }
      
      public function clearAllCloneEquipment() : Boolean
      {
         var _loc2_:BagItemVO = null;
         var _loc1_:Vector.<BagItemVO> = this.getAllCloneEquipment(true);
         if(_loc1_ && _loc1_.length > 0)
         {
            for each(_loc2_ in _loc1_)
            {
               this.removeItem(_loc2_.uid);
            }
            return true;
         }
         return false;
      }
      
      public function getEquipOnCardPosition(param1:Int64, param2:int) : BagItemVO
      {
         var _loc3_:BagItemVO = null;
         for each(_loc3_ in this.m_aryAll)
         {
            if(EquipmentUtils.checkEquipmentInCard(_loc3_.equipmentVO,param1) && EquipmentUtils.checkEquipmentPosition(_loc3_.equipmentVO,param2))
            {
               return _loc3_;
            }
         }
         return null;
      }
   }
}
