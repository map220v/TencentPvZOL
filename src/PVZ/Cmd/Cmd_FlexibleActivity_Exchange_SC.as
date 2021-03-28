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
   
   public final class Cmd_FlexibleActivity_Exchange_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_FlexibleActivity_Exchange_SC";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_Exchange_SC.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const INDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_Exchange_SC.index","index",2 << 3 | WireType.VARINT);
      
      public static const TIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_Exchange_SC.times","times",3 << 3 | WireType.VARINT);
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_FlexibleActivity_Exchange_SC.reward","reward",4 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var index$field:uint;
      
      private var times$field:uint;
      
      public var reward:Array;
      
      public function Cmd_FlexibleActivity_Exchange_SC()
      {
         this.reward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_FlexibleActivity_Exchange_SC.$MessageID;
      }
      
      public function clearActivityId() : void
      {
         this.hasField$0 &= 4294967294;
         this.activityId$field = new uint();
      }
      
      public function get hasActivityId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set activityId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.activityId$field = param1;
      }
      
      public function get activityId() : uint
      {
         return this.activityId$field;
      }
      
      public function clearIndex() : void
      {
         this.hasField$0 &= 4294967293;
         this.index$field = new uint();
      }
      
      public function get hasIndex() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set index(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.index$field = param1;
      }
      
      public function get index() : uint
      {
         return this.index$field;
      }
      
      public function clearTimes() : void
      {
         this.hasField$0 &= 4294967291;
         this.times$field = new uint();
      }
      
      public function get hasTimes() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set times(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.times$field = param1;
      }
      
      public function get times() : uint
      {
         return this.times$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         if(this.hasIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.index$field);
         }
         if(this.hasTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.times$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_Exchange_SC.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_Exchange_SC.index cannot be set twice.");
                  }
                  _loc4_++;
                  this.index = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_Exchange_SC.times cannot be set twice.");
                  }
                  _loc5_++;
                  this.times = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
