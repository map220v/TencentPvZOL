package com.qq.modules.friend.model.templates.ce
{
   public class FriendLogTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _desc:String;
      
      public function FriendLogTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._desc = param1.desc;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
   }
}
