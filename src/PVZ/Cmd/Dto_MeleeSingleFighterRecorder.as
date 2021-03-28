package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_MeleeSingleFighterRecorder extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_MeleeSingleFighterRecorder";
      
      public static const REPORTUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_MeleeSingleFighterRecorder.reportUid","reportUid",1 << 3 | WireType.VARINT);
      
      public static const WIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_MeleeSingleFighterRecorder.win","win",7 << 3 | WireType.VARINT);
       
      
      private var reportUid$field:Int64;
      
      private var win$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function Dto_MeleeSingleFighterRecorder()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_MeleeSingleFighterRecorder.$MessageID;
      }
      
      public function clearReportUid() : void
      {
         this.reportUid$field = null;
      }
      
      public function get hasReportUid() : Boolean
      {
         return this.reportUid$field != null;
      }
      
      public function set reportUid(param1:Int64) : void
      {
         this.reportUid$field = param1;
      }
      
      public function get reportUid() : Int64
      {
         return this.reportUid$field;
      }
      
      public function clearWin() : void
      {
         this.hasField$0 &= 4294967294;
         this.win$field = new Boolean();
      }
      
      public function get hasWin() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set win(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.win$field = param1;
      }
      
      public function get win() : Boolean
      {
         return this.win$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasReportUid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.reportUid$field);
         }
         if(this.hasWin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.win$field);
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
                     throw new IOError("Bad data format: Dto_MeleeSingleFighterRecorder.reportUid cannot be set twice.");
                  }
                  _loc3_++;
                  this.reportUid = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 7:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeSingleFighterRecorder.win cannot be set twice.");
                  }
                  _loc4_++;
                  this.win = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
