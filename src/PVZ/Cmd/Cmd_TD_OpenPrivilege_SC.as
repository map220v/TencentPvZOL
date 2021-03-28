package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_TD_OpenPrivilege_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_TD_OpenPrivilege_SC";
      
      public static const HASPRIVILEGE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_TD_OpenPrivilege_SC.hasPrivilege","hasPrivilege",1 << 3 | WireType.VARINT);
      
      public static const REMAINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_OpenPrivilege_SC.remainTime","remainTime",2 << 3 | WireType.VARINT);
       
      
      private var hasPrivilege$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var remainTime$field:uint;
      
      public function Cmd_TD_OpenPrivilege_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_TD_OpenPrivilege_SC.$MessageID;
      }
      
      public function clearHasPrivilege() : void
      {
         this.hasField$0 &= 4294967294;
         this.hasPrivilege$field = new Boolean();
      }
      
      public function get hasHasPrivilege() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set hasPrivilege(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.hasPrivilege$field = param1;
      }
      
      public function get hasPrivilege() : Boolean
      {
         return this.hasPrivilege$field;
      }
      
      public function clearRemainTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.remainTime$field = new uint();
      }
      
      public function get hasRemainTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set remainTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.remainTime$field = param1;
      }
      
      public function get remainTime() : uint
      {
         return this.remainTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasHasPrivilege)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_BOOL(param1,this.hasPrivilege$field);
         }
         if(this.hasRemainTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.remainTime$field);
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
                     throw new IOError("Bad data format: Cmd_TD_OpenPrivilege_SC.hasPrivilege cannot be set twice.");
                  }
                  _loc3_++;
                  this.hasPrivilege = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_OpenPrivilege_SC.remainTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.remainTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
