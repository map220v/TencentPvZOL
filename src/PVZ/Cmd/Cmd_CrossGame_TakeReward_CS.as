package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_CrossGame_TakeReward_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_CrossGame_TakeReward_CS";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_CrossGame_TakeReward_CS.activityid","activityid",1 << 3 | WireType.VARINT);
      
      public static const REWARDINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_CrossGame_TakeReward_CS.rewardindex","rewardindex",2 << 3 | WireType.VARINT);
      
      public static const ZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_CrossGame_TakeReward_CS.zoneid","zoneid",3 << 3 | WireType.VARINT);
       
      
      public var activityid:uint;
      
      public var rewardindex:uint;
      
      private var zoneid$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_CrossGame_TakeReward_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_CrossGame_TakeReward_CS.$MessageID;
      }
      
      public function clearZoneid() : void
      {
         this.hasField$0 &= 4294967294;
         this.zoneid$field = new uint();
      }
      
      public function get hasZoneid() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set zoneid(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.zoneid$field = param1;
      }
      
      public function get zoneid() : uint
      {
         return this.zoneid$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         WriteUtils.writeTag(param1,WireType.VARINT,1);
         WriteUtils.write$TYPE_UINT32(param1,this.activityid);
         WriteUtils.writeTag(param1,WireType.VARINT,2);
         WriteUtils.write$TYPE_UINT32(param1,this.rewardindex);
         if(this.hasZoneid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneid$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Cmd_CrossGame_TakeReward_CS.activityid cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_CrossGame_TakeReward_CS.rewardindex cannot be set twice.");
                  }
                  _loc4_++;
                  this.rewardindex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_CrossGame_TakeReward_CS.zoneid cannot be set twice.");
                  }
                  _loc5_++;
                  this.zoneid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
