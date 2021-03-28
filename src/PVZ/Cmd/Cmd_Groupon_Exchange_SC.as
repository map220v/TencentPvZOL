package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Groupon_Exchange_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Groupon_Exchange_SC";
      
      public static const CREADITS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Groupon_Exchange_SC.creadits","creadits",1 << 3 | WireType.VARINT);
      
      public static const ITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Groupon_Exchange_SC.item","item",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Groupon_Exchange_SC.itemId","itemId",3 << 3 | WireType.VARINT);
       
      
      private var creadits$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var item$field:Dto_IdNum;
      
      private var itemId$field:uint;
      
      public function Cmd_Groupon_Exchange_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Groupon_Exchange_SC.$MessageID;
      }
      
      public function clearCreadits() : void
      {
         this.hasField$0 &= 4294967294;
         this.creadits$field = new uint();
      }
      
      public function get hasCreadits() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set creadits(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.creadits$field = param1;
      }
      
      public function get creadits() : uint
      {
         return this.creadits$field;
      }
      
      public function clearItem() : void
      {
         this.item$field = null;
      }
      
      public function get hasItem() : Boolean
      {
         return this.item$field != null;
      }
      
      public function set item(param1:Dto_IdNum) : void
      {
         this.item$field = param1;
      }
      
      public function get item() : Dto_IdNum
      {
         return this.item$field;
      }
      
      public function clearItemId() : void
      {
         this.hasField$0 &= 4294967293;
         this.itemId$field = new uint();
      }
      
      public function get hasItemId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set itemId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.itemId$field = param1;
      }
      
      public function get itemId() : uint
      {
         return this.itemId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasCreadits)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.creadits$field);
         }
         if(this.hasItem)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.item$field);
         }
         if(this.hasItemId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.itemId$field);
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
                     throw new IOError("Bad data format: Cmd_Groupon_Exchange_SC.creadits cannot be set twice.");
                  }
                  _loc3_++;
                  this.creadits = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Groupon_Exchange_SC.item cannot be set twice.");
                  }
                  _loc4_++;
                  this.item = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.item);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Groupon_Exchange_SC.itemId cannot be set twice.");
                  }
                  _loc5_++;
                  this.itemId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
