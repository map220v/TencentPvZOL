package com.qq.modules.fuben.model.templates.ce
{
   public class FubenEnargysTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _needRes:String;
      
      protected var _enargyAdd:Number;
      
      public function FubenEnargysTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._needRes = param1.needRes;
         this._enargyAdd = param1.enargyAdd;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get needRes() : String
      {
         return this._needRes;
      }
      
      public function get enargyAdd() : Number
      {
         return this._enargyAdd;
      }
   }
}
