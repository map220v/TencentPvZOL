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
   
   public final class Cmd_NoEndTD_UseSkill_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_NoEndTD_UseSkill_CS";
      
      public static const MODE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndTD_UseSkill_CS.mode","mode",1 << 3 | WireType.VARINT);
      
      public static const PLANTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndTD_UseSkill_CS.plantId","plantId",2 << 3 | WireType.VARINT);
       
      
      private var mode$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var plantId$field:uint;
      
      public function Cmd_NoEndTD_UseSkill_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_NoEndTD_UseSkill_CS.$MessageID;
      }
      
      public function clearMode() : void
      {
         this.hasField$0 &= 4294967294;
         this.mode$field = new uint();
      }
      
      public function get hasMode() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set mode(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.mode$field = param1;
      }
      
      public function get mode() : uint
      {
         return this.mode$field;
      }
      
      public function clearPlantId() : void
      {
         this.hasField$0 &= 4294967293;
         this.plantId$field = new uint();
      }
      
      public function get hasPlantId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set plantId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.plantId$field = param1;
      }
      
      public function get plantId() : uint
      {
         return this.plantId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasMode)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.mode$field);
         }
         if(this.hasPlantId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.plantId$field);
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
                     throw new IOError("Bad data format: Cmd_NoEndTD_UseSkill_CS.mode cannot be set twice.");
                  }
                  _loc3_++;
                  this.mode = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_UseSkill_CS.plantId cannot be set twice.");
                  }
                  _loc4_++;
                  this.plantId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
