package com.qq.modules.map.model.templates.ce
{
   public class MapTempleTypeInfoTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _npcName:String;
      
      protected var _timeReward:String;
      
      protected var _desc:String;
      
      protected var _unionLevel:Number;
      
      public function MapTempleTypeInfoTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._npcName = param1.npcName;
         this._timeReward = param1.timeReward;
         this._desc = param1.desc;
         this._unionLevel = param1.unionLevel;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get npcName() : String
      {
         return this._npcName;
      }
      
      public function get timeReward() : String
      {
         return this._timeReward;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get unionLevel() : Number
      {
         return this._unionLevel;
      }
   }
}
