package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class FlexibleActivity_1003 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_1003";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1003.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const CONDITIONREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_1003.conditionReward","conditionReward",2 << 3 | WireType.LENGTH_DELIMITED,Dto_FlexibleActivityCondtionReward);
      
      public static const SUBTYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.FlexibleActivity_1003.subType","subType",3 << 3 | WireType.VARINT,E_1003_SubType);
      
      public static const RANKDAY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1003.rankDay","rankDay",4 << 3 | WireType.VARINT);
      
      public static const RANKNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1003.rankNum","rankNum",5 << 3 | WireType.VARINT);
      
      public static const RANKVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1003.rankValue","rankValue",6 << 3 | WireType.VARINT);
      
      public static const RANKOVER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.FlexibleActivity_1003.rankOver","rankOver",7 << 3 | WireType.VARINT);
      
      public static const RANKTOP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_1003.rankTop","rankTop",8 << 3 | WireType.LENGTH_DELIMITED,Dto_RankTop);
      
      public static const HASSENDMAIL:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.FlexibleActivity_1003.hasSendMail","hasSendMail",9 << 3 | WireType.VARINT);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var conditionReward:Array;
      
      private var subType$field:int;
      
      private var rankDay$field:uint;
      
      private var rankNum$field:uint;
      
      private var rankValue$field:uint;
      
      private var rankOver$field:Boolean;
      
      public var rankTop:Array;
      
      private var hasSendMail$field:Boolean;
      
      public function FlexibleActivity_1003()
      {
         this.conditionReward = [];
         this.rankTop = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_1003.$MessageID;
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
      
      public function clearSubType() : void
      {
         this.hasField$0 &= 4294967293;
         this.subType$field = new int();
      }
      
      public function get hasSubType() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set subType(param1:int) : void
      {
         this.hasField$0 |= 2;
         this.subType$field = param1;
      }
      
      public function get subType() : int
      {
         return this.subType$field;
      }
      
      public function clearRankDay() : void
      {
         this.hasField$0 &= 4294967291;
         this.rankDay$field = new uint();
      }
      
      public function get hasRankDay() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set rankDay(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.rankDay$field = param1;
      }
      
      public function get rankDay() : uint
      {
         return this.rankDay$field;
      }
      
      public function clearRankNum() : void
      {
         this.hasField$0 &= 4294967287;
         this.rankNum$field = new uint();
      }
      
      public function get hasRankNum() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set rankNum(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.rankNum$field = param1;
      }
      
      public function get rankNum() : uint
      {
         return this.rankNum$field;
      }
      
      public function clearRankValue() : void
      {
         this.hasField$0 &= 4294967279;
         this.rankValue$field = new uint();
      }
      
      public function get hasRankValue() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set rankValue(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.rankValue$field = param1;
      }
      
      public function get rankValue() : uint
      {
         return this.rankValue$field;
      }
      
      public function clearRankOver() : void
      {
         this.hasField$0 &= 4294967263;
         this.rankOver$field = new Boolean();
      }
      
      public function get hasRankOver() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set rankOver(param1:Boolean) : void
      {
         this.hasField$0 |= 32;
         this.rankOver$field = param1;
      }
      
      public function get rankOver() : Boolean
      {
         return this.rankOver$field;
      }
      
      public function clearHasSendMail() : void
      {
         this.hasField$0 &= 4294967231;
         this.hasSendMail$field = new Boolean();
      }
      
      public function get hasHasSendMail() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set hasSendMail(param1:Boolean) : void
      {
         this.hasField$0 |= 64;
         this.hasSendMail$field = param1;
      }
      
      public function get hasSendMail() : Boolean
      {
         return this.hasSendMail$field;
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
         while(_loc2_ < this.conditionReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.conditionReward[_loc2_]);
            _loc2_++;
         }
         if(this.hasSubType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_ENUM(param1,this.subType$field);
         }
         if(this.hasRankDay)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.rankDay$field);
         }
         if(this.hasRankNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.rankNum$field);
         }
         if(this.hasRankValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.rankValue$field);
         }
         if(this.hasRankOver)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.rankOver$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.rankTop.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rankTop[_loc3_]);
            _loc3_++;
         }
         if(this.hasHasSendMail)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_BOOL(param1,this.hasSendMail$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc10_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc10_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc10_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1003.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.conditionReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FlexibleActivityCondtionReward()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1003.subType cannot be set twice.");
                  }
                  _loc4_++;
                  this.subType = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1003.rankDay cannot be set twice.");
                  }
                  _loc5_++;
                  this.rankDay = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1003.rankNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.rankNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1003.rankValue cannot be set twice.");
                  }
                  _loc7_++;
                  this.rankValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1003.rankOver cannot be set twice.");
                  }
                  _loc8_++;
                  this.rankOver = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 8:
                  this.rankTop.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_RankTop()));
                  break;
               case 9:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1003.hasSendMail cannot be set twice.");
                  }
                  _loc9_++;
                  this.hasSendMail = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
