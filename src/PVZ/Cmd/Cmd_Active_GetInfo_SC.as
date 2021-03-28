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
   
   public final class Cmd_Active_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Active_GetInfo_SC";
      
      public static const ACTIVEVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Active_GetInfo_SC.activeValue","activeValue",1 << 3 | WireType.VARINT);
      
      public static const REWARDSTEP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Active_GetInfo_SC.rewardStep","rewardStep",2 << 3 | WireType.VARINT);
      
      public static const EVENTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Active_GetInfo_SC.events","events",3 << 3 | WireType.LENGTH_DELIMITED,Dto_ActiveEvent);
       
      
      private var activeValue$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var rewardStep$field:uint;
      
      public var events:Array;
      
      public function Cmd_Active_GetInfo_SC()
      {
         this.events = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Active_GetInfo_SC.$MessageID;
      }
      
      public function clearActiveValue() : void
      {
         this.hasField$0 &= 4294967294;
         this.activeValue$field = new uint();
      }
      
      public function get hasActiveValue() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set activeValue(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.activeValue$field = param1;
      }
      
      public function get activeValue() : uint
      {
         return this.activeValue$field;
      }
      
      public function clearRewardStep() : void
      {
         this.hasField$0 &= 4294967293;
         this.rewardStep$field = new uint();
      }
      
      public function get hasRewardStep() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set rewardStep(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.rewardStep$field = param1;
      }
      
      public function get rewardStep() : uint
      {
         return this.rewardStep$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasActiveValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activeValue$field);
         }
         if(this.hasRewardStep)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardStep$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.events.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.events[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Active_GetInfo_SC.activeValue cannot be set twice.");
                  }
                  _loc3_++;
                  this.activeValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Active_GetInfo_SC.rewardStep cannot be set twice.");
                  }
                  _loc4_++;
                  this.rewardStep = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  this.events.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ActiveEvent()));
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
