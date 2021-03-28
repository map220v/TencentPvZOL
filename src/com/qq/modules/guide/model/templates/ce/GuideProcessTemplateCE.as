package com.qq.modules.guide.model.templates.ce
{
   public class GuideProcessTemplateCE
   {
       
      
      protected var _order:Number;
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _openCondition:String;
      
      protected var _scene:String;
      
      protected var _finish:String;
      
      public function GuideProcessTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._order = param1.order;
         this._id = param1.id;
         this._name = param1.name;
         this._openCondition = param1.openCondition;
         this._scene = param1.scene;
         this._finish = param1.finish;
      }
      
      public function get order() : Number
      {
         return this._order;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get openCondition() : String
      {
         return this._openCondition;
      }
      
      public function get scene() : String
      {
         return this._scene;
      }
      
      public function get finish() : String
      {
         return this._finish;
      }
   }
}
