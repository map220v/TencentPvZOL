package com.qq.modules.quest.model.templates.ce
{
   public class DailyQuestInfoTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _questName:String;
      
      protected var _allTimes:Number;
      
      protected var _reward:String;
      
      protected var _finishCondition:String;
      
      protected var _order:Number;
      
      protected var _questDesc:String;
      
      protected var _openLv:Number;
      
      protected var _serverOpenDay:Number;
      
      protected var _needUnionLv:Number;
      
      public function DailyQuestInfoTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._questName = param1.questName;
         this._allTimes = param1.allTimes;
         this._reward = param1.reward;
         this._finishCondition = param1.finishCondition;
         this._order = param1.order;
         this._questDesc = param1.questDesc;
         this._openLv = param1.openLv;
         this._serverOpenDay = param1.serverOpenDay;
         this._needUnionLv = param1.needUnionLv;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get questName() : String
      {
         return this._questName;
      }
      
      public function get allTimes() : Number
      {
         return this._allTimes;
      }
      
      public function get reward() : String
      {
         return this._reward;
      }
      
      public function get finishCondition() : String
      {
         return this._finishCondition;
      }
      
      public function get order() : Number
      {
         return this._order;
      }
      
      public function get questDesc() : String
      {
         return this._questDesc;
      }
      
      public function get openLv() : Number
      {
         return this._openLv;
      }
      
      public function get serverOpenDay() : Number
      {
         return this._serverOpenDay;
      }
      
      public function get needUnionLv() : Number
      {
         return this._needUnionLv;
      }
   }
}
