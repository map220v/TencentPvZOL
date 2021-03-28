package com.qq.modules.fuben.model.templates.ce
{
   public class FubenChapterForUnionTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _upChapterId:Number;
      
      protected var _openLevel:Number;
      
      protected var _openCohesion:Number;
      
      protected var _resetCohesion:Number;
      
      protected var _fightCount:Number;
      
      protected var _closeTimes:Number;
      
      protected var _chapterTip:String;
      
      protected var _passReward:String;
      
      protected var _oneReward:String;
      
      protected var _totalReward:String;
      
      protected var _rewardTips:String;
      
      public function FubenChapterForUnionTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._upChapterId = param1.upChapterId;
         this._openLevel = param1.openLevel;
         this._openCohesion = param1.openCohesion;
         this._resetCohesion = param1.resetCohesion;
         this._fightCount = param1.fightCount;
         this._closeTimes = param1.closeTimes;
         this._chapterTip = param1.chapterTip;
         this._passReward = param1.passReward;
         this._oneReward = param1.oneReward;
         this._totalReward = param1.totalReward;
         this._rewardTips = param1.rewardTips;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get upChapterId() : Number
      {
         return this._upChapterId;
      }
      
      public function get openLevel() : Number
      {
         return this._openLevel;
      }
      
      public function get openCohesion() : Number
      {
         return this._openCohesion;
      }
      
      public function get resetCohesion() : Number
      {
         return this._resetCohesion;
      }
      
      public function get fightCount() : Number
      {
         return this._fightCount;
      }
      
      public function get closeTimes() : Number
      {
         return this._closeTimes;
      }
      
      public function get chapterTip() : String
      {
         return this._chapterTip;
      }
      
      public function get passReward() : String
      {
         return this._passReward;
      }
      
      public function get oneReward() : String
      {
         return this._oneReward;
      }
      
      public function get totalReward() : String
      {
         return this._totalReward;
      }
      
      public function get rewardTips() : String
      {
         return this._rewardTips;
      }
   }
}
