package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_ChangeRoleName_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ChangeRoleName_CS";
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_ChangeRoleName_CS.roleName","roleName",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const SEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Cmd_ChangeRoleName_CS.sex","sex",2 << 3 | WireType.VARINT);
      
      public static const ISNOTIFY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_ChangeRoleName_CS.isNotify","isNotify",3 << 3 | WireType.VARINT);
       
      
      private var roleName$field:String;
      
      private var sex$field:int;
      
      private var hasField$0:uint = 0;
      
      private var isNotify$field:Boolean;
      
      public function Cmd_ChangeRoleName_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ChangeRoleName_CS.$MessageID;
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
      
      public function clearIsNotify() : void
      {
         this.hasField$0 &= 4294967293;
         this.isNotify$field = new Boolean();
      }
      
      public function get hasIsNotify() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set isNotify(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.isNotify$field = param1;
      }
      
      public function get isNotify() : Boolean
      {
         return this.isNotify$field;
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
         if(this.hasIsNotify)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.isNotify$field);
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
                     throw new IOError("Bad data format: Cmd_ChangeRoleName_CS.roleName cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ChangeRoleName_CS.sex cannot be set twice.");
                  }
                  _loc4_++;
                  this.sex = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ChangeRoleName_CS.isNotify cannot be set twice.");
                  }
                  _loc5_++;
                  this.isNotify = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
