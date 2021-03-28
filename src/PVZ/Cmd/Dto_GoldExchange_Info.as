package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_GoldExchange_Info extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_GoldExchange_Info";
      
      public static const PRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GoldExchange_Info.price","price",1 << 3 | WireType.VARINT);
      
      public static const PRICE10TIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GoldExchange_Info.price10Times","price10Times",2 << 3 | WireType.VARINT);
      
      public static const GOLD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GoldExchange_Info.gold","gold",3 << 3 | WireType.VARINT);
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GoldExchange_Info.count","count",4 << 3 | WireType.VARINT);
      
      public static const TOTALCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GoldExchange_Info.totalCount","totalCount",5 << 3 | WireType.VARINT);
      
      public static const PRIORITY:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_GoldExchange_Info.priority","priority",6 << 3 | WireType.VARINT,E_Priority);
      
      public static const RECORDERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_GoldExchange_Info.recorders","recorders",7 << 3 | WireType.LENGTH_DELIMITED,Dto_GoldExchange_Recorder);
       
      
      private var price$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var price10Times$field:uint;
      
      private var gold$field:uint;
      
      private var count$field:uint;
      
      private var totalCount$field:uint;
      
      private var priority$field:int;
      
      public var recorders:Array;
      
      public function Dto_GoldExchange_Info()
      {
         this.recorders = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_GoldExchange_Info.$MessageID;
      }
      
      public function clearPrice() : void
      {
         this.hasField$0 &= 4294967294;
         this.price$field = new uint();
      }
      
      public function get hasPrice() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set price(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.price$field = param1;
      }
      
      public function get price() : uint
      {
         return this.price$field;
      }
      
      public function clearPrice10Times() : void
      {
         this.hasField$0 &= 4294967293;
         this.price10Times$field = new uint();
      }
      
      public function get hasPrice10Times() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set price10Times(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.price10Times$field = param1;
      }
      
      public function get price10Times() : uint
      {
         return this.price10Times$field;
      }
      
      public function clearGold() : void
      {
         this.hasField$0 &= 4294967291;
         this.gold$field = new uint();
      }
      
      public function get hasGold() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set gold(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.gold$field = param1;
      }
      
      public function get gold() : uint
      {
         return this.gold$field;
      }
      
      public function clearCount() : void
      {
         this.hasField$0 &= 4294967287;
         this.count$field = new uint();
      }
      
      public function get hasCount() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set count(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.count$field = param1;
      }
      
      public function get count() : uint
      {
         return this.count$field;
      }
      
      public function clearTotalCount() : void
      {
         this.hasField$0 &= 4294967279;
         this.totalCount$field = new uint();
      }
      
      public function get hasTotalCount() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set totalCount(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.totalCount$field = param1;
      }
      
      public function get totalCount() : uint
      {
         return this.totalCount$field;
      }
      
      public function clearPriority() : void
      {
         this.hasField$0 &= 4294967263;
         this.priority$field = new int();
      }
      
      public function get hasPriority() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set priority(param1:int) : void
      {
         this.hasField$0 |= 32;
         this.priority$field = param1;
      }
      
      public function get priority() : int
      {
         return this.priority$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasPrice)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.price$field);
         }
         if(this.hasPrice10Times)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.price10Times$field);
         }
         if(this.hasGold)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.gold$field);
         }
         if(this.hasCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.count$field);
         }
         if(this.hasTotalCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.totalCount$field);
         }
         if(this.hasPriority)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_ENUM(param1,this.priority$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.recorders.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.recorders[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Dto_GoldExchange_Info.price cannot be set twice.");
                  }
                  _loc3_++;
                  this.price = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GoldExchange_Info.price10Times cannot be set twice.");
                  }
                  _loc4_++;
                  this.price10Times = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GoldExchange_Info.gold cannot be set twice.");
                  }
                  _loc5_++;
                  this.gold = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GoldExchange_Info.count cannot be set twice.");
                  }
                  _loc6_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GoldExchange_Info.totalCount cannot be set twice.");
                  }
                  _loc7_++;
                  this.totalCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GoldExchange_Info.priority cannot be set twice.");
                  }
                  _loc8_++;
                  this.priority = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 7:
                  this.recorders.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_GoldExchange_Recorder()));
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
