package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.UInt64;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FormationInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FormationInfo";
      
      public static const CARDPOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FormationInfo.cardPos","cardPos",1 << 3 | WireType.LENGTH_DELIMITED,Dto_CardPosInfo);
      
      public static const FORMATIONID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FormationInfo.formationId","formationId",2 << 3 | WireType.VARINT);
      
      public static const LEADERUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_FormationInfo.leaderUid","leaderUid",3 << 3 | WireType.VARINT);
      
      public static const TOTALPOWER:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("PVZ.Cmd.Dto_FormationInfo.totalPower","totalPower",4 << 3 | WireType.VARINT);
      
      public static const TEAMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FormationInfo.teamId","teamId",5 << 3 | WireType.VARINT);
      
      public static const STATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FormationInfo.status","status",6 << 3 | WireType.VARINT);
      
      public static const RECOVERHPCOST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FormationInfo.recoverHpCost","recoverHpCost",7 << 3 | WireType.VARINT);
      
      public static const ISDEFEND:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_FormationInfo.isDefend","isDefend",8 << 3 | WireType.VARINT);
       
      
      public var cardPos:Array;
      
      private var formationId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var leaderUid$field:Int64;
      
      private var totalPower$field:UInt64;
      
      private var teamId$field:uint;
      
      private var status$field:uint;
      
      private var recoverHpCost$field:uint;
      
      private var isDefend$field:Boolean;
      
      public function Dto_FormationInfo()
      {
         this.cardPos = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FormationInfo.$MessageID;
      }
      
      public function clearFormationId() : void
      {
         this.hasField$0 &= 4294967294;
         this.formationId$field = new uint();
      }
      
      public function get hasFormationId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set formationId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.formationId$field = param1;
      }
      
      public function get formationId() : uint
      {
         return this.formationId$field;
      }
      
      public function clearLeaderUid() : void
      {
         this.leaderUid$field = null;
      }
      
      public function get hasLeaderUid() : Boolean
      {
         return this.leaderUid$field != null;
      }
      
      public function set leaderUid(param1:Int64) : void
      {
         this.leaderUid$field = param1;
      }
      
      public function get leaderUid() : Int64
      {
         return this.leaderUid$field;
      }
      
      public function clearTotalPower() : void
      {
         this.totalPower$field = null;
      }
      
      public function get hasTotalPower() : Boolean
      {
         return this.totalPower$field != null;
      }
      
      public function set totalPower(param1:UInt64) : void
      {
         this.totalPower$field = param1;
      }
      
      public function get totalPower() : UInt64
      {
         return this.totalPower$field;
      }
      
      public function clearTeamId() : void
      {
         this.hasField$0 &= 4294967293;
         this.teamId$field = new uint();
      }
      
      public function get hasTeamId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set teamId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.teamId$field = param1;
      }
      
      public function get teamId() : uint
      {
         return this.teamId$field;
      }
      
      public function clearStatus() : void
      {
         this.hasField$0 &= 4294967291;
         this.status$field = new uint();
      }
      
      public function get hasStatus() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set status(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.status$field = param1;
      }
      
      public function get status() : uint
      {
         return this.status$field;
      }
      
      public function clearRecoverHpCost() : void
      {
         this.hasField$0 &= 4294967287;
         this.recoverHpCost$field = new uint();
      }
      
      public function get hasRecoverHpCost() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set recoverHpCost(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.recoverHpCost$field = param1;
      }
      
      public function get recoverHpCost() : uint
      {
         return this.recoverHpCost$field;
      }
      
      public function clearIsDefend() : void
      {
         this.hasField$0 &= 4294967279;
         this.isDefend$field = new Boolean();
      }
      
      public function get hasIsDefend() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set isDefend(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.isDefend$field = param1;
      }
      
      public function get isDefend() : Boolean
      {
         return this.isDefend$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.cardPos.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cardPos[_loc2_]);
            _loc2_++;
         }
         if(this.hasFormationId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.formationId$field);
         }
         if(this.hasLeaderUid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT64(param1,this.leaderUid$field);
         }
         if(this.hasTotalPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT64(param1,this.totalPower$field);
         }
         if(this.hasTeamId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.teamId$field);
         }
         if(this.hasStatus)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.status$field);
         }
         if(this.hasRecoverHpCost)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.recoverHpCost$field);
         }
         if(this.hasIsDefend)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_BOOL(param1,this.isDefend$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                  this.cardPos.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_CardPosInfo()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FormationInfo.formationId cannot be set twice.");
                  }
                  _loc3_++;
                  this.formationId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FormationInfo.leaderUid cannot be set twice.");
                  }
                  _loc4_++;
                  this.leaderUid = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FormationInfo.totalPower cannot be set twice.");
                  }
                  _loc5_++;
                  this.totalPower = ReadUtils.read$TYPE_UINT64(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FormationInfo.teamId cannot be set twice.");
                  }
                  _loc6_++;
                  this.teamId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FormationInfo.status cannot be set twice.");
                  }
                  _loc7_++;
                  this.status = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FormationInfo.recoverHpCost cannot be set twice.");
                  }
                  _loc8_++;
                  this.recoverHpCost = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FormationInfo.isDefend cannot be set twice.");
                  }
                  _loc9_++;
                  this.isDefend = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
