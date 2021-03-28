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
   
   public final class Cmd_Adventure_Do_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Adventure_Do_SC";
      
      public static const PLACE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_Do_SC.place","place",1 << 3 | WireType.VARINT);
      
      public static const ROUTE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_Do_SC.route","route",2 << 3 | WireType.VARINT);
      
      public static const PLACES:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_Do_SC.places","places",3 << 3 | WireType.VARINT);
      
      public static const REWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Adventure_Do_SC.rewards","rewards",4 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const SPECIALREWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Adventure_Do_SC.specialRewards","specialRewards",5 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const CURRENTFINISH:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_Do_SC.currentFinish","currentFinish",6 << 3 | WireType.VARINT);
      
      public static const TODAYADVENTURETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_Do_SC.todayAdventureTime","todayAdventureTime",7 << 3 | WireType.VARINT);
       
      
      private var place$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var route$field:uint;
      
      public var places:Array;
      
      public var rewards:Array;
      
      public var specialRewards:Array;
      
      private var currentFinish$field:uint;
      
      private var todayAdventureTime$field:uint;
      
      public function Cmd_Adventure_Do_SC()
      {
         this.places = [];
         this.rewards = [];
         this.specialRewards = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Adventure_Do_SC.$MessageID;
      }
      
      public function clearPlace() : void
      {
         this.hasField$0 &= 4294967294;
         this.place$field = new uint();
      }
      
      public function get hasPlace() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set place(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.place$field = param1;
      }
      
      public function get place() : uint
      {
         return this.place$field;
      }
      
      public function clearRoute() : void
      {
         this.hasField$0 &= 4294967293;
         this.route$field = new uint();
      }
      
      public function get hasRoute() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set route(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.route$field = param1;
      }
      
      public function get route() : uint
      {
         return this.route$field;
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
      
      public function clearTodayAdventureTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.todayAdventureTime$field = new uint();
      }
      
      public function get hasTodayAdventureTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set todayAdventureTime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.todayAdventureTime$field = param1;
      }
      
      public function get todayAdventureTime() : uint
      {
         return this.todayAdventureTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         if(this.hasPlace)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.place$field);
         }
         if(this.hasRoute)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.route$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.places.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.places[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.rewards.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewards[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.specialRewards.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.specialRewards[_loc4_]);
            _loc4_++;
         }
         if(this.hasCurrentFinish)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.currentFinish$field);
         }
         if(this.hasTodayAdventureTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.todayAdventureTime$field);
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Adventure_Do_SC.place cannot be set twice.");
                  }
                  _loc3_++;
                  this.place = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Adventure_Do_SC.route cannot be set twice.");
                  }
                  _loc4_++;
                  this.route = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if((_loc7_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.places);
                  }
                  else
                  {
                     this.places.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 4:
                  this.rewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 5:
                  this.specialRewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 6:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Adventure_Do_SC.currentFinish cannot be set twice.");
                  }
                  _loc5_++;
                  this.currentFinish = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Adventure_Do_SC.todayAdventureTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.todayAdventureTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
