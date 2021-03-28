package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_ExitInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ExitInfo_SC";
      
      public static const SIGNIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExitInfo_SC.signIn","signIn",1 << 3 | WireType.VARINT);
      
      public static const PRESENTENERGY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExitInfo_SC.presentEnergy","presentEnergy",2 << 3 | WireType.VARINT);
      
      public static const FRIENDFIGHT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExitInfo_SC.friendFight","friendFight",3 << 3 | WireType.VARINT);
      
      public static const DAILYTD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExitInfo_SC.dailyTD","dailyTD",4 << 3 | WireType.VARINT);
      
      public static const CATCHTHIEF:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExitInfo_SC.catchThief","catchThief",5 << 3 | WireType.VARINT);
      
      public static const PROTECTFARM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExitInfo_SC.protectFarm","protectFarm",6 << 3 | WireType.VARINT);
      
      public static const GUILDFERTILIZATION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExitInfo_SC.guildFertilization","guildFertilization",7 << 3 | WireType.VARINT);
      
      public static const AREAN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExitInfo_SC.arean","arean",8 << 3 | WireType.VARINT);
      
      public static const WORLDBOSS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExitInfo_SC.worldBoss","worldBoss",9 << 3 | WireType.VARINT);
      
      public static const GOLDROOMCOLLECT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExitInfo_SC.goldRoomCollect","goldRoomCollect",10 << 3 | WireType.VARINT);
      
      public static const ZOMBIEISLAND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExitInfo_SC.zombieIsland","zombieIsland",11 << 3 | WireType.VARINT);
      
      public static const TREASUREFORMATION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExitInfo_SC.treasureFormation","treasureFormation",12 << 3 | WireType.VARINT);
      
      public static const TREASURESEIZE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExitInfo_SC.treasureSeize","treasureSeize",13 << 3 | WireType.VARINT);
       
      
      private var signIn$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var presentEnergy$field:uint;
      
      private var friendFight$field:uint;
      
      private var dailyTD$field:uint;
      
      private var catchThief$field:uint;
      
      private var protectFarm$field:uint;
      
      private var guildFertilization$field:uint;
      
      private var arean$field:uint;
      
      private var worldBoss$field:uint;
      
      private var goldRoomCollect$field:uint;
      
      private var zombieIsland$field:uint;
      
      private var treasureFormation$field:uint;
      
      private var treasureSeize$field:uint;
      
      public function Cmd_ExitInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ExitInfo_SC.$MessageID;
      }
      
      public function clearSignIn() : void
      {
         this.hasField$0 &= 4294967294;
         this.signIn$field = new uint();
      }
      
      public function get hasSignIn() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set signIn(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.signIn$field = param1;
      }
      
      public function get signIn() : uint
      {
         return this.signIn$field;
      }
      
      public function clearPresentEnergy() : void
      {
         this.hasField$0 &= 4294967293;
         this.presentEnergy$field = new uint();
      }
      
      public function get hasPresentEnergy() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set presentEnergy(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.presentEnergy$field = param1;
      }
      
      public function get presentEnergy() : uint
      {
         return this.presentEnergy$field;
      }
      
      public function clearFriendFight() : void
      {
         this.hasField$0 &= 4294967291;
         this.friendFight$field = new uint();
      }
      
      public function get hasFriendFight() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set friendFight(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.friendFight$field = param1;
      }
      
      public function get friendFight() : uint
      {
         return this.friendFight$field;
      }
      
      public function clearDailyTD() : void
      {
         this.hasField$0 &= 4294967287;
         this.dailyTD$field = new uint();
      }
      
      public function get hasDailyTD() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set dailyTD(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.dailyTD$field = param1;
      }
      
      public function get dailyTD() : uint
      {
         return this.dailyTD$field;
      }
      
      public function clearCatchThief() : void
      {
         this.hasField$0 &= 4294967279;
         this.catchThief$field = new uint();
      }
      
      public function get hasCatchThief() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set catchThief(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.catchThief$field = param1;
      }
      
      public function get catchThief() : uint
      {
         return this.catchThief$field;
      }
      
      public function clearProtectFarm() : void
      {
         this.hasField$0 &= 4294967263;
         this.protectFarm$field = new uint();
      }
      
      public function get hasProtectFarm() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set protectFarm(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.protectFarm$field = param1;
      }
      
      public function get protectFarm() : uint
      {
         return this.protectFarm$field;
      }
      
      public function clearGuildFertilization() : void
      {
         this.hasField$0 &= 4294967231;
         this.guildFertilization$field = new uint();
      }
      
      public function get hasGuildFertilization() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set guildFertilization(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.guildFertilization$field = param1;
      }
      
      public function get guildFertilization() : uint
      {
         return this.guildFertilization$field;
      }
      
      public function clearArean() : void
      {
         this.hasField$0 &= 4294967167;
         this.arean$field = new uint();
      }
      
      public function get hasArean() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set arean(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.arean$field = param1;
      }
      
      public function get arean() : uint
      {
         return this.arean$field;
      }
      
      public function clearWorldBoss() : void
      {
         this.hasField$0 &= 4294967039;
         this.worldBoss$field = new uint();
      }
      
      public function get hasWorldBoss() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set worldBoss(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.worldBoss$field = param1;
      }
      
      public function get worldBoss() : uint
      {
         return this.worldBoss$field;
      }
      
      public function clearGoldRoomCollect() : void
      {
         this.hasField$0 &= 4294966783;
         this.goldRoomCollect$field = new uint();
      }
      
      public function get hasGoldRoomCollect() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set goldRoomCollect(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.goldRoomCollect$field = param1;
      }
      
      public function get goldRoomCollect() : uint
      {
         return this.goldRoomCollect$field;
      }
      
      public function clearZombieIsland() : void
      {
         this.hasField$0 &= 4294966271;
         this.zombieIsland$field = new uint();
      }
      
      public function get hasZombieIsland() : Boolean
      {
         return (this.hasField$0 & 1024) != 0;
      }
      
      public function set zombieIsland(param1:uint) : void
      {
         this.hasField$0 |= 1024;
         this.zombieIsland$field = param1;
      }
      
      public function get zombieIsland() : uint
      {
         return this.zombieIsland$field;
      }
      
      public function clearTreasureFormation() : void
      {
         this.hasField$0 &= 4294965247;
         this.treasureFormation$field = new uint();
      }
      
      public function get hasTreasureFormation() : Boolean
      {
         return (this.hasField$0 & 2048) != 0;
      }
      
      public function set treasureFormation(param1:uint) : void
      {
         this.hasField$0 |= 2048;
         this.treasureFormation$field = param1;
      }
      
      public function get treasureFormation() : uint
      {
         return this.treasureFormation$field;
      }
      
      public function clearTreasureSeize() : void
      {
         this.hasField$0 &= 4294963199;
         this.treasureSeize$field = new uint();
      }
      
      public function get hasTreasureSeize() : Boolean
      {
         return (this.hasField$0 & 4096) != 0;
      }
      
      public function set treasureSeize(param1:uint) : void
      {
         this.hasField$0 |= 4096;
         this.treasureSeize$field = param1;
      }
      
      public function get treasureSeize() : uint
      {
         return this.treasureSeize$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasSignIn)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.signIn$field);
         }
         if(this.hasPresentEnergy)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.presentEnergy$field);
         }
         if(this.hasFriendFight)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.friendFight$field);
         }
         if(this.hasDailyTD)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.dailyTD$field);
         }
         if(this.hasCatchThief)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.catchThief$field);
         }
         if(this.hasProtectFarm)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.protectFarm$field);
         }
         if(this.hasGuildFertilization)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.guildFertilization$field);
         }
         if(this.hasArean)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.arean$field);
         }
         if(this.hasWorldBoss)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.worldBoss$field);
         }
         if(this.hasGoldRoomCollect)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.goldRoomCollect$field);
         }
         if(this.hasZombieIsland)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.zombieIsland$field);
         }
         if(this.hasTreasureFormation)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.treasureFormation$field);
         }
         if(this.hasTreasureSeize)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_UINT32(param1,this.treasureSeize$field);
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
                     throw new IOError("Bad data format: Cmd_ExitInfo_SC.signIn cannot be set twice.");
                  }
                  _loc3_++;
                  this.signIn = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExitInfo_SC.presentEnergy cannot be set twice.");
                  }
                  _loc4_++;
                  this.presentEnergy = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExitInfo_SC.friendFight cannot be set twice.");
                  }
                  _loc5_++;
                  this.friendFight = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExitInfo_SC.dailyTD cannot be set twice.");
                  }
                  _loc6_++;
                  this.dailyTD = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExitInfo_SC.catchThief cannot be set twice.");
                  }
                  _loc7_++;
                  this.catchThief = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExitInfo_SC.protectFarm cannot be set twice.");
                  }
                  _loc8_++;
                  this.protectFarm = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExitInfo_SC.guildFertilization cannot be set twice.");
                  }
                  _loc9_++;
                  this.guildFertilization = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExitInfo_SC.arean cannot be set twice.");
                  }
                  _loc10_++;
                  this.arean = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExitInfo_SC.worldBoss cannot be set twice.");
                  }
                  _loc11_++;
                  this.worldBoss = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExitInfo_SC.goldRoomCollect cannot be set twice.");
                  }
                  _loc12_++;
                  this.goldRoomCollect = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExitInfo_SC.zombieIsland cannot be set twice.");
                  }
                  _loc13_++;
                  this.zombieIsland = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExitInfo_SC.treasureFormation cannot be set twice.");
                  }
                  _loc14_++;
                  this.treasureFormation = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 13:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExitInfo_SC.treasureSeize cannot be set twice.");
                  }
                  _loc15_++;
                  this.treasureSeize = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc16_);
                  break;
            }
         }
      }
   }
}
