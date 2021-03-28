package com.qq.modules.main.model.templates.ce
{
   public class ErrorTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _desc:String;
      
      protected var _showPos:Number;
      
      protected var _handlerID:Number;
      
      protected var _isForbidConnectAgain:Number;
      
      public function ErrorTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._desc = param1.desc;
         this._showPos = param1.showPos;
         this._handlerID = param1.handlerID;
         this._isForbidConnectAgain = param1.isForbidConnectAgain;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get showPos() : Number
      {
         return this._showPos;
      }
      
      public function get handlerID() : Number
      {
         return this._handlerID;
      }
      
      public function get isForbidConnectAgain() : Number
      {
         return this._isForbidConnectAgain;
      }
   }
}
