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
   
   public final class Cmd_NoEndTD_StartTDGame_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_NoEndTD_StartTDGame_CS";
      
      public static const MODE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndTD_StartTDGame_CS.mode","mode",1 << 3 | WireType.VARINT);
      
      public static const FRIENDROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_NoEndTD_StartTDGame_CS.friendRoleId","friendRoleId",2 << 3 | WireType.VARINT);
      
      public static const RAIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndTD_StartTDGame_CS.rain","rain",3 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndTD_StartTDGame_CS.level","level",4 << 3 | WireType.VARINT);
       
      
      private var mode$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var friendRoleId$field:Int64;
      
      private var rain$field:uint;
      
      private var level$field:uint;
      
      public function Cmd_NoEndTD_StartTDGame_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_NoEndTD_StartTDGame_CS.$MessageID;
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
      
      public function clearFriendRoleId() : void
      {
         this.friendRoleId$field = null;
      }
      
      public function get hasFriendRoleId() : Boolean
      {
         return this.friendRoleId$field != null;
      }
      
      public function set friendRoleId(param1:Int64) : void
      {
         this.friendRoleId$field = param1;
      }
      
      public function get friendRoleId() : Int64
      {
         return this.friendRoleId$field;
      }
      
      public function clearRain() : void
      {
         this.hasField$0 &= 4294967293;
         this.rain$field = new uint();
      }
      
      public function get hasRain() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set rain(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.rain$field = param1;
      }
      
      public function get rain() : uint
      {
         return this.rain$field;
      }
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967291;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.level$field = param1;
      }
      
      public function get level() : uint
      {
         return this.level$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasMode)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.mode$field);
         }
         if(this.hasFriendRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.friendRoleId$field);
         }
         if(this.hasRain)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.rain$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
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
                     throw new IOError("Bad data format: Cmd_NoEndTD_StartTDGame_CS.mode cannot be set twice.");
                  }
                  _loc3_++;
                  this.mode = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_StartTDGame_CS.friendRoleId cannot be set twice.");
                  }
                  _loc4_++;
                  this.friendRoleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_StartTDGame_CS.rain cannot be set twice.");
                  }
                  _loc5_++;
                  this.rain = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_StartTDGame_CS.level cannot be set twice.");
                  }
                  _loc6_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
