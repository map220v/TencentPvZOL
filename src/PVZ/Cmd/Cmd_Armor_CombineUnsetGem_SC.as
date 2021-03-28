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
   
   public final class Cmd_Armor_CombineUnsetGem_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Armor_CombineUnsetGem_SC";
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Armor_CombineUnsetGem_SC.itemId","itemId",1 << 3 | WireType.VARINT);
      
      public static const BATCHCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Armor_CombineUnsetGem_SC.batchCount","batchCount",2 << 3 | WireType.VARINT);
      
      public static const COMBINEITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Armor_CombineUnsetGem_SC.combineItemId","combineItemId",3 << 3 | WireType.VARINT);
       
      
      private var itemId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var batchCount$field:uint;
      
      private var combineItemId$field:uint;
      
      public function Cmd_Armor_CombineUnsetGem_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Armor_CombineUnsetGem_SC.$MessageID;
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
      
      public function clearBatchCount() : void
      {
         this.hasField$0 &= 4294967293;
         this.batchCount$field = new uint();
      }
      
      public function get hasBatchCount() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set batchCount(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.batchCount$field = param1;
      }
      
      public function get batchCount() : uint
      {
         return this.batchCount$field;
      }
      
      public function clearCombineItemId() : void
      {
         this.hasField$0 &= 4294967291;
         this.combineItemId$field = new uint();
      }
      
      public function get hasCombineItemId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set combineItemId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.combineItemId$field = param1;
      }
      
      public function get combineItemId() : uint
      {
         return this.combineItemId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasItemId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.itemId$field);
         }
         if(this.hasBatchCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.batchCount$field);
         }
         if(this.hasCombineItemId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.combineItemId$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Armor_CombineUnsetGem_SC.itemId cannot be set twice.");
                  }
                  _loc3_++;
                  this.itemId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Armor_CombineUnsetGem_SC.batchCount cannot be set twice.");
                  }
                  _loc4_++;
                  this.batchCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Armor_CombineUnsetGem_SC.combineItemId cannot be set twice.");
                  }
                  _loc5_++;
                  this.combineItemId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
