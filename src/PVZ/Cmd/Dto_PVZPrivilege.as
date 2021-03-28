package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_PVZPrivilege extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_PVZPrivilege";
      
      public static const PRIVILEGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_PVZPrivilege.privilegeId","privilegeId",1 << 3 | WireType.VARINT);
      
      public static const PRIVILEGEPARAM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_PVZPrivilege.privilegeParam","privilegeParam",2 << 3 | WireType.VARINT);
      
      public static const ENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_PVZPrivilege.endTime","endTime",3 << 3 | WireType.VARINT);
       
      
      private var privilegeId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var privilegeParam$field:uint;
      
      private var endTime$field:uint;
      
      public function Dto_PVZPrivilege()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_PVZPrivilege.$MessageID;
      }
      
      public function clearPrivilegeId() : void
      {
         this.hasField$0 &= 4294967294;
         this.privilegeId$field = new uint();
      }
      
      public function get hasPrivilegeId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set privilegeId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.privilegeId$field = param1;
      }
      
      public function get privilegeId() : uint
      {
         return this.privilegeId$field;
      }
      
      public function clearPrivilegeParam() : void
      {
         this.hasField$0 &= 4294967293;
         this.privilegeParam$field = new uint();
      }
      
      public function get hasPrivilegeParam() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set privilegeParam(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.privilegeParam$field = param1;
      }
      
      public function get privilegeParam() : uint
      {
         return this.privilegeParam$field;
      }
      
      public function clearEndTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.endTime$field = new uint();
      }
      
      public function get hasEndTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set endTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.endTime$field = param1;
      }
      
      public function get endTime() : uint
      {
         return this.endTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasPrivilegeId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.privilegeId$field);
         }
         if(this.hasPrivilegeParam)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.privilegeParam$field);
         }
         if(this.hasEndTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.endTime$field);
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
                     throw new IOError("Bad data format: Dto_PVZPrivilege.privilegeId cannot be set twice.");
                  }
                  _loc3_++;
                  this.privilegeId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PVZPrivilege.privilegeParam cannot be set twice.");
                  }
                  _loc4_++;
                  this.privilegeParam = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PVZPrivilege.endTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.endTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
