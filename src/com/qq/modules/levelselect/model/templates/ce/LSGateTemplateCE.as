package com.qq.modules.levelselect.model.templates.ce
{
   public class LSGateTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _stageId:Number;
      
      protected var _gateId:Number;
      
      protected var _levelId:Number;
      
      protected var _subLevelId:Number;
      
      protected var _needStars:Number;
      
      protected var _needItems:String;
      
      public function LSGateTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._stageId = param1.stageId;
         this._gateId = param1.gateId;
         this._levelId = param1.levelId;
         this._subLevelId = param1.subLevelId;
         this._needStars = param1.needStars;
         this._needItems = param1.needItems;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get stageId() : Number
      {
         return this._stageId;
      }
      
      public function get gateId() : Number
      {
         return this._gateId;
      }
      
      public function get levelId() : Number
      {
         return this._levelId;
      }
      
      public function get subLevelId() : Number
      {
         return this._subLevelId;
      }
      
      public function get needStars() : Number
      {
         return this._needStars;
      }
      
      public function get needItems() : String
      {
         return this._needItems;
      }
   }
}
