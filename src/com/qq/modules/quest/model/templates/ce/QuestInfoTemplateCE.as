package com.qq.modules.quest.model.templates.ce
{
   public class QuestInfoTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _type:Number;
      
      protected var _questName:String;
      
      protected var _shortName:String;
      
      protected var _icon:String;
      
      protected var _desc:String;
      
      protected var _finishCondition:String;
      
      protected var _finishConditionDesc:String;
      
      protected var _reward:String;
      
      protected var _isHideProgress:Number;
      
      public function QuestInfoTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._type = param1.type;
         this._questName = param1.questName;
         this._shortName = param1.shortName;
         this._icon = param1.icon;
         this._desc = param1.desc;
         this._finishCondition = param1.finishCondition;
         this._finishConditionDesc = param1.finishConditionDesc;
         this._reward = param1.reward;
         this._isHideProgress = param1.isHideProgress;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get questName() : String
      {
         return this._questName;
      }
      
      public function get shortName() : String
      {
         return this._shortName;
      }
      
      public function get icon() : String
      {
         return this._icon;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get finishCondition() : String
      {
         return this._finishCondition;
      }
      
      public function get finishConditionDesc() : String
      {
         return this._finishConditionDesc;
      }
      
      public function get reward() : String
      {
         return this._reward;
      }
      
      public function get isHideProgress() : Number
      {
         return this._isHideProgress;
      }
   }
}
