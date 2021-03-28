package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_SyncTreasure_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SyncTreasure_SC";
      
      public static const REMAINSERARCHCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SyncTreasure_SC.remainSerarchCount","remainSerarchCount",1 << 3 | WireType.VARINT);
      
      public static const REMAINSEIZECOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SyncTreasure_SC.remainSeizeCount","remainSeizeCount",2 << 3 | WireType.VARINT);
      
      public static const ISSEARCHING:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_SyncTreasure_SC.isSearching","isSearching",4 << 3 | WireType.VARINT);
      
      public static const CANTAKETREASUREMAP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_SyncTreasure_SC.canTakeTreasureMap","canTakeTreasureMap",5 << 3 | WireType.VARINT);
      
      public static const SEARCHENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SyncTreasure_SC.searchEndTime","searchEndTime",6 << 3 | WireType.VARINT);
      
      public static const SEIZEENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SyncTreasure_SC.seizeEndTime","seizeEndTime",7 << 3 | WireType.VARINT);
       
      
      private var remainSerarchCount$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var remainSeizeCount$field:uint;
      
      private var isSearching$field:Boolean;
      
      private var canTakeTreasureMap$field:Boolean;
      
      private var searchEndTime$field:uint;
      
      private var seizeEndTime$field:uint;
      
      public function Cmd_SyncTreasure_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SyncTreasure_SC.$MessageID;
      }
      
      public function clearRemainSerarchCount() : void
      {
         this.hasField$0 &= 4294967294;
         this.remainSerarchCount$field = new uint();
      }
      
      public function get hasRemainSerarchCount() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set remainSerarchCount(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.remainSerarchCount$field = param1;
      }
      
      public function get remainSerarchCount() : uint
      {
         return this.remainSerarchCount$field;
      }
      
      public function clearRemainSeizeCount() : void
      {
         this.hasField$0 &= 4294967293;
         this.remainSeizeCount$field = new uint();
      }
      
      public function get hasRemainSeizeCount() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set remainSeizeCount(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.remainSeizeCount$field = param1;
      }
      
      public function get remainSeizeCount() : uint
      {
         return this.remainSeizeCount$field;
      }
      
      public function clearIsSearching() : void
      {
         this.hasField$0 &= 4294967291;
         this.isSearching$field = new Boolean();
      }
      
      public function get hasIsSearching() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set isSearching(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.isSearching$field = param1;
      }
      
      public function get isSearching() : Boolean
      {
         return this.isSearching$field;
      }
      
      public function clearCanTakeTreasureMap() : void
      {
         this.hasField$0 &= 4294967287;
         this.canTakeTreasureMap$field = new Boolean();
      }
      
      public function get hasCanTakeTreasureMap() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set canTakeTreasureMap(param1:Boolean) : void
      {
         this.hasField$0 |= 8;
         this.canTakeTreasureMap$field = param1;
      }
      
      public function get canTakeTreasureMap() : Boolean
      {
         return this.canTakeTreasureMap$field;
      }
      
      public function clearSearchEndTime() : void
      {
         this.hasField$0 &= 4294967279;
         this.searchEndTime$field = new uint();
      }
      
      public function get hasSearchEndTime() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set searchEndTime(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.searchEndTime$field = param1;
      }
      
      public function get searchEndTime() : uint
      {
         return this.searchEndTime$field;
      }
      
      public function clearSeizeEndTime() : void
      {
         this.hasField$0 &= 4294967263;
         this.seizeEndTime$field = new uint();
      }
      
      public function get hasSeizeEndTime() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set seizeEndTime(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.seizeEndTime$field = param1;
      }
      
      public function get seizeEndTime() : uint
      {
         return this.seizeEndTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRemainSerarchCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.remainSerarchCount$field);
         }
         if(this.hasRemainSeizeCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.remainSeizeCount$field);
         }
         if(this.hasIsSearching)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.isSearching$field);
         }
         if(this.hasCanTakeTreasureMap)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.canTakeTreasureMap$field);
         }
         if(this.hasSearchEndTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.searchEndTime$field);
         }
         if(this.hasSeizeEndTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.seizeEndTime$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SyncTreasure_SC.remainSerarchCount cannot be set twice.");
                  }
                  _loc3_++;
                  this.remainSerarchCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SyncTreasure_SC.remainSeizeCount cannot be set twice.");
                  }
                  _loc4_++;
                  this.remainSeizeCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SyncTreasure_SC.isSearching cannot be set twice.");
                  }
                  _loc5_++;
                  this.isSearching = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SyncTreasure_SC.canTakeTreasureMap cannot be set twice.");
                  }
                  _loc6_++;
                  this.canTakeTreasureMap = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SyncTreasure_SC.searchEndTime cannot be set twice.");
                  }
                  _loc7_++;
                  this.searchEndTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SyncTreasure_SC.seizeEndTime cannot be set twice.");
                  }
                  _loc8_++;
                  this.seizeEndTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
