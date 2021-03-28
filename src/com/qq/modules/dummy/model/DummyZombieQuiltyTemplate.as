package com.qq.modules.dummy.model
{
   import PVZ.Cmd.Dto_IdNum;
   import com.qq.modules.dummy.model.templates.ce.DummyZombieQuiltyTemplateCE;
   
   public class DummyZombieQuiltyTemplate extends DummyZombieQuiltyTemplateCE
   {
       
      
      private var _needEquipmentList:Array;
      
      private var _exchangeNeedItemNum:int;
      
      private var _losslessItemInfo:Dto_IdNum;
      
      public function DummyZombieQuiltyTemplate()
      {
         super();
      }
      
      public function get losslessItem() : Dto_IdNum
      {
         var _loc1_:Array = null;
         if(this._losslessItemInfo == null)
         {
            _loc1_ = losslessItemStr.split(":");
            this._losslessItemInfo = new Dto_IdNum();
            this._losslessItemInfo.id = _loc1_[0];
            this._losslessItemInfo.num = _loc1_[1];
         }
         return this._losslessItemInfo;
      }
      
      public function get needEquipmentList() : Array
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         if(this._needEquipmentList == null)
         {
            this._needEquipmentList = new Array();
            _loc1_ = needEquipmentStr.split(";");
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc5_ = (_loc4_ = _loc1_[_loc3_]).split(":");
               this._needEquipmentList.push(_loc5_);
               _loc3_++;
            }
         }
         return this._needEquipmentList;
      }
      
      public function getExchangeNeedItemNum() : int
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         if(this._exchangeNeedItemNum == 0)
         {
            _loc1_ = exchangeNeedItemStr.split(";");
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc5_ = (_loc4_ = _loc1_[_loc3_]).split(":");
               this._exchangeNeedItemNum = _loc5_[1];
               _loc3_++;
            }
         }
         return this._exchangeNeedItemNum;
      }
   }
}
