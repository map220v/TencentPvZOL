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
   
   public final class Cmd_ThanksGiving_Lottery_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ThanksGiving_Lottery_SC";
      
      public static const ITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ThanksGiving_Lottery_SC.item","item",1 << 3 | WireType.LENGTH_DELIMITED,Dto_ThanksGiving_RewardItem);
       
      
      private var item$field:Dto_ThanksGiving_RewardItem;
      
      public function Cmd_ThanksGiving_Lottery_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ThanksGiving_Lottery_SC.$MessageID;
      }
      
      public function clearItem() : void
      {
         this.item$field = null;
      }
      
      public function get hasItem() : Boolean
      {
         return this.item$field != null;
      }
      
      public function set item(param1:Dto_ThanksGiving_RewardItem) : void
      {
         this.item$field = param1;
      }
      
      public function get item() : Dto_ThanksGiving_RewardItem
      {
         return this.item$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasItem)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.item$field);
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
                     throw new IOError("Bad data format: Cmd_ThanksGiving_Lottery_SC.item cannot be set twice.");
                  }
                  _loc3_++;
                  this.item = new Dto_ThanksGiving_RewardItem();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.item);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
