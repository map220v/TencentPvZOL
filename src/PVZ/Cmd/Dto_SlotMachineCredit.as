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
   
   public final class Dto_SlotMachineCredit extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_SlotMachineCredit";
      
      public static const REWARDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SlotMachineCredit.rewardid","rewardid",1 << 3 | WireType.VARINT);
      
      public static const CREDITUP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SlotMachineCredit.creditup","creditup",2 << 3 | WireType.VARINT);
      
      public static const CREDITDOWN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SlotMachineCredit.creditdown","creditdown",3 << 3 | WireType.VARINT);
      
      public static const ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_SlotMachineCredit.items","items",4 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const HASTAKEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_SlotMachineCredit.hastaken","hastaken",5 << 3 | WireType.VARINT);
       
      
      private var rewardid$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var creditup$field:uint;
      
      private var creditdown$field:uint;
      
      public var items:Array;
      
      private var hastaken$field:Boolean;
      
      public function Dto_SlotMachineCredit()
      {
         this.items = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_SlotMachineCredit.$MessageID;
      }
      
      public function clearRewardid() : void
      {
         this.hasField$0 &= 4294967294;
         this.rewardid$field = new uint();
      }
      
      public function get hasRewardid() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set rewardid(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.rewardid$field = param1;
      }
      
      public function get rewardid() : uint
      {
         return this.rewardid$field;
      }
      
      public function clearCreditup() : void
      {
         this.hasField$0 &= 4294967293;
         this.creditup$field = new uint();
      }
      
      public function get hasCreditup() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set creditup(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.creditup$field = param1;
      }
      
      public function get creditup() : uint
      {
         return this.creditup$field;
      }
      
      public function clearCreditdown() : void
      {
         this.hasField$0 &= 4294967291;
         this.creditdown$field = new uint();
      }
      
      public function get hasCreditdown() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set creditdown(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.creditdown$field = param1;
      }
      
      public function get creditdown() : uint
      {
         return this.creditdown$field;
      }
      
      public function clearHastaken() : void
      {
         this.hasField$0 &= 4294967287;
         this.hastaken$field = new Boolean();
      }
      
      public function get hasHastaken() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set hastaken(param1:Boolean) : void
      {
         this.hasField$0 |= 8;
         this.hastaken$field = param1;
      }
      
      public function get hastaken() : Boolean
      {
         return this.hastaken$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasRewardid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardid$field);
         }
         if(this.hasCreditup)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.creditup$field);
         }
         if(this.hasCreditdown)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.creditdown$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.items.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.items[_loc2_]);
            _loc2_++;
         }
         if(this.hasHastaken)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.hastaken$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Dto_SlotMachineCredit.rewardid cannot be set twice.");
                  }
                  _loc3_++;
                  this.rewardid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SlotMachineCredit.creditup cannot be set twice.");
                  }
                  _loc4_++;
                  this.creditup = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SlotMachineCredit.creditdown cannot be set twice.");
                  }
                  _loc5_++;
                  this.creditdown = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  this.items.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SlotMachineCredit.hastaken cannot be set twice.");
                  }
                  _loc6_++;
                  this.hastaken = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
