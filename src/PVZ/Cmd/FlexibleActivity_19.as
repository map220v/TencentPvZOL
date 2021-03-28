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
   
   public final class FlexibleActivity_19 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_19";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_19.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const CONFINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_19.confInfo","confInfo",2 << 3 | WireType.LENGTH_DELIMITED,Dto_Fund_BaseInfo);
      
      public static const REFRESHTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_19.refreshTime","refreshTime",10 << 3 | WireType.VARINT);
      
      public static const CURWEEKDIAMOND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_19.curWeekDiamond","curWeekDiamond",11 << 3 | WireType.VARINT);
      
      public static const BUYINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_19.buyInfo","buyInfo",12 << 3 | WireType.LENGTH_DELIMITED,Dto_Fund_BuyInfo);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var confInfo:Array;
      
      private var refreshTime$field:uint;
      
      private var curWeekDiamond$field:uint;
      
      public var buyInfo:Array;
      
      public function FlexibleActivity_19()
      {
         this.confInfo = [];
         this.buyInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_19.$MessageID;
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
      
      public function clearRefreshTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.refreshTime$field = new uint();
      }
      
      public function get hasRefreshTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set refreshTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.refreshTime$field = param1;
      }
      
      public function get refreshTime() : uint
      {
         return this.refreshTime$field;
      }
      
      public function clearCurWeekDiamond() : void
      {
         this.hasField$0 &= 4294967291;
         this.curWeekDiamond$field = new uint();
      }
      
      public function get hasCurWeekDiamond() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set curWeekDiamond(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.curWeekDiamond$field = param1;
      }
      
      public function get curWeekDiamond() : uint
      {
         return this.curWeekDiamond$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.confInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.confInfo[_loc2_]);
            _loc2_++;
         }
         if(this.hasRefreshTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.refreshTime$field);
         }
         if(this.hasCurWeekDiamond)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.curWeekDiamond$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.buyInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,12);
            WriteUtils.write$TYPE_MESSAGE(param1,this.buyInfo[_loc3_]);
            _loc3_++;
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
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_19.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.confInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Fund_BaseInfo()));
                  break;
               case 10:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_19.refreshTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.refreshTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_19.curWeekDiamond cannot be set twice.");
                  }
                  _loc5_++;
                  this.curWeekDiamond = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  this.buyInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Fund_BuyInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
