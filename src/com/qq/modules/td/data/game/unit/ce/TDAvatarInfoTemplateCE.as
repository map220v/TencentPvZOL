package com.qq.modules.td.data.game.unit.ce
{
   public class TDAvatarInfoTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _avatarBoneNames:String;
      
      protected var _iconAvatarBoneNames:String;
      
      public function TDAvatarInfoTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._avatarBoneNames = param1.avatarBoneNames;
         this._iconAvatarBoneNames = param1.iconAvatarBoneNames;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get avatarBoneNames() : String
      {
         return this._avatarBoneNames;
      }
      
      public function get iconAvatarBoneNames() : String
      {
         return this._iconAvatarBoneNames;
      }
   }
}
