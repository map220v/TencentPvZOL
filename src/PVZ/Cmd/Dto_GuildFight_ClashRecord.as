package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_GuildFight_ClashRecord extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_GuildFight_ClashRecord";
      
      public static const GUILDID1:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_GuildFight_ClashRecord.guildId1","guildId1",1 << 3 | WireType.VARINT);
      
      public static const ROLEID1:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_GuildFight_ClashRecord.roleId1","roleId1",2 << 3 | WireType.VARINT);
      
      public static const ROLENAME1:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_GuildFight_ClashRecord.roleName1","roleName1",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const FORMATIONINDEX1:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_GuildFight_ClashRecord.formationIndex1","formationIndex1",4 << 3 | WireType.VARINT);
      
      public static const CYCLES1:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_GuildFight_ClashRecord.cycles1","cycles1",5 << 3 | WireType.VARINT);
      
      public static const GUILDID2:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_GuildFight_ClashRecord.guildId2","guildId2",6 << 3 | WireType.VARINT);
      
      public static const ROLENAME2:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_GuildFight_ClashRecord.roleName2","roleName2",7 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ROLEID2:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_GuildFight_ClashRecord.roleId2","roleId2",8 << 3 | WireType.VARINT);
      
      public static const FORMATIONINDEX2:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_GuildFight_ClashRecord.formationIndex2","formationIndex2",9 << 3 | WireType.VARINT);
      
      public static const CYCLES2:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_GuildFight_ClashRecord.cycles2","cycles2",10 << 3 | WireType.VARINT);
      
      public static const EARLYGUILDINDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_GuildFight_ClashRecord.earlyGuildIndex","earlyGuildIndex",11 << 3 | WireType.VARINT);
      
      public static const GUILD1STATE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_GuildFight_ClashRecord.guild1State","guild1State",12 << 3 | WireType.VARINT);
      
      public static const REPORTID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_GuildFight_ClashRecord.reportId","reportId",13 << 3 | WireType.VARINT);
       
      
      private var guildId1$field:Int64;
      
      private var roleId1$field:Int64;
      
      private var roleName1$field:String;
      
      private var formationIndex1$field:int;
      
      private var hasField$0:uint = 0;
      
      private var cycles1$field:int;
      
      private var guildId2$field:Int64;
      
      private var roleName2$field:String;
      
      private var roleId2$field:Int64;
      
      private var formationIndex2$field:int;
      
      private var cycles2$field:int;
      
      private var earlyGuildIndex$field:int;
      
      private var guild1State$field:int;
      
      private var reportId$field:Int64;
      
      public function Dto_GuildFight_ClashRecord()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_GuildFight_ClashRecord.$MessageID;
      }
      
      public function clearGuildId1() : void
      {
         this.guildId1$field = null;
      }
      
      public function get hasGuildId1() : Boolean
      {
         return this.guildId1$field != null;
      }
      
      public function set guildId1(param1:Int64) : void
      {
         this.guildId1$field = param1;
      }
      
      public function get guildId1() : Int64
      {
         return this.guildId1$field;
      }
      
      public function clearRoleId1() : void
      {
         this.roleId1$field = null;
      }
      
      public function get hasRoleId1() : Boolean
      {
         return this.roleId1$field != null;
      }
      
      public function set roleId1(param1:Int64) : void
      {
         this.roleId1$field = param1;
      }
      
      public function get roleId1() : Int64
      {
         return this.roleId1$field;
      }
      
      public function clearRoleName1() : void
      {
         this.roleName1$field = null;
      }
      
      public function get hasRoleName1() : Boolean
      {
         return this.roleName1$field != null;
      }
      
      public function set roleName1(param1:String) : void
      {
         this.roleName1$field = param1;
      }
      
      public function get roleName1() : String
      {
         return this.roleName1$field;
      }
      
      public function clearFormationIndex1() : void
      {
         this.hasField$0 &= 4294967294;
         this.formationIndex1$field = new int();
      }
      
      public function get hasFormationIndex1() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set formationIndex1(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.formationIndex1$field = param1;
      }
      
      public function get formationIndex1() : int
      {
         return this.formationIndex1$field;
      }
      
      public function clearCycles1() : void
      {
         this.hasField$0 &= 4294967293;
         this.cycles1$field = new int();
      }
      
      public function get hasCycles1() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set cycles1(param1:int) : void
      {
         this.hasField$0 |= 2;
         this.cycles1$field = param1;
      }
      
      public function get cycles1() : int
      {
         return this.cycles1$field;
      }
      
      public function clearGuildId2() : void
      {
         this.guildId2$field = null;
      }
      
      public function get hasGuildId2() : Boolean
      {
         return this.guildId2$field != null;
      }
      
      public function set guildId2(param1:Int64) : void
      {
         this.guildId2$field = param1;
      }
      
      public function get guildId2() : Int64
      {
         return this.guildId2$field;
      }
      
      public function clearRoleName2() : void
      {
         this.roleName2$field = null;
      }
      
      public function get hasRoleName2() : Boolean
      {
         return this.roleName2$field != null;
      }
      
      public function set roleName2(param1:String) : void
      {
         this.roleName2$field = param1;
      }
      
      public function get roleName2() : String
      {
         return this.roleName2$field;
      }
      
      public function clearRoleId2() : void
      {
         this.roleId2$field = null;
      }
      
      public function get hasRoleId2() : Boolean
      {
         return this.roleId2$field != null;
      }
      
      public function set roleId2(param1:Int64) : void
      {
         this.roleId2$field = param1;
      }
      
      public function get roleId2() : Int64
      {
         return this.roleId2$field;
      }
      
      public function clearFormationIndex2() : void
      {
         this.hasField$0 &= 4294967291;
         this.formationIndex2$field = new int();
      }
      
      public function get hasFormationIndex2() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set formationIndex2(param1:int) : void
      {
         this.hasField$0 |= 4;
         this.formationIndex2$field = param1;
      }
      
      public function get formationIndex2() : int
      {
         return this.formationIndex2$field;
      }
      
      public function clearCycles2() : void
      {
         this.hasField$0 &= 4294967287;
         this.cycles2$field = new int();
      }
      
      public function get hasCycles2() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set cycles2(param1:int) : void
      {
         this.hasField$0 |= 8;
         this.cycles2$field = param1;
      }
      
      public function get cycles2() : int
      {
         return this.cycles2$field;
      }
      
      public function clearEarlyGuildIndex() : void
      {
         this.hasField$0 &= 4294967279;
         this.earlyGuildIndex$field = new int();
      }
      
      public function get hasEarlyGuildIndex() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set earlyGuildIndex(param1:int) : void
      {
         this.hasField$0 |= 16;
         this.earlyGuildIndex$field = param1;
      }
      
      public function get earlyGuildIndex() : int
      {
         return this.earlyGuildIndex$field;
      }
      
      public function clearGuild1State() : void
      {
         this.hasField$0 &= 4294967263;
         this.guild1State$field = new int();
      }
      
      public function get hasGuild1State() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set guild1State(param1:int) : void
      {
         this.hasField$0 |= 32;
         this.guild1State$field = param1;
      }
      
      public function get guild1State() : int
      {
         return this.guild1State$field;
      }
      
      public function clearReportId() : void
      {
         this.reportId$field = null;
      }
      
      public function get hasReportId() : Boolean
      {
         return this.reportId$field != null;
      }
      
      public function set reportId(param1:Int64) : void
      {
         this.reportId$field = param1;
      }
      
      public function get reportId() : Int64
      {
         return this.reportId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasGuildId1)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.guildId1$field);
         }
         if(this.hasRoleId1)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.roleId1$field);
         }
         if(this.hasRoleName1)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.roleName1$field);
         }
         if(this.hasFormationIndex1)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_INT32(param1,this.formationIndex1$field);
         }
         if(this.hasCycles1)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_INT32(param1,this.cycles1$field);
         }
         if(this.hasGuildId2)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_INT64(param1,this.guildId2$field);
         }
         if(this.hasRoleName2)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_STRING(param1,this.roleName2$field);
         }
         if(this.hasRoleId2)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_INT64(param1,this.roleId2$field);
         }
         if(this.hasFormationIndex2)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_INT32(param1,this.formationIndex2$field);
         }
         if(this.hasCycles2)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_INT32(param1,this.cycles2$field);
         }
         if(this.hasEarlyGuildIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_INT32(param1,this.earlyGuildIndex$field);
         }
         if(this.hasGuild1State)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_INT32(param1,this.guild1State$field);
         }
         if(this.hasReportId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_INT64(param1,this.reportId$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc16_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         var _loc13_:uint = 0;
         var _loc14_:uint = 0;
         var _loc15_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc16_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc16_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_ClashRecord.guildId1 cannot be set twice.");
                  }
                  _loc3_++;
                  this.guildId1 = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_ClashRecord.roleId1 cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleId1 = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_ClashRecord.roleName1 cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleName1 = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_ClashRecord.formationIndex1 cannot be set twice.");
                  }
                  _loc6_++;
                  this.formationIndex1 = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_ClashRecord.cycles1 cannot be set twice.");
                  }
                  _loc7_++;
                  this.cycles1 = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_ClashRecord.guildId2 cannot be set twice.");
                  }
                  _loc8_++;
                  this.guildId2 = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_ClashRecord.roleName2 cannot be set twice.");
                  }
                  _loc9_++;
                  this.roleName2 = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_ClashRecord.roleId2 cannot be set twice.");
                  }
                  _loc10_++;
                  this.roleId2 = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_ClashRecord.formationIndex2 cannot be set twice.");
                  }
                  _loc11_++;
                  this.formationIndex2 = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_ClashRecord.cycles2 cannot be set twice.");
                  }
                  _loc12_++;
                  this.cycles2 = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_ClashRecord.earlyGuildIndex cannot be set twice.");
                  }
                  _loc13_++;
                  this.earlyGuildIndex = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 12:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_ClashRecord.guild1State cannot be set twice.");
                  }
                  _loc14_++;
                  this.guild1State = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 13:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_ClashRecord.reportId cannot be set twice.");
                  }
                  _loc15_++;
                  this.reportId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc16_);
                  break;
            }
         }
      }
   }
}
