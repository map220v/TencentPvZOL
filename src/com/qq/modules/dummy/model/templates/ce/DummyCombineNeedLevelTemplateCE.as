package com.qq.modules.dummy.model.templates.ce
{
   public class DummyCombineNeedLevelTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _combineID:Number;
      
      protected var _needLevel:Number;
      
      protected var _propStr:String;
      
      public function DummyCombineNeedLevelTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._combineID = param1.combineID;
         this._needLevel = param1.needLevel;
         this._propStr = param1.propStr;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get combineID() : Number
      {
         return this._combineID;
      }
      
      public function get needLevel() : Number
      {
         return this._needLevel;
      }
      
      public function get propStr() : String
      {
         return this._propStr;
      }
   }
}
