package com.qq.modules.dummy.model.templates.ce
{
   public class DummyEquipmentQuiltyTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _maxLV:Number;
      
      protected var _compositeDrawingCostParam:String;
      
      protected var _compositeDrawingGenerateParam:String;
      
      protected var _exchangeNeedItemStr:String;
      
      public function DummyEquipmentQuiltyTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._maxLV = param1.maxLV;
         this._compositeDrawingCostParam = param1.compositeDrawingCostParam;
         this._compositeDrawingGenerateParam = param1.compositeDrawingGenerateParam;
         this._exchangeNeedItemStr = param1.exchangeNeedItemStr;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get maxLV() : Number
      {
         return this._maxLV;
      }
      
      public function get compositeDrawingCostParam() : String
      {
         return this._compositeDrawingCostParam;
      }
      
      public function get compositeDrawingGenerateParam() : String
      {
         return this._compositeDrawingGenerateParam;
      }
      
      public function get exchangeNeedItemStr() : String
      {
         return this._exchangeNeedItemStr;
      }
   }
}
