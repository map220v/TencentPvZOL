package com.qq.modules.main.model.templates.ce
{
   public class ExitGameTipsTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _evtName:String;
      
      protected var _count:Number;
      
      protected var _order:Number;
      
      protected var _time:String;
      
      protected var _lv:Number;
      
      protected var _desc:String;
      
      public function ExitGameTipsTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._evtName = param1.evtName;
         this._count = param1.count;
         this._order = param1.order;
         this._time = param1.time;
         this._lv = param1.lv;
         this._desc = param1.desc;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get evtName() : String
      {
         return this._evtName;
      }
      
      public function get count() : Number
      {
         return this._count;
      }
      
      public function get order() : Number
      {
         return this._order;
      }
      
      public function get time() : String
      {
         return this._time;
      }
      
      public function get lv() : Number
      {
         return this._lv;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
   }
}
