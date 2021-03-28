package com.qq.modules.entryIcon.model.templates.ce
{
   public class SystemIconTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _order:Number;
      
      protected var _needLevel:Number;
      
      protected var _beginTime:String;
      
      protected var _endTime:String;
      
      protected var _needDays:Number;
      
      protected var _iconUrl:String;
      
      protected var _desc:String;
      
      protected var _originalFlashPolicy:String;
      
      protected var _params:String;
      
      protected var _groupID:Number;
      
      public function SystemIconTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._order = param1.order;
         this._needLevel = param1.needLevel;
         this._beginTime = param1.beginTime;
         this._endTime = param1.endTime;
         this._needDays = param1.needDays;
         this._iconUrl = param1.iconUrl;
         this._desc = param1.desc;
         this._originalFlashPolicy = param1.originalFlashPolicy;
         this._params = param1.params;
         this._groupID = param1.groupID;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get order() : Number
      {
         return this._order;
      }
      
      public function get needLevel() : Number
      {
         return this._needLevel;
      }
      
      public function get beginTime() : String
      {
         return this._beginTime;
      }
      
      public function get endTime() : String
      {
         return this._endTime;
      }
      
      public function get needDays() : Number
      {
         return this._needDays;
      }
      
      public function get iconUrl() : String
      {
         return this._iconUrl;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get originalFlashPolicy() : String
      {
         return this._originalFlashPolicy;
      }
      
      public function get params() : String
      {
         return this._params;
      }
      
      public function get groupID() : Number
      {
         return this._groupID;
      }
   }
}
