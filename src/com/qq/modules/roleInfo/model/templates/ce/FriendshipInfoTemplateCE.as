package com.qq.modules.roleInfo.model.templates.ce
{
   public class FriendshipInfoTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _addFriendPoint:Number;
      
      protected var _friendshipMax:Number;
      
      public function FriendshipInfoTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._addFriendPoint = param1.addFriendPoint;
         this._friendshipMax = param1.friendshipMax;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get addFriendPoint() : Number
      {
         return this._addFriendPoint;
      }
      
      public function get friendshipMax() : Number
      {
         return this._friendshipMax;
      }
   }
}
