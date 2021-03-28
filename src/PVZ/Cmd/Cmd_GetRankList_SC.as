package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_GetRankList_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GetRankList_SC";
      
      public static const RANKTYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Cmd_GetRankList_SC.ranktype","ranktype",1 << 3 | WireType.VARINT,E_RankType);
      
      public static const PAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GetRankList_SC.page","page",2 << 3 | WireType.VARINT);
      
      public static const RANKNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GetRankList_SC.ranknum","ranknum",3 << 3 | WireType.VARINT);
      
      public static const ROLEFIGHTPOWER:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetRankList_SC.rolefightpower","rolefightpower",4 << 3 | WireType.LENGTH_DELIMITED,Dto_RoleFightPower);
      
      public static const ROLEACHIEVEMENT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetRankList_SC.roleachievement","roleachievement",5 << 3 | WireType.LENGTH_DELIMITED,Dto_RoleAchievement);
      
      public static const GUILDFIGHTPOWER:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetRankList_SC.guildfightpower","guildfightpower",6 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFightPower);
      
      public static const SCREWUPSTAGE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetRankList_SC.screwupstage","screwupstage",7 << 3 | WireType.LENGTH_DELIMITED,Dto_ScrewUpStage);
      
      public static const RANKARENA:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetRankList_SC.rankArena","rankArena",8 << 3 | WireType.LENGTH_DELIMITED,Dto_RankArenaRankInfo);
      
      public static const ROLEPLANTSTAR:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetRankList_SC.roleplantstar","roleplantstar",9 << 3 | WireType.LENGTH_DELIMITED,Dto_RolePlantStar);
      
      public static const GUILDFUBENSINGLEDAMAGE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetRankList_SC.guildFubenSingleDamage","guildFubenSingleDamage",10 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFubenSingleDamage);
      
      public static const GUILDFUBENTOTALDAMAGE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetRankList_SC.guildFubenTotalDamage","guildFubenTotalDamage",11 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFubenTotalDamage);
      
      public static const GUILDFUBENUSEDTIME:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetRankList_SC.guildFubenUsedTime","guildFubenUsedTime",12 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFubenUsedTime);
      
      public static const GUILDFUBENSTAGEDAMAGE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetRankList_SC.guildFubenStageDamage","guildFubenStageDamage",13 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFubenStageDamage);
      
      public static const GUILDFUBENSTAGETIME:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetRankList_SC.guildFubenStageTime","guildFubenStageTime",14 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFubenStageTime);
      
      public static const NEWSCREWUPSTAGE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetRankList_SC.newscrewupstage","newscrewupstage",15 << 3 | WireType.LENGTH_DELIMITED,Dto_NewScrewUpStage);
      
      public static const ALLSERVERROLEPOWER:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetRankList_SC.allServerRolePower","allServerRolePower",101 << 3 | WireType.LENGTH_DELIMITED,Dto_AllServerRolePower);
      
      public static const ALLSERVERNEWSCREWUP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetRankList_SC.allServerNewScrewUp","allServerNewScrewUp",102 << 3 | WireType.LENGTH_DELIMITED,Dto_AllServerNewScrewUp);
      
      public static const ALLSERVERNOENDFUBEN:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetRankList_SC.allServerNoEndFuben","allServerNoEndFuben",103 << 3 | WireType.LENGTH_DELIMITED,Dto_AllServerNoEndFuben);
      
      public static const ALLSERVERPUPPETPOWER:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetRankList_SC.allServerPuppetPower","allServerPuppetPower",104 << 3 | WireType.LENGTH_DELIMITED,Dto_AllServerPuppetPower);
      
      public static const ALLSERVERRANKARENA:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetRankList_SC.allServerRankArena","allServerRankArena",105 << 3 | WireType.LENGTH_DELIMITED,Dto_AllServerRankArena);
       
      
      private var ranktype$field:int;
      
      private var hasField$0:uint = 0;
      
      private var page$field:uint;
      
      private var ranknum$field:uint;
      
      public var rolefightpower:Array;
      
      public var roleachievement:Array;
      
      public var guildfightpower:Array;
      
      public var screwupstage:Array;
      
      public var rankArena:Array;
      
      public var roleplantstar:Array;
      
      public var guildFubenSingleDamage:Array;
      
      public var guildFubenTotalDamage:Array;
      
      public var guildFubenUsedTime:Array;
      
      public var guildFubenStageDamage:Array;
      
      public var guildFubenStageTime:Array;
      
      public var newscrewupstage:Array;
      
      public var allServerRolePower:Array;
      
      public var allServerNewScrewUp:Array;
      
      public var allServerNoEndFuben:Array;
      
      public var allServerPuppetPower:Array;
      
      public var allServerRankArena:Array;
      
      public function Cmd_GetRankList_SC()
      {
         this.rolefightpower = [];
         this.roleachievement = [];
         this.guildfightpower = [];
         this.screwupstage = [];
         this.rankArena = [];
         this.roleplantstar = [];
         this.guildFubenSingleDamage = [];
         this.guildFubenTotalDamage = [];
         this.guildFubenUsedTime = [];
         this.guildFubenStageDamage = [];
         this.guildFubenStageTime = [];
         this.newscrewupstage = [];
         this.allServerRolePower = [];
         this.allServerNewScrewUp = [];
         this.allServerNoEndFuben = [];
         this.allServerPuppetPower = [];
         this.allServerRankArena = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GetRankList_SC.$MessageID;
      }
      
      public function clearRanktype() : void
      {
         this.hasField$0 &= 4294967294;
         this.ranktype$field = new int();
      }
      
      public function get hasRanktype() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set ranktype(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.ranktype$field = param1;
      }
      
      public function get ranktype() : int
      {
         return this.ranktype$field;
      }
      
      public function clearPage() : void
      {
         this.hasField$0 &= 4294967293;
         this.page$field = new uint();
      }
      
      public function get hasPage() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set page(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.page$field = param1;
      }
      
      public function get page() : uint
      {
         return this.page$field;
      }
      
      public function clearRanknum() : void
      {
         this.hasField$0 &= 4294967291;
         this.ranknum$field = new uint();
      }
      
      public function get hasRanknum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set ranknum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.ranknum$field = param1;
      }
      
      public function get ranknum() : uint
      {
         return this.ranknum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc19_:* = undefined;
         if(this.hasRanktype)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_ENUM(param1,this.ranktype$field);
         }
         if(this.hasPage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.page$field);
         }
         if(this.hasRanknum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.ranknum$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.rolefightpower.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rolefightpower[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.roleachievement.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.roleachievement[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.guildfightpower.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildfightpower[_loc4_]);
            _loc4_++;
         }
         var _loc5_:uint = 0;
         while(_loc5_ < this.screwupstage.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.screwupstage[_loc5_]);
            _loc5_++;
         }
         var _loc6_:uint = 0;
         while(_loc6_ < this.rankArena.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rankArena[_loc6_]);
            _loc6_++;
         }
         var _loc7_:uint = 0;
         while(_loc7_ < this.roleplantstar.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.roleplantstar[_loc7_]);
            _loc7_++;
         }
         var _loc8_:uint = 0;
         while(_loc8_ < this.guildFubenSingleDamage.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildFubenSingleDamage[_loc8_]);
            _loc8_++;
         }
         var _loc9_:uint = 0;
         while(_loc9_ < this.guildFubenTotalDamage.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,11);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildFubenTotalDamage[_loc9_]);
            _loc9_++;
         }
         var _loc10_:uint = 0;
         while(_loc10_ < this.guildFubenUsedTime.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,12);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildFubenUsedTime[_loc10_]);
            _loc10_++;
         }
         var _loc11_:uint = 0;
         while(_loc11_ < this.guildFubenStageDamage.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,13);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildFubenStageDamage[_loc11_]);
            _loc11_++;
         }
         var _loc12_:uint = 0;
         while(_loc12_ < this.guildFubenStageTime.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,14);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildFubenStageTime[_loc12_]);
            _loc12_++;
         }
         var _loc13_:uint = 0;
         while(_loc13_ < this.newscrewupstage.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,15);
            WriteUtils.write$TYPE_MESSAGE(param1,this.newscrewupstage[_loc13_]);
            _loc13_++;
         }
         var _loc14_:uint = 0;
         while(_loc14_ < this.allServerRolePower.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,101);
            WriteUtils.write$TYPE_MESSAGE(param1,this.allServerRolePower[_loc14_]);
            _loc14_++;
         }
         var _loc15_:uint = 0;
         while(_loc15_ < this.allServerNewScrewUp.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,102);
            WriteUtils.write$TYPE_MESSAGE(param1,this.allServerNewScrewUp[_loc15_]);
            _loc15_++;
         }
         var _loc16_:uint = 0;
         while(_loc16_ < this.allServerNoEndFuben.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,103);
            WriteUtils.write$TYPE_MESSAGE(param1,this.allServerNoEndFuben[_loc16_]);
            _loc16_++;
         }
         var _loc17_:uint = 0;
         while(_loc17_ < this.allServerPuppetPower.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,104);
            WriteUtils.write$TYPE_MESSAGE(param1,this.allServerPuppetPower[_loc17_]);
            _loc17_++;
         }
         var _loc18_:uint = 0;
         while(_loc18_ < this.allServerRankArena.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,105);
            WriteUtils.write$TYPE_MESSAGE(param1,this.allServerRankArena[_loc18_]);
            _loc18_++;
         }
         for(_loc19_ in this)
         {
            super.writeUnknown(param1,_loc19_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetRankList_SC.ranktype cannot be set twice.");
                  }
                  _loc3_++;
                  this.ranktype = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetRankList_SC.page cannot be set twice.");
                  }
                  _loc4_++;
                  this.page = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetRankList_SC.ranknum cannot be set twice.");
                  }
                  _loc5_++;
                  this.ranknum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  this.rolefightpower.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_RoleFightPower()));
                  break;
               case 5:
                  this.roleachievement.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_RoleAchievement()));
                  break;
               case 6:
                  this.guildfightpower.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_GuildFightPower()));
                  break;
               case 7:
                  this.screwupstage.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ScrewUpStage()));
                  break;
               case 8:
                  this.rankArena.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_RankArenaRankInfo()));
                  break;
               case 9:
                  this.roleplantstar.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_RolePlantStar()));
                  break;
               case 10:
                  this.guildFubenSingleDamage.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_GuildFubenSingleDamage()));
                  break;
               case 11:
                  this.guildFubenTotalDamage.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_GuildFubenTotalDamage()));
                  break;
               case 12:
                  this.guildFubenUsedTime.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_GuildFubenUsedTime()));
                  break;
               case 13:
                  this.guildFubenStageDamage.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_GuildFubenStageDamage()));
                  break;
               case 14:
                  this.guildFubenStageTime.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_GuildFubenStageTime()));
                  break;
               case 15:
                  this.newscrewupstage.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_NewScrewUpStage()));
                  break;
               case 101:
                  this.allServerRolePower.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_AllServerRolePower()));
                  break;
               case 102:
                  this.allServerNewScrewUp.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_AllServerNewScrewUp()));
                  break;
               case 103:
                  this.allServerNoEndFuben.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_AllServerNoEndFuben()));
                  break;
               case 104:
                  this.allServerPuppetPower.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_AllServerPuppetPower()));
                  break;
               case 105:
                  this.allServerRankArena.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_AllServerRankArena()));
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
