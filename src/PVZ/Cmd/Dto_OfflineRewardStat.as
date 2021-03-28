package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_OfflineRewardStat extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_OfflineRewardStat";
      
      public static const REWARDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_OfflineRewardStat.rewardId","rewardId",1 << 3 | WireType.VARINT);
      
      public static const REWARDSTAT:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_OfflineRewardStat.rewardStat","rewardStat",2 << 3 | WireType.VARINT,OfflineRewardStat);
       
      
      private var rewardId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var rewardStat$field:int;
      
      public function Dto_OfflineRewardStat()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_OfflineRewardStat.$MessageID;
      }
      
      public function clearRewardId() : void
      {
         this.hasField$0 &= 4294967294;
         this.rewardId$field = new uint();
      }
      
      public function get hasRewardId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set rewardId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.rewardId$field = param1;
      }
      
      public function get rewardId() : uint
      {
         return this.rewardId$field;
      }
      
      public function clearRewardStat() : void
      {
         this.hasField$0 &= 4294967293;
         this.rewardStat$field = new int();
      }
      
      public function get hasRewardStat() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set rewardStat(param1:int) : void
      {
         this.hasField$0 |= 2;
         this.rewardStat$field = param1;
      }
      
      public function get rewardStat() : int
      {
         return this.rewardStat$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRewardId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardId$field);
         }
         if(this.hasRewardStat)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_ENUM(param1,this.rewardStat$field);
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
                     throw new IOError("Bad data format: Dto_OfflineRewardStat.rewardId cannot be set twice.");
                  }
                  _loc3_++;
                  this.rewardId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_OfflineRewardStat.rewardStat cannot be set twice.");
                  }
                  _loc4_++;
                  this.rewardStat = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
