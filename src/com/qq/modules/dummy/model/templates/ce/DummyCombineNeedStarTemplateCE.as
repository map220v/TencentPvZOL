package com.qq.modules.dummy.model.templates.ce
{
   public class DummyCombineNeedStarTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _combineID:Number;
      
      protected var _needStar:Number;
      
      protected var _propStr:String;
      
      public function DummyCombineNeedStarTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._combineID = param1.combineID;
         this._needStar = param1.needStar;
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
      
      public function get needStar() : Number
      {
         return this._needStar;
      }
      
      public function get propStr() : String
      {
         return this._propStr;
      }
   }
}
