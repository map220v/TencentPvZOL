package com.qq.modules.dummy.model
{
   import com.qq.modules.dummy.model.templates.ce.DummyEquipmentQuiltyTemplateCE;
   
   public class DummyEquipmentQuiltyTemplate extends DummyEquipmentQuiltyTemplateCE
   {
       
      
      private var _exchangeNeedItemNum:int;
      
      public function DummyEquipmentQuiltyTemplate()
      {
         super();
      }
      
      public function get compositeDrawingCost() : Array
      {
         return compositeDrawingCostParam.split(":");
      }
      
      public function get compositeDrawingGenerate() : Array
      {
         return compositeDrawingGenerateParam.split(":");
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
