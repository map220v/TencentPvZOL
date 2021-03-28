package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_NoEndTD_Vote_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_NoEndTD_Vote_CS";
      
      public static const MODE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndTD_Vote_CS.mode","mode",1 << 3 | WireType.VARINT);
      
      public static const TARGETROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_NoEndTD_Vote_CS.targetRoleId","targetRoleId",2 << 3 | WireType.VARINT);
      
      public static const RANKBOARDTYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Cmd_NoEndTD_Vote_CS.rankBoardType","rankBoardType",3 << 3 | WireType.VARINT,E_NoEndTDRankBoardType);
      
      public static const UPDOWN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_NoEndTD_Vote_CS.upDown","upDown",4 << 3 | WireType.VARINT);
       
      
      private var mode$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var targetRoleId$field:Int64;
      
      private var rankBoardType$field:int;
      
      private var upDown$field:Boolean;
      
      public function Cmd_NoEndTD_Vote_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_NoEndTD_Vote_CS.$MessageID;
      }
      
      public function clearMode() : void
      {
         this.hasField$0 &= 4294967294;
         this.mode$field = new uint();
      }
      
      public function get hasMode() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set mode(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.mode$field = param1;
      }
      
      public function get mode() : uint
      {
         return this.mode$field;
      }
      
      public function clearTargetRoleId() : void
      {
         this.targetRoleId$field = null;
      }
      
      public function get hasTargetRoleId() : Boolean
      {
         return this.targetRoleId$field != null;
      }
      
      public function set targetRoleId(param1:Int64) : void
      {
         this.targetRoleId$field = param1;
      }
      
      public function get targetRoleId() : Int64
      {
         return this.targetRoleId$field;
      }
      
      public function clearRankBoardType() : void
      {
         this.hasField$0 &= 4294967293;
         this.rankBoardType$field = new int();
      }
      
      public function get hasRankBoardType() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set rankBoardType(param1:int) : void
      {
         this.hasField$0 |= 2;
         this.rankBoardType$field = param1;
      }
      
      public function get rankBoardType() : int
      {
         return this.rankBoardType$field;
      }
      
      public function clearUpDown() : void
      {
         this.hasField$0 &= 4294967291;
         this.upDown$field = new Boolean();
      }
      
      public function get hasUpDown() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set upDown(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.upDown$field = param1;
      }
      
      public function get upDown() : Boolean
      {
         return this.upDown$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasMode)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.mode$field);
         }
         if(this.hasTargetRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.targetRoleId$field);
         }
         if(this.hasRankBoardType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_ENUM(param1,this.rankBoardType$field);
         }
         if(this.hasUpDown)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.upDown$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Cmd_NoEndTD_Vote_CS.mode cannot be set twice.");
                  }
                  _loc3_++;
                  this.mode = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_Vote_CS.targetRoleId cannot be set twice.");
                  }
                  _loc4_++;
                  this.targetRoleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_Vote_CS.rankBoardType cannot be set twice.");
                  }
                  _loc5_++;
                  this.rankBoardType = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_Vote_CS.upDown cannot be set twice.");
                  }
                  _loc6_++;
                  this.upDown = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
