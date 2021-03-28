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
   
   public final class Dto_RoleAttr extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_RoleAttr";
      
      public static const OLDROLELEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RoleAttr.oldRoleLevel","oldRoleLevel",1 << 3 | WireType.VARINT);
      
      public static const OLDEXPPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RoleAttr.oldExpPercent","oldExpPercent",2 << 3 | WireType.VARINT);
      
      public static const NEWROLELEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RoleAttr.newRoleLevel","newRoleLevel",3 << 3 | WireType.VARINT);
      
      public static const NEWEXPPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RoleAttr.newExpPercent","newExpPercent",4 << 3 | WireType.VARINT);
       
      
      private var oldRoleLevel$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var oldExpPercent$field:uint;
      
      private var newRoleLevel$field:uint;
      
      private var newExpPercent$field:uint;
      
      public function Dto_RoleAttr()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_RoleAttr.$MessageID;
      }
      
      public function clearOldRoleLevel() : void
      {
         this.hasField$0 &= 4294967294;
         this.oldRoleLevel$field = new uint();
      }
      
      public function get hasOldRoleLevel() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set oldRoleLevel(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.oldRoleLevel$field = param1;
      }
      
      public function get oldRoleLevel() : uint
      {
         return this.oldRoleLevel$field;
      }
      
      public function clearOldExpPercent() : void
      {
         this.hasField$0 &= 4294967293;
         this.oldExpPercent$field = new uint();
      }
      
      public function get hasOldExpPercent() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set oldExpPercent(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.oldExpPercent$field = param1;
      }
      
      public function get oldExpPercent() : uint
      {
         return this.oldExpPercent$field;
      }
      
      public function clearNewRoleLevel() : void
      {
         this.hasField$0 &= 4294967291;
         this.newRoleLevel$field = new uint();
      }
      
      public function get hasNewRoleLevel() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set newRoleLevel(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.newRoleLevel$field = param1;
      }
      
      public function get newRoleLevel() : uint
      {
         return this.newRoleLevel$field;
      }
      
      public function clearNewExpPercent() : void
      {
         this.hasField$0 &= 4294967287;
         this.newExpPercent$field = new uint();
      }
      
      public function get hasNewExpPercent() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set newExpPercent(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.newExpPercent$field = param1;
      }
      
      public function get newExpPercent() : uint
      {
         return this.newExpPercent$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasOldRoleLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.oldRoleLevel$field);
         }
         if(this.hasOldExpPercent)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.oldExpPercent$field);
         }
         if(this.hasNewRoleLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.newRoleLevel$field);
         }
         if(this.hasNewExpPercent)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.newExpPercent$field);
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
                     throw new IOError("Bad data format: Dto_RoleAttr.oldRoleLevel cannot be set twice.");
                  }
                  _loc3_++;
                  this.oldRoleLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RoleAttr.oldExpPercent cannot be set twice.");
                  }
                  _loc4_++;
                  this.oldExpPercent = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RoleAttr.newRoleLevel cannot be set twice.");
                  }
                  _loc5_++;
                  this.newRoleLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RoleAttr.newExpPercent cannot be set twice.");
                  }
                  _loc6_++;
                  this.newExpPercent = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
