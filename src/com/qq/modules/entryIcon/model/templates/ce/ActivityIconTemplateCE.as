package com.qq.modules.entryIcon.model.templates.ce
{
   public class ActivityIconTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _order:Number;
      
      protected var _iconUrl:String;
      
      protected var _desc:String;
      
      protected var _params:String;
      
      protected var _originalFlashPolicy:String;
      
      protected var _groupID:Number;
      
      public function ActivityIconTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._order = param1.order;
         this._iconUrl = param1.iconUrl;
         this._desc = param1.desc;
         this._params = param1.params;
         this._originalFlashPolicy = param1.originalFlashPolicy;
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
      
      public function get iconUrl() : String
      {
         return this._iconUrl;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get params() : String
      {
         return this._params;
      }
      
      public function get originalFlashPolicy() : String
      {
         return this._originalFlashPolicy;
      }
      
      public function get groupID() : Number
      {
         return this._groupID;
      }
   }
}
