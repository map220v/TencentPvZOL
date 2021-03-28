package com.qq.modules.fuben.model.templates.ce
{
   public class FubenBonusTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _mode:Number;
      
      protected var _bonus:String;
      
      protected var _xy:String;
      
      protected var _starsMax:Number;
      
      protected var _nextDoorXy:String;
      
      public function FubenBonusTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._mode = param1.mode;
         this._bonus = param1.bonus;
         this._xy = param1.xy;
         this._starsMax = param1.starsMax;
         this._nextDoorXy = param1.nextDoorXy;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get mode() : Number
      {
         return this._mode;
      }
      
      public function get bonus() : String
      {
         return this._bonus;
      }
      
      public function get xy() : String
      {
         return this._xy;
      }
      
      public function get starsMax() : Number
      {
         return this._starsMax;
      }
      
      public function get nextDoorXy() : String
      {
         return this._nextDoorXy;
      }
   }
}
