package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FightReport extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FightReport";
      
      public static const RESULT:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_FightReport.result","result",1 << 3 | WireType.VARINT,E_FightResult);
      
      public static const LEFTSIDE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightReport.leftSide","leftSide",2 << 3 | WireType.LENGTH_DELIMITED,Dto_FightSide);
      
      public static const RIGHTSIDE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightReport.rightSide","rightSide",3 << 3 | WireType.LENGTH_DELIMITED,Dto_FightSide);
      
      public static const FIGHTREPLAY:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightReport.fightReplay","fightReplay",4 << 3 | WireType.LENGTH_DELIMITED,Dto_FightRound);
      
      public static const FIGHTTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightReport.fightType","fightType",5 << 3 | WireType.VARINT);
      
      public static const FIGHTSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightReport.fightScore","fightScore",6 << 3 | WireType.VARINT);
      
      public static const WINSIDE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightReport.winSide","winSide",7 << 3 | WireType.VARINT);
      
      public static const NOTE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightReport.note","note",8 << 3 | WireType.LENGTH_DELIMITED,Dto_FightNote);
      
      public static const GUILDFIGHT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightReport.guildFight","guildFight",9 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFight);
       
      
      private var result$field:int;
      
      private var hasField$0:uint = 0;
      
      private var leftSide$field:Dto_FightSide;
      
      private var rightSide$field:Dto_FightSide;
      
      public var fightReplay:Array;
      
      private var fightType$field:uint;
      
      private var fightScore$field:uint;
      
      private var winSide$field:uint;
      
      private var note$field:Dto_FightNote;
      
      private var guildFight$field:Dto_GuildFight;
      
      public function Dto_FightReport()
      {
         this.fightReplay = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FightReport.$MessageID;
      }
      
      public function clearResult() : void
      {
         this.hasField$0 &= 4294967294;
         this.result$field = new int();
      }
      
      public function get hasResult() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set result(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.result$field = param1;
      }
      
      public function get result() : int
      {
         return this.result$field;
      }
      
      public function clearLeftSide() : void
      {
         this.leftSide$field = null;
      }
      
      public function get hasLeftSide() : Boolean
      {
         return this.leftSide$field != null;
      }
      
      public function set leftSide(param1:Dto_FightSide) : void
      {
         this.leftSide$field = param1;
      }
      
      public function get leftSide() : Dto_FightSide
      {
         return this.leftSide$field;
      }
      
      public function clearRightSide() : void
      {
         this.rightSide$field = null;
      }
      
      public function get hasRightSide() : Boolean
      {
         return this.rightSide$field != null;
      }
      
      public function set rightSide(param1:Dto_FightSide) : void
      {
         this.rightSide$field = param1;
      }
      
      public function get rightSide() : Dto_FightSide
      {
         return this.rightSide$field;
      }
      
      public function clearFightType() : void
      {
         this.hasField$0 &= 4294967293;
         this.fightType$field = new uint();
      }
      
      public function get hasFightType() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set fightType(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.fightType$field = param1;
      }
      
      public function get fightType() : uint
      {
         return this.fightType$field;
      }
      
      public function clearFightScore() : void
      {
         this.hasField$0 &= 4294967291;
         this.fightScore$field = new uint();
      }
      
      public function get hasFightScore() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set fightScore(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.fightScore$field = param1;
      }
      
      public function get fightScore() : uint
      {
         return this.fightScore$field;
      }
      
      public function clearWinSide() : void
      {
         this.hasField$0 &= 4294967287;
         this.winSide$field = new uint();
      }
      
      public function get hasWinSide() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set winSide(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.winSide$field = param1;
      }
      
      public function get winSide() : uint
      {
         return this.winSide$field;
      }
      
      public function clearNote() : void
      {
         this.note$field = null;
      }
      
      public function get hasNote() : Boolean
      {
         return this.note$field != null;
      }
      
      public function set note(param1:Dto_FightNote) : void
      {
         this.note$field = param1;
      }
      
      public function get note() : Dto_FightNote
      {
         return this.note$field;
      }
      
      public function clearGuildFight() : void
      {
         this.guildFight$field = null;
      }
      
      public function get hasGuildFight() : Boolean
      {
         return this.guildFight$field != null;
      }
      
      public function set guildFight(param1:Dto_GuildFight) : void
      {
         this.guildFight$field = param1;
      }
      
      public function get guildFight() : Dto_GuildFight
      {
         return this.guildFight$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasResult)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_ENUM(param1,this.result$field);
         }
         if(this.hasLeftSide)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.leftSide$field);
         }
         if(this.hasRightSide)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rightSide$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.fightReplay.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.fightReplay[_loc2_]);
            _loc2_++;
         }
         if(this.hasFightType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.fightType$field);
         }
         if(this.hasFightScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.fightScore$field);
         }
         if(this.hasWinSide)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.winSide$field);
         }
         if(this.hasNote)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.note$field);
         }
         if(this.hasGuildFight)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildFight$field);
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
                     throw new IOError("Bad data format: Dto_FightReport.result cannot be set twice.");
                  }
                  _loc3_++;
                  this.result = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightReport.leftSide cannot be set twice.");
                  }
                  _loc4_++;
                  this.leftSide = new Dto_FightSide();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.leftSide);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightReport.rightSide cannot be set twice.");
                  }
                  _loc5_++;
                  this.rightSide = new Dto_FightSide();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.rightSide);
                  break;
               case 4:
                  this.fightReplay.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FightRound()));
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightReport.fightType cannot be set twice.");
                  }
                  _loc6_++;
                  this.fightType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightReport.fightScore cannot be set twice.");
                  }
                  _loc7_++;
                  this.fightScore = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightReport.winSide cannot be set twice.");
                  }
                  _loc8_++;
                  this.winSide = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightReport.note cannot be set twice.");
                  }
                  _loc9_++;
                  this.note = new Dto_FightNote();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.note);
                  break;
               case 9:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightReport.guildFight cannot be set twice.");
                  }
                  _loc10_++;
                  this.guildFight = new Dto_GuildFight();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.guildFight);
                  break;
               default:
                  super.readUnknown(param1,_loc11_);
                  break;
            }
         }
      }
   }
}
