package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_ExpeditionFightRewardInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ExpeditionFightRewardInfo";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_ExpeditionFightRewardInfo.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const RANKID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightRewardInfo.rankId","rankId",2 << 3 | WireType.VARINT);
      
      public static const SUMRANKID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightRewardInfo.sumRankId","sumRankId",3 << 3 | WireType.VARINT);
       
      
      private var roleId$field:Int64;
      
      private var rankId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var sumRankId$field:uint;
      
      public function Dto_ExpeditionFightRewardInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ExpeditionFightRewardInfo.$MessageID;
      }
      
      public function clearRoleId() : void
      {
         this.roleId$field = null;
      }
      
      public function get hasRoleId() : Boolean
      {
         return this.roleId$field != null;
      }
      
      public function set roleId(param1:Int64) : void
      {
         this.roleId$field = param1;
      }
      
      public function get roleId() : Int64
      {
         return this.roleId$field;
      }
      
      public function clearRankId() : void
      {
         this.hasField$0 &= 4294967294;
         this.rankId$field = new uint();
      }
      
      public function get hasRankId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set rankId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.rankId$field = param1;
      }
      
      public function get rankId() : uint
      {
         return this.rankId$field;
      }
      
      public function clearSumRankId() : void
      {
         this.hasField$0 &= 4294967293;
         this.sumRankId$field = new uint();
      }
      
      public function get hasSumRankId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set sumRankId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.sumRankId$field = param1;
      }
      
      public function get sumRankId() : uint
      {
         return this.sumRankId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasRankId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.rankId$field);
         }
         if(this.hasSumRankId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.sumRankId$field);
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
                     throw new IOError("Bad data format: Dto_ExpeditionFightRewardInfo.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightRewardInfo.rankId cannot be set twice.");
                  }
                  _loc4_++;
                  this.rankId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightRewardInfo.sumRankId cannot be set twice.");
                  }
                  _loc5_++;
                  this.sumRankId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
