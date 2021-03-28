package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_MarketTrade extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_MarketTrade";
      
      public static const NEEDITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_MarketTrade.needItem","needItem",1 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const REWARDITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_MarketTrade.rewardItem","rewardItem",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const BISTRADE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_MarketTrade.bIsTrade","bIsTrade",3 << 3 | WireType.VARINT);
      
      public static const COSTPERFORM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MarketTrade.costPerform","costPerform",4 << 3 | WireType.VARINT);
       
      
      private var needItem$field:Dto_IdNum;
      
      private var rewardItem$field:Dto_IdNum;
      
      private var bIsTrade$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var costPerform$field:uint;
      
      public function Dto_MarketTrade()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_MarketTrade.$MessageID;
      }
      
      public function clearNeedItem() : void
      {
         this.needItem$field = null;
      }
      
      public function get hasNeedItem() : Boolean
      {
         return this.needItem$field != null;
      }
      
      public function set needItem(param1:Dto_IdNum) : void
      {
         this.needItem$field = param1;
      }
      
      public function get needItem() : Dto_IdNum
      {
         return this.needItem$field;
      }
      
      public function clearRewardItem() : void
      {
         this.rewardItem$field = null;
      }
      
      public function get hasRewardItem() : Boolean
      {
         return this.rewardItem$field != null;
      }
      
      public function set rewardItem(param1:Dto_IdNum) : void
      {
         this.rewardItem$field = param1;
      }
      
      public function get rewardItem() : Dto_IdNum
      {
         return this.rewardItem$field;
      }
      
      public function clearBIsTrade() : void
      {
         this.hasField$0 &= 4294967294;
         this.bIsTrade$field = new Boolean();
      }
      
      public function get hasBIsTrade() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set bIsTrade(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.bIsTrade$field = param1;
      }
      
      public function get bIsTrade() : Boolean
      {
         return this.bIsTrade$field;
      }
      
      public function clearCostPerform() : void
      {
         this.hasField$0 &= 4294967293;
         this.costPerform$field = new uint();
      }
      
      public function get hasCostPerform() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set costPerform(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.costPerform$field = param1;
      }
      
      public function get costPerform() : uint
      {
         return this.costPerform$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasNeedItem)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.needItem$field);
         }
         if(this.hasRewardItem)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardItem$field);
         }
         if(this.hasBIsTrade)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.bIsTrade$field);
         }
         if(this.hasCostPerform)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.costPerform$field);
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
                     throw new IOError("Bad data format: Dto_MarketTrade.needItem cannot be set twice.");
                  }
                  _loc3_++;
                  this.needItem = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.needItem);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MarketTrade.rewardItem cannot be set twice.");
                  }
                  _loc4_++;
                  this.rewardItem = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.rewardItem);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MarketTrade.bIsTrade cannot be set twice.");
                  }
                  _loc5_++;
                  this.bIsTrade = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MarketTrade.costPerform cannot be set twice.");
                  }
                  _loc6_++;
                  this.costPerform = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
