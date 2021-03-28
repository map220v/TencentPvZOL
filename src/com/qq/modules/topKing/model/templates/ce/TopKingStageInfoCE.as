package com.qq.modules.topKing.model.templates.ce
{
   public class TopKingStageInfoCE
   {
       
      
      protected var _id:Number;
      
      protected var _startTime:Number;
      
      protected var _durtion:Number;
      
      protected var _totalBattle:Number;
      
      protected var _rewardStr:String;
      
      protected var _rewardBoxIndex:Number;
      
      protected var _desc:String;
      
      protected var _name:String;
      
      protected var _finalScore:String;
      
      protected var _isBetBlueDiamond:Number;
      
      public function TopKingStageInfoCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._startTime = param1.startTime;
         this._durtion = param1.durtion;
         this._totalBattle = param1.totalBattle;
         this._rewardStr = param1.rewardStr;
         this._rewardBoxIndex = param1.rewardBoxIndex;
         this._desc = param1.desc;
         this._name = param1.name;
         this._finalScore = param1.finalScore;
         this._isBetBlueDiamond = param1.isBetBlueDiamond;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get startTime() : Number
      {
         return this._startTime;
      }
      
      public function get durtion() : Number
      {
         return this._durtion;
      }
      
      public function get totalBattle() : Number
      {
         return this._totalBattle;
      }
      
      public function get rewardStr() : String
      {
         return this._rewardStr;
      }
      
      public function get rewardBoxIndex() : Number
      {
         return this._rewardBoxIndex;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get finalScore() : String
      {
         return this._finalScore;
      }
      
      public function get isBetBlueDiamond() : Number
      {
         return this._isBetBlueDiamond;
      }
   }
}
