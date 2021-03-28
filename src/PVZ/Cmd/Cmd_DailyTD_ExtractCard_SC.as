package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_DailyTD_ExtractCard_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_DailyTD_ExtractCard_SC";
      
      public static const CARDITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_DailyTD_ExtractCard_SC.cardItem","cardItem",1 << 3 | WireType.LENGTH_DELIMITED,Dto_DailyTDCard);
       
      
      private var cardItem$field:Dto_DailyTDCard;
      
      public function Cmd_DailyTD_ExtractCard_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_DailyTD_ExtractCard_SC.$MessageID;
      }
      
      public function clearCardItem() : void
      {
         this.cardItem$field = null;
      }
      
      public function get hasCardItem() : Boolean
      {
         return this.cardItem$field != null;
      }
      
      public function set cardItem(param1:Dto_DailyTDCard) : void
      {
         this.cardItem$field = param1;
      }
      
      public function get cardItem() : Dto_DailyTDCard
      {
         return this.cardItem$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasCardItem)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cardItem$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Cmd_DailyTD_ExtractCard_SC.cardItem cannot be set twice.");
                  }
                  _loc3_++;
                  this.cardItem = new Dto_DailyTDCard();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.cardItem);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
