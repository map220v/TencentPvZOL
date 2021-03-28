package com.qq.modules.map.model.templates.ce
{
   public class MapMineBuffTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _percentBuff:Number;
      
      protected var _regularBuff:Number;
      
      public function MapMineBuffTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._percentBuff = param1.percentBuff;
         this._regularBuff = param1.regularBuff;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get percentBuff() : Number
      {
         return this._percentBuff;
      }
      
      public function get regularBuff() : Number
      {
         return this._regularBuff;
      }
   }
}
