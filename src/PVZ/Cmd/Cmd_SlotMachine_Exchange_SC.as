package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_SlotMachine_Exchange_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SlotMachine_Exchange_SC";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SlotMachine_Exchange_SC.activityid","activityid",1 << 3 | WireType.VARINT);
      
      public static const EXCHANGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SlotMachine_Exchange_SC.exchangeid","exchangeid",2 << 3 | WireType.VARINT);
      
      public static const REWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_SlotMachine_Exchange_SC.rewards","rewards",3 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const TOTALCREDIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SlotMachine_Exchange_SC.totalcredit","totalcredit",4 << 3 | WireType.VARINT);
      
      public static const CONSUMEDCREDIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SlotMachine_Exchange_SC.consumedcredit","consumedcredit",5 << 3 | WireType.VARINT);
       
      
      private var activityid$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var exchangeid$field:uint;
      
      public var rewards:Array;
      
      private var totalcredit$field:uint;
      
      private var consumedcredit$field:uint;
      
      public function Cmd_SlotMachine_Exchange_SC()
      {
         this.rewards = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SlotMachine_Exchange_SC.$MessageID;
      }
      
      public function clearActivityid() : void
      {
         this.hasField$0 &= 4294967294;
         this.activityid$field = new uint();
      }
      
      public function get hasActivityid() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set activityid(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.activityid$field = param1;
      }
      
      public function get activityid() : uint
      {
         return this.activityid$field;
      }
      
      public function clearExchangeid() : void
      {
         this.hasField$0 &= 4294967293;
         this.exchangeid$field = new uint();
      }
      
      public function get hasExchangeid() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set exchangeid(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.exchangeid$field = param1;
      }
      
      public function get exchangeid() : uint
      {
         return this.exchangeid$field;
      }
      
      public function clearTotalcredit() : void
      {
         this.hasField$0 &= 4294967291;
         this.totalcredit$field = new uint();
      }
      
      public function get hasTotalcredit() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set totalcredit(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.totalcredit$field = param1;
      }
      
      public function get totalcredit() : uint
      {
         return this.totalcredit$field;
      }
      
      public function clearConsumedcredit() : void
      {
         this.hasField$0 &= 4294967287;
         this.consumedcredit$field = new uint();
      }
      
      public function get hasConsumedcredit() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set consumedcredit(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.consumedcredit$field = param1;
      }
      
      public function get consumedcredit() : uint
      {
         return this.consumedcredit$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasActivityid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityid$field);
         }
         if(this.hasExchangeid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.exchangeid$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewards.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewards[_loc2_]);
            _loc2_++;
         }
         if(this.hasTotalcredit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.totalcredit$field);
         }
         if(this.hasConsumedcredit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.consumedcredit$field);
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
                     throw new IOError("Bad data format: Cmd_SlotMachine_Exchange_SC.activityid cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SlotMachine_Exchange_SC.exchangeid cannot be set twice.");
                  }
                  _loc4_++;
                  this.exchangeid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  this.rewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SlotMachine_Exchange_SC.totalcredit cannot be set twice.");
                  }
                  _loc5_++;
                  this.totalcredit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SlotMachine_Exchange_SC.consumedcredit cannot be set twice.");
                  }
                  _loc6_++;
                  this.consumedcredit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
