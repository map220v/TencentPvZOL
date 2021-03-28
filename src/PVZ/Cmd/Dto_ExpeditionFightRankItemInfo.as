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
   
   public final class Dto_ExpeditionFightRankItemInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ExpeditionFightRankItemInfo";
      
      public static const RANKID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightRankItemInfo.rankId","rankId",1 << 3 | WireType.VARINT);
      
      public static const ZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightRankItemInfo.zoneId","zoneId",2 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ExpeditionFightRankItemInfo.roleName","roleName",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const WIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightRankItemInfo.win","win",4 << 3 | WireType.VARINT);
      
      public static const LOSE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightRankItemInfo.lose","lose",5 << 3 | WireType.VARINT);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightRankItemInfo.score","score",6 << 3 | WireType.VARINT);
       
      
      private var rankId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var zoneId$field:uint;
      
      private var roleName$field:String;
      
      private var win$field:uint;
      
      private var lose$field:uint;
      
      private var score$field:uint;
      
      public function Dto_ExpeditionFightRankItemInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ExpeditionFightRankItemInfo.$MessageID;
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
         this.hasField$0 &= 4294967291;
         this.win$field = new uint();
      }
      
      public function get hasWin() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set win(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.win$field = param1;
      }
      
      public function get win() : uint
      {
         return this.win$field;
      }
      
      public function clearLose() : void
      {
         this.hasField$0 &= 4294967287;
         this.lose$field = new uint();
      }
      
      public function get hasLose() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set lose(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.lose$field = param1;
      }
      
      public function get lose() : uint
      {
         return this.lose$field;
      }
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967279;
         this.score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         this.hasField$0 |= 16;
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
         if(this.hasZoneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneId$field);
         }
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasWin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.win$field);
         }
         if(this.hasLose)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.lose$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.score$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightRankItemInfo.rankId cannot be set twice.");
                  }
                  _loc3_++;
                  this.rankId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightRankItemInfo.zoneId cannot be set twice.");
                  }
                  _loc4_++;
                  this.zoneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightRankItemInfo.roleName cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightRankItemInfo.win cannot be set twice.");
                  }
                  _loc6_++;
                  this.win = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightRankItemInfo.lose cannot be set twice.");
                  }
                  _loc7_++;
                  this.lose = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightRankItemInfo.score cannot be set twice.");
                  }
                  _loc8_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
