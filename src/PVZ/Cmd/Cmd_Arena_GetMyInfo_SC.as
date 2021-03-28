package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Arena_GetMyInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Arena_GetMyInfo_SC";
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Arena_GetMyInfo_SC.rank","rank",1 << 3 | WireType.VARINT);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Arena_GetMyInfo_SC.score","score",2 << 3 | WireType.VARINT);
      
      public static const CURGRADE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Arena_GetMyInfo_SC.curGrade","curGrade",3 << 3 | WireType.VARINT);
      
      public static const NEXTGRADE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Arena_GetMyInfo_SC.nextGrade","nextGrade",4 << 3 | WireType.VARINT);
      
      public static const LEFTCHALLENGENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Arena_GetMyInfo_SC.leftChallengeNum","leftChallengeNum",5 << 3 | WireType.VARINT);
      
      public static const COOLDOWN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Arena_GetMyInfo_SC.coolDown","coolDown",6 << 3 | WireType.VARINT);
      
      public static const ISARENASTARTED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Arena_GetMyInfo_SC.isArenaStarted","isArenaStarted",7 << 3 | WireType.VARINT);
      
      public static const RECORDERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Arena_GetMyInfo_SC.recorders","recorders",8 << 3 | WireType.LENGTH_DELIMITED,Dto_ArenaRecorder);
       
      
      private var rank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var score$field:uint;
      
      private var curGrade$field:uint;
      
      private var nextGrade$field:uint;
      
      private var leftChallengeNum$field:uint;
      
      private var coolDown$field:uint;
      
      private var isArenaStarted$field:Boolean;
      
      public var recorders:Array;
      
      public function Cmd_Arena_GetMyInfo_SC()
      {
         this.recorders = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Arena_GetMyInfo_SC.$MessageID;
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
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967293;
         this.score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.score$field = param1;
      }
      
      public function get score() : uint
      {
         return this.score$field;
      }
      
      public function clearCurGrade() : void
      {
         this.hasField$0 &= 4294967291;
         this.curGrade$field = new uint();
      }
      
      public function get hasCurGrade() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set curGrade(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.curGrade$field = param1;
      }
      
      public function get curGrade() : uint
      {
         return this.curGrade$field;
      }
      
      public function clearNextGrade() : void
      {
         this.hasField$0 &= 4294967287;
         this.nextGrade$field = new uint();
      }
      
      public function get hasNextGrade() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set nextGrade(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.nextGrade$field = param1;
      }
      
      public function get nextGrade() : uint
      {
         return this.nextGrade$field;
      }
      
      public function clearLeftChallengeNum() : void
      {
         this.hasField$0 &= 4294967279;
         this.leftChallengeNum$field = new uint();
      }
      
      public function get hasLeftChallengeNum() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set leftChallengeNum(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.leftChallengeNum$field = param1;
      }
      
      public function get leftChallengeNum() : uint
      {
         return this.leftChallengeNum$field;
      }
      
      public function clearCoolDown() : void
      {
         this.hasField$0 &= 4294967263;
         this.coolDown$field = new uint();
      }
      
      public function get hasCoolDown() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set coolDown(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.coolDown$field = param1;
      }
      
      public function get coolDown() : uint
      {
         return this.coolDown$field;
      }
      
      public function clearIsArenaStarted() : void
      {
         this.hasField$0 &= 4294967231;
         this.isArenaStarted$field = new Boolean();
      }
      
      public function get hasIsArenaStarted() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set isArenaStarted(param1:Boolean) : void
      {
         this.hasField$0 |= 64;
         this.isArenaStarted$field = param1;
      }
      
      public function get isArenaStarted() : Boolean
      {
         return this.isArenaStarted$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.score$field);
         }
         if(this.hasCurGrade)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.curGrade$field);
         }
         if(this.hasNextGrade)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.nextGrade$field);
         }
         if(this.hasLeftChallengeNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.leftChallengeNum$field);
         }
         if(this.hasCoolDown)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.coolDown$field);
         }
         if(this.hasIsArenaStarted)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.isArenaStarted$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.recorders.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.recorders[_loc2_]);
            _loc2_++;
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
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Arena_GetMyInfo_SC.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Arena_GetMyInfo_SC.score cannot be set twice.");
                  }
                  _loc4_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Arena_GetMyInfo_SC.curGrade cannot be set twice.");
                  }
                  _loc5_++;
                  this.curGrade = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Arena_GetMyInfo_SC.nextGrade cannot be set twice.");
                  }
                  _loc6_++;
                  this.nextGrade = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Arena_GetMyInfo_SC.leftChallengeNum cannot be set twice.");
                  }
                  _loc7_++;
                  this.leftChallengeNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Arena_GetMyInfo_SC.coolDown cannot be set twice.");
                  }
                  _loc8_++;
                  this.coolDown = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Arena_GetMyInfo_SC.isArenaStarted cannot be set twice.");
                  }
                  _loc9_++;
                  this.isArenaStarted = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 8:
                  this.recorders.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ArenaRecorder()));
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
