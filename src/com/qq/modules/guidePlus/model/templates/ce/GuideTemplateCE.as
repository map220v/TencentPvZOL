package com.qq.modules.guidePlus.model.templates.ce
{
   public class GuideTemplateCE
   {
       
      
      protected var _order:Number;
      
      protected var _id:Number;
      
      protected var _level:Number;
      
      protected var _context:Number;
      
      protected var _groupID:Number;
      
      public function GuideTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._order = param1.order;
         this._id = param1.id;
         this._level = param1.level;
         this._context = param1.context;
         this._groupID = param1.groupID;
      }
      
      public function get order() : Number
      {
         return this._order;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get level() : Number
      {
         return this._level;
      }
      
      public function get context() : Number
      {
         return this._context;
      }
      
      public function get groupID() : Number
      {
         return this._groupID;
      }
   }
}
