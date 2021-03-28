package com.qq.modules.td.model.vo
{
   import com.qq.utils.data.PData;
   import org.as3commons.logging.api.getLogger;
   
   public class TDCardListData
   {
       
      
      private var _maxSlotNum:PData;
      
      private var _slotCardData:Array;
      
      public function TDCardListData()
      {
         super();
         this._maxSlotNum = new PData();
      }
      
      public function get maxSlotNum() : int
      {
         return this._maxSlotNum.get();
      }
      
      public function set maxSlotNum(param1:int) : void
      {
         this._maxSlotNum.set(param1);
      }
      
      public function get slotCardData() : Array
      {
         return this._slotCardData.concat();
      }
      
      public function reset(param1:int = 0) : void
      {
         this._maxSlotNum.set(param1);
         this._slotCardData = new Array();
      }
      
      public function getCardSlotIndex() : int
      {
         if(this._slotCardData.length >= this._maxSlotNum.get())
         {
            return -1;
         }
         return this._slotCardData.length;
      }
      
      public function getExtenalCardNum() : int
      {
         var _loc3_:TDCardData = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this._slotCardData.length)
         {
            _loc3_ = this._slotCardData[_loc2_];
            if(_loc3_.choosePos == TDCardData.CARD_CHOOSE_POS_EXTERN)
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function addCardToSlot(param1:TDCardData) : void
      {
         if(this.hasPlant(param1))
         {
            getLogger("TD").debug("卡槽中已经存在该植物" + param1.plantStaticInfo.type);
            return;
         }
         this._slotCardData.push(param1);
      }
      
      public function removeCardFromSlot(param1:TDCardData) : int
      {
         var _loc4_:TDCardData = null;
         var _loc2_:int = this._slotCardData.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this._slotCardData[_loc3_]).id == param1.id)
            {
               this._slotCardData.splice(_loc3_,1);
               return 1;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public function getPlantTypeByIndex(param1:int) : int
      {
         return this._slotCardData[param1];
      }
      
      public function hasPlant(param1:TDCardData) : Boolean
      {
         var _loc4_:TDCardData = null;
         if(this._slotCardData == null)
         {
            this._slotCardData = new Array();
         }
         var _loc2_:int = this._slotCardData.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this._slotCardData[_loc3_]).id == param1.id)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function hasPlantType(param1:int) : Boolean
      {
         var _loc4_:TDCardData = null;
         var _loc2_:int = this._slotCardData.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this._slotCardData[_loc3_]).plantStaticInfo.type == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function getFreeSkillPlantSlotIndex() : int
      {
         if(this._slotCardData.length >= this._maxSlotNum.get())
         {
            return -1;
         }
         return this._slotCardData.length;
      }
      
      public function totalSlotNum() : int
      {
         return this._slotCardData.length;
      }
      
      public function get totalCostRain() : int
      {
         var _loc2_:TDCardData = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this._slotCardData)
         {
            _loc1_ += _loc2_.plantStaticInfo.baseInfo.costWater;
         }
         return _loc1_;
      }
   }
}
