package com.qq.modules.sound.model.templates.ce
{
   public class TDSoundSceneTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _choosePlantSoundID:Number;
      
      protected var _backgroundSoundID:Number;
      
      protected var _winSoundID:Number;
      
      protected var _loseoundID:Number;
      
      protected var _lawnMowerID:Number;
      
      protected var _zombieAppearList:String;
      
      public function TDSoundSceneTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._choosePlantSoundID = param1.choosePlantSoundID;
         this._backgroundSoundID = param1.backgroundSoundID;
         this._winSoundID = param1.winSoundID;
         this._loseoundID = param1.loseoundID;
         this._lawnMowerID = param1.lawnMowerID;
         this._zombieAppearList = param1.zombieAppearList;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get choosePlantSoundID() : Number
      {
         return this._choosePlantSoundID;
      }
      
      public function get backgroundSoundID() : Number
      {
         return this._backgroundSoundID;
      }
      
      public function get winSoundID() : Number
      {
         return this._winSoundID;
      }
      
      public function get loseoundID() : Number
      {
         return this._loseoundID;
      }
      
      public function get lawnMowerID() : Number
      {
         return this._lawnMowerID;
      }
      
      public function get zombieAppearList() : String
      {
         return this._zombieAppearList;
      }
   }
}
