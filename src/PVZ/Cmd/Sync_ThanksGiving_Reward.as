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
   
   public final class Sync_ThanksGiving_Reward extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Sync_ThanksGiving_Reward";
      
      public static const ITEMS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Sync_ThanksGiving_Reward.items","items",1 << 3 | WireType.LENGTH_DELIMITED,Dto_ThanksGiving_RewardItem);
       
      
      private var items$field:Dto_ThanksGiving_RewardItem;
      
      public function Sync_ThanksGiving_Reward()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Sync_ThanksGiving_Reward.$MessageID;
      }
      
      public function clearItems() : void
      {
         this.items$field = null;
      }
      
      public function get hasItems() : Boolean
      {
         return this.items$field != null;
      }
      
      public function set items(param1:Dto_ThanksGiving_RewardItem) : void
      {
         this.items$field = param1;
      }
      
      public function get items() : Dto_ThanksGiving_RewardItem
      {
         return this.items$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasItems)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.items$field);
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
                     throw new IOError("Bad data format: Sync_ThanksGiving_Reward.items cannot be set twice.");
                  }
                  _loc3_++;
                  this.items = new Dto_ThanksGiving_RewardItem();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.items);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
