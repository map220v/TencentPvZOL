package com.qq.modules.arena.model.templates.ce
{
   public class ArenaGroupSettingCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _upRank:String;
      
      protected var _downRank:String;
      
      protected var _maxFightNum:Number;
      
      protected var _des:String;
      
      protected var _icon:Number;
      
      protected var _rankDes:String;
      
      public function ArenaGroupSettingCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._upRank = param1.upRank;
         this._downRank = param1.downRank;
         this._maxFightNum = param1.maxFightNum;
         this._des = param1.des;
         this._icon = param1.icon;
         this._rankDes = param1.rankDes;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get upRank() : String
      {
         return this._upRank;
      }
      
      public function get downRank() : String
      {
         return this._downRank;
      }
      
      public function get maxFightNum() : Number
      {
         return this._maxFightNum;
      }
      
      public function get des() : String
      {
         return this._des;
      }
      
      public function get icon() : Number
      {
         return this._icon;
      }
      
      public function get rankDes() : String
      {
         return this._rankDes;
      }
   }
}
