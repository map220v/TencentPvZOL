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
   
   public final class Cmd_Equip_AttachInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Equip_AttachInfo_SC";
      
      public static const ATTACHID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Equip_AttachInfo_SC.attachId","attachId",1 << 3 | WireType.VARINT);
      
      public static const CANTAKETODAY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Equip_AttachInfo_SC.canTakeToday","canTakeToday",2 << 3 | WireType.VARINT);
      
      public static const HASTAKETODAY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Equip_AttachInfo_SC.hasTakeToday","hasTakeToday",3 << 3 | WireType.VARINT);
      
      public static const CANTAKEFIRST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Equip_AttachInfo_SC.canTakeFirst","canTakeFirst",4 << 3 | WireType.VARINT);
      
      public static const HASTAKEFIRST:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Equip_AttachInfo_SC.hasTakeFirst","hasTakeFirst",5 << 3 | WireType.VARINT);
      
      public static const BUYTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Equip_AttachInfo_SC.buyTime","buyTime",6 << 3 | WireType.VARINT);
       
      
      private var attachId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var canTakeToday$field:uint;
      
      private var hasTakeToday$field:Boolean;
      
      private var canTakeFirst$field:uint;
      
      private var hasTakeFirst$field:Boolean;
      
      private var buyTime$field:uint;
      
      public function Cmd_Equip_AttachInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Equip_AttachInfo_SC.$MessageID;
      }
      
      public function clearAttachId() : void
      {
         this.hasField$0 &= 4294967294;
         this.attachId$field = new uint();
      }
      
      public function get hasAttachId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set attachId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.attachId$field = param1;
      }
      
      public function get attachId() : uint
      {
         return this.attachId$field;
      }
      
      public function clearCanTakeToday() : void
      {
         this.hasField$0 &= 4294967293;
         this.canTakeToday$field = new uint();
      }
      
      public function get hasCanTakeToday() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set canTakeToday(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.canTakeToday$field = param1;
      }
      
      public function get canTakeToday() : uint
      {
         return this.canTakeToday$field;
      }
      
      public function clearHasTakeToday() : void
      {
         this.hasField$0 &= 4294967291;
         this.hasTakeToday$field = new Boolean();
      }
      
      public function get hasHasTakeToday() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set hasTakeToday(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.hasTakeToday$field = param1;
      }
      
      public function get hasTakeToday() : Boolean
      {
         return this.hasTakeToday$field;
      }
      
      public function clearCanTakeFirst() : void
      {
         this.hasField$0 &= 4294967287;
         this.canTakeFirst$field = new uint();
      }
      
      public function get hasCanTakeFirst() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set canTakeFirst(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.canTakeFirst$field = param1;
      }
      
      public function get canTakeFirst() : uint
      {
         return this.canTakeFirst$field;
      }
      
      public function clearHasTakeFirst() : void
      {
         this.hasField$0 &= 4294967279;
         this.hasTakeFirst$field = new Boolean();
      }
      
      public function get hasHasTakeFirst() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set hasTakeFirst(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.hasTakeFirst$field = param1;
      }
      
      public function get hasTakeFirst() : Boolean
      {
         return this.hasTakeFirst$field;
      }
      
      public function clearBuyTime() : void
      {
         this.hasField$0 &= 4294967263;
         this.buyTime$field = new uint();
      }
      
      public function get hasBuyTime() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set buyTime(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.buyTime$field = param1;
      }
      
      public function get buyTime() : uint
      {
         return this.buyTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasAttachId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.attachId$field);
         }
         if(this.hasCanTakeToday)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.canTakeToday$field);
         }
         if(this.hasHasTakeToday)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.hasTakeToday$field);
         }
         if(this.hasCanTakeFirst)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.canTakeFirst$field);
         }
         if(this.hasHasTakeFirst)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.hasTakeFirst$field);
         }
         if(this.hasBuyTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.buyTime$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_AttachInfo_SC.attachId cannot be set twice.");
                  }
                  _loc3_++;
                  this.attachId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_AttachInfo_SC.canTakeToday cannot be set twice.");
                  }
                  _loc4_++;
                  this.canTakeToday = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_AttachInfo_SC.hasTakeToday cannot be set twice.");
                  }
                  _loc5_++;
                  this.hasTakeToday = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_AttachInfo_SC.canTakeFirst cannot be set twice.");
                  }
                  _loc6_++;
                  this.canTakeFirst = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_AttachInfo_SC.hasTakeFirst cannot be set twice.");
                  }
                  _loc7_++;
                  this.hasTakeFirst = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Equip_AttachInfo_SC.buyTime cannot be set twice.");
                  }
                  _loc8_++;
                  this.buyTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
