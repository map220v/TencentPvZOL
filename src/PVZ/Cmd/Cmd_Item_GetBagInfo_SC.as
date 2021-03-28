package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Item_GetBagInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Item_GetBagInfo_SC";
      
      public static const ALL:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Item_GetBagInfo_SC.all","all",1 << 3 | WireType.LENGTH_DELIMITED,Dto_ItemInfo);
      
      public static const NEWITEMLIST:RepeatedFieldDescriptor$TYPE_INT64 = new RepeatedFieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Item_GetBagInfo_SC.newItemList","newItemList",2 << 3 | WireType.VARINT);
      
      public static const BNEXT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Item_GetBagInfo_SC.bNext","bNext",3 << 3 | WireType.VARINT);
       
      
      public var all:Array;
      
      public var newItemList:Array;
      
      private var bNext$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Item_GetBagInfo_SC()
      {
         this.all = [];
         this.newItemList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Item_GetBagInfo_SC.$MessageID;
      }
      
      public function clearBNext() : void
      {
         this.hasField$0 &= 4294967294;
         this.bNext$field = new Boolean();
      }
      
      public function get hasBNext() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set bNext(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.bNext$field = param1;
      }
      
      public function get bNext() : Boolean
      {
         return this.bNext$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.all.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.all[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.newItemList.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.newItemList[_loc3_]);
            _loc3_++;
         }
         if(this.hasBNext)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.bNext$field);
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
                  this.all.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ItemInfo()));
                  break;
               case 2:
                  if((_loc4_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_INT64,this.newItemList);
                  }
                  else
                  {
                     this.newItemList.push(ReadUtils.read$TYPE_INT64(param1));
                  }
                  break;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Item_GetBagInfo_SC.bNext cannot be set twice.");
                  }
                  _loc3_++;
                  this.bNext = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
