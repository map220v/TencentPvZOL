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
   
   public final class Cmd_Adventure_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Adventure_GetInfo_SC";
      
      public static const ADVENTUREREMAIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_GetInfo_SC.adventureRemain","adventureRemain",1 << 3 | WireType.VARINT);
      
      public static const CURRENTROUTE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_GetInfo_SC.currentRoute","currentRoute",2 << 3 | WireType.VARINT);
      
      public static const CURRENTFINISH:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_GetInfo_SC.currentFinish","currentFinish",3 << 3 | WireType.VARINT);
      
      public static const ROUTES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Adventure_GetInfo_SC.routes","routes",4 << 3 | WireType.LENGTH_DELIMITED,Dto_Adventure_Route);
      
      public static const PLACES:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_GetInfo_SC.places","places",5 << 3 | WireType.VARINT);
      
      public static const FREEREFRESHREMAIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_GetInfo_SC.freeRefreshRemain","freeRefreshRemain",6 << 3 | WireType.VARINT);
      
      public static const TODAYADVENTURETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Adventure_GetInfo_SC.todayAdventureTime","todayAdventureTime",7 << 3 | WireType.VARINT);
       
      
      private var adventureRemain$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var currentRoute$field:uint;
      
      private var currentFinish$field:uint;
      
      public var routes:Array;
      
      public var places:Array;
      
      private var freeRefreshRemain$field:uint;
      
      private var todayAdventureTime$field:uint;
      
      public function Cmd_Adventure_GetInfo_SC()
      {
         this.routes = [];
         this.places = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Adventure_GetInfo_SC.$MessageID;
      }
      
      public function clearAdventureRemain() : void
      {
         this.hasField$0 &= 4294967294;
         this.adventureRemain$field = new uint();
      }
      
      public function get hasAdventureRemain() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set adventureRemain(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.adventureRemain$field = param1;
      }
      
      public function get adventureRemain() : uint
      {
         return this.adventureRemain$field;
      }
      
      public function clearCurrentRoute() : void
      {
         this.hasField$0 &= 4294967293;
         this.currentRoute$field = new uint();
      }
      
      public function get hasCurrentRoute() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set currentRoute(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.currentRoute$field = param1;
      }
      
      public function get currentRoute() : uint
      {
         return this.currentRoute$field;
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
      
      public function clearFreeRefreshRemain() : void
      {
         this.hasField$0 &= 4294967287;
         this.freeRefreshRemain$field = new uint();
      }
      
      public function get hasFreeRefreshRemain() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set freeRefreshRemain(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.freeRefreshRemain$field = param1;
      }
      
      public function get freeRefreshRemain() : uint
      {
         return this.freeRefreshRemain$field;
      }
      
      public function clearTodayAdventureTime() : void
      {
         this.hasField$0 &= 4294967279;
         this.todayAdventureTime$field = new uint();
      }
      
      public function get hasTodayAdventureTime() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set todayAdventureTime(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.todayAdventureTime$field = param1;
      }
      
      public function get todayAdventureTime() : uint
      {
         return this.todayAdventureTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasAdventureRemain)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.adventureRemain$field);
         }
         if(this.hasCurrentRoute)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.currentRoute$field);
         }
         if(this.hasCurrentFinish)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.currentFinish$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.routes.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.routes[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.places.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.places[_loc3_]);
            _loc3_++;
         }
         if(this.hasFreeRefreshRemain)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.freeRefreshRemain$field);
         }
         if(this.hasTodayAdventureTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.todayAdventureTime$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Adventure_GetInfo_SC.adventureRemain cannot be set twice.");
                  }
                  _loc3_++;
                  this.adventureRemain = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Adventure_GetInfo_SC.currentRoute cannot be set twice.");
                  }
                  _loc4_++;
                  this.currentRoute = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Adventure_GetInfo_SC.currentFinish cannot be set twice.");
                  }
                  _loc5_++;
                  this.currentFinish = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  this.routes.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Adventure_Route()));
                  break;
               case 5:
                  if((_loc8_ & 7) == WireType.LENGTH_DELIMITED)
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
                     throw new IOError("Bad data format: Cmd_Adventure_GetInfo_SC.freeRefreshRemain cannot be set twice.");
                  }
                  _loc6_++;
                  this.freeRefreshRemain = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Adventure_GetInfo_SC.todayAdventureTime cannot be set twice.");
                  }
                  _loc7_++;
                  this.todayAdventureTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
