package com.qq.modules.yetiTD.model.templates.ce
{
   public class YetiTDModeTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _wishStr:String;
      
      protected var _chestStr:String;
      
      protected var _diamondCostStr:String;
      
      public function YetiTDModeTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._wishStr = param1.wishStr;
         this._chestStr = param1.chestStr;
         this._diamondCostStr = param1.diamondCostStr;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get wishStr() : String
      {
         return this._wishStr;
      }
      
      public function get chestStr() : String
      {
         return this._chestStr;
      }
      
      public function get diamondCostStr() : String
      {
         return this._diamondCostStr;
      }
   }
}
