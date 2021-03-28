package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_AllServerNoEndFuben extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_AllServerNoEndFuben";
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AllServerNoEndFuben.rank","rank",1 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_AllServerNoEndFuben.roleName","roleName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AllServerNoEndFuben.zoneId","zoneId",3 << 3 | WireType.VARINT);
      
      public static const POWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AllServerNoEndFuben.power","power",4 << 3 | WireType.VARINT);
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AllServerNoEndFuben.stageId","stageId",5 << 3 | WireType.VARINT);
      
      public static const FORMATION:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_AllServerNoEndFuben.formation","formation",6 << 3 | WireType.LENGTH_DELIMITED,Dto_ShowFormationInfo);
      
      public static const RESULT:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_AllServerNoEndFuben.result","result",7 << 3 | WireType.VARINT,E_AllServerNoEndFubenResult);
       
      
      private var rank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var roleName$field:String;
      
      private var zoneId$field:uint;
      
      private var power$field:uint;
      
      private var stageId$field:uint;
      
      private var formation$field:Dto_ShowFormationInfo;
      
      private var result$field:int;
      
      public function Dto_AllServerNoEndFuben()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_AllServerNoEndFuben.$MessageID;
      }
      
      public function clearRank() : void
      {
         this.hasField$0 &= 4294967294;
         this.rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return this.rank$field;
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
      
      public function clearZoneId() : void
      {
         this.hasField$0 &= 4294967293;
         this.zoneId$field = new uint();
      }
      
      public function get hasZoneId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set zoneId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.zoneId$field = param1;
      }
      
      public function get zoneId() : uint
      {
         return this.zoneId$field;
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
      
      public function clearResult() : void
      {
         this.hasField$0 &= 4294967279;
         this.result$field = new int();
      }
      
      public function get hasResult() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set result(param1:int) : void
      {
         this.hasField$0 |= 16;
         this.result$field = param1;
      }
      
      public function get result() : int
      {
         return this.result$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasZoneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneId$field);
         }
         if(this.hasPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.power$field);
         }
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         if(this.hasFormation)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.formation$field);
         }
         if(this.hasResult)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_ENUM(param1,this.result$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Dto_AllServerNoEndFuben.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerNoEndFuben.roleName cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerNoEndFuben.zoneId cannot be set twice.");
                  }
                  _loc5_++;
                  this.zoneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerNoEndFuben.power cannot be set twice.");
                  }
                  _loc6_++;
                  this.power = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerNoEndFuben.stageId cannot be set twice.");
                  }
                  _loc7_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerNoEndFuben.formation cannot be set twice.");
                  }
                  _loc8_++;
                  this.formation = new Dto_ShowFormationInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.formation);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerNoEndFuben.result cannot be set twice.");
                  }
                  _loc9_++;
                  this.result = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
