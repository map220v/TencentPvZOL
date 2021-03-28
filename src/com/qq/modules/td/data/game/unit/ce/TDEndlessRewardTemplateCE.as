package com.qq.modules.td.data.game.unit.ce
{
   public class TDEndlessRewardTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _rankStart:Number;
      
      protected var _rankEnd:Number;
      
      protected var _rewardStr:String;
      
      public function TDEndlessRewardTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._rankStart = param1.rankStart;
         this._rankEnd = param1.rankEnd;
         this._rewardStr = param1.rewardStr;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get rankStart() : Number
      {
         return this._rankStart;
      }
      
      public function get rankEnd() : Number
      {
         return this._rankEnd;
      }
      
      public function get rewardStr() : String
      {
         return this._rewardStr;
      }
   }
}
