package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_SetRoleName_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SetRoleName_SC";
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_SetRoleName_SC.roleName","roleName",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const SEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Cmd_SetRoleName_SC.sex","sex",2 << 3 | WireType.VARINT);
       
      
      private var roleName$field:String;
      
      private var sex$field:int;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_SetRoleName_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SetRoleName_SC.$MessageID;
      }
      
      public function clearRoleName() : void
      {
         this.roleName$field = null;
      }
      
      public function get hasRoleName() : Boolean
      {
         return this.roleName$field != null;
      }
      
      public function set roleName(param1:String) : void
      {
         this.roleName$field = param1;
      }
      
      public function get roleName() : String
      {
         return this.roleName$field;
      }
      
      public function clearSex() : void
      {
         this.hasField$0 &= 4294967294;
         this.sex$field = new int();
      }
      
      public function get hasSex() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set sex(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.sex$field = param1;
      }
      
      public function get sex() : int
      {
         return this.sex$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasSex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT32(param1,this.sex$field);
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
                     throw new IOError("Bad data format: Cmd_SetRoleName_SC.roleName cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SetRoleName_SC.sex cannot be set twice.");
                  }
                  _loc4_++;
                  this.sex = ReadUtils.read$TYPE_INT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
