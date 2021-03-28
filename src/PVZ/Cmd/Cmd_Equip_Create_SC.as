package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Equip_Create_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Equip_Create_SC";
      
      public static const EQUIPID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Equip_Create_SC.equipId","equipId",1 << 3 | WireType.VARINT);
      
      public static const EQUIPUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Equip_Create_SC.equipUId","equipUId",2 << 3 | WireType.VARINT);
       
      
      private var equipId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var equipUId$field:Int64;
      
      public function Cmd_Equip_Create_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Equip_Create_SC.$MessageID;
      }
      
      public function clearEquipId() : void
      {
         this.hasField$0 &= 4294967294;
         this.equipId$field = new uint();
      }
      
      public function get hasEquipId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set equipId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.equipId$field = param1;
      }
      
      public function get equipId() : uint
      {
         return this.equipId$field;
      }
      
      public function clearEquipUId() : void
      {
         this.equipUId$field = null;
      }
      
      public function get hasEquipUId() : Boolean
      {
         return this.equipUId$field != null;
      }
      
      public function set equipUId(param1:Int64) : void
      {
         this.equipUId$field = param1;
      }
      
      public function get equipUId() : Int64
      {
         return this.equipUId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasEquipId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.equipId$field);
         }
         if(this.hasEquipUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.equipUId$field);
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
                     throw new IOError("Bad data format: Cmd_Equip_Create_SC.equipId cannot be set twice.");
                  }
                  _loc3_++;
                  this.equipId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_Create_SC.equipUId cannot be set twice.");
                  }
                  _loc4_++;
                  this.equipUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
