package com.qq.modules.td.data.game.unit.ce
{
   public class TDEndlessModeTemplateCE
   {
       
      
      protected var _modeId:Number;
      
      protected var _name:String;
      
      protected var _time:String;
      
      protected var _img:String;
      
      public function TDEndlessModeTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._modeId = param1.modeId;
         this._name = param1.name;
         this._time = param1.time;
         this._img = param1.img;
      }
      
      public function get modeId() : Number
      {
         return this._modeId;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get time() : String
      {
         return this._time;
      }
      
      public function get img() : String
      {
         return this._img;
      }
   }
}
