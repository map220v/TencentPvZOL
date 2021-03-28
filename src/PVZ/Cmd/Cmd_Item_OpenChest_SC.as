package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Item_OpenChest_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Item_OpenChest_SC";
      
      public static const USEDITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Item_OpenChest_SC.usedItemId","usedItemId",1 << 3 | WireType.VARINT);
      
      public static const ALLITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Item_OpenChest_SC.allItems","allItems",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const OPENEDITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Item_OpenChest_SC.openedItems","openedItems",3 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var usedItemId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var allItems:Array;
      
      public var openedItems:Array;
      
      public function Cmd_Item_OpenChest_SC()
      {
         this.allItems = [];
         this.openedItems = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Item_OpenChest_SC.$MessageID;
      }
      
      public function clearUsedItemId() : void
      {
         this.hasField$0 &= 4294967294;
         this.usedItemId$field = new uint();
      }
      
      public function get hasUsedItemId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set usedItemId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.usedItemId$field = param1;
      }
      
      public function get usedItemId() : uint
      {
         return this.usedItemId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasUsedItemId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.usedItemId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.allItems.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.allItems[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.openedItems.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.openedItems[_loc3_]);
            _loc3_++;
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                     throw new IOError("Bad data format: Cmd_Item_OpenChest_SC.usedItemId cannot be set twice.");
                  }
                  _loc3_++;
                  this.usedItemId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.allItems.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 3:
                  this.openedItems.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
