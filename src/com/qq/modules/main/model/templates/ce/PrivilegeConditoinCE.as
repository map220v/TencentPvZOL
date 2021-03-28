package com.qq.modules.main.model.templates.ce
{
   public class PrivilegeConditoinCE
   {
       
      
      protected var _id:Number;
      
      protected var _needLv:Number;
      
      protected var _defaultVIPID:Number;
      
      public function PrivilegeConditoinCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._needLv = param1.needLv;
         this._defaultVIPID = param1.defaultVIPID;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get needLv() : Number
      {
         return this._needLv;
      }
      
      public function get defaultVIPID() : Number
      {
         return this._defaultVIPID;
      }
   }
}
