package com.qq.modules.endlessTD.model
{
   import flash.utils.ByteArray;
   
   public class EndlessTDPlantRecord extends EndlessTDObjectRecord
   {
      
      private static const TAG_PLANT_ID:uint = 0;
      
      private static const TAG_CURRENT_HP:uint = 1;
      
      private static const TAG_TILE_INDEX:uint = 2;
       
      
      public function EndlessTDPlantRecord()
      {
         super();
      }
      
      public static function createFromBytes(param1:ByteArray) : EndlessTDPlantRecord
      {
         var _loc2_:EndlessTDPlantRecord = new EndlessTDPlantRecord();
         _loc2_.readFromBytes(param1);
         return _loc2_;
      }
      
      public static function createFromObject(param1:Object) : EndlessTDPlantRecord
      {
         var _loc2_:EndlessTDPlantRecord = new EndlessTDPlantRecord();
         _loc2_.plantID = param1.plantID;
         _loc2_.tileIndex = param1.tileIndex;
         _loc2_.currentHP = param1.currentHP;
         return _loc2_;
      }
      
      override protected function get tagBounds() : uint
      {
         return 3;
      }
      
      public function get currentHP() : uint
      {
         return getValue(TAG_CURRENT_HP);
      }
      
      public function set currentHP(param1:uint) : void
      {
         setValue(TAG_CURRENT_HP,param1);
      }
      
      public function get plantID() : uint
      {
         return getValue(TAG_PLANT_ID);
      }
      
      public function set plantID(param1:uint) : void
      {
         setValue(TAG_PLANT_ID,param1);
      }
      
      public function get tileIndex() : uint
      {
         return getValue(TAG_TILE_INDEX);
      }
      
      public function set tileIndex(param1:uint) : void
      {
         setValue(TAG_TILE_INDEX,param1);
      }
   }
}
