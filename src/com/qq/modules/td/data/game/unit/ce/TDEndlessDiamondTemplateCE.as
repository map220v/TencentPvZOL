package com.qq.modules.td.data.game.unit.ce
{
   public class TDEndlessDiamondTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _diamond:Number;
      
      public function TDEndlessDiamondTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._diamond = param1.diamond;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get diamond() : Number
      {
         return this._diamond;
      }
   }
}
