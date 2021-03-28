package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.utils.IDataInput;
   
   public final class Cmd_PayShop_GetGiftTicketList_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_PayShop_GetGiftTicketList_SC";
      
      public static const GIFTTICKET:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_PayShop_GetGiftTicketList_SC.giftTicket","giftTicket",1 << 3 | WireType.LENGTH_DELIMITED,DtoPayShopGiftTicket);
       
      
      public var giftTicket:Array;
      
      public function Cmd_PayShop_GetGiftTicketList_SC()
      {
         this.giftTicket = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_PayShop_GetGiftTicketList_SC.$MessageID;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.giftTicket.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.giftTicket[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc3_ >> 3)
            {
               case 1:
                  this.giftTicket.push(ReadUtils.read$TYPE_MESSAGE(param1,new DtoPayShopGiftTicket()));
                  break;
               default:
                  super.readUnknown(param1,_loc3_);
                  break;
            }
         }
      }
   }
}
