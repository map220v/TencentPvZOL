package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_CardInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_CardInfo";
      
      public static const CARDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardInfo.cardId","cardId",1 << 3 | WireType.VARINT);
      
      public static const ITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_CardInfo.item","item",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const CARDSTATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_CardInfo.cardStatus","cardStatus",3 << 3 | WireType.VARINT,E_CardStatus);
       
      
      private var cardId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var item$field:Dto_IdNum;
      
      private var cardStatus$field:int;
      
      public function Dto_CardInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_CardInfo.$MessageID;
      }
      
      public function clearCardId() : void
      {
         this.hasField$0 &= 4294967294;
         this.cardId$field = new uint();
      }
      
      public function get hasCardId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set cardId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.cardId$field = param1;
      }
      
      public function get cardId() : uint
      {
         return this.cardId$field;
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
      
      public function clearCardStatus() : void
      {
         this.hasField$0 &= 4294967293;
         this.cardStatus$field = new int();
      }
      
      public function get hasCardStatus() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set cardStatus(param1:int) : void
      {
         this.hasField$0 |= 2;
         this.cardStatus$field = param1;
      }
      
      public function get cardStatus() : int
      {
         return this.cardStatus$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasCardId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.cardId$field);
         }
         if(this.hasItem)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.item$field);
         }
         if(this.hasCardStatus)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_ENUM(param1,this.cardStatus$field);
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
                     throw new IOError("Bad data format: Dto_CardInfo.cardId cannot be set twice.");
                  }
                  _loc3_++;
                  this.cardId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardInfo.item cannot be set twice.");
                  }
                  _loc4_++;
                  this.item = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.item);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardInfo.cardStatus cannot be set twice.");
                  }
                  _loc5_++;
                  this.cardStatus = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
