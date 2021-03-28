package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_GuildAckJoin_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GuildAckJoin_CS";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_GuildAckJoin_CS.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const AGREE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_GuildAckJoin_CS.agree","agree",2 << 3 | WireType.VARINT);
       
      
      private var roleId$field:Int64;
      
      private var agree$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_GuildAckJoin_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GuildAckJoin_CS.$MessageID;
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
      
      public function clearAgree() : void
      {
         this.hasField$0 &= 4294967294;
         this.agree$field = new Boolean();
      }
      
      public function get hasAgree() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set agree(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.agree$field = param1;
      }
      
      public function get agree() : Boolean
      {
         return this.agree$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasAgree)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.agree$field);
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
                     throw new IOError("Bad data format: Cmd_GuildAckJoin_CS.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildAckJoin_CS.agree cannot be set twice.");
                  }
                  _loc4_++;
                  this.agree = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
