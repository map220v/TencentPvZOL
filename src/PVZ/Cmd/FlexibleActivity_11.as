package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class FlexibleActivity_11 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_11";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_11.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const BOX:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_11.box","box",2 << 3 | WireType.LENGTH_DELIMITED,Dto_SpringRewardBox);
      
      public static const CREDITS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_11.credits","credits",3 << 3 | WireType.VARINT);
      
      public static const LASTGETCREDITDATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_11.lastGetCreditDate","lastGetCreditDate",4 << 3 | WireType.VARINT);
      
      public static const TODAYGETCREDIT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.FlexibleActivity_11.todayGetCredit","todayGetCredit",5 << 3 | WireType.VARINT);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var box:Array;
      
      private var credits$field:uint;
      
      private var lastGetCreditDate$field:uint;
      
      private var todayGetCredit$field:Boolean;
      
      public function FlexibleActivity_11()
      {
         this.box = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_11.$MessageID;
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
      
      public function clearLastGetCreditDate() : void
      {
         this.hasField$0 &= 4294967291;
         this.lastGetCreditDate$field = new uint();
      }
      
      public function get hasLastGetCreditDate() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set lastGetCreditDate(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.lastGetCreditDate$field = param1;
      }
      
      public function get lastGetCreditDate() : uint
      {
         return this.lastGetCreditDate$field;
      }
      
      public function clearTodayGetCredit() : void
      {
         this.hasField$0 &= 4294967287;
         this.todayGetCredit$field = new Boolean();
      }
      
      public function get hasTodayGetCredit() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set todayGetCredit(param1:Boolean) : void
      {
         this.hasField$0 |= 8;
         this.todayGetCredit$field = param1;
      }
      
      public function get todayGetCredit() : Boolean
      {
         return this.todayGetCredit$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.box.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.box[_loc2_]);
            _loc2_++;
         }
         if(this.hasCredits)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.credits$field);
         }
         if(this.hasLastGetCreditDate)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.lastGetCreditDate$field);
         }
         if(this.hasTodayGetCredit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.todayGetCredit$field);
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
                     throw new IOError("Bad data format: FlexibleActivity_11.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.box.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_SpringRewardBox()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_11.credits cannot be set twice.");
                  }
                  _loc4_++;
                  this.credits = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_11.lastGetCreditDate cannot be set twice.");
                  }
                  _loc5_++;
                  this.lastGetCreditDate = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_11.todayGetCredit cannot be set twice.");
                  }
                  _loc6_++;
                  this.todayGetCredit = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
