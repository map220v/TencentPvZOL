package com.qq.modules.basic.model.templates.ce
{
   public class EntryTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _needLevel:Number;
      
      protected var _needDays:Number;
      
      public function EntryTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._needLevel = param1.needLevel;
         this._needDays = param1.needDays;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get needLevel() : Number
      {
         return this._needLevel;
      }
      
      public function get needDays() : Number
      {
         return this._needDays;
      }
   }
}
