package com.qq.modules.endlessTD.model
{
   import flash.utils.ByteArray;
   
   public class EndlessTDTileRecord extends EndlessTDObjectRecord
   {
      
      private static const TAG_TILE_TYPE:uint = 0;
      
      private static const TAG_TILE_INDEX:uint = 1;
       
      
      public function EndlessTDTileRecord()
      {
         super();
      }
      
      public static function createFromBytes(param1:ByteArray) : EndlessTDTileRecord
      {
         var _loc2_:EndlessTDTileRecord = new EndlessTDTileRecord();
         _loc2_.readFromBytes(param1);
         return _loc2_;
      }
      
      public static function createFromObject(param1:Object) : EndlessTDTileRecord
      {
         var _loc2_:EndlessTDTileRecord = new EndlessTDTileRecord();
         _loc2_.tileIndex = param1.tileIndex;
         _loc2_.tileType = param1.tileType;
         return _loc2_;
      }
      
      override protected function get tagBounds() : uint
      {
         return 2;
      }
      
      public function set tileType(param1:uint) : void
      {
         setValue(TAG_TILE_TYPE,param1);
      }
      
      public function get tileType() : uint
      {
         return getValue(TAG_TILE_TYPE);
      }
      
      public function set tileIndex(param1:uint) : void
      {
         setValue(TAG_TILE_INDEX,param1);
      }
      
      public function get tileIndex() : uint
      {
         return getValue(TAG_TILE_INDEX);
      }
   }
}
