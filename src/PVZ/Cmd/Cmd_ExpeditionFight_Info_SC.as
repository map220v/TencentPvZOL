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
   
   public final class Cmd_ExpeditionFight_Info_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ExpeditionFight_Info_SC";
      
      public static const SECTIONID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Info_SC.sectionId","sectionId",1 << 3 | WireType.VARINT);
      
      public static const BEGINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Info_SC.beginTime","beginTime",2 << 3 | WireType.VARINT);
      
      public static const STAGETYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Info_SC.stageType","stageType",3 << 3 | WireType.VARINT);
      
      public static const BFIGHTING:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_ExpeditionFight_Info_SC.bFighting","bFighting",4 << 3 | WireType.VARINT);
      
      public static const SIDE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_Info_SC.side","side",5 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightSideInfo);
      
      public static const HASTAKEREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_ExpeditionFight_Info_SC.hasTakeReward","hasTakeReward",6 << 3 | WireType.VARINT);
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_Info_SC.reward","reward",7 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const SIDEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Info_SC.sideId","sideId",8 << 3 | WireType.VARINT);
      
      public static const SIDEZONE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_Info_SC.sideZone","sideZone",9 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightSideZoneInfo);
      
      public static const ROLEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_Info_SC.roleInfo","roleInfo",10 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightSignUpRoleInfo);
       
      
      private var sectionId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var beginTime$field:uint;
      
      private var stageType$field:uint;
      
      private var bFighting$field:Boolean;
      
      public var side:Array;
      
      private var hasTakeReward$field:Boolean;
      
      public var reward:Array;
      
      private var sideId$field:uint;
      
      public var sideZone:Array;
      
      private var roleInfo$field:Dto_ExpeditionFightSignUpRoleInfo;
      
      public function Cmd_ExpeditionFight_Info_SC()
      {
         this.side = [];
         this.reward = [];
         this.sideZone = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ExpeditionFight_Info_SC.$MessageID;
      }
      
      public function clearSectionId() : void
      {
         this.hasField$0 &= 4294967294;
         this.sectionId$field = new uint();
      }
      
      public function get hasSectionId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set sectionId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.sectionId$field = param1;
      }
      
      public function get sectionId() : uint
      {
         return this.sectionId$field;
      }
      
      public function clearBeginTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.beginTime$field = new uint();
      }
      
      public function get hasBeginTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set beginTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.beginTime$field = param1;
      }
      
      public function get beginTime() : uint
      {
         return this.beginTime$field;
      }
      
      public function clearStageType() : void
      {
         this.hasField$0 &= 4294967291;
         this.stageType$field = new uint();
      }
      
      public function get hasStageType() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set stageType(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.stageType$field = param1;
      }
      
      public function get stageType() : uint
      {
         return this.stageType$field;
      }
      
      public function clearBFighting() : void
      {
         this.hasField$0 &= 4294967287;
         this.bFighting$field = new Boolean();
      }
      
      public function get hasBFighting() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set bFighting(param1:Boolean) : void
      {
         this.hasField$0 |= 8;
         this.bFighting$field = param1;
      }
      
      public function get bFighting() : Boolean
      {
         return this.bFighting$field;
      }
      
      public function clearHasTakeReward() : void
      {
         this.hasField$0 &= 4294967279;
         this.hasTakeReward$field = new Boolean();
      }
      
      public function get hasHasTakeReward() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set hasTakeReward(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.hasTakeReward$field = param1;
      }
      
      public function get hasTakeReward() : Boolean
      {
         return this.hasTakeReward$field;
      }
      
      public function clearSideId() : void
      {
         this.hasField$0 &= 4294967263;
         this.sideId$field = new uint();
      }
      
      public function get hasSideId() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set sideId(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.sideId$field = param1;
      }
      
      public function get sideId() : uint
      {
         return this.sideId$field;
      }
      
      public function clearRoleInfo() : void
      {
         this.roleInfo$field = null;
      }
      
      public function get hasRoleInfo() : Boolean
      {
         return this.roleInfo$field != null;
      }
      
      public function set roleInfo(param1:Dto_ExpeditionFightSignUpRoleInfo) : void
      {
         this.roleInfo$field = param1;
      }
      
      public function get roleInfo() : Dto_ExpeditionFightSignUpRoleInfo
      {
         return this.roleInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         if(this.hasSectionId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.sectionId$field);
         }
         if(this.hasBeginTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.beginTime$field);
         }
         if(this.hasStageType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.stageType$field);
         }
         if(this.hasBFighting)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.bFighting$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.side.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.side[_loc2_]);
            _loc2_++;
         }
         if(this.hasHasTakeReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_BOOL(param1,this.hasTakeReward$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc3_]);
            _loc3_++;
         }
         if(this.hasSideId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.sideId$field);
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.sideZone.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.sideZone[_loc4_]);
            _loc4_++;
         }
         if(this.hasRoleInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.roleInfo$field);
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
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
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Info_SC.sectionId cannot be set twice.");
                  }
                  _loc3_++;
                  this.sectionId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Info_SC.beginTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.beginTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Info_SC.stageType cannot be set twice.");
                  }
                  _loc5_++;
                  this.stageType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Info_SC.bFighting cannot be set twice.");
                  }
                  _loc6_++;
                  this.bFighting = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 5:
                  this.side.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ExpeditionFightSideInfo()));
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Info_SC.hasTakeReward cannot be set twice.");
                  }
                  _loc7_++;
                  this.hasTakeReward = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 7:
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 8:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Info_SC.sideId cannot be set twice.");
                  }
                  _loc8_++;
                  this.sideId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  this.sideZone.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ExpeditionFightSideZoneInfo()));
                  break;
               case 10:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Info_SC.roleInfo cannot be set twice.");
                  }
                  _loc9_++;
                  this.roleInfo = new Dto_ExpeditionFightSignUpRoleInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.roleInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
