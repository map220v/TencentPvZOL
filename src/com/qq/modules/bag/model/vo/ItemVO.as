package com.qq.modules.bag.model.vo
{
   import PVZ.Cmd.Dto_IdNum;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.equipment.model.EquipmentFactory;
   import com.qq.modules.equipment.model.templates.EquipmentItemTemplate;
   
   public class ItemVO
   {
       
      
      public var itemId:int;
      
      public var amount:int;
      
      private var _template:BagItemTemplate;
      
      private var _equipTemplate:EquipmentItemTemplate;
      
      public function ItemVO(param1:int, param2:int = 0)
      {
         super();
         this.amount = param2;
         this.itemId = param1;
      }
      
      public static function createByString(param1:String, param2:String) : ItemVO
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:Array = param1.split(param2);
         if(_loc3_ && _loc3_.length > 1)
         {
            _loc4_ = _loc3_[0];
            _loc5_ = _loc3_[1];
            return new ItemVO(_loc4_,_loc5_);
         }
         return null;
      }
      
      public static function createListByString(param1:String, param2:String, param3:String) : Vector.<ItemVO>
      {
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc4_:Vector.<ItemVO> = new Vector.<ItemVO>();
         if(param1 && param1.length > 0)
         {
            _loc5_ = param1.split(param2);
            for each(_loc6_ in _loc5_)
            {
               if(_loc6_ && _loc6_.length > 0)
               {
                  _loc4_.push(createByString(_loc6_,param3));
               }
            }
         }
         return _loc4_;
      }
      
      public static function sortByItemID(param1:ItemVO, param2:ItemVO) : int
      {
         return param1.itemId - param2.itemId;
      }
      
      public function get template() : BagItemTemplate
      {
         if(this._template == null)
         {
            this._template = ItemTemplateFactory.instance.getBagItemTemplateById(this.itemId);
         }
         return this._template;
      }
      
      public function get equipTemplate() : EquipmentItemTemplate
      {
         if(this._equipTemplate == null)
         {
            this._equipTemplate = EquipmentFactory.instance.getEquipmentItemByItemID(this.itemId);
         }
         return this._equipTemplate;
      }
      
      public function createDto_IdNum() : Dto_IdNum
      {
         var _loc1_:Dto_IdNum = new Dto_IdNum();
         _loc1_.id = this.itemId;
         _loc1_.num = this.amount;
         return _loc1_;
      }
   }
}
