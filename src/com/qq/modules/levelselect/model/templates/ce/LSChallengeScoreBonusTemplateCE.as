package com.qq.modules.levelselect.model.templates.ce
{
   public class LSChallengeScoreBonusTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _stageID:Number;
      
      protected var _levelID:Number;
      
      protected var _subLevelID:Number;
      
      protected var _challengeLevelID:Number;
      
      protected var _scoreMax:Number;
      
      protected var _scoreMin:Number;
      
      protected var _gold:Number;
      
      public function LSChallengeScoreBonusTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._stageID = param1.stageID;
         this._levelID = param1.levelID;
         this._subLevelID = param1.subLevelID;
         this._challengeLevelID = param1.challengeLevelID;
         this._scoreMax = param1.scoreMax;
         this._scoreMin = param1.scoreMin;
         this._gold = param1.gold;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get stageID() : Number
      {
         return this._stageID;
      }
      
      public function get levelID() : Number
      {
         return this._levelID;
      }
      
      public function get subLevelID() : Number
      {
         return this._subLevelID;
      }
      
      public function get challengeLevelID() : Number
      {
         return this._challengeLevelID;
      }
      
      public function get scoreMax() : Number
      {
         return this._scoreMax;
      }
      
      public function get scoreMin() : Number
      {
         return this._scoreMin;
      }
      
      public function get gold() : Number
      {
         return this._gold;
      }
   }
}
