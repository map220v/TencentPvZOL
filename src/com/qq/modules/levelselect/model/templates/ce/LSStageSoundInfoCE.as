package com.qq.modules.levelselect.model.templates.ce
{
   public class LSStageSoundInfoCE
   {
       
      
      protected var _id:Number;
      
      protected var _stageID:Number;
      
      protected var _bgSoundID:Number;
      
      public function LSStageSoundInfoCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._stageID = param1.stageID;
         this._bgSoundID = param1.bgSoundID;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get stageID() : Number
      {
         return this._stageID;
      }
      
      public function get bgSoundID() : Number
      {
         return this._bgSoundID;
      }
   }
}
