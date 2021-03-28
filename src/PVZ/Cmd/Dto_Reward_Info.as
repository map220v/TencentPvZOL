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
   
   public final class Dto_Reward_Info extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Reward_Info";
      
      public static const DATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Reward_Info.date","date",1 << 3 | WireType.VARINT);
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Reward_Info.itemId","itemId",2 << 3 | WireType.VARINT);
      
      public static const ITEMNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Reward_Info.itemNum","itemNum",3 << 3 | WireType.VARINT);
      
      public static const VIPLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Reward_Info.vipLevel","vipLevel",4 << 3 | WireType.VARINT);
       
      
      private var date$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var itemId$field:uint;
      
      private var itemNum$field:uint;
      
      private var vipLevel$field:uint;
      
      public function Dto_Reward_Info()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Reward_Info.$MessageID;
      }
      
      public function clearDate() : void
      {
         this.hasField$0 &= 4294967294;
         this.date$field = new uint();
      }
      
      public function get hasDate() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set date(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.date$field = param1;
      }
      
      public function get date() : uint
      {
         return this.date$field;
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
      
      public function clearItemNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.itemNum$field = new uint();
      }
      
      public function get hasItemNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set itemNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.itemNum$field = param1;
      }
      
      public function get itemNum() : uint
      {
         return this.itemNum$field;
      }
      
      public function clearVipLevel() : void
      {
         this.hasField$0 &= 4294967287;
         this.vipLevel$field = new uint();
      }
      
      public function get hasVipLevel() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set vipLevel(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.vipLevel$field = param1;
      }
      
      public function get vipLevel() : uint
      {
         return this.vipLevel$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasDate)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.date$field);
         }
         if(this.hasItemId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.itemId$field);
         }
         if(this.hasItemNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.itemNum$field);
         }
         if(this.hasVipLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.vipLevel$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Reward_Info.date cannot be set twice.");
                  }
                  _loc3_++;
                  this.date = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Reward_Info.itemId cannot be set twice.");
                  }
                  _loc4_++;
                  this.itemId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Reward_Info.itemNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.itemNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Reward_Info.vipLevel cannot be set twice.");
                  }
                  _loc6_++;
                  this.vipLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
