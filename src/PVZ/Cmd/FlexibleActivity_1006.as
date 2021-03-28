package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class FlexibleActivity_1006 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_1006";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1006.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const CONDITIONREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_1006.conditionReward","conditionReward",2 << 3 | WireType.LENGTH_DELIMITED,Dto_FlexibleActivityCondtionReward);
      
      public static const SIGNINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_1006.signInfo","signInfo",3 << 3 | WireType.LENGTH_DELIMITED,Dto_MonthSignInfo);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var conditionReward:Array;
      
      private var signInfo$field:Dto_MonthSignInfo;
      
      public function FlexibleActivity_1006()
      {
         this.conditionReward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_1006.$MessageID;
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
      
      public function clearSignInfo() : void
      {
         this.signInfo$field = null;
      }
      
      public function get hasSignInfo() : Boolean
      {
         return this.signInfo$field != null;
      }
      
      public function set signInfo(param1:Dto_MonthSignInfo) : void
      {
         this.signInfo$field = param1;
      }
      
      public function get signInfo() : Dto_MonthSignInfo
      {
         return this.signInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.conditionReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.conditionReward[_loc2_]);
            _loc2_++;
         }
         if(this.hasSignInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.signInfo$field);
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
                     throw new IOError("Bad data format: FlexibleActivity_1006.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.conditionReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FlexibleActivityCondtionReward()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1006.signInfo cannot be set twice.");
                  }
                  _loc4_++;
                  this.signInfo = new Dto_MonthSignInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.signInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
