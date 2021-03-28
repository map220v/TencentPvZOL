package com.qq.modules.dummy.model.templates.ce
{
   public class DummyFubenLevelTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _mode:Number;
      
      protected var _chapterID:Number;
      
      protected var _stageID:Number;
      
      protected var _levelID:Number;
      
      protected var _name:String;
      
      protected var _recommandFP:Number;
      
      public function DummyFubenLevelTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._mode = param1.mode;
         this._chapterID = param1.chapterID;
         this._stageID = param1.stageID;
         this._levelID = param1.levelID;
         this._name = param1.name;
         this._recommandFP = param1.recommandFP;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get mode() : Number
      {
         return this._mode;
      }
      
      public function get chapterID() : Number
      {
         return this._chapterID;
      }
      
      public function get stageID() : Number
      {
         return this._stageID;
      }
      
      public function get levelID() : Number
      {
         return this._levelID;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get recommandFP() : Number
      {
         return this._recommandFP;
      }
   }
}
