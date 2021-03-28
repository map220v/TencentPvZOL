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
   
   public final class Cmd_Nutrition_ReagentUpLevel_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Nutrition_ReagentUpLevel_CS";
      
      public static const REAGENTID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Nutrition_ReagentUpLevel_CS.reagentId","reagentId",1 << 3 | WireType.VARINT);
      
      public static const TARGETLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_ReagentUpLevel_CS.targetLevel","targetLevel",2 << 3 | WireType.VARINT);
       
      
      private var reagentId$field:Int64;
      
      private var targetLevel$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Nutrition_ReagentUpLevel_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Nutrition_ReagentUpLevel_CS.$MessageID;
      }
      
      public function clearReagentId() : void
      {
         this.reagentId$field = null;
      }
      
      public function get hasReagentId() : Boolean
      {
         return this.reagentId$field != null;
      }
      
      public function set reagentId(param1:Int64) : void
      {
         this.reagentId$field = param1;
      }
      
      public function get reagentId() : Int64
      {
         return this.reagentId$field;
      }
      
      public function clearTargetLevel() : void
      {
         this.hasField$0 &= 4294967294;
         this.targetLevel$field = new uint();
      }
      
      public function get hasTargetLevel() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set targetLevel(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.targetLevel$field = param1;
      }
      
      public function get targetLevel() : uint
      {
         return this.targetLevel$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasReagentId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.reagentId$field);
         }
         if(this.hasTargetLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.targetLevel$field);
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
                     throw new IOError("Bad data format: Cmd_Nutrition_ReagentUpLevel_CS.reagentId cannot be set twice.");
                  }
                  _loc3_++;
                  this.reagentId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_ReagentUpLevel_CS.targetLevel cannot be set twice.");
                  }
                  _loc4_++;
                  this.targetLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
