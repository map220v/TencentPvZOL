package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Friend_GetList_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Friend_GetList_CS";
      
      public static const MODULETYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_GetList_CS.moduleType","moduleType",1 << 3 | WireType.VARINT);
      
      public static const FRIENDTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_GetList_CS.friendType","friendType",2 << 3 | WireType.VARINT);
      
      public static const PAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_GetList_CS.page","page",3 << 3 | WireType.VARINT);
      
      public static const PAGESIZE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_GetList_CS.pageSize","pageSize",4 << 3 | WireType.VARINT);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Friend_GetList_CS.name","name",5 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var moduleType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var friendType$field:uint;
      
      private var page$field:uint;
      
      private var pageSize$field:uint;
      
      private var name$field:String;
      
      public function Cmd_Friend_GetList_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Friend_GetList_CS.$MessageID;
      }
      
      public function clearModuleType() : void
      {
         this.hasField$0 &= 4294967294;
         this.moduleType$field = new uint();
      }
      
      public function get hasModuleType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set moduleType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.moduleType$field = param1;
      }
      
      public function get moduleType() : uint
      {
         return this.moduleType$field;
      }
      
      public function clearFriendType() : void
      {
         this.hasField$0 &= 4294967293;
         this.friendType$field = new uint();
      }
      
      public function get hasFriendType() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set friendType(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.friendType$field = param1;
      }
      
      public function get friendType() : uint
      {
         return this.friendType$field;
      }
      
      public function clearPage() : void
      {
         this.hasField$0 &= 4294967291;
         this.page$field = new uint();
      }
      
      public function get hasPage() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set page(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.page$field = param1;
      }
      
      public function get page() : uint
      {
         return this.page$field;
      }
      
      public function clearPageSize() : void
      {
         this.hasField$0 &= 4294967287;
         this.pageSize$field = new uint();
      }
      
      public function get hasPageSize() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set pageSize(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.pageSize$field = param1;
      }
      
      public function get pageSize() : uint
      {
         return this.pageSize$field;
      }
      
      public function clearName() : void
      {
         this.name$field = null;
      }
      
      public function get hasName() : Boolean
      {
         return this.name$field != null;
      }
      
      public function set name(param1:String) : void
      {
         this.name$field = param1;
      }
      
      public function get name() : String
      {
         return this.name$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasModuleType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.moduleType$field);
         }
         if(this.hasFriendType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.friendType$field);
         }
         if(this.hasPage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.page$field);
         }
         if(this.hasPageSize)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.pageSize$field);
         }
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_STRING(param1,this.name$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_GetList_CS.moduleType cannot be set twice.");
                  }
                  _loc3_++;
                  this.moduleType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_GetList_CS.friendType cannot be set twice.");
                  }
                  _loc4_++;
                  this.friendType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_GetList_CS.page cannot be set twice.");
                  }
                  _loc5_++;
                  this.page = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_GetList_CS.pageSize cannot be set twice.");
                  }
                  _loc6_++;
                  this.pageSize = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_GetList_CS.name cannot be set twice.");
                  }
                  _loc7_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
