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
   
   public final class Cmd_FlexibleActivity_WealthGodRedPacketStat_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_FlexibleActivity_WealthGodRedPacketStat_SC";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const PRICEOFPACKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.priceOfPacket","priceOfPacket",2 << 3 | WireType.VARINT);
      
      public static const GETBEGINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.getBeginTime","getBeginTime",3 << 3 | WireType.VARINT);
      
      public static const GETENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.getEndTime","getEndTime",4 << 3 | WireType.VARINT);
      
      public static const COOLDOWNLMT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.coolDownLmt","coolDownLmt",5 << 3 | WireType.VARINT);
      
      public static const GETCOUNTLMT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.getCountLmt","getCountLmt",6 << 3 | WireType.VARINT);
      
      public static const TOTALPACKETNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.totalPacketNum","totalPacketNum",7 << 3 | WireType.VARINT);
      
      public static const GETCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.getCount","getCount",11 << 3 | WireType.VARINT);
      
      public static const LASTGETTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.lastGetTime","lastGetTime",12 << 3 | WireType.VARINT);
      
      public static const DAYGOLDDIAMOND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.dayGoldDiamond","dayGoldDiamond",13 << 3 | WireType.VARINT);
      
      public static const SENDCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.sendCount","sendCount",14 << 3 | WireType.VARINT);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var priceOfPacket$field:uint;
      
      private var getBeginTime$field:uint;
      
      private var getEndTime$field:uint;
      
      private var coolDownLmt$field:uint;
      
      private var getCountLmt$field:uint;
      
      private var totalPacketNum$field:uint;
      
      private var getCount$field:uint;
      
      private var lastGetTime$field:uint;
      
      private var dayGoldDiamond$field:uint;
      
      private var sendCount$field:uint;
      
      public function Cmd_FlexibleActivity_WealthGodRedPacketStat_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.$MessageID;
      }
      
      public function clearActivityId() : void
      {
         this.hasField$0 &= 4294967294;
         this.activityId$field = new uint();
      }
      
      public function get hasActivityId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set activityId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.activityId$field = param1;
      }
      
      public function get activityId() : uint
      {
         return this.activityId$field;
      }
      
      public function clearPriceOfPacket() : void
      {
         this.hasField$0 &= 4294967293;
         this.priceOfPacket$field = new uint();
      }
      
      public function get hasPriceOfPacket() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set priceOfPacket(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.priceOfPacket$field = param1;
      }
      
      public function get priceOfPacket() : uint
      {
         return this.priceOfPacket$field;
      }
      
      public function clearGetBeginTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.getBeginTime$field = new uint();
      }
      
      public function get hasGetBeginTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set getBeginTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.getBeginTime$field = param1;
      }
      
      public function get getBeginTime() : uint
      {
         return this.getBeginTime$field;
      }
      
      public function clearGetEndTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.getEndTime$field = new uint();
      }
      
      public function get hasGetEndTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set getEndTime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.getEndTime$field = param1;
      }
      
      public function get getEndTime() : uint
      {
         return this.getEndTime$field;
      }
      
      public function clearCoolDownLmt() : void
      {
         this.hasField$0 &= 4294967279;
         this.coolDownLmt$field = new uint();
      }
      
      public function get hasCoolDownLmt() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set coolDownLmt(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.coolDownLmt$field = param1;
      }
      
      public function get coolDownLmt() : uint
      {
         return this.coolDownLmt$field;
      }
      
      public function clearGetCountLmt() : void
      {
         this.hasField$0 &= 4294967263;
         this.getCountLmt$field = new uint();
      }
      
      public function get hasGetCountLmt() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set getCountLmt(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.getCountLmt$field = param1;
      }
      
      public function get getCountLmt() : uint
      {
         return this.getCountLmt$field;
      }
      
      public function clearTotalPacketNum() : void
      {
         this.hasField$0 &= 4294967231;
         this.totalPacketNum$field = new uint();
      }
      
      public function get hasTotalPacketNum() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set totalPacketNum(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.totalPacketNum$field = param1;
      }
      
      public function get totalPacketNum() : uint
      {
         return this.totalPacketNum$field;
      }
      
      public function clearGetCount() : void
      {
         this.hasField$0 &= 4294967167;
         this.getCount$field = new uint();
      }
      
      public function get hasGetCount() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set getCount(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.getCount$field = param1;
      }
      
      public function get getCount() : uint
      {
         return this.getCount$field;
      }
      
      public function clearLastGetTime() : void
      {
         this.hasField$0 &= 4294967039;
         this.lastGetTime$field = new uint();
      }
      
      public function get hasLastGetTime() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set lastGetTime(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.lastGetTime$field = param1;
      }
      
      public function get lastGetTime() : uint
      {
         return this.lastGetTime$field;
      }
      
      public function clearDayGoldDiamond() : void
      {
         this.hasField$0 &= 4294966783;
         this.dayGoldDiamond$field = new uint();
      }
      
      public function get hasDayGoldDiamond() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set dayGoldDiamond(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.dayGoldDiamond$field = param1;
      }
      
      public function get dayGoldDiamond() : uint
      {
         return this.dayGoldDiamond$field;
      }
      
      public function clearSendCount() : void
      {
         this.hasField$0 &= 4294966271;
         this.sendCount$field = new uint();
      }
      
      public function get hasSendCount() : Boolean
      {
         return (this.hasField$0 & 1024) != 0;
      }
      
      public function set sendCount(param1:uint) : void
      {
         this.hasField$0 |= 1024;
         this.sendCount$field = param1;
      }
      
      public function get sendCount() : uint
      {
         return this.sendCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         if(this.hasPriceOfPacket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.priceOfPacket$field);
         }
         if(this.hasGetBeginTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.getBeginTime$field);
         }
         if(this.hasGetEndTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.getEndTime$field);
         }
         if(this.hasCoolDownLmt)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.coolDownLmt$field);
         }
         if(this.hasGetCountLmt)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.getCountLmt$field);
         }
         if(this.hasTotalPacketNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.totalPacketNum$field);
         }
         if(this.hasGetCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.getCount$field);
         }
         if(this.hasLastGetTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.lastGetTime$field);
         }
         if(this.hasDayGoldDiamond)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_UINT32(param1,this.dayGoldDiamond$field);
         }
         if(this.hasSendCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,14);
            WriteUtils.write$TYPE_UINT32(param1,this.sendCount$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc14_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         var _loc13_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc14_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc14_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.priceOfPacket cannot be set twice.");
                  }
                  _loc4_++;
                  this.priceOfPacket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.getBeginTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.getBeginTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.getEndTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.getEndTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.coolDownLmt cannot be set twice.");
                  }
                  _loc7_++;
                  this.coolDownLmt = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.getCountLmt cannot be set twice.");
                  }
                  _loc8_++;
                  this.getCountLmt = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.totalPacketNum cannot be set twice.");
                  }
                  _loc9_++;
                  this.totalPacketNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.getCount cannot be set twice.");
                  }
                  _loc10_++;
                  this.getCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.lastGetTime cannot be set twice.");
                  }
                  _loc11_++;
                  this.lastGetTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 13:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.dayGoldDiamond cannot be set twice.");
                  }
                  _loc12_++;
                  this.dayGoldDiamond = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 14:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_WealthGodRedPacketStat_SC.sendCount cannot be set twice.");
                  }
                  _loc13_++;
                  this.sendCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc14_);
                  break;
            }
         }
      }
   }
}
