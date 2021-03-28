package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Adventure_Auto_Do_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Adventure_Auto_Do_SC";
      
      public static const ROUTE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_Auto_Do_SC.route","route",1 << 3 | WireType.VARINT);
      
      public static const CONSUMEREFRESH:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_Auto_Do_SC.consumeRefresh","consumeRefresh",2 << 3 | WireType.VARINT);
      
      public static const REWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Adventure_Auto_Do_SC.rewards","rewards",3 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const CURRENTFINISH:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_Auto_Do_SC.currentFinish","currentFinish",4 << 3 | WireType.VARINT);
      
      public static const PLACES:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_Auto_Do_SC.places","places",5 << 3 | WireType.VARINT);
      
      public static const ADVENTUREREMAIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_Auto_Do_SC.adventureRemain","adventureRemain",6 << 3 | WireType.VARINT);
      
      public static const SPECIALREWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Adventure_Auto_Do_SC.specialRewards","specialRewards",7 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const TAKEADVENTURECOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_Auto_Do_SC.takeAdventureCount","takeAdventureCount",8 << 3 | WireType.VARINT);
      
      public static const FREEREFRESHREMAIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_Auto_Do_SC.freeRefreshRemain","freeRefreshRemain",9 << 3 | WireType.VARINT);
      
      public static const TODAYADVENTURETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_Auto_Do_SC.todayAdventureTime","todayAdventureTime",10 << 3 | WireType.VARINT);
       
      
      private var route$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var consumeRefresh$field:uint;
      
      public var rewards:Array;
      
      private var currentFinish$field:uint;
      
      public var places:Array;
      
      private var adventureRemain$field:uint;
      
      public var specialRewards:Array;
      
      private var takeAdventureCount$field:uint;
      
      private var freeRefreshRemain$field:uint;
      
      private var todayAdventureTime$field:uint;
      
      public function Cmd_Adventure_Auto_Do_SC()
      {
         this.rewards = [];
         this.places = [];
         this.specialRewards = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Adventure_Auto_Do_SC.$MessageID;
      }
      
      public function clearRoute() : void
      {
         this.hasField$0 &= 4294967294;
         this.route$field = new uint();
      }
      
      public function get hasRoute() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set route(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.route$field = param1;
      }
      
      public function get route() : uint
      {
         return this.route$field;
      }
      
      public function clearConsumeRefresh() : void
      {
         this.hasField$0 &= 4294967293;
         this.consumeRefresh$field = new uint();
      }
      
      public function get hasConsumeRefresh() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set consumeRefresh(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.consumeRefresh$field = param1;
      }
      
      public function get consumeRefresh() : uint
      {
         return this.consumeRefresh$field;
      }
      
      public function clearCurrentFinish() : void
      {
         this.hasField$0 &= 4294967291;
         this.currentFinish$field = new uint();
      }
      
      public function get hasCurrentFinish() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set currentFinish(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.currentFinish$field = param1;
      }
      
      public function get currentFinish() : uint
      {
         return this.currentFinish$field;
      }
      
      public function clearAdventureRemain() : void
      {
         this.hasField$0 &= 4294967287;
         this.adventureRemain$field = new uint();
      }
      
      public function get hasAdventureRemain() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set adventureRemain(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.adventureRemain$field = param1;
      }
      
      public function get adventureRemain() : uint
      {
         return this.adventureRemain$field;
      }
      
      public function clearTakeAdventureCount() : void
      {
         this.hasField$0 &= 4294967279;
         this.takeAdventureCount$field = new uint();
      }
      
      public function get hasTakeAdventureCount() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set takeAdventureCount(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.takeAdventureCount$field = param1;
      }
      
      public function get takeAdventureCount() : uint
      {
         return this.takeAdventureCount$field;
      }
      
      public function clearFreeRefreshRemain() : void
      {
         this.hasField$0 &= 4294967263;
         this.freeRefreshRemain$field = new uint();
      }
      
      public function get hasFreeRefreshRemain() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set freeRefreshRemain(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.freeRefreshRemain$field = param1;
      }
      
      public function get freeRefreshRemain() : uint
      {
         return this.freeRefreshRemain$field;
      }
      
      public function clearTodayAdventureTime() : void
      {
         this.hasField$0 &= 4294967231;
         this.todayAdventureTime$field = new uint();
      }
      
      public function get hasTodayAdventureTime() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set todayAdventureTime(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.todayAdventureTime$field = param1;
      }
      
      public function get todayAdventureTime() : uint
      {
         return this.todayAdventureTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         if(this.hasRoute)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.route$field);
         }
         if(this.hasConsumeRefresh)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.consumeRefresh$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewards.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewards[_loc2_]);
            _loc2_++;
         }
         if(this.hasCurrentFinish)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.currentFinish$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.places.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.places[_loc3_]);
            _loc3_++;
         }
         if(this.hasAdventureRemain)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.adventureRemain$field);
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.specialRewards.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.specialRewards[_loc4_]);
            _loc4_++;
         }
         if(this.hasTakeAdventureCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.takeAdventureCount$field);
         }
         if(this.hasFreeRefreshRemain)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.freeRefreshRemain$field);
         }
         if(this.hasTodayAdventureTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.todayAdventureTime$field);
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc10_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc10_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc10_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Adventure_Auto_Do_SC.route cannot be set twice.");
                  }
                  _loc3_++;
                  this.route = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Adventure_Auto_Do_SC.consumeRefresh cannot be set twice.");
                  }
                  _loc4_++;
                  this.consumeRefresh = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  this.rewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Adventure_Auto_Do_SC.currentFinish cannot be set twice.");
                  }
                  _loc5_++;
                  this.currentFinish = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if((_loc10_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.places);
                  }
                  else
                  {
                     this.places.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Adventure_Auto_Do_SC.adventureRemain cannot be set twice.");
                  }
                  _loc6_++;
                  this.adventureRemain = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  this.specialRewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 8:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Adventure_Auto_Do_SC.takeAdventureCount cannot be set twice.");
                  }
                  _loc7_++;
                  this.takeAdventureCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Adventure_Auto_Do_SC.freeRefreshRemain cannot be set twice.");
                  }
                  _loc8_++;
                  this.freeRefreshRemain = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Adventure_Auto_Do_SC.todayAdventureTime cannot be set twice.");
                  }
                  _loc9_++;
                  this.todayAdventureTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
