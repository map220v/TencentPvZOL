package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Rank_NoEndFuben extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Rank_NoEndFuben";
      
      public static const BEGINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Rank_NoEndFuben.beginTime","beginTime",3 << 3 | WireType.VARINT);
      
      public static const UIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Rank_NoEndFuben.uin","uin",4 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Rank_NoEndFuben.roleName","roleName",5 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const QQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Rank_NoEndFuben.qqFaceURL","qqFaceURL",6 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const POWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Rank_NoEndFuben.power","power",7 << 3 | WireType.VARINT);
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Rank_NoEndFuben.stageId","stageId",8 << 3 | WireType.VARINT);
      
      public static const FORMATION:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Rank_NoEndFuben.formation","formation",10 << 3 | WireType.LENGTH_DELIMITED,Dto_ShowFormationInfo);
      
      public static const HISTORYMAXPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Rank_NoEndFuben.historyMaxPower","historyMaxPower",11 << 3 | WireType.VARINT);
       
      
      private var beginTime$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var uin$field:uint;
      
      private var roleName$field:String;
      
      private var qqFaceURL$field:String;
      
      private var power$field:uint;
      
      private var stageId$field:uint;
      
      private var formation$field:Dto_ShowFormationInfo;
      
      private var historyMaxPower$field:uint;
      
      public function Dto_Rank_NoEndFuben()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Rank_NoEndFuben.$MessageID;
      }
      
      public function clearBeginTime() : void
      {
         this.hasField$0 &= 4294967294;
         this.beginTime$field = new uint();
      }
      
      public function get hasBeginTime() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set beginTime(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.beginTime$field = param1;
      }
      
      public function get beginTime() : uint
      {
         return this.beginTime$field;
      }
      
      public function clearUin() : void
      {
         this.hasField$0 &= 4294967293;
         this.uin$field = new uint();
      }
      
      public function get hasUin() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set uin(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.uin$field = param1;
      }
      
      public function get uin() : uint
      {
         return this.uin$field;
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
      
      public function clearQqFaceURL() : void
      {
         this.qqFaceURL$field = null;
      }
      
      public function get hasQqFaceURL() : Boolean
      {
         return this.qqFaceURL$field != null;
      }
      
      public function set qqFaceURL(param1:String) : void
      {
         this.qqFaceURL$field = param1;
      }
      
      public function get qqFaceURL() : String
      {
         return this.qqFaceURL$field;
      }
      
      public function clearPower() : void
      {
         this.hasField$0 &= 4294967291;
         this.power$field = new uint();
      }
      
      public function get hasPower() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set power(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.power$field = param1;
      }
      
      public function get power() : uint
      {
         return this.power$field;
      }
      
      public function clearStageId() : void
      {
         this.hasField$0 &= 4294967287;
         this.stageId$field = new uint();
      }
      
      public function get hasStageId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set stageId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.stageId$field = param1;
      }
      
      public function get stageId() : uint
      {
         return this.stageId$field;
      }
      
      public function clearFormation() : void
      {
         this.formation$field = null;
      }
      
      public function get hasFormation() : Boolean
      {
         return this.formation$field != null;
      }
      
      public function set formation(param1:Dto_ShowFormationInfo) : void
      {
         this.formation$field = param1;
      }
      
      public function get formation() : Dto_ShowFormationInfo
      {
         return this.formation$field;
      }
      
      public function clearHistoryMaxPower() : void
      {
         this.hasField$0 &= 4294967279;
         this.historyMaxPower$field = new uint();
      }
      
      public function get hasHistoryMaxPower() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set historyMaxPower(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.historyMaxPower$field = param1;
      }
      
      public function get historyMaxPower() : uint
      {
         return this.historyMaxPower$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasBeginTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.beginTime$field);
         }
         if(this.hasUin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.uin$field);
         }
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasQqFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_STRING(param1,this.qqFaceURL$field);
         }
         if(this.hasPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.power$field);
         }
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         if(this.hasFormation)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.formation$field);
         }
         if(this.hasHistoryMaxPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.historyMaxPower$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc11_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc11_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc11_ >> 3)
            {
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Rank_NoEndFuben.beginTime cannot be set twice.");
                  }
                  _loc3_++;
                  this.beginTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Rank_NoEndFuben.uin cannot be set twice.");
                  }
                  _loc4_++;
                  this.uin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Rank_NoEndFuben.roleName cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Rank_NoEndFuben.qqFaceURL cannot be set twice.");
                  }
                  _loc6_++;
                  this.qqFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 7:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Rank_NoEndFuben.power cannot be set twice.");
                  }
                  _loc7_++;
                  this.power = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Rank_NoEndFuben.stageId cannot be set twice.");
                  }
                  _loc8_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Rank_NoEndFuben.formation cannot be set twice.");
                  }
                  _loc9_++;
                  this.formation = new Dto_ShowFormationInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.formation);
                  break;
               case 11:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Rank_NoEndFuben.historyMaxPower cannot be set twice.");
                  }
                  _loc10_++;
                  this.historyMaxPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc11_);
                  break;
            }
         }
      }
   }
}
