package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class FlexibleActivity_22 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_22";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_22.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const CANBUYDAY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_22.canBuyDay","canBuyDay",2 << 3 | WireType.VARINT);
      
      public static const OPENBUY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_22.openBuy","openBuy",3 << 3 | WireType.VARINT);
      
      public static const PRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_22.price","price",4 << 3 | WireType.VARINT);
      
      public static const TOTALVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_22.totalValue","totalValue",5 << 3 | WireType.VARINT);
      
      public static const ALLRETURN:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_22.AllReturn","allReturn",6 << 3 | WireType.LENGTH_DELIMITED,GrowReturnConf);
      
      public static const BUYTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_22.buyTime","buyTime",10 << 3 | WireType.VARINT);
      
      public static const GETLIST:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_22.getList","getList",11 << 3 | WireType.VARINT);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var canBuyDay$field:uint;
      
      private var openBuy$field:uint;
      
      private var price$field:uint;
      
      private var totalValue$field:uint;
      
      public var allReturn:Array;
      
      private var buyTime$field:uint;
      
      public var getList:Array;
      
      public function FlexibleActivity_22()
      {
         this.allReturn = [];
         this.getList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_22.$MessageID;
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
      
      public function clearCanBuyDay() : void
      {
         this.hasField$0 &= 4294967293;
         this.canBuyDay$field = new uint();
      }
      
      public function get hasCanBuyDay() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set canBuyDay(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.canBuyDay$field = param1;
      }
      
      public function get canBuyDay() : uint
      {
         return this.canBuyDay$field;
      }
      
      public function clearOpenBuy() : void
      {
         this.hasField$0 &= 4294967291;
         this.openBuy$field = new uint();
      }
      
      public function get hasOpenBuy() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set openBuy(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.openBuy$field = param1;
      }
      
      public function get openBuy() : uint
      {
         return this.openBuy$field;
      }
      
      public function clearPrice() : void
      {
         this.hasField$0 &= 4294967287;
         this.price$field = new uint();
      }
      
      public function get hasPrice() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set price(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.price$field = param1;
      }
      
      public function get price() : uint
      {
         return this.price$field;
      }
      
      public function clearTotalValue() : void
      {
         this.hasField$0 &= 4294967279;
         this.totalValue$field = new uint();
      }
      
      public function get hasTotalValue() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set totalValue(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.totalValue$field = param1;
      }
      
      public function get totalValue() : uint
      {
         return this.totalValue$field;
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
         var _loc4_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         if(this.hasCanBuyDay)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.canBuyDay$field);
         }
         if(this.hasOpenBuy)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.openBuy$field);
         }
         if(this.hasPrice)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.price$field);
         }
         if(this.hasTotalValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.totalValue$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.allReturn.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.allReturn[_loc2_]);
            _loc2_++;
         }
         if(this.hasBuyTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.buyTime$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.getList.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.getList[_loc3_]);
            _loc3_++;
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                     throw new IOError("Bad data format: FlexibleActivity_22.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_22.canBuyDay cannot be set twice.");
                  }
                  _loc4_++;
                  this.canBuyDay = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_22.openBuy cannot be set twice.");
                  }
                  _loc5_++;
                  this.openBuy = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_22.price cannot be set twice.");
                  }
                  _loc6_++;
                  this.price = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_22.totalValue cannot be set twice.");
                  }
                  _loc7_++;
                  this.totalValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  this.allReturn.push(ReadUtils.read$TYPE_MESSAGE(param1,new GrowReturnConf()));
                  break;
               case 10:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_22.buyTime cannot be set twice.");
                  }
                  _loc8_++;
                  this.buyTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if((_loc9_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.getList);
                  }
                  else
                  {
                     this.getList.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
