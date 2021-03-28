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
   
   public final class Cmd_RankArena_Challenge_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_RankArena_Challenge_CS";
      
      public static const OPPONENTID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_RankArena_Challenge_CS.opponentId","opponentId",1 << 3 | WireType.VARINT);
      
      public static const OPPONENTINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_RankArena_Challenge_CS.opponentIndex","opponentIndex",2 << 3 | WireType.VARINT);
       
      
      private var opponentId$field:Int64;
      
      private var opponentIndex$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_RankArena_Challenge_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_RankArena_Challenge_CS.$MessageID;
      }
      
      public function clearOpponentId() : void
      {
         this.opponentId$field = null;
      }
      
      public function get hasOpponentId() : Boolean
      {
         return this.opponentId$field != null;
      }
      
      public function set opponentId(param1:Int64) : void
      {
         this.opponentId$field = param1;
      }
      
      public function get opponentId() : Int64
      {
         return this.opponentId$field;
      }
      
      public function clearOpponentIndex() : void
      {
         this.hasField$0 &= 4294967294;
         this.opponentIndex$field = new uint();
      }
      
      public function get hasOpponentIndex() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set opponentIndex(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.opponentIndex$field = param1;
      }
      
      public function get opponentIndex() : uint
      {
         return this.opponentIndex$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasOpponentId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.opponentId$field);
         }
         if(this.hasOpponentIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.opponentIndex$field);
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
                     throw new IOError("Bad data format: Cmd_RankArena_Challenge_CS.opponentId cannot be set twice.");
                  }
                  _loc3_++;
                  this.opponentId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_RankArena_Challenge_CS.opponentIndex cannot be set twice.");
                  }
                  _loc4_++;
                  this.opponentIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
