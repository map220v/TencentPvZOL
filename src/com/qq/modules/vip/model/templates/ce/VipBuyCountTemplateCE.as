package com.qq.modules.vip.model.templates.ce
{
   public class VipBuyCountTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _type:Number;
      
      protected var _count:Number;
      
      protected var _diamond:Number;
      
      public function VipBuyCountTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._type = param1.type;
         this._count = param1.count;
         this._diamond = param1.diamond;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get count() : Number
      {
         return this._count;
      }
      
      public function get diamond() : Number
      {
         return this._diamond;
      }
   }
}
