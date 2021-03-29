package com.qq.modules.levelselect.model.templates.ce
{
   public class LSChallengeRankBonusTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _stageId:Number;
      
      protected var _levelId:Number;
      
      protected var _subLevelId:Number;
      
      protected var _challengeLevelId:Number;
      
      protected var _min:Number;
      
      protected var _max:Number;
      
      protected var _bonus:String;
      
      public function LSChallengeRankBonusTemplateCE()
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
         this._min = param1.min;
         this._max = param1.max;
         this._bonus = param1.bonus;
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
      
      public function get min() : Number
      {
         return this._min;
      }
      
      public function get max() : Number
      {
         return this._max;
      }
      
      public function get bonus() : String
      {
         return this._bonus;
      }
   }
}
