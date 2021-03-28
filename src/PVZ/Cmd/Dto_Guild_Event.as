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
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Guild_Event extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Guild_Event";
      
      public static const EVENTTYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_Guild_Event.eventType","eventType",1 << 3 | WireType.VARINT,E_GuildEventType);
      
      public static const PLAYER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Guild_Event.player","player",2 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_User);
      
      public static const PLANTBATTLE:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_Event.plantBattle","plantBattle",3 << 3 | WireType.VARINT);
      
      public static const WARPLAYERID:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Guild_Event.warPlayerId","warPlayerId",4 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_User);
      
      public static const GUILDLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_Event.guildLevel","guildLevel",5 << 3 | WireType.VARINT);
      
      public static const LEADERCHANGE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Guild_Event.leaderChange","leaderChange",6 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_User);
      
      public static const POSITIONROLE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Guild_Event.positionRole","positionRole",7 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_User);
      
      public static const POSITIONCHANGE:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_Event.positionChange","positionChange",8 << 3 | WireType.VARINT);
      
      public static const EVENTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_Event.eventTime","eventTime",9 << 3 | WireType.VARINT);
      
      public static const CHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_Event.chapterId","chapterId",10 << 3 | WireType.VARINT);
      
      public static const SETJOINPOSITION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_Event.setJoinPosition","setJoinPosition",11 << 3 | WireType.VARINT);
       
      
      private var eventType$field:int;
      
      private var hasField$0:uint = 0;
      
      private var player$field:Dto_Guild_User;
      
      public var plantBattle:Array;
      
      public var warPlayerId:Array;
      
      private var guildLevel$field:uint;
      
      public var leaderChange:Array;
      
      private var positionRole$field:Dto_Guild_User;
      
      public var positionChange:Array;
      
      private var eventTime$field:uint;
      
      private var chapterId$field:uint;
      
      private var setJoinPosition$field:uint;
      
      public function Dto_Guild_Event()
      {
         this.plantBattle = [];
         this.warPlayerId = [];
         this.leaderChange = [];
         this.positionChange = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Guild_Event.$MessageID;
      }
      
      public function clearEventType() : void
      {
         this.hasField$0 &= 4294967294;
         this.eventType$field = new int();
      }
      
      public function get hasEventType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set eventType(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.eventType$field = param1;
      }
      
      public function get eventType() : int
      {
         return this.eventType$field;
      }
      
      public function clearPlayer() : void
      {
         this.player$field = null;
      }
      
      public function get hasPlayer() : Boolean
      {
         return this.player$field != null;
      }
      
      public function set player(param1:Dto_Guild_User) : void
      {
         this.player$field = param1;
      }
      
      public function get player() : Dto_Guild_User
      {
         return this.player$field;
      }
      
      public function clearGuildLevel() : void
      {
         this.hasField$0 &= 4294967293;
         this.guildLevel$field = new uint();
      }
      
      public function get hasGuildLevel() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set guildLevel(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.guildLevel$field = param1;
      }
      
      public function get guildLevel() : uint
      {
         return this.guildLevel$field;
      }
      
      public function clearPositionRole() : void
      {
         this.positionRole$field = null;
      }
      
      public function get hasPositionRole() : Boolean
      {
         return this.positionRole$field != null;
      }
      
      public function set positionRole(param1:Dto_Guild_User) : void
      {
         this.positionRole$field = param1;
      }
      
      public function get positionRole() : Dto_Guild_User
      {
         return this.positionRole$field;
      }
      
      public function clearEventTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.eventTime$field = new uint();
      }
      
      public function get hasEventTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set eventTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.eventTime$field = param1;
      }
      
      public function get eventTime() : uint
      {
         return this.eventTime$field;
      }
      
      public function clearChapterId() : void
      {
         this.hasField$0 &= 4294967287;
         this.chapterId$field = new uint();
      }
      
      public function get hasChapterId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set chapterId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.chapterId$field = param1;
      }
      
      public function get chapterId() : uint
      {
         return this.chapterId$field;
      }
      
      public function clearSetJoinPosition() : void
      {
         this.hasField$0 &= 4294967279;
         this.setJoinPosition$field = new uint();
      }
      
      public function get hasSetJoinPosition() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set setJoinPosition(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.setJoinPosition$field = param1;
      }
      
      public function get setJoinPosition() : uint
      {
         return this.setJoinPosition$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc6_:* = undefined;
         if(this.hasEventType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_ENUM(param1,this.eventType$field);
         }
         if(this.hasPlayer)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.player$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.plantBattle.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.plantBattle[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.warPlayerId.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.warPlayerId[_loc3_]);
            _loc3_++;
         }
         if(this.hasGuildLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.guildLevel$field);
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.leaderChange.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.leaderChange[_loc4_]);
            _loc4_++;
         }
         if(this.hasPositionRole)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.positionRole$field);
         }
         var _loc5_:uint = 0;
         while(_loc5_ < this.positionChange.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.positionChange[_loc5_]);
            _loc5_++;
         }
         if(this.hasEventTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.eventTime$field);
         }
         if(this.hasChapterId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.chapterId$field);
         }
         if(this.hasSetJoinPosition)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.setJoinPosition$field);
         }
         for(_loc6_ in this)
         {
            super.writeUnknown(param1,_loc6_);
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
                     throw new IOError("Bad data format: Dto_Guild_Event.eventType cannot be set twice.");
                  }
                  _loc3_++;
                  this.eventType = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Event.player cannot be set twice.");
                  }
                  _loc4_++;
                  this.player = new Dto_Guild_User();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.player);
                  break;
               case 3:
                  if((_loc10_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.plantBattle);
                  }
                  else
                  {
                     this.plantBattle.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 4:
                  this.warPlayerId.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Guild_User()));
                  break;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Event.guildLevel cannot be set twice.");
                  }
                  _loc5_++;
                  this.guildLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  this.leaderChange.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Guild_User()));
                  break;
               case 7:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Event.positionRole cannot be set twice.");
                  }
                  _loc6_++;
                  this.positionRole = new Dto_Guild_User();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.positionRole);
                  break;
               case 8:
                  if((_loc10_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.positionChange);
                  }
                  else
                  {
                     this.positionChange.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 9:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Event.eventTime cannot be set twice.");
                  }
                  _loc7_++;
                  this.eventTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Event.chapterId cannot be set twice.");
                  }
                  _loc8_++;
                  this.chapterId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_Event.setJoinPosition cannot be set twice.");
                  }
                  _loc9_++;
                  this.setJoinPosition = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
