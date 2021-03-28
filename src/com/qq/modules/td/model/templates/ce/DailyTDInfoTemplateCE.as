package com.qq.modules.td.model.templates.ce
{
   public class DailyTDInfoTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _type:Number;
      
      protected var _groupID:Number;
      
      protected var _levelID:Number;
      
      protected var _name:String;
      
      protected var _soundSceneID:Number;
      
      protected var _preloadSoundIDList:String;
      
      protected var _mapUrl:String;
      
      protected var _sceneID:Number;
      
      protected var _mapDesc:String;
      
      protected var _standard:Number;
      
      protected var _lower1:Number;
      
      protected var _hp1:Number;
      
      protected var _armor1:Number;
      
      protected var _lower2:Number;
      
      protected var _hp2:Number;
      
      protected var _armor2:Number;
      
      protected var _higher1:Number;
      
      protected var _hp3:Number;
      
      protected var _armor3:Number;
      
      protected var _higher2:Number;
      
      protected var _hp4:Number;
      
      protected var _armor4:Number;
      
      public function DailyTDInfoTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._type = param1.type;
         this._groupID = param1.groupID;
         this._levelID = param1.levelID;
         this._name = param1.name;
         this._soundSceneID = param1.soundSceneID;
         this._preloadSoundIDList = param1.preloadSoundIDList;
         this._mapUrl = param1.mapUrl;
         this._sceneID = param1.sceneID;
         this._mapDesc = param1.mapDesc;
         this._standard = param1.standard;
         this._lower1 = param1.lower1;
         this._hp1 = param1.hp1;
         this._armor1 = param1.armor1;
         this._lower2 = param1.lower2;
         this._hp2 = param1.hp2;
         this._armor2 = param1.armor2;
         this._higher1 = param1.higher1;
         this._hp3 = param1.hp3;
         this._armor3 = param1.armor3;
         this._higher2 = param1.higher2;
         this._hp4 = param1.hp4;
         this._armor4 = param1.armor4;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get groupID() : Number
      {
         return this._groupID;
      }
      
      public function get levelID() : Number
      {
         return this._levelID;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get soundSceneID() : Number
      {
         return this._soundSceneID;
      }
      
      public function get preloadSoundIDList() : String
      {
         return this._preloadSoundIDList;
      }
      
      public function get mapUrl() : String
      {
         return this._mapUrl;
      }
      
      public function get sceneID() : Number
      {
         return this._sceneID;
      }
      
      public function get mapDesc() : String
      {
         return this._mapDesc;
      }
      
      public function get standard() : Number
      {
         return this._standard;
      }
      
      public function get lower1() : Number
      {
         return this._lower1;
      }
      
      public function get hp1() : Number
      {
         return this._hp1;
      }
      
      public function get armor1() : Number
      {
         return this._armor1;
      }
      
      public function get lower2() : Number
      {
         return this._lower2;
      }
      
      public function get hp2() : Number
      {
         return this._hp2;
      }
      
      public function get armor2() : Number
      {
         return this._armor2;
      }
      
      public function get higher1() : Number
      {
         return this._higher1;
      }
      
      public function get hp3() : Number
      {
         return this._hp3;
      }
      
      public function get armor3() : Number
      {
         return this._armor3;
      }
      
      public function get higher2() : Number
      {
         return this._higher2;
      }
      
      public function get hp4() : Number
      {
         return this._hp4;
      }
      
      public function get armor4() : Number
      {
         return this._armor4;
      }
   }
}
