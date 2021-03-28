package com.qq.modules.endlessTD.model
{
   import com.qq.modules.endlessTD.EndlessTDConst;
   import flash.utils.ByteArray;
   
   public class EndlessTDStageRecord
   {
       
      
      private var m_vecPlant:Vector.<EndlessTDPlantRecord>;
      
      private var m_vecTile:Vector.<EndlessTDTileRecord>;
      
      private var m_level:uint;
      
      private var m_rain:uint;
      
      private var m_score:uint;
      
      private var m_bean:uint;
      
      private var m_sun:uint;
      
      public function EndlessTDStageRecord()
      {
         super();
         this.m_vecPlant = new Vector.<EndlessTDPlantRecord>();
         this.m_vecTile = new Vector.<EndlessTDTileRecord>();
      }
      
      public function set level(param1:uint) : void
      {
         this.m_level = param1;
      }
      
      public function get level() : uint
      {
         return this.m_level;
      }
      
      public function set rain(param1:uint) : void
      {
         this.m_rain = param1;
      }
      
      public function get rain() : uint
      {
         return this.m_rain;
      }
      
      public function set score(param1:uint) : void
      {
         this.m_score = param1;
      }
      
      public function get score() : uint
      {
         return this.m_score;
      }
      
      public function set sun(param1:uint) : void
      {
         this.m_sun = param1;
      }
      
      public function get sun() : uint
      {
         return this.m_sun;
      }
      
      public function get bean() : uint
      {
         return this.m_bean;
      }
      
      public function set bean(param1:uint) : void
      {
         this.m_bean = param1;
      }
      
      public function save() : ByteArray
      {
         var _loc2_:EndlessTDPlantRecord = null;
         var _loc3_:EndlessTDTileRecord = null;
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.writeUnsignedInt(EndlessTDConst.ENDLESS_TD_RECORD_VERSION);
         _loc1_.writeUnsignedInt(this.m_sun);
         _loc1_.writeByte(this.m_bean);
         _loc1_.writeByte(this.m_vecPlant.length);
         for each(_loc2_ in this.m_vecPlant)
         {
            _loc2_.writeToBytes(_loc1_);
         }
         _loc1_.writeByte(this.m_vecTile.length);
         for each(_loc3_ in this.m_vecTile)
         {
            _loc3_.writeToBytes(_loc1_);
         }
         _loc1_.compress();
         return _loc1_;
      }
      
      public function addRecord(param1:EndlessTDPlantRecord) : void
      {
         this.m_vecPlant.push(param1);
      }
      
      public function addTile(param1:EndlessTDTileRecord) : void
      {
         this.m_vecTile.push(param1);
      }
      
      public function load(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:uint = 0;
         var _loc5_:EndlessTDPlantRecord = null;
         param1.uncompress();
         var _loc2_:int = param1.readUnsignedInt();
         if(_loc2_ == EndlessTDConst.ENDLESS_TD_RECORD_VERSION)
         {
            this.m_sun = param1.readUnsignedInt();
            this.m_bean = param1.readUnsignedByte();
            _loc4_ = param1.readUnsignedByte();
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               this.m_vecPlant.push(EndlessTDPlantRecord.createFromBytes(param1));
               _loc3_++;
            }
            _loc4_ = param1.readUnsignedByte();
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               this.m_vecTile.push(EndlessTDTileRecord.createFromBytes(param1));
               _loc3_++;
            }
         }
         else
         {
            this.reset();
         }
      }
      
      public function get allRecord() : Vector.<EndlessTDPlantRecord>
      {
         return this.m_vecPlant;
      }
      
      public function get allTile() : Vector.<EndlessTDTileRecord>
      {
         return this.m_vecTile;
      }
      
      public function reset() : void
      {
         this.m_score = 0;
         this.m_rain = 0;
         this.m_level = 0;
         this.m_bean = 0;
         this.m_sun = 0;
         this.m_vecPlant.length = 0;
         this.m_vecTile.length = 0;
      }
   }
}
