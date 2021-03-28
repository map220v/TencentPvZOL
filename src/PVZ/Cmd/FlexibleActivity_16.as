package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class FlexibleActivity_16 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_16";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_16.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const VOWITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_16.vowItems","vowItems",2 << 3 | WireType.LENGTH_DELIMITED,Dto_VowItemInfo);
      
      public static const EXCHANGEITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_16.exchangeItems","exchangeItems",3 << 3 | WireType.LENGTH_DELIMITED,Dto_TanabataExchangeInfo);
      
      public static const VOWMAXNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_16.vowMaxNum","vowMaxNum",4 << 3 | WireType.VARINT);
      
      public static const VOWNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_16.vowNum","vowNum",5 << 3 | WireType.VARINT);
      
      public static const STONENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_16.stoneNum","stoneNum",6 << 3 | WireType.VARINT);
      
      public static const MUSTITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_16.mustItems","mustItems",7 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var vowItems:Array;
      
      public var exchangeItems:Array;
      
      private var vowMaxNum$field:uint;
      
      private var vowNum$field:uint;
      
      private var stoneNum$field:uint;
      
      public var mustItems:Array;
      
      public function FlexibleActivity_16()
      {
         this.vowItems = [];
         this.exchangeItems = [];
         this.mustItems = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_16.$MessageID;
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
      
      public function clearVowMaxNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.vowMaxNum$field = new uint();
      }
      
      public function get hasVowMaxNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set vowMaxNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.vowMaxNum$field = param1;
      }
      
      public function get vowMaxNum() : uint
      {
         return this.vowMaxNum$field;
      }
      
      public function clearVowNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.vowNum$field = new uint();
      }
      
      public function get hasVowNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set vowNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.vowNum$field = param1;
      }
      
      public function get vowNum() : uint
      {
         return this.vowNum$field;
      }
      
      public function clearStoneNum() : void
      {
         this.hasField$0 &= 4294967287;
         this.stoneNum$field = new uint();
      }
      
      public function get hasStoneNum() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set stoneNum(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.stoneNum$field = param1;
      }
      
      public function get stoneNum() : uint
      {
         return this.stoneNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.vowItems.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.vowItems[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.exchangeItems.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.exchangeItems[_loc3_]);
            _loc3_++;
         }
         if(this.hasVowMaxNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.vowMaxNum$field);
         }
         if(this.hasVowNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.vowNum$field);
         }
         if(this.hasStoneNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.stoneNum$field);
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.mustItems.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.mustItems[_loc4_]);
            _loc4_++;
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
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
                     throw new IOError("Bad data format: FlexibleActivity_16.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.vowItems.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_VowItemInfo()));
                  break;
               case 3:
                  this.exchangeItems.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_TanabataExchangeInfo()));
                  break;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_16.vowMaxNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.vowMaxNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_16.vowNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.vowNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_16.stoneNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.stoneNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  this.mustItems.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
