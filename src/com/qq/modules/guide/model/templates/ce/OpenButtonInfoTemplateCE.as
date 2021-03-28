package com.qq.modules.guide.model.templates.ce
{
   public class OpenButtonInfoTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _buttonName:String;
      
      protected var _openLv:Number;
      
      protected var _openDays:Number;
      
      protected var _checkPanelName:String;
      
      protected var _addCommand:String;
      
      protected var _operateType:String;
      
      public function OpenButtonInfoTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._buttonName = param1.buttonName;
         this._openLv = param1.openLv;
         this._openDays = param1.openDays;
         this._checkPanelName = param1.checkPanelName;
         this._addCommand = param1.addCommand;
         this._operateType = param1.operateType;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get buttonName() : String
      {
         return this._buttonName;
      }
      
      public function get openLv() : Number
      {
         return this._openLv;
      }
      
      public function get openDays() : Number
      {
         return this._openDays;
      }
      
      public function get checkPanelName() : String
      {
         return this._checkPanelName;
      }
      
      public function get addCommand() : String
      {
         return this._addCommand;
      }
      
      public function get operateType() : String
      {
         return this._operateType;
      }
   }
}
