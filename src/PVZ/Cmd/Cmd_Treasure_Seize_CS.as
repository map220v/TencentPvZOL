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
   
   public final class Cmd_Treasure_Seize_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Treasure_Seize_CS";
      
      public static const HOUSEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Treasure_Seize_CS.houseId","houseId",1 << 3 | WireType.VARINT);
      
      public static const FORMATIONID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Treasure_Seize_CS.formationId","formationId",2 << 3 | WireType.VARINT);
       
      
      private var houseId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var formationId$field:uint;
      
      public function Cmd_Treasure_Seize_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Treasure_Seize_CS.$MessageID;
      }
      
      public function clearHouseId() : void
      {
         this.hasField$0 &= 4294967294;
         this.houseId$field = new uint();
      }
      
      public function get hasHouseId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set houseId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.houseId$field = param1;
      }
      
      public function get houseId() : uint
      {
         return this.houseId$field;
      }
      
      public function clearFormationId() : void
      {
         this.hasField$0 &= 4294967293;
         this.formationId$field = new uint();
      }
      
      public function get hasFormationId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set formationId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.formationId$field = param1;
      }
      
      public function get formationId() : uint
      {
         return this.formationId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasHouseId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.houseId$field);
         }
         if(this.hasFormationId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.formationId$field);
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
                     throw new IOError("Bad data format: Cmd_Treasure_Seize_CS.houseId cannot be set twice.");
                  }
                  _loc3_++;
                  this.houseId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Treasure_Seize_CS.formationId cannot be set twice.");
                  }
                  _loc4_++;
                  this.formationId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
