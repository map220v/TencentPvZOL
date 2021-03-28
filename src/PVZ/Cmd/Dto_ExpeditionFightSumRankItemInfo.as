package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_ExpeditionFightSumRankItemInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ExpeditionFightSumRankItemInfo";
      
      public static const RANKID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightSumRankItemInfo.rankId","rankId",1 << 3 | WireType.VARINT);
      
      public static const SIDEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightSumRankItemInfo.sideId","sideId",2 << 3 | WireType.VARINT);
      
      public static const ZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightSumRankItemInfo.zoneId","zoneId",3 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ExpeditionFightSumRankItemInfo.roleName","roleName",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const WIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightSumRankItemInfo.win","win",5 << 3 | WireType.VARINT);
      
      public static const LOSE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightSumRankItemInfo.lose","lose",6 << 3 | WireType.VARINT);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightSumRankItemInfo.score","score",7 << 3 | WireType.VARINT);
       
      
      private var rankId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var sideId$field:uint;
      
      private var zoneId$field:uint;
      
      private var roleName$field:String;
      
      private var win$field:uint;
      
      private var lose$field:uint;
      
      private var score$field:uint;
      
      public function Dto_ExpeditionFightSumRankItemInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ExpeditionFightSumRankItemInfo.$MessageID;
      }
      
      public function clearRankId() : void
      {
         this.hasField$0 &= 4294967294;
         this.rankId$field = new uint();
      }
      
      public function get hasRankId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set rankId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.rankId$field = param1;
      }
      
      public function get rankId() : uint
      {
         return this.rankId$field;
      }
      
      public function clearSideId() : void
      {
         this.hasField$0 &= 4294967293;
         this.sideId$field = new uint();
      }
      
      public function get hasSideId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set sideId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.sideId$field = param1;
      }
      
      public function get sideId() : uint
      {
         return this.sideId$field;
      }
      
      public function clearZoneId() : void
      {
         this.hasField$0 &= 4294967291;
         this.zoneId$field = new uint();
      }
      
      public function get hasZoneId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set zoneId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.zoneId$field = param1;
      }
      
      public function get zoneId() : uint
      {
         return this.zoneId$field;
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
      
      public function clearWin() : void
      {
         this.hasField$0 &= 4294967287;
         this.win$field = new uint();
      }
      
      public function get hasWin() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set win(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.win$field = param1;
      }
      
      public function get win() : uint
      {
         return this.win$field;
      }
      
      public function clearLose() : void
      {
         this.hasField$0 &= 4294967279;
         this.lose$field = new uint();
      }
      
      public function get hasLose() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set lose(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.lose$field = param1;
      }
      
      public function get lose() : uint
      {
         return this.lose$field;
      }
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967263;
         this.score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.score$field = param1;
      }
      
      public function get score() : uint
      {
         return this.score$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRankId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.rankId$field);
         }
         if(this.hasSideId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.sideId$field);
         }
         if(this.hasZoneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneId$field);
         }
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasWin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.win$field);
         }
         if(this.hasLose)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.lose$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.score$field);
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
                     throw new IOError("Bad data format: Dto_ExpeditionFightSumRankItemInfo.rankId cannot be set twice.");
                  }
                  _loc3_++;
                  this.rankId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightSumRankItemInfo.sideId cannot be set twice.");
                  }
                  _loc4_++;
                  this.sideId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightSumRankItemInfo.zoneId cannot be set twice.");
                  }
                  _loc5_++;
                  this.zoneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightSumRankItemInfo.roleName cannot be set twice.");
                  }
                  _loc6_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightSumRankItemInfo.win cannot be set twice.");
                  }
                  _loc7_++;
                  this.win = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightSumRankItemInfo.lose cannot be set twice.");
                  }
                  _loc8_++;
                  this.lose = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightSumRankItemInfo.score cannot be set twice.");
                  }
                  _loc9_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
