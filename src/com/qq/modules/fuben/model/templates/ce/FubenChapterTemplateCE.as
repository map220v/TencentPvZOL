package com.qq.modules.fuben.model.templates.ce
{
   public class FubenChapterTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _levelNeed:Number;
      
      protected var _levelMin:Number;
      
      protected var _levelMax:Number;
      
      protected var _desc:String;
      
      protected var _battleMapId:Number;
      
      public function FubenChapterTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._levelNeed = param1.levelNeed;
         this._levelMin = param1.levelMin;
         this._levelMax = param1.levelMax;
         this._desc = param1.desc;
         this._battleMapId = param1.battleMapId;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get levelNeed() : Number
      {
         return this._levelNeed;
      }
      
      public function get levelMin() : Number
      {
         return this._levelMin;
      }
      
      public function get levelMax() : Number
      {
         return this._levelMax;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get battleMapId() : Number
      {
         return this._battleMapId;
      }
   }
}
