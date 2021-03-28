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
   
   public final class Dto_Fertilizer_Info extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Fertilizer_Info";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_Fertilizer_Info.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Fertilizer_Info.roleName","roleName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const FERTILIZERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fertilizer_Info.fertilizerId","fertilizerId",3 << 3 | WireType.VARINT);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fertilizer_Info.exp","exp",4 << 3 | WireType.VARINT);
      
      public static const FERTILIZERTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fertilizer_Info.fertilizerTime","fertilizerTime",5 << 3 | WireType.VARINT);
      
      public static const CONTRIBVAL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fertilizer_Info.contribVal","contribVal",6 << 3 | WireType.VARINT);
       
      
      private var roleId$field:Int64;
      
      private var roleName$field:String;
      
      private var fertilizerId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var exp$field:uint;
      
      private var fertilizerTime$field:uint;
      
      private var contribVal$field:uint;
      
      public function Dto_Fertilizer_Info()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Fertilizer_Info.$MessageID;
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
      
      public function clearFertilizerId() : void
      {
         this.hasField$0 &= 4294967294;
         this.fertilizerId$field = new uint();
      }
      
      public function get hasFertilizerId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set fertilizerId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.fertilizerId$field = param1;
      }
      
      public function get fertilizerId() : uint
      {
         return this.fertilizerId$field;
      }
      
      public function clearExp() : void
      {
         this.hasField$0 &= 4294967293;
         this.exp$field = new uint();
      }
      
      public function get hasExp() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set exp(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.exp$field = param1;
      }
      
      public function get exp() : uint
      {
         return this.exp$field;
      }
      
      public function clearFertilizerTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.fertilizerTime$field = new uint();
      }
      
      public function get hasFertilizerTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set fertilizerTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.fertilizerTime$field = param1;
      }
      
      public function get fertilizerTime() : uint
      {
         return this.fertilizerTime$field;
      }
      
      public function clearContribVal() : void
      {
         this.hasField$0 &= 4294967287;
         this.contribVal$field = new uint();
      }
      
      public function get hasContribVal() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set contribVal(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.contribVal$field = param1;
      }
      
      public function get contribVal() : uint
      {
         return this.contribVal$field;
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
         if(this.hasFertilizerId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.fertilizerId$field);
         }
         if(this.hasExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.exp$field);
         }
         if(this.hasFertilizerTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.fertilizerTime$field);
         }
         if(this.hasContribVal)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.contribVal$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fertilizer_Info.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fertilizer_Info.roleName cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fertilizer_Info.fertilizerId cannot be set twice.");
                  }
                  _loc5_++;
                  this.fertilizerId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fertilizer_Info.exp cannot be set twice.");
                  }
                  _loc6_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fertilizer_Info.fertilizerTime cannot be set twice.");
                  }
                  _loc7_++;
                  this.fertilizerTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fertilizer_Info.contribVal cannot be set twice.");
                  }
                  _loc8_++;
                  this.contribVal = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
