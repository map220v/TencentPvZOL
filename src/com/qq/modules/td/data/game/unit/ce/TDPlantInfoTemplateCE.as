package com.qq.modules.td.data.game.unit.ce
{
   public class TDPlantInfoTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _type:Number;
      
      protected var _avaterID:Number;
      
      protected var _stageId:Number;
      
      public function TDPlantInfoTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._type = param1.type;
         this._avaterID = param1.avaterID;
         this._stageId = param1.stageId;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get avaterID() : Number
      {
         return this._avaterID;
      }
      
      public function get stageId() : Number
      {
         return this._stageId;
      }
   }
}
