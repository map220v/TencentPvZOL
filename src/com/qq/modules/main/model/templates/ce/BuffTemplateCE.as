package com.qq.modules.main.model.templates.ce
{
   public class BuffTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _type:Number;
      
      protected var _name:String;
      
      protected var _desc:String;
      
      protected var _buffTime:Number;
      
      protected var _iconId:Number;
      
      protected var _castleId:Number;
      
      protected var _replaceType:Number;
      
      public function BuffTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._type = param1.type;
         this._name = param1.name;
         this._desc = param1.desc;
         this._buffTime = param1.buffTime;
         this._iconId = param1.iconId;
         this._castleId = param1.castleId;
         this._replaceType = param1.replaceType;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get buffTime() : Number
      {
         return this._buffTime;
      }
      
      public function get iconId() : Number
      {
         return this._iconId;
      }
      
      public function get castleId() : Number
      {
         return this._castleId;
      }
      
      public function get replaceType() : Number
      {
         return this._replaceType;
      }
   }
}
