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
   
   public final class Dto_VipInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_VipInfo";
      
      public static const CARDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_VipInfo.cardId","cardId",1 << 3 | WireType.VARINT);
      
      public static const ENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_VipInfo.endTime","endTime",2 << 3 | WireType.VARINT);
      
      public static const GOTGIFT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_VipInfo.gotGift","gotGift",3 << 3 | WireType.VARINT);
      
      public static const TODAYENERGY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_VipInfo.todayEnergy","todayEnergy",4 << 3 | WireType.VARINT);
      
      public static const RENEWALPRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_VipInfo.renewalPrice","renewalPrice",5 << 3 | WireType.VARINT);
      
      public static const TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_VipInfo.type","type",6 << 3 | WireType.VARINT);
      
      public static const BHASVIP3PRIVILEGE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_VipInfo.bHasVip3Privilege","bHasVip3Privilege",7 << 3 | WireType.VARINT);
      
      public static const TODAYTICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_VipInfo.todayTicket","todayTicket",8 << 3 | WireType.VARINT);
      
      public static const HASTAKENENERGY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_VipInfo.hasTakenEnergy","hasTakenEnergy",9 << 3 | WireType.VARINT);
      
      public static const HASTAKENTICKET:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_VipInfo.hasTakenTicket","hasTakenTicket",10 << 3 | WireType.VARINT);
      
      public static const HASRENEWGIFT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_VipInfo.hasRenewGift","hasRenewGift",11 << 3 | WireType.VARINT);
       
      
      private var cardId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var endTime$field:uint;
      
      private var gotGift$field:Boolean;
      
      private var todayEnergy$field:uint;
      
      private var renewalPrice$field:uint;
      
      private var type$field:uint;
      
      private var bHasVip3Privilege$field:Boolean;
      
      private var todayTicket$field:uint;
      
      private var hasTakenEnergy$field:Boolean;
      
      private var hasTakenTicket$field:Boolean;
      
      private var hasRenewGift$field:Boolean;
      
      public function Dto_VipInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_VipInfo.$MessageID;
      }
      
      public function clearCardId() : void
      {
         this.hasField$0 &= 4294967294;
         this.cardId$field = new uint();
      }
      
      public function get hasCardId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set cardId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.cardId$field = param1;
      }
      
      public function get cardId() : uint
      {
         return this.cardId$field;
      }
      
      public function clearEndTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.endTime$field = new uint();
      }
      
      public function get hasEndTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set endTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.endTime$field = param1;
      }
      
      public function get endTime() : uint
      {
         return this.endTime$field;
      }
      
      public function clearGotGift() : void
      {
         this.hasField$0 &= 4294967291;
         this.gotGift$field = new Boolean();
      }
      
      public function get hasGotGift() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set gotGift(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.gotGift$field = param1;
      }
      
      public function get gotGift() : Boolean
      {
         return this.gotGift$field;
      }
      
      public function clearTodayEnergy() : void
      {
         this.hasField$0 &= 4294967287;
         this.todayEnergy$field = new uint();
      }
      
      public function get hasTodayEnergy() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set todayEnergy(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.todayEnergy$field = param1;
      }
      
      public function get todayEnergy() : uint
      {
         return this.todayEnergy$field;
      }
      
      public function clearRenewalPrice() : void
      {
         this.hasField$0 &= 4294967279;
         this.renewalPrice$field = new uint();
      }
      
      public function get hasRenewalPrice() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set renewalPrice(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.renewalPrice$field = param1;
      }
      
      public function get renewalPrice() : uint
      {
         return this.renewalPrice$field;
      }
      
      public function clearType() : void
      {
         this.hasField$0 &= 4294967263;
         this.type$field = new uint();
      }
      
      public function get hasType() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set type(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.type$field = param1;
      }
      
      public function get type() : uint
      {
         return this.type$field;
      }
      
      public function clearBHasVip3Privilege() : void
      {
         this.hasField$0 &= 4294967231;
         this.bHasVip3Privilege$field = new Boolean();
      }
      
      public function get hasBHasVip3Privilege() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set bHasVip3Privilege(param1:Boolean) : void
      {
         this.hasField$0 |= 64;
         this.bHasVip3Privilege$field = param1;
      }
      
      public function get bHasVip3Privilege() : Boolean
      {
         return this.bHasVip3Privilege$field;
      }
      
      public function clearTodayTicket() : void
      {
         this.hasField$0 &= 4294967167;
         this.todayTicket$field = new uint();
      }
      
      public function get hasTodayTicket() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set todayTicket(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.todayTicket$field = param1;
      }
      
      public function get todayTicket() : uint
      {
         return this.todayTicket$field;
      }
      
      public function clearHasTakenEnergy() : void
      {
         this.hasField$0 &= 4294967039;
         this.hasTakenEnergy$field = new Boolean();
      }
      
      public function get hasHasTakenEnergy() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set hasTakenEnergy(param1:Boolean) : void
      {
         this.hasField$0 |= 256;
         this.hasTakenEnergy$field = param1;
      }
      
      public function get hasTakenEnergy() : Boolean
      {
         return this.hasTakenEnergy$field;
      }
      
      public function clearHasTakenTicket() : void
      {
         this.hasField$0 &= 4294966783;
         this.hasTakenTicket$field = new Boolean();
      }
      
      public function get hasHasTakenTicket() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set hasTakenTicket(param1:Boolean) : void
      {
         this.hasField$0 |= 512;
         this.hasTakenTicket$field = param1;
      }
      
      public function get hasTakenTicket() : Boolean
      {
         return this.hasTakenTicket$field;
      }
      
      public function clearHasRenewGift() : void
      {
         this.hasField$0 &= 4294966271;
         this.hasRenewGift$field = new Boolean();
      }
      
      public function get hasHasRenewGift() : Boolean
      {
         return (this.hasField$0 & 1024) != 0;
      }
      
      public function set hasRenewGift(param1:Boolean) : void
      {
         this.hasField$0 |= 1024;
         this.hasRenewGift$field = param1;
      }
      
      public function get hasRenewGift() : Boolean
      {
         return this.hasRenewGift$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasCardId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.cardId$field);
         }
         if(this.hasEndTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.endTime$field);
         }
         if(this.hasGotGift)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.gotGift$field);
         }
         if(this.hasTodayEnergy)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.todayEnergy$field);
         }
         if(this.hasRenewalPrice)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.renewalPrice$field);
         }
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.type$field);
         }
         if(this.hasBHasVip3Privilege)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.bHasVip3Privilege$field);
         }
         if(this.hasTodayTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.todayTicket$field);
         }
         if(this.hasHasTakenEnergy)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_BOOL(param1,this.hasTakenEnergy$field);
         }
         if(this.hasHasTakenTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_BOOL(param1,this.hasTakenTicket$field);
         }
         if(this.hasHasRenewGift)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_BOOL(param1,this.hasRenewGift$field);
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
                     throw new IOError("Bad data format: Dto_VipInfo.cardId cannot be set twice.");
                  }
                  _loc3_++;
                  this.cardId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_VipInfo.endTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.endTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_VipInfo.gotGift cannot be set twice.");
                  }
                  _loc5_++;
                  this.gotGift = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_VipInfo.todayEnergy cannot be set twice.");
                  }
                  _loc6_++;
                  this.todayEnergy = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_VipInfo.renewalPrice cannot be set twice.");
                  }
                  _loc7_++;
                  this.renewalPrice = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_VipInfo.type cannot be set twice.");
                  }
                  _loc8_++;
                  this.type = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_VipInfo.bHasVip3Privilege cannot be set twice.");
                  }
                  _loc9_++;
                  this.bHasVip3Privilege = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_VipInfo.todayTicket cannot be set twice.");
                  }
                  _loc10_++;
                  this.todayTicket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_VipInfo.hasTakenEnergy cannot be set twice.");
                  }
                  _loc11_++;
                  this.hasTakenEnergy = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_VipInfo.hasTakenTicket cannot be set twice.");
                  }
                  _loc12_++;
                  this.hasTakenTicket = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_VipInfo.hasRenewGift cannot be set twice.");
                  }
                  _loc13_++;
                  this.hasRenewGift = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc14_);
                  break;
            }
         }
      }
   }
}
