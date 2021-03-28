package com.qq.modules.main.model.settings.battleCard.ce
{
   public class BattleCardMarketSettingCE
   {
       
      
      protected var _id:Number;
      
      protected var _costStr:String;
      
      protected var _needCardNum:String;
      
      protected var _desc:String;
      
      public function BattleCardMarketSettingCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._costStr = param1.costStr;
         this._needCardNum = param1.needCardNum;
         this._desc = param1.desc;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get costStr() : String
      {
         return this._costStr;
      }
      
      public function get needCardNum() : String
      {
         return this._needCardNum;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
   }
}
