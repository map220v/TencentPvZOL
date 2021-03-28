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
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_TopFight_PairInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_TopFight_PairInfo_SC";
      
      public static const ROLEINFO1:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_TopFight_PairInfo_SC.roleInfo1","roleInfo1",1 << 3 | WireType.LENGTH_DELIMITED,Dto_TopFightPairRoleInfo);
      
      public static const ROLEINFO2:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_TopFight_PairInfo_SC.roleInfo2","roleInfo2",2 << 3 | WireType.LENGTH_DELIMITED,Dto_TopFightPairRoleInfo);
      
      public static const REPORTINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_TopFight_PairInfo_SC.reportInfo","reportInfo",3 << 3 | WireType.LENGTH_DELIMITED,Dto_TopFightReportInfo);
      
      public static const BETTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TopFight_PairInfo_SC.betType","betType",4 << 3 | WireType.VARINT);
      
      public static const BETVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TopFight_PairInfo_SC.betValue","betValue",5 << 3 | WireType.VARINT);
      
      public static const BETFIGHTRESULT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_TopFight_PairInfo_SC.betFightResult","betFightResult",6 << 3 | WireType.VARINT);
       
      
      private var roleInfo1$field:Dto_TopFightPairRoleInfo;
      
      private var roleInfo2$field:Dto_TopFightPairRoleInfo;
      
      public var reportInfo:Array;
      
      private var betType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var betValue$field:uint;
      
      private var betFightResult$field:Boolean;
      
      public function Cmd_TopFight_PairInfo_SC()
      {
         this.reportInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_TopFight_PairInfo_SC.$MessageID;
      }
      
      public function clearRoleInfo1() : void
      {
         this.roleInfo1$field = null;
      }
      
      public function get hasRoleInfo1() : Boolean
      {
         return this.roleInfo1$field != null;
      }
      
      public function set roleInfo1(param1:Dto_TopFightPairRoleInfo) : void
      {
         this.roleInfo1$field = param1;
      }
      
      public function get roleInfo1() : Dto_TopFightPairRoleInfo
      {
         return this.roleInfo1$field;
      }
      
      public function clearRoleInfo2() : void
      {
         this.roleInfo2$field = null;
      }
      
      public function get hasRoleInfo2() : Boolean
      {
         return this.roleInfo2$field != null;
      }
      
      public function set roleInfo2(param1:Dto_TopFightPairRoleInfo) : void
      {
         this.roleInfo2$field = param1;
      }
      
      public function get roleInfo2() : Dto_TopFightPairRoleInfo
      {
         return this.roleInfo2$field;
      }
      
      public function clearBetType() : void
      {
         this.hasField$0 &= 4294967294;
         this.betType$field = new uint();
      }
      
      public function get hasBetType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set betType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.betType$field = param1;
      }
      
      public function get betType() : uint
      {
         return this.betType$field;
      }
      
      public function clearBetValue() : void
      {
         this.hasField$0 &= 4294967293;
         this.betValue$field = new uint();
      }
      
      public function get hasBetValue() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set betValue(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.betValue$field = param1;
      }
      
      public function get betValue() : uint
      {
         return this.betValue$field;
      }
      
      public function clearBetFightResult() : void
      {
         this.hasField$0 &= 4294967291;
         this.betFightResult$field = new Boolean();
      }
      
      public function get hasBetFightResult() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set betFightResult(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.betFightResult$field = param1;
      }
      
      public function get betFightResult() : Boolean
      {
         return this.betFightResult$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasRoleInfo1)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.roleInfo1$field);
         }
         if(this.hasRoleInfo2)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.roleInfo2$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.reportInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reportInfo[_loc2_]);
            _loc2_++;
         }
         if(this.hasBetType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.betType$field);
         }
         if(this.hasBetValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.betValue$field);
         }
         if(this.hasBetFightResult)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_BOOL(param1,this.betFightResult$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_PairInfo_SC.roleInfo1 cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleInfo1 = new Dto_TopFightPairRoleInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.roleInfo1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_PairInfo_SC.roleInfo2 cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleInfo2 = new Dto_TopFightPairRoleInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.roleInfo2);
                  break;
               case 3:
                  this.reportInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_TopFightReportInfo()));
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_PairInfo_SC.betType cannot be set twice.");
                  }
                  _loc5_++;
                  this.betType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_PairInfo_SC.betValue cannot be set twice.");
                  }
                  _loc6_++;
                  this.betValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_PairInfo_SC.betFightResult cannot be set twice.");
                  }
                  _loc7_++;
                  this.betFightResult = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
