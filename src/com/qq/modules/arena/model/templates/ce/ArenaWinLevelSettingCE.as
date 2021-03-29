package com.qq.modules.arena.model.templates.ce
{
   public class ArenaWinLevelSettingCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _scroe:Number;
      
      public function ArenaWinLevelSettingCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._scroe = param1.scroe;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get scroe() : Number
      {
         return this._scroe;
      }
   }
}
