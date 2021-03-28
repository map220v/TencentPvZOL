package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_WorldMap_CellInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_WorldMap_CellInfo";
      
      public static const TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldMap_CellInfo.type","type",1 << 3 | WireType.VARINT);
      
      public static const POS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_WorldMap_CellInfo.pos","pos",2 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_WorldMap_CellInfo.roleId","roleId",3 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_WorldMap_CellInfo.roleName","roleName",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const WARSTATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldMap_CellInfo.warState","warState",5 << 3 | WireType.VARINT);
      
      public static const STATEENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldMap_CellInfo.stateEndTime","stateEndTime",6 << 3 | WireType.VARINT);
      
      public static const AVATAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldMap_CellInfo.avatar","avatar",7 << 3 | WireType.VARINT);
      
      public static const WARFREE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldMap_CellInfo.warFree","warFree",8 << 3 | WireType.VARINT);
      
      public static const WARFREEENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldMap_CellInfo.warFreeEndTime","warFreeEndTime",9 << 3 | WireType.VARINT);
      
      public static const MINECAR:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_WorldMap_CellInfo.mineCar","mineCar",10 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_MineCar);
      
      public static const GUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_WorldMap_CellInfo.guildId","guildId",11 << 3 | WireType.VARINT);
      
      public static const GUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_WorldMap_CellInfo.guildName","guildName",12 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const GUILDFLAG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_WorldMap_CellInfo.guildFlag","guildFlag",13 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_FlagInfo);
      
      public static const ENEMYFLAG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_WorldMap_CellInfo.enemyFlag","enemyFlag",14 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_FlagInfo);
      
      public static const AREA:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldMap_CellInfo.area","area",15 << 3 | WireType.VARINT);
      
      public static const DIAMOND:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_WorldMap_CellInfo.diamond","diamond",16 << 3 | WireType.LENGTH_DELIMITED,Dto_DiamondInfo);
      
      public static const MINESTATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldMap_CellInfo.mineState","mineState",30 << 3 | WireType.VARINT);
      
      public static const TEMPLEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldMap_CellInfo.templeId","templeId",50 << 3 | WireType.VARINT);
       
      
      private var type$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var pos$field:Dto_WorldMap_Pos;
      
      private var roleId$field:Int64;
      
      private var roleName$field:String;
      
      private var warState$field:uint;
      
      private var stateEndTime$field:uint;
      
      private var avatar$field:uint;
      
      private var warFree$field:uint;
      
      private var warFreeEndTime$field:uint;
      
      public var mineCar:Array;
      
      private var guildId$field:Int64;
      
      private var guildName$field:String;
      
      private var guildFlag$field:Dto_Guild_FlagInfo;
      
      private var enemyFlag$field:Dto_Guild_FlagInfo;
      
      private var area$field:uint;
      
      private var diamond$field:Dto_DiamondInfo;
      
      private var mineState$field:uint;
      
      private var templeId$field:uint;
      
      public function Dto_WorldMap_CellInfo()
      {
         this.mineCar = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_WorldMap_CellInfo.$MessageID;
      }
      
      public function clearType() : void
      {
         this.hasField$0 &= 4294967294;
         this.type$field = new uint();
      }
      
      public function get hasType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set type(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.type$field = param1;
      }
      
      public function get type() : uint
      {
         return this.type$field;
      }
      
      public function clearPos() : void
      {
         this.pos$field = null;
      }
      
      public function get hasPos() : Boolean
      {
         return this.pos$field != null;
      }
      
      public function set pos(param1:Dto_WorldMap_Pos) : void
      {
         this.pos$field = param1;
      }
      
      public function get pos() : Dto_WorldMap_Pos
      {
         return this.pos$field;
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
      
      public function clearWarState() : void
      {
         this.hasField$0 &= 4294967293;
         this.warState$field = new uint();
      }
      
      public function get hasWarState() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set warState(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.warState$field = param1;
      }
      
      public function get warState() : uint
      {
         return this.warState$field;
      }
      
      public function clearStateEndTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.stateEndTime$field = new uint();
      }
      
      public function get hasStateEndTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set stateEndTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.stateEndTime$field = param1;
      }
      
      public function get stateEndTime() : uint
      {
         return this.stateEndTime$field;
      }
      
      public function clearAvatar() : void
      {
         this.hasField$0 &= 4294967287;
         this.avatar$field = new uint();
      }
      
      public function get hasAvatar() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set avatar(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.avatar$field = param1;
      }
      
      public function get avatar() : uint
      {
         return this.avatar$field;
      }
      
      public function clearWarFree() : void
      {
         this.hasField$0 &= 4294967279;
         this.warFree$field = new uint();
      }
      
      public function get hasWarFree() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set warFree(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.warFree$field = param1;
      }
      
      public function get warFree() : uint
      {
         return this.warFree$field;
      }
      
      public function clearWarFreeEndTime() : void
      {
         this.hasField$0 &= 4294967263;
         this.warFreeEndTime$field = new uint();
      }
      
      public function get hasWarFreeEndTime() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set warFreeEndTime(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.warFreeEndTime$field = param1;
      }
      
      public function get warFreeEndTime() : uint
      {
         return this.warFreeEndTime$field;
      }
      
      public function clearGuildId() : void
      {
         this.guildId$field = null;
      }
      
      public function get hasGuildId() : Boolean
      {
         return this.guildId$field != null;
      }
      
      public function set guildId(param1:Int64) : void
      {
         this.guildId$field = param1;
      }
      
      public function get guildId() : Int64
      {
         return this.guildId$field;
      }
      
      public function clearGuildName() : void
      {
         this.guildName$field = null;
      }
      
      public function get hasGuildName() : Boolean
      {
         return this.guildName$field != null;
      }
      
      public function set guildName(param1:String) : void
      {
         this.guildName$field = param1;
      }
      
      public function get guildName() : String
      {
         return this.guildName$field;
      }
      
      public function clearGuildFlag() : void
      {
         this.guildFlag$field = null;
      }
      
      public function get hasGuildFlag() : Boolean
      {
         return this.guildFlag$field != null;
      }
      
      public function set guildFlag(param1:Dto_Guild_FlagInfo) : void
      {
         this.guildFlag$field = param1;
      }
      
      public function get guildFlag() : Dto_Guild_FlagInfo
      {
         return this.guildFlag$field;
      }
      
      public function clearEnemyFlag() : void
      {
         this.enemyFlag$field = null;
      }
      
      public function get hasEnemyFlag() : Boolean
      {
         return this.enemyFlag$field != null;
      }
      
      public function set enemyFlag(param1:Dto_Guild_FlagInfo) : void
      {
         this.enemyFlag$field = param1;
      }
      
      public function get enemyFlag() : Dto_Guild_FlagInfo
      {
         return this.enemyFlag$field;
      }
      
      public function clearArea() : void
      {
         this.hasField$0 &= 4294967231;
         this.area$field = new uint();
      }
      
      public function get hasArea() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set area(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.area$field = param1;
      }
      
      public function get area() : uint
      {
         return this.area$field;
      }
      
      public function clearDiamond() : void
      {
         this.diamond$field = null;
      }
      
      public function get hasDiamond() : Boolean
      {
         return this.diamond$field != null;
      }
      
      public function set diamond(param1:Dto_DiamondInfo) : void
      {
         this.diamond$field = param1;
      }
      
      public function get diamond() : Dto_DiamondInfo
      {
         return this.diamond$field;
      }
      
      public function clearMineState() : void
      {
         this.hasField$0 &= 4294967167;
         this.mineState$field = new uint();
      }
      
      public function get hasMineState() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set mineState(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.mineState$field = param1;
      }
      
      public function get mineState() : uint
      {
         return this.mineState$field;
      }
      
      public function clearTempleId() : void
      {
         this.hasField$0 &= 4294967039;
         this.templeId$field = new uint();
      }
      
      public function get hasTempleId() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set templeId(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.templeId$field = param1;
      }
      
      public function get templeId() : uint
      {
         return this.templeId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.type$field);
         }
         if(this.hasPos)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.pos$field);
         }
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasWarState)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.warState$field);
         }
         if(this.hasStateEndTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.stateEndTime$field);
         }
         if(this.hasAvatar)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.avatar$field);
         }
         if(this.hasWarFree)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.warFree$field);
         }
         if(this.hasWarFreeEndTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.warFreeEndTime$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.mineCar.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.mineCar[_loc2_]);
            _loc2_++;
         }
         if(this.hasGuildId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_INT64(param1,this.guildId$field);
         }
         if(this.hasGuildName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,12);
            WriteUtils.write$TYPE_STRING(param1,this.guildName$field);
         }
         if(this.hasGuildFlag)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,13);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildFlag$field);
         }
         if(this.hasEnemyFlag)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,14);
            WriteUtils.write$TYPE_MESSAGE(param1,this.enemyFlag$field);
         }
         if(this.hasArea)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,15);
            WriteUtils.write$TYPE_UINT32(param1,this.area$field);
         }
         if(this.hasDiamond)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,16);
            WriteUtils.write$TYPE_MESSAGE(param1,this.diamond$field);
         }
         if(this.hasMineState)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,30);
            WriteUtils.write$TYPE_UINT32(param1,this.mineState$field);
         }
         if(this.hasTempleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,50);
            WriteUtils.write$TYPE_UINT32(param1,this.templeId$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc20_:uint = 0;
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
         var _loc16_:uint = 0;
         var _loc17_:uint = 0;
         var _loc18_:uint = 0;
         var _loc19_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc20_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc20_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_CellInfo.type cannot be set twice.");
                  }
                  _loc3_++;
                  this.type = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_CellInfo.pos cannot be set twice.");
                  }
                  _loc4_++;
                  this.pos = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.pos);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_CellInfo.roleId cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_CellInfo.roleName cannot be set twice.");
                  }
                  _loc6_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_CellInfo.warState cannot be set twice.");
                  }
                  _loc7_++;
                  this.warState = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_CellInfo.stateEndTime cannot be set twice.");
                  }
                  _loc8_++;
                  this.stateEndTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_CellInfo.avatar cannot be set twice.");
                  }
                  _loc9_++;
                  this.avatar = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_CellInfo.warFree cannot be set twice.");
                  }
                  _loc10_++;
                  this.warFree = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_CellInfo.warFreeEndTime cannot be set twice.");
                  }
                  _loc11_++;
                  this.warFreeEndTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  this.mineCar.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_WorldMap_MineCar()));
                  break;
               case 11:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_CellInfo.guildId cannot be set twice.");
                  }
                  _loc12_++;
                  this.guildId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 12:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_CellInfo.guildName cannot be set twice.");
                  }
                  _loc13_++;
                  this.guildName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 13:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_CellInfo.guildFlag cannot be set twice.");
                  }
                  _loc14_++;
                  this.guildFlag = new Dto_Guild_FlagInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.guildFlag);
                  break;
               case 14:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_CellInfo.enemyFlag cannot be set twice.");
                  }
                  _loc15_++;
                  this.enemyFlag = new Dto_Guild_FlagInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.enemyFlag);
                  break;
               case 15:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_CellInfo.area cannot be set twice.");
                  }
                  _loc16_++;
                  this.area = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 16:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_CellInfo.diamond cannot be set twice.");
                  }
                  _loc17_++;
                  this.diamond = new Dto_DiamondInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.diamond);
                  break;
               case 30:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_CellInfo.mineState cannot be set twice.");
                  }
                  _loc18_++;
                  this.mineState = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 50:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldMap_CellInfo.templeId cannot be set twice.");
                  }
                  _loc19_++;
                  this.templeId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc20_);
                  break;
            }
         }
      }
   }
}
