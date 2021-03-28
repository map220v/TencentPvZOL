package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_FLOAT;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_TopFightBetInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_TopFightBetInfo";
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TopFightBetInfo.stageId","stageId",1 << 3 | WireType.VARINT);
      
      public static const PAIRINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TopFightBetInfo.pairIndex","pairIndex",2 << 3 | WireType.VARINT);
      
      public static const BETTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TopFightBetInfo.betType","betType",3 << 3 | WireType.VARINT);
      
      public static const BETVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TopFightBetInfo.betValue","betValue",4 << 3 | WireType.VARINT);
      
      public static const BETRESULT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_TopFightBetInfo.betResult","betResult",5 << 3 | WireType.VARINT);
      
      public static const BETODDS:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("PVZ.Cmd.Dto_TopFightBetInfo.betOdds","betOdds",6 << 3 | WireType.FIXED_32_BIT);
      
      public static const ZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TopFightBetInfo.zoneId","zoneId",7 << 3 | WireType.VARINT);
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_TopFightBetInfo.roleId","roleId",8 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_TopFightBetInfo.roleName","roleName",9 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const REPORTINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_TopFightBetInfo.reportInfo","reportInfo",10 << 3 | WireType.LENGTH_DELIMITED,Dto_TopFightReportInfo);
      
      public static const REWARDSTATE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_TopFightBetInfo.rewardState","rewardState",11 << 3 | WireType.VARINT,E_CommonRewardState);
      
      public static const ISLEFT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_TopFightBetInfo.isLeft","isLeft",12 << 3 | WireType.VARINT);
       
      
      private var stageId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var pairIndex$field:uint;
      
      private var betType$field:uint;
      
      private var betValue$field:uint;
      
      private var betResult$field:Boolean;
      
      private var betOdds$field:Number;
      
      private var zoneId$field:uint;
      
      private var roleId$field:Int64;
      
      private var roleName$field:String;
      
      public var reportInfo:Array;
      
      private var rewardState$field:int;
      
      private var isLeft$field:Boolean;
      
      public function Dto_TopFightBetInfo()
      {
         this.reportInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_TopFightBetInfo.$MessageID;
      }
      
      public function clearStageId() : void
      {
         this.hasField$0 &= 4294967294;
         this.stageId$field = new uint();
      }
      
      public function get hasStageId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set stageId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.stageId$field = param1;
      }
      
      public function get stageId() : uint
      {
         return this.stageId$field;
      }
      
      public function clearPairIndex() : void
      {
         this.hasField$0 &= 4294967293;
         this.pairIndex$field = new uint();
      }
      
      public function get hasPairIndex() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set pairIndex(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.pairIndex$field = param1;
      }
      
      public function get pairIndex() : uint
      {
         return this.pairIndex$field;
      }
      
      public function clearBetType() : void
      {
         this.hasField$0 &= 4294967291;
         this.betType$field = new uint();
      }
      
      public function get hasBetType() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set betType(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.betType$field = param1;
      }
      
      public function get betType() : uint
      {
         return this.betType$field;
      }
      
      public function clearBetValue() : void
      {
         this.hasField$0 &= 4294967287;
         this.betValue$field = new uint();
      }
      
      public function get hasBetValue() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set betValue(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.betValue$field = param1;
      }
      
      public function get betValue() : uint
      {
         return this.betValue$field;
      }
      
      public function clearBetResult() : void
      {
         this.hasField$0 &= 4294967279;
         this.betResult$field = new Boolean();
      }
      
      public function get hasBetResult() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set betResult(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.betResult$field = param1;
      }
      
      public function get betResult() : Boolean
      {
         return this.betResult$field;
      }
      
      public function clearBetOdds() : void
      {
         this.hasField$0 &= 4294967263;
         this.betOdds$field = new Number();
      }
      
      public function get hasBetOdds() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set betOdds(param1:Number) : void
      {
         this.hasField$0 |= 32;
         this.betOdds$field = param1;
      }
      
      public function get betOdds() : Number
      {
         return this.betOdds$field;
      }
      
      public function clearZoneId() : void
      {
         this.hasField$0 &= 4294967231;
         this.zoneId$field = new uint();
      }
      
      public function get hasZoneId() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set zoneId(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.zoneId$field = param1;
      }
      
      public function get zoneId() : uint
      {
         return this.zoneId$field;
      }
      
      public function clearRoleId() : void
      {
         this.roleId$field = null;
      }
      
      public function get hasRoleId() : Boolean
      {
         return this.roleId$field != null;
      }
      
      public function set roleId(param1:Int64) : void
      {
         this.roleId$field = param1;
      }
      
      public function get roleId() : Int64
      {
         return this.roleId$field;
      }
      
      public function clearRoleName() : void
      {
         this.roleName$field = null;
      }
      
      public function get hasRoleName() : Boolean
      {
         return this.roleName$field != null;
      }
      
      public function set roleName(param1:String) : void
      {
         this.roleName$field = param1;
      }
      
      public function get roleName() : String
      {
         return this.roleName$field;
      }
      
      public function clearRewardState() : void
      {
         this.hasField$0 &= 4294967167;
         this.rewardState$field = new int();
      }
      
      public function get hasRewardState() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set rewardState(param1:int) : void
      {
         this.hasField$0 |= 128;
         this.rewardState$field = param1;
      }
      
      public function get rewardState() : int
      {
         return this.rewardState$field;
      }
      
      public function clearIsLeft() : void
      {
         this.hasField$0 &= 4294967039;
         this.isLeft$field = new Boolean();
      }
      
      public function get hasIsLeft() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set isLeft(param1:Boolean) : void
      {
         this.hasField$0 |= 256;
         this.isLeft$field = param1;
      }
      
      public function get isLeft() : Boolean
      {
         return this.isLeft$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         if(this.hasPairIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.pairIndex$field);
         }
         if(this.hasBetType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.betType$field);
         }
         if(this.hasBetValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.betValue$field);
         }
         if(this.hasBetResult)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.betResult$field);
         }
         if(this.hasBetOdds)
         {
            WriteUtils.writeTag(param1,WireType.FIXED_32_BIT,6);
            WriteUtils.write$TYPE_FLOAT(param1,this.betOdds$field);
         }
         if(this.hasZoneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneId$field);
         }
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.reportInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reportInfo[_loc2_]);
            _loc2_++;
         }
         if(this.hasRewardState)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_ENUM(param1,this.rewardState$field);
         }
         if(this.hasIsLeft)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_BOOL(param1,this.isLeft$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc14_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         var _loc13_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc14_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc14_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TopFightBetInfo.stageId cannot be set twice.");
                  }
                  _loc3_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TopFightBetInfo.pairIndex cannot be set twice.");
                  }
                  _loc4_++;
                  this.pairIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TopFightBetInfo.betType cannot be set twice.");
                  }
                  _loc5_++;
                  this.betType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TopFightBetInfo.betValue cannot be set twice.");
                  }
                  _loc6_++;
                  this.betValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TopFightBetInfo.betResult cannot be set twice.");
                  }
                  _loc7_++;
                  this.betResult = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TopFightBetInfo.betOdds cannot be set twice.");
                  }
                  _loc8_++;
                  this.betOdds = ReadUtils.read$TYPE_FLOAT(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TopFightBetInfo.zoneId cannot be set twice.");
                  }
                  _loc9_++;
                  this.zoneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TopFightBetInfo.roleId cannot be set twice.");
                  }
                  _loc10_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TopFightBetInfo.roleName cannot be set twice.");
                  }
                  _loc11_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 10:
                  this.reportInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_TopFightReportInfo()));
                  break;
               case 11:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TopFightBetInfo.rewardState cannot be set twice.");
                  }
                  _loc12_++;
                  this.rewardState = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 12:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TopFightBetInfo.isLeft cannot be set twice.");
                  }
                  _loc13_++;
                  this.isLeft = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc14_);
                  break;
            }
         }
      }
   }
}
