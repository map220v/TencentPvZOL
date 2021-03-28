package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class FlexibleActivity_1007 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_1007";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1007.activityid","activityid",1 << 3 | WireType.VARINT);
      
      public static const RULEID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.FlexibleActivity_1007.ruleid","ruleid",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const CONDITIONREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_1007.conditionreward","conditionreward",100 << 3 | WireType.LENGTH_DELIMITED,Dto_FlexibleCrossGameActivityCondtionReward);
      
      public static const TIMESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1007.timestamp","timestamp",101 << 3 | WireType.VARINT);
      
      public static const ACCLOGINDAYS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1007.acclogindays","acclogindays",102 << 3 | WireType.VARINT);
       
      
      public var activityid:uint;
      
      private var ruleid$field:String;
      
      public var conditionreward:Array;
      
      private var timestamp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var acclogindays$field:uint;
      
      public function FlexibleActivity_1007()
      {
         this.conditionreward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_1007.$MessageID;
      }
      
      public function clearRuleid() : void
      {
         this.ruleid$field = null;
      }
      
      public function get hasRuleid() : Boolean
      {
         return this.ruleid$field != null;
      }
      
      public function set ruleid(param1:String) : void
      {
         this.ruleid$field = param1;
      }
      
      public function get ruleid() : String
      {
         return this.ruleid$field;
      }
      
      public function clearTimestamp() : void
      {
         this.hasField$0 &= 4294967294;
         this.timestamp$field = new uint();
      }
      
      public function get hasTimestamp() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set timestamp(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.timestamp$field = param1;
      }
      
      public function get timestamp() : uint
      {
         return this.timestamp$field;
      }
      
      public function clearAcclogindays() : void
      {
         this.hasField$0 &= 4294967293;
         this.acclogindays$field = new uint();
      }
      
      public function get hasAcclogindays() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set acclogindays(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.acclogindays$field = param1;
      }
      
      public function get acclogindays() : uint
      {
         return this.acclogindays$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         WriteUtils.writeTag(param1,WireType.VARINT,1);
         WriteUtils.write$TYPE_UINT32(param1,this.activityid);
         if(this.hasRuleid)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.ruleid$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.conditionreward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,100);
            WriteUtils.write$TYPE_MESSAGE(param1,this.conditionreward[_loc2_]);
            _loc2_++;
         }
         if(this.hasTimestamp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,101);
            WriteUtils.write$TYPE_UINT32(param1,this.timestamp$field);
         }
         if(this.hasAcclogindays)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,102);
            WriteUtils.write$TYPE_UINT32(param1,this.acclogindays$field);
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
                     throw new IOError("Bad data format: FlexibleActivity_1007.activityid cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1007.ruleid cannot be set twice.");
                  }
                  _loc4_++;
                  this.ruleid = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 100:
                  this.conditionreward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FlexibleCrossGameActivityCondtionReward()));
                  break;
               case 101:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1007.timestamp cannot be set twice.");
                  }
                  _loc5_++;
                  this.timestamp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 102:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1007.acclogindays cannot be set twice.");
                  }
                  _loc6_++;
                  this.acclogindays = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
