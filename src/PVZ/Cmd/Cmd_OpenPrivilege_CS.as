package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_OpenPrivilege_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_OpenPrivilege_CS";
      
      public static const EPRIVILEGE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Cmd_OpenPrivilege_CS.ePrivilege","ePrivilege",1 << 3 | WireType.VARINT,E_OpenPrivilege);
       
      
      private var ePrivilege$field:int;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_OpenPrivilege_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_OpenPrivilege_CS.$MessageID;
      }
      
      public function clearEPrivilege() : void
      {
         this.hasField$0 &= 4294967294;
         this.ePrivilege$field = new int();
      }
      
      public function get hasEPrivilege() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set ePrivilege(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.ePrivilege$field = param1;
      }
      
      public function get ePrivilege() : int
      {
         return this.ePrivilege$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasEPrivilege)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_ENUM(param1,this.ePrivilege$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_OpenPrivilege_CS.ePrivilege cannot be set twice.");
                  }
                  _loc3_++;
                  this.ePrivilege = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
