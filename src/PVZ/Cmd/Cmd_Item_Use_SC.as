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
   
   public final class Cmd_Item_Use_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Item_Use_SC";
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Item_Use_SC.itemId","itemId",1 << 3 | WireType.VARINT);
      
      public static const INUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Item_Use_SC.iNum","iNum",2 << 3 | WireType.VARINT);
       
      
      private var itemId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var iNum$field:uint;
      
      public function Cmd_Item_Use_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Item_Use_SC.$MessageID;
      }
      
      public function clearItemId() : void
      {
         this.hasField$0 &= 4294967294;
         this.itemId$field = new uint();
      }
      
      public function get hasItemId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set itemId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.itemId$field = param1;
      }
      
      public function get itemId() : uint
      {
         return this.itemId$field;
      }
      
      public function clearINum() : void
      {
         this.hasField$0 &= 4294967293;
         this.iNum$field = new uint();
      }
      
      public function get hasINum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set iNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.iNum$field = param1;
      }
      
      public function get iNum() : uint
      {
         return this.iNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasItemId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.itemId$field);
         }
         if(this.hasINum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.iNum$field);
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
                     throw new IOError("Bad data format: Cmd_Item_Use_SC.itemId cannot be set twice.");
                  }
                  _loc3_++;
                  this.itemId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Item_Use_SC.iNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.iNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
