package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_GuildFight_SyncKnockoutFight_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GuildFight_SyncKnockoutFight_SC";
      
      public static const WAYFIGHTINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GuildFight_SyncKnockoutFight_SC.wayFightInfo","wayFightInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFight_KnockoutFightInfo);
      
      public static const LEFTGUILDSTATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFight_SyncKnockoutFight_SC.leftGuildState","leftGuildState",2 << 3 | WireType.VARINT);
      
      public static const CYCLES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFight_SyncKnockoutFight_SC.cycles","cycles",3 << 3 | WireType.VARINT);
      
      public static const CANSETCYCLES:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_GuildFight_SyncKnockoutFight_SC.canSetCycles","canSetCycles",4 << 3 | WireType.VARINT);
      
      public static const LEFTGUILDINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GuildFight_SyncKnockoutFight_SC.leftGuildInfo","leftGuildInfo",5 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFight_GuildInfo);
      
      public static const RIGHTGUILDINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GuildFight_SyncKnockoutFight_SC.rightGuildInfo","rightGuildInfo",6 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFight_GuildInfo);
       
      
      public var wayFightInfo:Array;
      
      private var leftGuildState$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var cycles$field:uint;
      
      private var canSetCycles$field:Boolean;
      
      private var leftGuildInfo$field:Dto_GuildFight_GuildInfo;
      
      private var rightGuildInfo$field:Dto_GuildFight_GuildInfo;
      
      public function Cmd_GuildFight_SyncKnockoutFight_SC()
      {
         this.wayFightInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GuildFight_SyncKnockoutFight_SC.$MessageID;
      }
      
      public function clearLeftGuildState() : void
      {
         this.hasField$0 &= 4294967294;
         this.leftGuildState$field = new uint();
      }
      
      public function get hasLeftGuildState() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set leftGuildState(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.leftGuildState$field = param1;
      }
      
      public function get leftGuildState() : uint
      {
         return this.leftGuildState$field;
      }
      
      public function clearCycles() : void
      {
         this.hasField$0 &= 4294967293;
         this.cycles$field = new uint();
      }
      
      public function get hasCycles() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set cycles(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.cycles$field = param1;
      }
      
      public function get cycles() : uint
      {
         return this.cycles$field;
      }
      
      public function clearCanSetCycles() : void
      {
         this.hasField$0 &= 4294967291;
         this.canSetCycles$field = new Boolean();
      }
      
      public function get hasCanSetCycles() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set canSetCycles(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.canSetCycles$field = param1;
      }
      
      public function get canSetCycles() : Boolean
      {
         return this.canSetCycles$field;
      }
      
      public function clearLeftGuildInfo() : void
      {
         this.leftGuildInfo$field = null;
      }
      
      public function get hasLeftGuildInfo() : Boolean
      {
         return this.leftGuildInfo$field != null;
      }
      
      public function set leftGuildInfo(param1:Dto_GuildFight_GuildInfo) : void
      {
         this.leftGuildInfo$field = param1;
      }
      
      public function get leftGuildInfo() : Dto_GuildFight_GuildInfo
      {
         return this.leftGuildInfo$field;
      }
      
      public function clearRightGuildInfo() : void
      {
         this.rightGuildInfo$field = null;
      }
      
      public function get hasRightGuildInfo() : Boolean
      {
         return this.rightGuildInfo$field != null;
      }
      
      public function set rightGuildInfo(param1:Dto_GuildFight_GuildInfo) : void
      {
         this.rightGuildInfo$field = param1;
      }
      
      public function get rightGuildInfo() : Dto_GuildFight_GuildInfo
      {
         return this.rightGuildInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.wayFightInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.wayFightInfo[_loc2_]);
            _loc2_++;
         }
         if(this.hasLeftGuildState)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.leftGuildState$field);
         }
         if(this.hasCycles)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.cycles$field);
         }
         if(this.hasCanSetCycles)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.canSetCycles$field);
         }
         if(this.hasLeftGuildInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.leftGuildInfo$field);
         }
         if(this.hasRightGuildInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rightGuildInfo$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  this.wayFightInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_GuildFight_KnockoutFightInfo()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SyncKnockoutFight_SC.leftGuildState cannot be set twice.");
                  }
                  _loc3_++;
                  this.leftGuildState = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SyncKnockoutFight_SC.cycles cannot be set twice.");
                  }
                  _loc4_++;
                  this.cycles = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SyncKnockoutFight_SC.canSetCycles cannot be set twice.");
                  }
                  _loc5_++;
                  this.canSetCycles = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SyncKnockoutFight_SC.leftGuildInfo cannot be set twice.");
                  }
                  _loc6_++;
                  this.leftGuildInfo = new Dto_GuildFight_GuildInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.leftGuildInfo);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SyncKnockoutFight_SC.rightGuildInfo cannot be set twice.");
                  }
                  _loc7_++;
                  this.rightGuildInfo = new Dto_GuildFight_GuildInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.rightGuildInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
