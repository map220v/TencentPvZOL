package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class DtoGlobal_FlexibleActivity_26_Record extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.DtoGlobal_FlexibleActivity_26_Record";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.DtoGlobal_FlexibleActivity_26_Record.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const TIMESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.DtoGlobal_FlexibleActivity_26_Record.timestamp","timestamp",2 << 3 | WireType.VARINT);
      
      public static const ITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.DtoGlobal_FlexibleActivity_26_Record.item","item",3 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var roleId$field:Int64;
      
      private var timestamp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var item$field:Dto_IdNum;
      
      public function DtoGlobal_FlexibleActivity_26_Record()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return DtoGlobal_FlexibleActivity_26_Record.$MessageID;
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
      
      public function clearTimestamp() : void
      {
         this.hasField$0 &= 4294967294;
         this.timestamp$field = new uint();
      }
      
      public function get hasTimestamp() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set timestamp(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.timestamp$field = param1;
      }
      
      public function get timestamp() : uint
      {
         return this.timestamp$field;
      }
      
      public function clearItem() : void
      {
         this.item$field = null;
      }
      
      public function get hasItem() : Boolean
      {
         return this.item$field != null;
      }
      
      public function set item(param1:Dto_IdNum) : void
      {
         this.item$field = param1;
      }
      
      public function get item() : Dto_IdNum
      {
         return this.item$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasTimestamp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.timestamp$field);
         }
         if(this.hasItem)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.item$field);
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
                     throw new IOError("Bad data format: DtoGlobal_FlexibleActivity_26_Record.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: DtoGlobal_FlexibleActivity_26_Record.timestamp cannot be set twice.");
                  }
                  _loc4_++;
                  this.timestamp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: DtoGlobal_FlexibleActivity_26_Record.item cannot be set twice.");
                  }
                  _loc5_++;
                  this.item = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.item);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
