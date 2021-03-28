package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Scratch_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Scratch_GetInfo_SC";
      
      public static const REMAINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Scratch_GetInfo_SC.remainTime","remainTime",1 << 3 | WireType.VARINT);
      
      public static const TOTALTICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Scratch_GetInfo_SC.totalTicket","totalTicket",2 << 3 | WireType.VARINT);
      
      public static const ISOPEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Scratch_GetInfo_SC.isOpen","isOpen",3 << 3 | WireType.VARINT);
      
      public static const EVENT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Scratch_GetInfo_SC.event","event",4 << 3 | WireType.LENGTH_DELIMITED,Dto_Scratch_Event);
      
      public static const BUYTICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Scratch_GetInfo_SC.buyTicket","buyTicket",5 << 3 | WireType.VARINT);
      
      public static const REMAINTICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Scratch_GetInfo_SC.remainTicket","remainTicket",6 << 3 | WireType.VARINT);
      
      public static const TOPRCD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Scratch_GetInfo_SC.topRcd","topRcd",7 << 3 | WireType.LENGTH_DELIMITED,Dto_Scratch_Event);
       
      
      private var remainTime$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var totalTicket$field:uint;
      
      private var isOpen$field:Boolean;
      
      public var event:Array;
      
      private var buyTicket$field:uint;
      
      private var remainTicket$field:uint;
      
      public var topRcd:Array;
      
      public function Cmd_Scratch_GetInfo_SC()
      {
         this.event = [];
         this.topRcd = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Scratch_GetInfo_SC.$MessageID;
      }
      
      public function clearRemainTime() : void
      {
         this.hasField$0 &= 4294967294;
         this.remainTime$field = new uint();
      }
      
      public function get hasRemainTime() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set remainTime(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.remainTime$field = param1;
      }
      
      public function get remainTime() : uint
      {
         return this.remainTime$field;
      }
      
      public function clearTotalTicket() : void
      {
         this.hasField$0 &= 4294967293;
         this.totalTicket$field = new uint();
      }
      
      public function get hasTotalTicket() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set totalTicket(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.totalTicket$field = param1;
      }
      
      public function get totalTicket() : uint
      {
         return this.totalTicket$field;
      }
      
      public function clearIsOpen() : void
      {
         this.hasField$0 &= 4294967291;
         this.isOpen$field = new Boolean();
      }
      
      public function get hasIsOpen() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set isOpen(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.isOpen$field = param1;
      }
      
      public function get isOpen() : Boolean
      {
         return this.isOpen$field;
      }
      
      public function clearBuyTicket() : void
      {
         this.hasField$0 &= 4294967287;
         this.buyTicket$field = new uint();
      }
      
      public function get hasBuyTicket() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set buyTicket(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.buyTicket$field = param1;
      }
      
      public function get buyTicket() : uint
      {
         return this.buyTicket$field;
      }
      
      public function clearRemainTicket() : void
      {
         this.hasField$0 &= 4294967279;
         this.remainTicket$field = new uint();
      }
      
      public function get hasRemainTicket() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set remainTicket(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.remainTicket$field = param1;
      }
      
      public function get remainTicket() : uint
      {
         return this.remainTicket$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasRemainTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.remainTime$field);
         }
         if(this.hasTotalTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.totalTicket$field);
         }
         if(this.hasIsOpen)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.isOpen$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.event.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.event[_loc2_]);
            _loc2_++;
         }
         if(this.hasBuyTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.buyTicket$field);
         }
         if(this.hasRemainTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.remainTicket$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.topRcd.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.topRcd[_loc3_]);
            _loc3_++;
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
                     throw new IOError("Bad data format: Cmd_Scratch_GetInfo_SC.remainTime cannot be set twice.");
                  }
                  _loc3_++;
                  this.remainTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Scratch_GetInfo_SC.totalTicket cannot be set twice.");
                  }
                  _loc4_++;
                  this.totalTicket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Scratch_GetInfo_SC.isOpen cannot be set twice.");
                  }
                  _loc5_++;
                  this.isOpen = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 4:
                  this.event.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Scratch_Event()));
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Scratch_GetInfo_SC.buyTicket cannot be set twice.");
                  }
                  _loc6_++;
                  this.buyTicket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Scratch_GetInfo_SC.remainTicket cannot be set twice.");
                  }
                  _loc7_++;
                  this.remainTicket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  this.topRcd.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Scratch_Event()));
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
