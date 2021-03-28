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
   
   public final class Cmd_ExpeditionFight_ChangeCity_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ExpeditionFight_ChangeCity_SC";
      
      public static const CITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_ChangeCity_SC.cityId","cityId",1 << 3 | WireType.VARINT);
      
      public static const BANACTIONTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_ChangeCity_SC.banActionType","banActionType",2 << 3 | WireType.VARINT);
      
      public static const BANACTIONTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_ChangeCity_SC.banActionTime","banActionTime",3 << 3 | WireType.VARINT);
      
      public static const BUYCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_ChangeCity_SC.buyCount","buyCount",4 << 3 | WireType.VARINT);
      
      public static const LASTBUYTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_ChangeCity_SC.lastBuyTime","lastBuyTime",5 << 3 | WireType.VARINT);
       
      
      private var cityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var banActionType$field:uint;
      
      private var banActionTime$field:uint;
      
      private var buyCount$field:uint;
      
      private var lastBuyTime$field:uint;
      
      public function Cmd_ExpeditionFight_ChangeCity_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ExpeditionFight_ChangeCity_SC.$MessageID;
      }
      
      public function clearCityId() : void
      {
         this.hasField$0 &= 4294967294;
         this.cityId$field = new uint();
      }
      
      public function get hasCityId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set cityId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.cityId$field = param1;
      }
      
      public function get cityId() : uint
      {
         return this.cityId$field;
      }
      
      public function clearBanActionType() : void
      {
         this.hasField$0 &= 4294967293;
         this.banActionType$field = new uint();
      }
      
      public function get hasBanActionType() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set banActionType(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.banActionType$field = param1;
      }
      
      public function get banActionType() : uint
      {
         return this.banActionType$field;
      }
      
      public function clearBanActionTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.banActionTime$field = new uint();
      }
      
      public function get hasBanActionTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set banActionTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.banActionTime$field = param1;
      }
      
      public function get banActionTime() : uint
      {
         return this.banActionTime$field;
      }
      
      public function clearBuyCount() : void
      {
         this.hasField$0 &= 4294967287;
         this.buyCount$field = new uint();
      }
      
      public function get hasBuyCount() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set buyCount(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.buyCount$field = param1;
      }
      
      public function get buyCount() : uint
      {
         return this.buyCount$field;
      }
      
      public function clearLastBuyTime() : void
      {
         this.hasField$0 &= 4294967279;
         this.lastBuyTime$field = new uint();
      }
      
      public function get hasLastBuyTime() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set lastBuyTime(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.lastBuyTime$field = param1;
      }
      
      public function get lastBuyTime() : uint
      {
         return this.lastBuyTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasCityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.cityId$field);
         }
         if(this.hasBanActionType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.banActionType$field);
         }
         if(this.hasBanActionTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.banActionTime$field);
         }
         if(this.hasBuyCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.buyCount$field);
         }
         if(this.hasLastBuyTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.lastBuyTime$field);
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
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_ChangeCity_SC.cityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.cityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_ChangeCity_SC.banActionType cannot be set twice.");
                  }
                  _loc4_++;
                  this.banActionType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_ChangeCity_SC.banActionTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.banActionTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_ChangeCity_SC.buyCount cannot be set twice.");
                  }
                  _loc6_++;
                  this.buyCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_ChangeCity_SC.lastBuyTime cannot be set twice.");
                  }
                  _loc7_++;
                  this.lastBuyTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
