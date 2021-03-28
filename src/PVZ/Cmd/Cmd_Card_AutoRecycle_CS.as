package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_INT64;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Card_AutoRecycle_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Card_AutoRecycle_CS";
      
      public static const PWDTAG:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Card_AutoRecycle_CS.pwdtag","pwdtag",1 << 3 | WireType.VARINT);
      
      public static const CARDUID:RepeatedFieldDescriptor$TYPE_INT64 = new RepeatedFieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Card_AutoRecycle_CS.cardUId","cardUId",2 << 3 | WireType.VARINT);
       
      
      private var pwdtag$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var cardUId:Array;
      
      public function Cmd_Card_AutoRecycle_CS()
      {
         this.cardUId = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Card_AutoRecycle_CS.$MessageID;
      }
      
      public function clearPwdtag() : void
      {
         this.hasField$0 &= 4294967294;
         this.pwdtag$field = new uint();
      }
      
      public function get hasPwdtag() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set pwdtag(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.pwdtag$field = param1;
      }
      
      public function get pwdtag() : uint
      {
         return this.pwdtag$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasPwdtag)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.pwdtag$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.cardUId.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.cardUId[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_AutoRecycle_CS.pwdtag cannot be set twice.");
                  }
                  _loc3_++;
                  this.pwdtag = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if((_loc4_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_INT64,this.cardUId);
                  }
                  else
                  {
                     this.cardUId.push(ReadUtils.read$TYPE_INT64(param1));
                  }
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
