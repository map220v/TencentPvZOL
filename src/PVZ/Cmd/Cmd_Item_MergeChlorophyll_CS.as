package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Item_MergeChlorophyll_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Item_MergeChlorophyll_CS";
      
      public static const ITEMBASEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Item_MergeChlorophyll_CS.itemBaseId","itemBaseId",1 << 3 | WireType.VARINT);
      
      public static const ISALL:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Item_MergeChlorophyll_CS.isAll","isAll",2 << 3 | WireType.VARINT);
       
      
      private var itemBaseId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var isAll$field:Boolean;
      
      public function Cmd_Item_MergeChlorophyll_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Item_MergeChlorophyll_CS.$MessageID;
      }
      
      public function clearItemBaseId() : void
      {
         this.hasField$0 &= 4294967294;
         this.itemBaseId$field = new uint();
      }
      
      public function get hasItemBaseId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set itemBaseId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.itemBaseId$field = param1;
      }
      
      public function get itemBaseId() : uint
      {
         return this.itemBaseId$field;
      }
      
      public function clearIsAll() : void
      {
         this.hasField$0 &= 4294967293;
         this.isAll$field = new Boolean();
      }
      
      public function get hasIsAll() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set isAll(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.isAll$field = param1;
      }
      
      public function get isAll() : Boolean
      {
         return this.isAll$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasItemBaseId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.itemBaseId$field);
         }
         if(this.hasIsAll)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.isAll$field);
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
                     throw new IOError("Bad data format: Cmd_Item_MergeChlorophyll_CS.itemBaseId cannot be set twice.");
                  }
                  _loc3_++;
                  this.itemBaseId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Item_MergeChlorophyll_CS.isAll cannot be set twice.");
                  }
                  _loc4_++;
                  this.isAll = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
