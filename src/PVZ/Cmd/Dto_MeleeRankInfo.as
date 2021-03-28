package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_MeleeRankInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_MeleeRankInfo";
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_MeleeRankInfo.roleName","roleName",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const QQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_MeleeRankInfo.qqFaceURL","qqFaceURL",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MeleeRankInfo.score","score",3 << 3 | WireType.VARINT);
      
      public static const WINSTREAKCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MeleeRankInfo.winStreakCount","winStreakCount",4 << 3 | WireType.VARINT);
      
      public static const SCOREDIFF:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MeleeRankInfo.scoreDiff","scoreDiff",5 << 3 | WireType.VARINT);
      
      public static const ROLELEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MeleeRankInfo.roleLevel","roleLevel",6 << 3 | WireType.VARINT);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MeleeRankInfo.rank","rank",7 << 3 | WireType.VARINT);
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_MeleeRankInfo.roleId","roleId",8 << 3 | WireType.VARINT);
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_MeleeRankInfo.reward","reward",9 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var roleName$field:String;
      
      private var qqFaceURL$field:String;
      
      private var score$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var winStreakCount$field:uint;
      
      private var scoreDiff$field:uint;
      
      private var roleLevel$field:uint;
      
      private var rank$field:uint;
      
      private var roleId$field:Int64;
      
      public var reward:Array;
      
      public function Dto_MeleeRankInfo()
      {
         this.reward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_MeleeRankInfo.$MessageID;
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
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967294;
         this.score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.score$field = param1;
      }
      
      public function get score() : uint
      {
         return this.score$field;
      }
      
      public function clearWinStreakCount() : void
      {
         this.hasField$0 &= 4294967293;
         this.winStreakCount$field = new uint();
      }
      
      public function get hasWinStreakCount() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set winStreakCount(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.winStreakCount$field = param1;
      }
      
      public function get winStreakCount() : uint
      {
         return this.winStreakCount$field;
      }
      
      public function clearScoreDiff() : void
      {
         this.hasField$0 &= 4294967291;
         this.scoreDiff$field = new uint();
      }
      
      public function get hasScoreDiff() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set scoreDiff(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.scoreDiff$field = param1;
      }
      
      public function get scoreDiff() : uint
      {
         return this.scoreDiff$field;
      }
      
      public function clearRoleLevel() : void
      {
         this.hasField$0 &= 4294967287;
         this.roleLevel$field = new uint();
      }
      
      public function get hasRoleLevel() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set roleLevel(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.roleLevel$field = param1;
      }
      
      public function get roleLevel() : uint
      {
         return this.roleLevel$field;
      }
      
      public function clearRank() : void
      {
         this.hasField$0 &= 4294967279;
         this.rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return this.rank$field;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasQqFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.qqFaceURL$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.score$field);
         }
         if(this.hasWinStreakCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.winStreakCount$field);
         }
         if(this.hasScoreDiff)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.scoreDiff$field);
         }
         if(this.hasRoleLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.roleLevel$field);
         }
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeRankInfo.roleName cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeRankInfo.qqFaceURL cannot be set twice.");
                  }
                  _loc4_++;
                  this.qqFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeRankInfo.score cannot be set twice.");
                  }
                  _loc5_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeRankInfo.winStreakCount cannot be set twice.");
                  }
                  _loc6_++;
                  this.winStreakCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeRankInfo.scoreDiff cannot be set twice.");
                  }
                  _loc7_++;
                  this.scoreDiff = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeRankInfo.roleLevel cannot be set twice.");
                  }
                  _loc8_++;
                  this.roleLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeRankInfo.rank cannot be set twice.");
                  }
                  _loc9_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeRankInfo.roleId cannot be set twice.");
                  }
                  _loc10_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 9:
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               default:
                  super.readUnknown(param1,_loc11_);
                  break;
            }
         }
      }
   }
}
