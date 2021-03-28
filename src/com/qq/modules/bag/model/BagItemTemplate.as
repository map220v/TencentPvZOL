package com.qq.modules.bag.model
{
   import PVZ.Cmd.Dto_IdNum;
   import com.qq.constant.bag.BagItemUtil;
   import com.qq.modules.bag.ItemType;
   import com.qq.modules.bag.model.templates.ce.BagItemTemplateCE;
   
   public class BagItemTemplate extends BagItemTemplateCE
   {
       
      
      public var amount:int;
      
      private var _getUseEffect:Array;
      
      public function BagItemTemplate(param1:int = 0)
      {
         super();
         if(param1 != 0)
         {
            _id = param1;
         }
      }
      
      public function get iconSource() : String
      {
         return BagItemUtil.getBagItemImageSource(id);
      }
      
      public function getUseEffect(param1:int) : int
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         if(this._getUseEffect == null)
         {
            this._getUseEffect = [];
            _loc2_ = useEffect.split(";");
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _loc4_ = String(_loc2_[_loc3_]).split(":");
               this._getUseEffect[_loc4_[0]] = _loc4_[1];
               _loc3_++;
            }
         }
         return this._getUseEffect[param1];
      }
      
      public function getCardId() : Dto_IdNum
      {
         var _loc2_:Array = null;
         var _loc1_:Dto_IdNum = new Dto_IdNum();
         if(this.type == ItemType.TYPE_CARD)
         {
            _loc2_ = cardItemId.split(":");
            _loc1_.id = _loc2_[0];
            _loc1_.num = _loc2_[1];
         }
         return _loc1_;
      }
   }
}
