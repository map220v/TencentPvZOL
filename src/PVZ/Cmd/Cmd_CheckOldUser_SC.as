package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_CheckOldUser_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_CheckOldUser_SC";
      
      public static const ISOLDUSER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_CheckOldUser_SC.isOldUser","isOldUser",1 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_CheckOldUser_SC.roleName","roleName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const QQNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_CheckOldUser_SC.qqName","qqName",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const PLAYSTARTFLASH:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_CheckOldUser_SC.playStartFlash","playStartFlash",4 << 3 | WireType.VARINT);
       
      
      private var isOldUser$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var roleName$field:String;
      
      private var qqName$field:String;
      
      private var playStartFlash$field:Boolean;
      
      public function Cmd_CheckOldUser_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_CheckOldUser_SC.$MessageID;
      }
      
      public function clearIsOldUser() : void
      {
         this.hasField$0 &= 4294967294;
         this.isOldUser$field = new Boolean();
      }
      
      public function get hasIsOldUser() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set isOldUser(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.isOldUser$field = param1;
      }
      
      public function get isOldUser() : Boolean
      {
         return this.isOldUser$field;
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
      
      public function clearQqName() : void
      {
         this.qqName$field = null;
      }
      
      public function get hasQqName() : Boolean
      {
         return this.qqName$field != null;
      }
      
      public function set qqName(param1:String) : void
      {
         this.qqName$field = param1;
      }
      
      public function get qqName() : String
      {
         return this.qqName$field;
      }
      
      public function clearPlayStartFlash() : void
      {
         this.hasField$0 &= 4294967293;
         this.playStartFlash$field = new Boolean();
      }
      
      public function get hasPlayStartFlash() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set playStartFlash(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.playStartFlash$field = param1;
      }
      
      public function get playStartFlash() : Boolean
      {
         return this.playStartFlash$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasIsOldUser)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_BOOL(param1,this.isOldUser$field);
         }
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasQqName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.qqName$field);
         }
         if(this.hasPlayStartFlash)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.playStartFlash$field);
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
                     throw new IOError("Bad data format: Cmd_CheckOldUser_SC.isOldUser cannot be set twice.");
                  }
                  _loc3_++;
                  this.isOldUser = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_CheckOldUser_SC.roleName cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_CheckOldUser_SC.qqName cannot be set twice.");
                  }
                  _loc5_++;
                  this.qqName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_CheckOldUser_SC.playStartFlash cannot be set twice.");
                  }
                  _loc6_++;
                  this.playStartFlash = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
