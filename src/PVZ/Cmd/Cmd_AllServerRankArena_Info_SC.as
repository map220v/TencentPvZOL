package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_AllServerRankArena_Info_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_AllServerRankArena_Info_SC";
      
      public static const SELF:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_AllServerRankArena_Info_SC.self","self",1 << 3 | WireType.LENGTH_DELIMITED,Dto_AllServerRankArena_Opponent);
      
      public static const CHALLENGETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_AllServerRankArena_Info_SC.challengeTimes","challengeTimes",2 << 3 | WireType.VARINT);
      
      public static const MAXRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_AllServerRankArena_Info_SC.maxRank","maxRank",3 << 3 | WireType.VARINT);
      
      public static const TAKEMAXRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_AllServerRankArena_Info_SC.takeMaxRank","takeMaxRank",4 << 3 | WireType.VARINT);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_AllServerRankArena_Info_SC.score","score",5 << 3 | WireType.VARINT);
      
      public static const TAKESCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_AllServerRankArena_Info_SC.takeScore","takeScore",6 << 3 | WireType.VARINT);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_AllServerRankArena_Info_SC.rank","rank",7 << 3 | WireType.VARINT);
      
      public static const TOPOPPONENT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_AllServerRankArena_Info_SC.topOpponent","topOpponent",8 << 3 | WireType.LENGTH_DELIMITED,Dto_AllServerRankArena_Opponent);
      
      public static const OPPONENT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_AllServerRankArena_Info_SC.opponent","opponent",9 << 3 | WireType.LENGTH_DELIMITED,Dto_AllServerRankArena_Opponent);
       
      
      private var self$field:Dto_AllServerRankArena_Opponent;
      
      private var challengeTimes$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var maxRank$field:uint;
      
      private var takeMaxRank$field:uint;
      
      private var score$field:uint;
      
      private var takeScore$field:uint;
      
      private var rank$field:uint;
      
      public var topOpponent:Array;
      
      public var opponent:Array;
      
      public function Cmd_AllServerRankArena_Info_SC()
      {
         this.topOpponent = [];
         this.opponent = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_AllServerRankArena_Info_SC.$MessageID;
      }
      
      public function clearSelf() : void
      {
         this.self$field = null;
      }
      
      public function get hasSelf() : Boolean
      {
         return this.self$field != null;
      }
      
      public function set self(param1:Dto_AllServerRankArena_Opponent) : void
      {
         this.self$field = param1;
      }
      
      public function get self() : Dto_AllServerRankArena_Opponent
      {
         return this.self$field;
      }
      
      public function clearChallengeTimes() : void
      {
         this.hasField$0 &= 4294967294;
         this.challengeTimes$field = new uint();
      }
      
      public function get hasChallengeTimes() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set challengeTimes(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.challengeTimes$field = param1;
      }
      
      public function get challengeTimes() : uint
      {
         return this.challengeTimes$field;
      }
      
      public function clearMaxRank() : void
      {
         this.hasField$0 &= 4294967293;
         this.maxRank$field = new uint();
      }
      
      public function get hasMaxRank() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set maxRank(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.maxRank$field = param1;
      }
      
      public function get maxRank() : uint
      {
         return this.maxRank$field;
      }
      
      public function clearTakeMaxRank() : void
      {
         this.hasField$0 &= 4294967291;
         this.takeMaxRank$field = new uint();
      }
      
      public function get hasTakeMaxRank() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set takeMaxRank(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.takeMaxRank$field = param1;
      }
      
      public function get takeMaxRank() : uint
      {
         return this.takeMaxRank$field;
      }
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967287;
         this.score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.score$field = param1;
      }
      
      public function get score() : uint
      {
         return this.score$field;
      }
      
      public function clearTakeScore() : void
      {
         this.hasField$0 &= 4294967279;
         this.takeScore$field = new uint();
      }
      
      public function get hasTakeScore() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set takeScore(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.takeScore$field = param1;
      }
      
      public function get takeScore() : uint
      {
         return this.takeScore$field;
      }
      
      public function clearRank() : void
      {
         this.hasField$0 &= 4294967263;
         this.rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return this.rank$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasSelf)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.self$field);
         }
         if(this.hasChallengeTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.challengeTimes$field);
         }
         if(this.hasMaxRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.maxRank$field);
         }
         if(this.hasTakeMaxRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.takeMaxRank$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.score$field);
         }
         if(this.hasTakeScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.takeScore$field);
         }
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.topOpponent.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.topOpponent[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.opponent.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.opponent[_loc3_]);
            _loc3_++;
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
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_Info_SC.self cannot be set twice.");
                  }
                  _loc3_++;
                  this.self = new Dto_AllServerRankArena_Opponent();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.self);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_Info_SC.challengeTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.challengeTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_Info_SC.maxRank cannot be set twice.");
                  }
                  _loc5_++;
                  this.maxRank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_Info_SC.takeMaxRank cannot be set twice.");
                  }
                  _loc6_++;
                  this.takeMaxRank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_Info_SC.score cannot be set twice.");
                  }
                  _loc7_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_Info_SC.takeScore cannot be set twice.");
                  }
                  _loc8_++;
                  this.takeScore = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_Info_SC.rank cannot be set twice.");
                  }
                  _loc9_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  this.topOpponent.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_AllServerRankArena_Opponent()));
                  break;
               case 9:
                  this.opponent.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_AllServerRankArena_Opponent()));
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
