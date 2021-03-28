package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Card_GetMysteryCardInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Card_GetMysteryCardInfo_SC";
      
      public static const CARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Card_GetMysteryCardInfo_SC.card","card",1 << 3 | WireType.LENGTH_DELIMITED,Dto_MysteryCard);
      
      public static const LUCKVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Card_GetMysteryCardInfo_SC.luckValue","luckValue",2 << 3 | WireType.VARINT);
       
      
      private var card$field:Dto_MysteryCard;
      
      private var luckValue$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Card_GetMysteryCardInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Card_GetMysteryCardInfo_SC.$MessageID;
      }
      
      public function clearCard() : void
      {
         this.card$field = null;
      }
      
      public function get hasCard() : Boolean
      {
         return this.card$field != null;
      }
      
      public function set card(param1:Dto_MysteryCard) : void
      {
         this.card$field = param1;
      }
      
      public function get card() : Dto_MysteryCard
      {
         return this.card$field;
      }
      
      public function clearLuckValue() : void
      {
         this.hasField$0 &= 4294967294;
         this.luckValue$field = new uint();
      }
      
      public function get hasLuckValue() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set luckValue(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.luckValue$field = param1;
      }
      
      public function get luckValue() : uint
      {
         return this.luckValue$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasCard)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.card$field);
         }
         if(this.hasLuckValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.luckValue$field);
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
                     throw new IOError("Bad data format: Cmd_Card_GetMysteryCardInfo_SC.card cannot be set twice.");
                  }
                  _loc3_++;
                  this.card = new Dto_MysteryCard();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.card);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_GetMysteryCardInfo_SC.luckValue cannot be set twice.");
                  }
                  _loc4_++;
                  this.luckValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
