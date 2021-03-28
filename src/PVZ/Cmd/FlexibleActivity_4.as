package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class FlexibleActivity_4 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_4";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_4.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const GROUPONGOODS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_4.grouponGoods","grouponGoods",2 << 3 | WireType.LENGTH_DELIMITED,Dto_Groupon_Goods);
      
      public static const EXCHANGEITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_4.exchangeItems","exchangeItems",3 << 3 | WireType.LENGTH_DELIMITED,Dto_Groupon_ExchangeItem);
      
      public static const CREDITS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_4.credits","credits",4 << 3 | WireType.VARINT);
      
      public static const LEFTDAYS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_4.leftDays","leftDays",5 << 3 | WireType.VARINT);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var grouponGoods:Dto_Groupon_Goods;
      
      public var exchangeItems:Array;
      
      private var credits$field:uint;
      
      private var leftDays$field:uint;
      
      public function FlexibleActivity_4()
      {
         this.exchangeItems = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_4.$MessageID;
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
      
      public function clearCredits() : void
      {
         this.hasField$0 &= 4294967293;
         this.credits$field = new uint();
      }
      
      public function get hasCredits() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set credits(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.credits$field = param1;
      }
      
      public function get credits() : uint
      {
         return this.credits$field;
      }
      
      public function clearLeftDays() : void
      {
         this.hasField$0 &= 4294967291;
         this.leftDays$field = new uint();
      }
      
      public function get hasLeftDays() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set leftDays(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.leftDays$field = param1;
      }
      
      public function get leftDays() : uint
      {
         return this.leftDays$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
         WriteUtils.write$TYPE_MESSAGE(param1,this.grouponGoods);
         var _loc2_:uint = 0;
         while(_loc2_ < this.exchangeItems.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.exchangeItems[_loc2_]);
            _loc2_++;
         }
         if(this.hasCredits)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.credits$field);
         }
         if(this.hasLeftDays)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.leftDays$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: FlexibleActivity_4.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_4.grouponGoods cannot be set twice.");
                  }
                  _loc4_++;
                  this.grouponGoods = new Dto_Groupon_Goods();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.grouponGoods);
                  break;
               case 3:
                  this.exchangeItems.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Groupon_ExchangeItem()));
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_4.credits cannot be set twice.");
                  }
                  _loc5_++;
                  this.credits = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_4.leftDays cannot be set twice.");
                  }
                  _loc6_++;
                  this.leftDays = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
