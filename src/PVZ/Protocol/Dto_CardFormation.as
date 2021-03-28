package PVZ.Protocol
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_CardFormation extends Message
   {
      
      public static const $MessageID:String = "PVZ.Protocol.Dto_CardFormation";
      
      public static const LEADERCARD:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Protocol.Dto_CardFormation.leaderCard","leaderCard",1 << 3 | WireType.VARINT);
      
      public static const CARDLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Protocol.Dto_CardFormation.cardList","cardList",2 << 3 | WireType.LENGTH_DELIMITED,Dto_CardFullInfo);
       
      
      private var leaderCard$field:Int64;
      
      public var cardList:Array;
      
      public function Dto_CardFormation()
      {
         this.cardList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_CardFormation.$MessageID;
      }
      
      public function clearLeaderCard() : void
      {
         this.leaderCard$field = null;
      }
      
      public function get hasLeaderCard() : Boolean
      {
         return this.leaderCard$field != null;
      }
      
      public function set leaderCard(param1:Int64) : void
      {
         this.leaderCard$field = param1;
      }
      
      public function get leaderCard() : Int64
      {
         return this.leaderCard$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasLeaderCard)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.leaderCard$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.cardList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cardList[_loc2_]);
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
                     throw new IOError("Bad data format: Dto_CardFormation.leaderCard cannot be set twice.");
                  }
                  _loc3_++;
                  this.leaderCard = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  this.cardList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_CardFullInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
