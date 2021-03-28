package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_SlotMachine_Spin_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SlotMachine_Spin_SC";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SlotMachine_Spin_SC.activityid","activityid",1 << 3 | WireType.VARINT);
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SlotMachine_Spin_SC.count","count",2 << 3 | WireType.VARINT);
      
      public static const REWARDS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_SlotMachine_Spin_SC.rewards","rewards",3 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const CREDITS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SlotMachine_Spin_SC.credits","credits",4 << 3 | WireType.VARINT);
      
      public static const SPINRESULT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_SlotMachine_Spin_SC.spinresult","spinresult",5 << 3 | WireType.LENGTH_DELIMITED,Dto_SpinResult);
      
      public static const TOTALCREDIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SlotMachine_Spin_SC.totalcredit","totalcredit",6 << 3 | WireType.VARINT);
       
      
      private var activityid$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var count$field:uint;
      
      private var rewards$field:Dto_IdNum;
      
      private var credits$field:uint;
      
      private var spinresult$field:Dto_SpinResult;
      
      private var totalcredit$field:uint;
      
      public function Cmd_SlotMachine_Spin_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SlotMachine_Spin_SC.$MessageID;
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
      
      public function clearCount() : void
      {
         this.hasField$0 &= 4294967293;
         this.count$field = new uint();
      }
      
      public function get hasCount() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set count(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.count$field = param1;
      }
      
      public function get count() : uint
      {
         return this.count$field;
      }
      
      public function clearRewards() : void
      {
         this.rewards$field = null;
      }
      
      public function get hasRewards() : Boolean
      {
         return this.rewards$field != null;
      }
      
      public function set rewards(param1:Dto_IdNum) : void
      {
         this.rewards$field = param1;
      }
      
      public function get rewards() : Dto_IdNum
      {
         return this.rewards$field;
      }
      
      public function clearCredits() : void
      {
         this.hasField$0 &= 4294967291;
         this.credits$field = new uint();
      }
      
      public function get hasCredits() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set credits(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.credits$field = param1;
      }
      
      public function get credits() : uint
      {
         return this.credits$field;
      }
      
      public function clearSpinresult() : void
      {
         this.spinresult$field = null;
      }
      
      public function get hasSpinresult() : Boolean
      {
         return this.spinresult$field != null;
      }
      
      public function set spinresult(param1:Dto_SpinResult) : void
      {
         this.spinresult$field = param1;
      }
      
      public function get spinresult() : Dto_SpinResult
      {
         return this.spinresult$field;
      }
      
      public function clearTotalcredit() : void
      {
         this.hasField$0 &= 4294967287;
         this.totalcredit$field = new uint();
      }
      
      public function get hasTotalcredit() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set totalcredit(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.totalcredit$field = param1;
      }
      
      public function get totalcredit() : uint
      {
         return this.totalcredit$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasActivityid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityid$field);
         }
         if(this.hasCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.count$field);
         }
         if(this.hasRewards)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewards$field);
         }
         if(this.hasCredits)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.credits$field);
         }
         if(this.hasSpinresult)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.spinresult$field);
         }
         if(this.hasTotalcredit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.totalcredit$field);
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
                     throw new IOError("Bad data format: Cmd_SlotMachine_Spin_SC.activityid cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SlotMachine_Spin_SC.count cannot be set twice.");
                  }
                  _loc4_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SlotMachine_Spin_SC.rewards cannot be set twice.");
                  }
                  _loc5_++;
                  this.rewards = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.rewards);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SlotMachine_Spin_SC.credits cannot be set twice.");
                  }
                  _loc6_++;
                  this.credits = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SlotMachine_Spin_SC.spinresult cannot be set twice.");
                  }
                  _loc7_++;
                  this.spinresult = new Dto_SpinResult();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.spinresult);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SlotMachine_Spin_SC.totalcredit cannot be set twice.");
                  }
                  _loc8_++;
                  this.totalcredit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
