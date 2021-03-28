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
   
   public final class Cmd_FlexibleActivity26_Reset_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_FlexibleActivity26_Reset_SC";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity26_Reset_SC.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const RESETCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity26_Reset_SC.resetCount","resetCount",2 << 3 | WireType.VARINT);
      
      public static const SELECTREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_FlexibleActivity26_Reset_SC.selectReward","selectReward",3 << 3 | WireType.LENGTH_DELIMITED,Dto_SelectReward);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var resetCount$field:uint;
      
      public var selectReward:Array;
      
      public function Cmd_FlexibleActivity26_Reset_SC()
      {
         this.selectReward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_FlexibleActivity26_Reset_SC.$MessageID;
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
      
      public function clearResetCount() : void
      {
         this.hasField$0 &= 4294967293;
         this.resetCount$field = new uint();
      }
      
      public function get hasResetCount() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set resetCount(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.resetCount$field = param1;
      }
      
      public function get resetCount() : uint
      {
         return this.resetCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         if(this.hasResetCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.resetCount$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.selectReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.selectReward[_loc2_]);
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
                     throw new IOError("Bad data format: Cmd_FlexibleActivity26_Reset_SC.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity26_Reset_SC.resetCount cannot be set twice.");
                  }
                  _loc4_++;
                  this.resetCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  this.selectReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_SelectReward()));
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
