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
   
   public final class Dto_ShowCardInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ShowCardInfo";
      
      public static const POSINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ShowCardInfo.posIndex","posIndex",1 << 3 | WireType.VARINT);
      
      public static const CARDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ShowCardInfo.cardId","cardId",2 << 3 | WireType.VARINT);
       
      
      private var posIndex$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var cardId$field:uint;
      
      public function Dto_ShowCardInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ShowCardInfo.$MessageID;
      }
      
      public function clearPosIndex() : void
      {
         this.hasField$0 &= 4294967294;
         this.posIndex$field = new uint();
      }
      
      public function get hasPosIndex() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set posIndex(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.posIndex$field = param1;
      }
      
      public function get posIndex() : uint
      {
         return this.posIndex$field;
      }
      
      public function clearCardId() : void
      {
         this.hasField$0 &= 4294967293;
         this.cardId$field = new uint();
      }
      
      public function get hasCardId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set cardId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.cardId$field = param1;
      }
      
      public function get cardId() : uint
      {
         return this.cardId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasPosIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.posIndex$field);
         }
         if(this.hasCardId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.cardId$field);
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
                     throw new IOError("Bad data format: Dto_ShowCardInfo.posIndex cannot be set twice.");
                  }
                  _loc3_++;
                  this.posIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ShowCardInfo.cardId cannot be set twice.");
                  }
                  _loc4_++;
                  this.cardId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
