package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FriendApply extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FriendApply";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_FriendApply.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FriendApply.roleName","roleName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ROLELEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FriendApply.roleLevel","roleLevel",3 << 3 | WireType.VARINT);
      
      public static const QQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FriendApply.qqFaceURL","qqFaceURL",4 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var roleId$field:Int64;
      
      private var roleName$field:String;
      
      private var roleLevel$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var qqFaceURL$field:String;
      
      public function Dto_FriendApply()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FriendApply.$MessageID;
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
      
      public function clearRoleLevel() : void
      {
         this.hasField$0 &= 4294967294;
         this.roleLevel$field = new uint();
      }
      
      public function get hasRoleLevel() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set roleLevel(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.roleLevel$field = param1;
      }
      
      public function get roleLevel() : uint
      {
         return this.roleLevel$field;
      }
      
      public function clearQqFaceURL() : void
      {
         this.qqFaceURL$field = null;
      }
      
      public function get hasQqFaceURL() : Boolean
      {
         return this.qqFaceURL$field != null;
      }
      
      public function set qqFaceURL(param1:String) : void
      {
         this.qqFaceURL$field = param1;
      }
      
      public function get qqFaceURL() : String
      {
         return this.qqFaceURL$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasRoleLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.roleLevel$field);
         }
         if(this.hasQqFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.qqFaceURL$field);
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
                     throw new IOError("Bad data format: Dto_FriendApply.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendApply.roleName cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendApply.roleLevel cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendApply.qqFaceURL cannot be set twice.");
                  }
                  _loc6_++;
                  this.qqFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
