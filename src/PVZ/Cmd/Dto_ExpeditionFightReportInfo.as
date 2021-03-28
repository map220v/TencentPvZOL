package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_ExpeditionFightReportInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ExpeditionFightReportInfo";
      
      public static const TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightReportInfo.type","type",1 << 3 | WireType.VARINT);
      
      public static const ATTACKERSIDEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightReportInfo.attackerSideId","attackerSideId",2 << 3 | WireType.VARINT);
      
      public static const ATTACKERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ExpeditionFightReportInfo.attackerName","attackerName",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const DEFENDERSIDEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightReportInfo.defenderSideId","defenderSideId",4 << 3 | WireType.VARINT);
      
      public static const DEFENDERCITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightReportInfo.defenderCityId","defenderCityId",5 << 3 | WireType.VARINT);
      
      public static const DEFENDERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ExpeditionFightReportInfo.defenderName","defenderName",6 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const WIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_ExpeditionFightReportInfo.win","win",7 << 3 | WireType.VARINT);
      
      public static const REPORTINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightReportInfo.reportIndex","reportIndex",8 << 3 | WireType.VARINT);
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightReportInfo.time","time",9 << 3 | WireType.VARINT);
      
      public static const PARAM1:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_ExpeditionFightReportInfo.param1","param1",10 << 3 | WireType.VARINT);
      
      public static const PARAM2:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_ExpeditionFightReportInfo.param2","param2",11 << 3 | WireType.VARINT);
       
      
      private var type$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var attackerSideId$field:uint;
      
      private var attackerName$field:String;
      
      private var defenderSideId$field:uint;
      
      private var defenderCityId$field:uint;
      
      private var defenderName$field:String;
      
      private var win$field:Boolean;
      
      private var reportIndex$field:uint;
      
      private var time$field:uint;
      
      private var param1$field:Int64;
      
      private var param2$field:Int64;
      
      public function Dto_ExpeditionFightReportInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ExpeditionFightReportInfo.$MessageID;
      }
      
      public function clearType() : void
      {
         this.hasField$0 &= 4294967294;
         this.type$field = new uint();
      }
      
      public function get hasType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set type(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.type$field = param1;
      }
      
      public function get type() : uint
      {
         return this.type$field;
      }
      
      public function clearAttackerSideId() : void
      {
         this.hasField$0 &= 4294967293;
         this.attackerSideId$field = new uint();
      }
      
      public function get hasAttackerSideId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set attackerSideId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.attackerSideId$field = param1;
      }
      
      public function get attackerSideId() : uint
      {
         return this.attackerSideId$field;
      }
      
      public function clearAttackerName() : void
      {
         this.attackerName$field = null;
      }
      
      public function get hasAttackerName() : Boolean
      {
         return this.attackerName$field != null;
      }
      
      public function set attackerName(param1:String) : void
      {
         this.attackerName$field = param1;
      }
      
      public function get attackerName() : String
      {
         return this.attackerName$field;
      }
      
      public function clearDefenderSideId() : void
      {
         this.hasField$0 &= 4294967291;
         this.defenderSideId$field = new uint();
      }
      
      public function get hasDefenderSideId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set defenderSideId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.defenderSideId$field = param1;
      }
      
      public function get defenderSideId() : uint
      {
         return this.defenderSideId$field;
      }
      
      public function clearDefenderCityId() : void
      {
         this.hasField$0 &= 4294967287;
         this.defenderCityId$field = new uint();
      }
      
      public function get hasDefenderCityId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set defenderCityId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.defenderCityId$field = param1;
      }
      
      public function get defenderCityId() : uint
      {
         return this.defenderCityId$field;
      }
      
      public function clearDefenderName() : void
      {
         this.defenderName$field = null;
      }
      
      public function get hasDefenderName() : Boolean
      {
         return this.defenderName$field != null;
      }
      
      public function set defenderName(param1:String) : void
      {
         this.defenderName$field = param1;
      }
      
      public function get defenderName() : String
      {
         return this.defenderName$field;
      }
      
      public function clearWin() : void
      {
         this.hasField$0 &= 4294967279;
         this.win$field = new Boolean();
      }
      
      public function get hasWin() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set win(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.win$field = param1;
      }
      
      public function get win() : Boolean
      {
         return this.win$field;
      }
      
      public function clearReportIndex() : void
      {
         this.hasField$0 &= 4294967263;
         this.reportIndex$field = new uint();
      }
      
      public function get hasReportIndex() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set reportIndex(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.reportIndex$field = param1;
      }
      
      public function get reportIndex() : uint
      {
         return this.reportIndex$field;
      }
      
      public function clearTime() : void
      {
         this.hasField$0 &= 4294967231;
         this.time$field = new uint();
      }
      
      public function get hasTime() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set time(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.time$field = param1;
      }
      
      public function get time() : uint
      {
         return this.time$field;
      }
      
      public function clearParam1() : void
      {
         this.param1$field = null;
      }
      
      public function get hasParam1() : Boolean
      {
         return this.param1$field != null;
      }
      
      public function set param1(param1:Int64) : void
      {
         this.param1$field = param1;
      }
      
      public function get param1() : Int64
      {
         return this.param1$field;
      }
      
      public function clearParam2() : void
      {
         this.param2$field = null;
      }
      
      public function get hasParam2() : Boolean
      {
         return this.param2$field != null;
      }
      
      public function set param2(param1:Int64) : void
      {
         this.param2$field = param1;
      }
      
      public function get param2() : Int64
      {
         return this.param2$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.type$field);
         }
         if(this.hasAttackerSideId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.attackerSideId$field);
         }
         if(this.hasAttackerName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.attackerName$field);
         }
         if(this.hasDefenderSideId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.defenderSideId$field);
         }
         if(this.hasDefenderCityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.defenderCityId$field);
         }
         if(this.hasDefenderName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_STRING(param1,this.defenderName$field);
         }
         if(this.hasWin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.win$field);
         }
         if(this.hasReportIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.reportIndex$field);
         }
         if(this.hasTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.time$field);
         }
         if(this.hasParam1)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_INT64(param1,this.param1$field);
         }
         if(this.hasParam2)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_INT64(param1,this.param2$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Dto_ExpeditionFightReportInfo.type cannot be set twice.");
                  }
                  _loc3_++;
                  this.type = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightReportInfo.attackerSideId cannot be set twice.");
                  }
                  _loc4_++;
                  this.attackerSideId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightReportInfo.attackerName cannot be set twice.");
                  }
                  _loc5_++;
                  this.attackerName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightReportInfo.defenderSideId cannot be set twice.");
                  }
                  _loc6_++;
                  this.defenderSideId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightReportInfo.defenderCityId cannot be set twice.");
                  }
                  _loc7_++;
                  this.defenderCityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightReportInfo.defenderName cannot be set twice.");
                  }
                  _loc8_++;
                  this.defenderName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightReportInfo.win cannot be set twice.");
                  }
                  _loc9_++;
                  this.win = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightReportInfo.reportIndex cannot be set twice.");
                  }
                  _loc10_++;
                  this.reportIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightReportInfo.time cannot be set twice.");
                  }
                  _loc11_++;
                  this.time = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightReportInfo.param1 cannot be set twice.");
                  }
                  _loc12_++;
                  this.param1 = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightReportInfo.param2 cannot be set twice.");
                  }
                  _loc13_++;
                  this.param2 = ReadUtils.read$TYPE_INT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc14_);
                  break;
            }
         }
      }
   }
}
