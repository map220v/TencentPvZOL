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
   
   public final class Dto_Fund_BuyInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Fund_BuyInfo";
      
      public static const FUNDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fund_BuyInfo.fundId","fundId",1 << 3 | WireType.VARINT);
      
      public static const BUYTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fund_BuyInfo.buyTime","buyTime",2 << 3 | WireType.VARINT);
      
      public static const REWARDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fund_BuyInfo.rewardTime","rewardTime",3 << 3 | WireType.VARINT);
       
      
      private var fundId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var buyTime$field:uint;
      
      private var rewardTime$field:uint;
      
      public function Dto_Fund_BuyInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Fund_BuyInfo.$MessageID;
      }
      
      public function clearFundId() : void
      {
         this.hasField$0 &= 4294967294;
         this.fundId$field = new uint();
      }
      
      public function get hasFundId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set fundId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.fundId$field = param1;
      }
      
      public function get fundId() : uint
      {
         return this.fundId$field;
      }
      
      public function clearBuyTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.buyTime$field = new uint();
      }
      
      public function get hasBuyTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set buyTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.buyTime$field = param1;
      }
      
      public function get buyTime() : uint
      {
         return this.buyTime$field;
      }
      
      public function clearRewardTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.rewardTime$field = new uint();
      }
      
      public function get hasRewardTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set rewardTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.rewardTime$field = param1;
      }
      
      public function get rewardTime() : uint
      {
         return this.rewardTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasFundId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.fundId$field);
         }
         if(this.hasBuyTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.buyTime$field);
         }
         if(this.hasRewardTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardTime$field);
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
                     throw new IOError("Bad data format: Dto_Fund_BuyInfo.fundId cannot be set twice.");
                  }
                  _loc3_++;
                  this.fundId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fund_BuyInfo.buyTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.buyTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fund_BuyInfo.rewardTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.rewardTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
