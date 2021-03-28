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
   
   public final class Cmd_Halloween_TakeFullServerReward_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Halloween_TakeFullServerReward_CS";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Halloween_TakeFullServerReward_CS.activityid","activityid",1 << 3 | WireType.VARINT);
      
      public static const INDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Halloween_TakeFullServerReward_CS.index","index",2 << 3 | WireType.VARINT);
       
      
      private var activityid$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var index$field:uint;
      
      public function Cmd_Halloween_TakeFullServerReward_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Halloween_TakeFullServerReward_CS.$MessageID;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasActivityid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityid$field);
         }
         if(this.hasIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.index$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Cmd_Halloween_TakeFullServerReward_CS.activityid cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Halloween_TakeFullServerReward_CS.index cannot be set twice.");
                  }
                  _loc4_++;
                  this.index = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
