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
   
   public final class Cmd_Mine_CollectAllMine_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Mine_CollectAllMine_SC";
      
      public static const TOTALCOIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Mine_CollectAllMine_SC.totalCoin","totalCoin",1 << 3 | WireType.VARINT);
       
      
      private var totalCoin$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Mine_CollectAllMine_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Mine_CollectAllMine_SC.$MessageID;
      }
      
      public function clearTotalCoin() : void
      {
         this.hasField$0 &= 4294967294;
         this.totalCoin$field = new uint();
      }
      
      public function get hasTotalCoin() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set totalCoin(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.totalCoin$field = param1;
      }
      
      public function get totalCoin() : uint
      {
         return this.totalCoin$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasTotalCoin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.totalCoin$field);
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
                     throw new IOError("Bad data format: Cmd_Mine_CollectAllMine_SC.totalCoin cannot be set twice.");
                  }
                  _loc3_++;
                  this.totalCoin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
