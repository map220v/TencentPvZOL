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
   
   public final class Cmd_ExpeditionFight_RefreshRankInfo_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ExpeditionFight_RefreshRankInfo_CS";
      
      public static const PAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_RefreshRankInfo_CS.page","page",1 << 3 | WireType.VARINT);
       
      
      private var page$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_ExpeditionFight_RefreshRankInfo_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ExpeditionFight_RefreshRankInfo_CS.$MessageID;
      }
      
      public function clearPage() : void
      {
         this.hasField$0 &= 4294967294;
         this.page$field = new uint();
      }
      
      public function get hasPage() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set page(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.page$field = param1;
      }
      
      public function get page() : uint
      {
         return this.page$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasPage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.page$field);
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
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_RefreshRankInfo_CS.page cannot be set twice.");
                  }
                  _loc3_++;
                  this.page = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
