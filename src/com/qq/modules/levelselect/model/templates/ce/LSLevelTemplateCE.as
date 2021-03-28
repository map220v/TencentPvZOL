package com.qq.modules.levelselect.model.templates.ce
{
   public class LSLevelTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _stageId:Number;
      
      protected var _levelId:Number;
      
      protected var _subLevelId:Number;
      
      protected var _challengeLevelId:Number;
      
      protected var _needRoleLevel:Number;
      
      protected var _needPower:Number;
      
      protected var _bonusCoin:Number;
      
      protected var _bonusExp:Number;
      
      protected var _firstCoin:Number;
      
      protected var _bonusPlant:Number;
      
      protected var _bonusItems:String;
      
      protected var _achievementInfo:String;
      
      protected var _name:String;
      
      protected var _soundSceneID:Number;
      
      protected var _preloadSoundIDList:String;
      
      protected var _movie:String;
      
      protected var _achievementIntro:String;
      
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
      
      public function LSLevelTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._stageId = param1.stageId;
         this._levelId = param1.levelId;
         this._subLevelId = param1.subLevelId;
         this._challengeLevelId = param1.challengeLevelId;
         this._needRoleLevel = param1.needRoleLevel;
         this._needPower = param1.needPower;
         this._bonusCoin = param1.bonusCoin;
         this._bonusExp = param1.bonusExp;
         this._firstCoin = param1.firstCoin;
         this._bonusPlant = param1.bonusPlant;
         this._bonusItems = param1.bonusItems;
         this._achievementInfo = param1.achievementInfo;
         this._name = param1.name;
         this._soundSceneID = param1.soundSceneID;
         this._preloadSoundIDList = param1.preloadSoundIDList;
         this._movie = param1.movie;
         this._achievementIntro = param1.achievementIntro;
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
      
      public function get stageId() : Number
      {
         return this._stageId;
      }
      
      public function get levelId() : Number
      {
         return this._levelId;
      }
      
      public function get subLevelId() : Number
      {
         return this._subLevelId;
      }
      
      public function get challengeLevelId() : Number
      {
         return this._challengeLevelId;
      }
      
      public function get needRoleLevel() : Number
      {
         return this._needRoleLevel;
      }
      
      public function get needPower() : Number
      {
         return this._needPower;
      }
      
      public function get bonusCoin() : Number
      {
         return this._bonusCoin;
      }
      
      public function get bonusExp() : Number
      {
         return this._bonusExp;
      }
      
      public function get firstCoin() : Number
      {
         return this._firstCoin;
      }
      
      public function get bonusPlant() : Number
      {
         return this._bonusPlant;
      }
      
      public function get bonusItems() : String
      {
         return this._bonusItems;
      }
      
      public function get achievementInfo() : String
      {
         return this._achievementInfo;
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
      
      public function get movie() : String
      {
         return this._movie;
      }
      
      public function get achievementIntro() : String
      {
         return this._achievementIntro;
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
