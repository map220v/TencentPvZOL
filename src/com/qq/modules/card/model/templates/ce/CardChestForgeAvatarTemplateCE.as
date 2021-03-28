package com.qq.modules.card.model.templates.ce
{
   public class CardChestForgeAvatarTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _type:Number;
      
      protected var _level:Number;
      
      protected var _useItemStr:String;
      
      public function CardChestForgeAvatarTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._type = param1.type;
         this._level = param1.level;
         this._useItemStr = param1.useItemStr;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get level() : Number
      {
         return this._level;
      }
      
      public function get useItemStr() : String
      {
         return this._useItemStr;
      }
   }
}
