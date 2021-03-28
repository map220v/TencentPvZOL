package com.qq.modules.main.model.settings.plantTalent.ce
{
   public class PlantTalentTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _stageId:Number;
      
      protected var _plantId:Number;
      
      protected var _name:String;
      
      protected var _parentTalentId:Number;
      
      protected var _talentIndex:Number;
      
      protected var _param:String;
      
      protected var _icon:String;
      
      protected var _desc:String;
      
      protected var _power:Number;
      
      protected var _condName:String;
      
      protected var _advancedCond:String;
      
      protected var _condDesc:String;
      
      public function PlantTalentTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._stageId = param1.stageId;
         this._plantId = param1.plantId;
         this._name = param1.name;
         this._parentTalentId = param1.parentTalentId;
         this._talentIndex = param1.talentIndex;
         this._param = param1.param;
         this._icon = param1.icon;
         this._desc = param1.desc;
         this._power = param1.power;
         this._condName = param1.condName;
         this._advancedCond = param1.advancedCond;
         this._condDesc = param1.condDesc;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get stageId() : Number
      {
         return this._stageId;
      }
      
      public function get plantId() : Number
      {
         return this._plantId;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get parentTalentId() : Number
      {
         return this._parentTalentId;
      }
      
      public function get talentIndex() : Number
      {
         return this._talentIndex;
      }
      
      public function get param() : String
      {
         return this._param;
      }
      
      public function get icon() : String
      {
         return this._icon;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get power() : Number
      {
         return this._power;
      }
      
      public function get condName() : String
      {
         return this._condName;
      }
      
      public function get advancedCond() : String
      {
         return this._advancedCond;
      }
      
      public function get condDesc() : String
      {
         return this._condDesc;
      }
   }
}
