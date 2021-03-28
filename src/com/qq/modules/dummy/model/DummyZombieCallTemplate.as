package com.qq.modules.dummy.model
{
   import PVZ.Cmd.Dto_IdNum;
   import com.qq.modules.dummy.model.templates.ce.DummyZombieCallTemplateCE;
   
   public class DummyZombieCallTemplate extends DummyZombieCallTemplateCE
   {
       
      
      private var _needItem:Dto_IdNum;
      
      private var _needDiamond:Dto_IdNum;
      
      private var _getItem:Dto_IdNum;
      
      private var _dropItemList:Array;
      
      public function DummyZombieCallTemplate()
      {
         super();
      }
      
      public function get needItem() : Dto_IdNum
      {
         var _loc1_:Array = null;
         if(this._needItem == null)
         {
            this._needItem = new Dto_IdNum();
            _loc1_ = needItemStr.split(":");
            this._needItem.id = _loc1_[0];
            this._needItem.num = _loc1_[1];
         }
         return this._needItem;
      }
      
      public function get getItem() : Dto_IdNum
      {
         var _loc1_:Array = null;
         if(this._getItem == null)
         {
            this._getItem = new Dto_IdNum();
            _loc1_ = getItemStr.split(":");
            this._getItem.id = _loc1_[0];
            this._getItem.num = _loc1_[1];
         }
         return this._getItem;
      }
      
      public function get needDiamond() : Dto_IdNum
      {
         var _loc1_:Array = null;
         if(this._needDiamond == null)
         {
            this._needDiamond = new Dto_IdNum();
            _loc1_ = needDiamondStr.split(":");
            this._needDiamond.id = _loc1_[0];
            this._needDiamond.num = _loc1_[1];
         }
         return this._needDiamond;
      }
      
      public function get dropItemList() : Array
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         if(this._dropItemList == null)
         {
            this._dropItemList = new Array();
            _loc1_ = dropItemStr.split(";");
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc5_ = (_loc4_ = _loc1_[_loc3_]).split(":");
               this._dropItemList.push(_loc5_[0]);
               _loc3_++;
            }
         }
         return this._dropItemList;
      }
   }
}
