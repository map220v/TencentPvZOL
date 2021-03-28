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
   
   public final class Cmd_GuildFuben_NewDayReward_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GuildFuben_NewDayReward_GetInfo_SC";
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFuben_NewDayReward_GetInfo_SC.itemId","itemId",1 << 3 | WireType.VARINT);
      
      public static const HISTORYNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFuben_NewDayReward_GetInfo_SC.historyNum","historyNum",2 << 3 | WireType.VARINT);
      
      public static const TAKENNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFuben_NewDayReward_GetInfo_SC.takenNum","takenNum",3 << 3 | WireType.VARINT);
      
      public static const CURRNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFuben_NewDayReward_GetInfo_SC.currNum","currNum",4 << 3 | WireType.VARINT);
      
      public static const MAXNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFuben_NewDayReward_GetInfo_SC.maxNum","maxNum",5 << 3 | WireType.VARINT);
       
      
      private var itemId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var historyNum$field:uint;
      
      private var takenNum$field:uint;
      
      private var currNum$field:uint;
      
      private var maxNum$field:uint;
      
      public function Cmd_GuildFuben_NewDayReward_GetInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GuildFuben_NewDayReward_GetInfo_SC.$MessageID;
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
      
      public function clearHistoryNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.historyNum$field = new uint();
      }
      
      public function get hasHistoryNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set historyNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.historyNum$field = param1;
      }
      
      public function get historyNum() : uint
      {
         return this.historyNum$field;
      }
      
      public function clearTakenNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.takenNum$field = new uint();
      }
      
      public function get hasTakenNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set takenNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.takenNum$field = param1;
      }
      
      public function get takenNum() : uint
      {
         return this.takenNum$field;
      }
      
      public function clearCurrNum() : void
      {
         this.hasField$0 &= 4294967287;
         this.currNum$field = new uint();
      }
      
      public function get hasCurrNum() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set currNum(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.currNum$field = param1;
      }
      
      public function get currNum() : uint
      {
         return this.currNum$field;
      }
      
      public function clearMaxNum() : void
      {
         this.hasField$0 &= 4294967279;
         this.maxNum$field = new uint();
      }
      
      public function get hasMaxNum() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set maxNum(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.maxNum$field = param1;
      }
      
      public function get maxNum() : uint
      {
         return this.maxNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasItemId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.itemId$field);
         }
         if(this.hasHistoryNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.historyNum$field);
         }
         if(this.hasTakenNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.takenNum$field);
         }
         if(this.hasCurrNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.currNum$field);
         }
         if(this.hasMaxNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.maxNum$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFuben_NewDayReward_GetInfo_SC.itemId cannot be set twice.");
                  }
                  _loc3_++;
                  this.itemId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFuben_NewDayReward_GetInfo_SC.historyNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.historyNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFuben_NewDayReward_GetInfo_SC.takenNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.takenNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFuben_NewDayReward_GetInfo_SC.currNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.currNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFuben_NewDayReward_GetInfo_SC.maxNum cannot be set twice.");
                  }
                  _loc7_++;
                  this.maxNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
