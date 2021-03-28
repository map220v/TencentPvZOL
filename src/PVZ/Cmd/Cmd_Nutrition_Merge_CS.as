package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Nutrition_Merge_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Nutrition_Merge_CS";
      
      public static const REAGENTSRCID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Nutrition_Merge_CS.reagentSrcId","reagentSrcId",1 << 3 | WireType.VARINT);
      
      public static const REAGENTDSTID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Nutrition_Merge_CS.reagentDstId","reagentDstId",2 << 3 | WireType.VARINT);
       
      
      private var reagentSrcId$field:Int64;
      
      private var reagentDstId$field:Int64;
      
      public function Cmd_Nutrition_Merge_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Nutrition_Merge_CS.$MessageID;
      }
      
      public function clearReagentSrcId() : void
      {
         this.reagentSrcId$field = null;
      }
      
      public function get hasReagentSrcId() : Boolean
      {
         return this.reagentSrcId$field != null;
      }
      
      public function set reagentSrcId(param1:Int64) : void
      {
         this.reagentSrcId$field = param1;
      }
      
      public function get reagentSrcId() : Int64
      {
         return this.reagentSrcId$field;
      }
      
      public function clearReagentDstId() : void
      {
         this.reagentDstId$field = null;
      }
      
      public function get hasReagentDstId() : Boolean
      {
         return this.reagentDstId$field != null;
      }
      
      public function set reagentDstId(param1:Int64) : void
      {
         this.reagentDstId$field = param1;
      }
      
      public function get reagentDstId() : Int64
      {
         return this.reagentDstId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasReagentSrcId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.reagentSrcId$field);
         }
         if(this.hasReagentDstId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.reagentDstId$field);
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
                     throw new IOError("Bad data format: Cmd_Nutrition_Merge_CS.reagentSrcId cannot be set twice.");
                  }
                  _loc3_++;
                  this.reagentSrcId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_Merge_CS.reagentDstId cannot be set twice.");
                  }
                  _loc4_++;
                  this.reagentDstId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
