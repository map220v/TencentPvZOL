package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_DailyTD_GetTokenShop_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_DailyTD_GetTokenShop_SC";
      
      public static const TRADELIST:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyTD_GetTokenShop_SC.tradeList","tradeList",1 << 3 | WireType.VARINT);
      
      public static const BISTRADELIST:RepeatedFieldDescriptor$TYPE_BOOL = new RepeatedFieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_DailyTD_GetTokenShop_SC.bIsTradeList","bIsTradeList",2 << 3 | WireType.VARINT);
      
      public static const INEXTREFRESH:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyTD_GetTokenShop_SC.iNextRefresh","iNextRefresh",3 << 3 | WireType.VARINT);
      
      public static const IREFRESHBYHAND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyTD_GetTokenShop_SC.iRefreshByHand","iRefreshByHand",4 << 3 | WireType.VARINT);
      
      public static const INEEDTIMECOIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyTD_GetTokenShop_SC.iNeedTimeCoin","iNeedTimeCoin",5 << 3 | WireType.VARINT);
       
      
      public var tradeList:Array;
      
      public var bIsTradeList:Array;
      
      private var iNextRefresh$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var iRefreshByHand$field:uint;
      
      private var iNeedTimeCoin$field:uint;
      
      public function Cmd_DailyTD_GetTokenShop_SC()
      {
         this.tradeList = [];
         this.bIsTradeList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_DailyTD_GetTokenShop_SC.$MessageID;
      }
      
      public function clearINextRefresh() : void
      {
         this.hasField$0 &= 4294967294;
         this.iNextRefresh$field = new uint();
      }
      
      public function get hasINextRefresh() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set iNextRefresh(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.iNextRefresh$field = param1;
      }
      
      public function get iNextRefresh() : uint
      {
         return this.iNextRefresh$field;
      }
      
      public function clearIRefreshByHand() : void
      {
         this.hasField$0 &= 4294967293;
         this.iRefreshByHand$field = new uint();
      }
      
      public function get hasIRefreshByHand() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set iRefreshByHand(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.iRefreshByHand$field = param1;
      }
      
      public function get iRefreshByHand() : uint
      {
         return this.iRefreshByHand$field;
      }
      
      public function clearINeedTimeCoin() : void
      {
         this.hasField$0 &= 4294967291;
         this.iNeedTimeCoin$field = new uint();
      }
      
      public function get hasINeedTimeCoin() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set iNeedTimeCoin(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.iNeedTimeCoin$field = param1;
      }
      
      public function get iNeedTimeCoin() : uint
      {
         return this.iNeedTimeCoin$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.tradeList.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.tradeList[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.bIsTradeList.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.bIsTradeList[_loc3_]);
            _loc3_++;
         }
         if(this.hasINextRefresh)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.iNextRefresh$field);
         }
         if(this.hasIRefreshByHand)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.iRefreshByHand$field);
         }
         if(this.hasINeedTimeCoin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.iNeedTimeCoin$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                  if((_loc6_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.tradeList);
                  }
                  else
                  {
                     this.tradeList.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 2:
                  if((_loc6_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_BOOL,this.bIsTradeList);
                  }
                  else
                  {
                     this.bIsTradeList.push(ReadUtils.read$TYPE_BOOL(param1));
                  }
                  break;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyTD_GetTokenShop_SC.iNextRefresh cannot be set twice.");
                  }
                  _loc3_++;
                  this.iNextRefresh = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyTD_GetTokenShop_SC.iRefreshByHand cannot be set twice.");
                  }
                  _loc4_++;
                  this.iRefreshByHand = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyTD_GetTokenShop_SC.iNeedTimeCoin cannot be set twice.");
                  }
                  _loc5_++;
                  this.iNeedTimeCoin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
