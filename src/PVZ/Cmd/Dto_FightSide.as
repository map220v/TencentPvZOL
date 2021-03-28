package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FightSide extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FightSide";
      
      public static const SIDETYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_FightSide.sideType","sideType",1 << 3 | WireType.VARINT,E_FightSide);
      
      public static const BEFORECARDLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightSide.beforeCardList","beforeCardList",2 << 3 | WireType.LENGTH_DELIMITED,Dto_FightCardInfo);
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightSide.reward","reward",3 << 3 | WireType.LENGTH_DELIMITED,Dto_FightReward);
      
      public static const AFTERCARDLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightSide.afterCardList","afterCardList",4 << 3 | WireType.LENGTH_DELIMITED,Dto_FightCardInfo);
      
      public static const ROLEFACEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightSide.roleFaceId","roleFaceId",5 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FightSide.roleName","roleName",6 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const TOTALPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightSide.totalPower","totalPower",7 << 3 | WireType.VARINT);
      
      public static const ROLELEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightSide.roleLevel","roleLevel",8 << 3 | WireType.VARINT);
      
      public static const CARDEXP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightSide.cardExp","cardExp",9 << 3 | WireType.LENGTH_DELIMITED,Dto_CardExp);
      
      public static const ROLEATTR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightSide.roleAttr","roleAttr",10 << 3 | WireType.LENGTH_DELIMITED,Dto_RoleAttr);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightSide.score","score",11 << 3 | WireType.VARINT);
      
      public static const STREAKSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightSide.streakScore","streakScore",12 << 3 | WireType.VARINT);
      
      public static const ROLEQQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FightSide.roleQQFaceURL","roleQQFaceURL",13 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const WINSTREAK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightSide.winstreak","winstreak",14 << 3 | WireType.VARINT);
      
      public static const TOTALSPEED:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightSide.totalSpeed","totalSpeed",15 << 3 | WireType.VARINT);
      
      public static const PUPPETLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightSide.puppetList","puppetList",16 << 3 | WireType.LENGTH_DELIMITED,Dto_FightPuppetInfo);
       
      
      private var sideType$field:int;
      
      private var hasField$0:uint = 0;
      
      public var beforeCardList:Array;
      
      public var reward:Array;
      
      public var afterCardList:Array;
      
      private var roleFaceId$field:uint;
      
      private var roleName$field:String;
      
      private var totalPower$field:uint;
      
      private var roleLevel$field:uint;
      
      private var cardExp$field:Dto_CardExp;
      
      private var roleAttr$field:Dto_RoleAttr;
      
      private var score$field:uint;
      
      private var streakScore$field:uint;
      
      private var roleQQFaceURL$field:String;
      
      private var winstreak$field:uint;
      
      private var totalSpeed$field:uint;
      
      public var puppetList:Array;
      
      public function Dto_FightSide()
      {
         this.beforeCardList = [];
         this.reward = [];
         this.afterCardList = [];
         this.puppetList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FightSide.$MessageID;
      }
      
      public function clearSideType() : void
      {
         this.hasField$0 &= 4294967294;
         this.sideType$field = new int();
      }
      
      public function get hasSideType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set sideType(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.sideType$field = param1;
      }
      
      public function get sideType() : int
      {
         return this.sideType$field;
      }
      
      public function clearRoleFaceId() : void
      {
         this.hasField$0 &= 4294967293;
         this.roleFaceId$field = new uint();
      }
      
      public function get hasRoleFaceId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set roleFaceId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.roleFaceId$field = param1;
      }
      
      public function get roleFaceId() : uint
      {
         return this.roleFaceId$field;
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
      
      public function clearTotalPower() : void
      {
         this.hasField$0 &= 4294967291;
         this.totalPower$field = new uint();
      }
      
      public function get hasTotalPower() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set totalPower(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.totalPower$field = param1;
      }
      
      public function get totalPower() : uint
      {
         return this.totalPower$field;
      }
      
      public function clearRoleLevel() : void
      {
         this.hasField$0 &= 4294967287;
         this.roleLevel$field = new uint();
      }
      
      public function get hasRoleLevel() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set roleLevel(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.roleLevel$field = param1;
      }
      
      public function get roleLevel() : uint
      {
         return this.roleLevel$field;
      }
      
      public function clearCardExp() : void
      {
         this.cardExp$field = null;
      }
      
      public function get hasCardExp() : Boolean
      {
         return this.cardExp$field != null;
      }
      
      public function set cardExp(param1:Dto_CardExp) : void
      {
         this.cardExp$field = param1;
      }
      
      public function get cardExp() : Dto_CardExp
      {
         return this.cardExp$field;
      }
      
      public function clearRoleAttr() : void
      {
         this.roleAttr$field = null;
      }
      
      public function get hasRoleAttr() : Boolean
      {
         return this.roleAttr$field != null;
      }
      
      public function set roleAttr(param1:Dto_RoleAttr) : void
      {
         this.roleAttr$field = param1;
      }
      
      public function get roleAttr() : Dto_RoleAttr
      {
         return this.roleAttr$field;
      }
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967279;
         this.score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.score$field = param1;
      }
      
      public function get score() : uint
      {
         return this.score$field;
      }
      
      public function clearStreakScore() : void
      {
         this.hasField$0 &= 4294967263;
         this.streakScore$field = new uint();
      }
      
      public function get hasStreakScore() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set streakScore(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.streakScore$field = param1;
      }
      
      public function get streakScore() : uint
      {
         return this.streakScore$field;
      }
      
      public function clearRoleQQFaceURL() : void
      {
         this.roleQQFaceURL$field = null;
      }
      
      public function get hasRoleQQFaceURL() : Boolean
      {
         return this.roleQQFaceURL$field != null;
      }
      
      public function set roleQQFaceURL(param1:String) : void
      {
         this.roleQQFaceURL$field = param1;
      }
      
      public function get roleQQFaceURL() : String
      {
         return this.roleQQFaceURL$field;
      }
      
      public function clearWinstreak() : void
      {
         this.hasField$0 &= 4294967231;
         this.winstreak$field = new uint();
      }
      
      public function get hasWinstreak() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set winstreak(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.winstreak$field = param1;
      }
      
      public function get winstreak() : uint
      {
         return this.winstreak$field;
      }
      
      public function clearTotalSpeed() : void
      {
         this.hasField$0 &= 4294967167;
         this.totalSpeed$field = new uint();
      }
      
      public function get hasTotalSpeed() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set totalSpeed(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.totalSpeed$field = param1;
      }
      
      public function get totalSpeed() : uint
      {
         return this.totalSpeed$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc6_:* = undefined;
         if(this.hasSideType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_ENUM(param1,this.sideType$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.beforeCardList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.beforeCardList[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.afterCardList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.afterCardList[_loc4_]);
            _loc4_++;
         }
         if(this.hasRoleFaceId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.roleFaceId$field);
         }
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasTotalPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.totalPower$field);
         }
         if(this.hasRoleLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.roleLevel$field);
         }
         if(this.hasCardExp)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cardExp$field);
         }
         if(this.hasRoleAttr)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.roleAttr$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.score$field);
         }
         if(this.hasStreakScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.streakScore$field);
         }
         if(this.hasRoleQQFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,13);
            WriteUtils.write$TYPE_STRING(param1,this.roleQQFaceURL$field);
         }
         if(this.hasWinstreak)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,14);
            WriteUtils.write$TYPE_UINT32(param1,this.winstreak$field);
         }
         if(this.hasTotalSpeed)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,15);
            WriteUtils.write$TYPE_UINT32(param1,this.totalSpeed$field);
         }
         var _loc5_:uint = 0;
         while(_loc5_ < this.puppetList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,16);
            WriteUtils.write$TYPE_MESSAGE(param1,this.puppetList[_loc5_]);
            _loc5_++;
         }
         for(_loc6_ in this)
         {
            super.writeUnknown(param1,_loc6_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc15_:uint = 0;
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
         while(param1.bytesAvailable > param2)
         {
            _loc15_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc15_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightSide.sideType cannot be set twice.");
                  }
                  _loc3_++;
                  this.sideType = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 2:
                  this.beforeCardList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FightCardInfo()));
                  break;
               case 3:
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FightReward()));
                  break;
               case 4:
                  this.afterCardList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FightCardInfo()));
                  break;
               case 5:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightSide.roleFaceId cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleFaceId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightSide.roleName cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 7:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightSide.totalPower cannot be set twice.");
                  }
                  _loc6_++;
                  this.totalPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightSide.roleLevel cannot be set twice.");
                  }
                  _loc7_++;
                  this.roleLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightSide.cardExp cannot be set twice.");
                  }
                  _loc8_++;
                  this.cardExp = new Dto_CardExp();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.cardExp);
                  break;
               case 10:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightSide.roleAttr cannot be set twice.");
                  }
                  _loc9_++;
                  this.roleAttr = new Dto_RoleAttr();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.roleAttr);
                  break;
               case 11:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightSide.score cannot be set twice.");
                  }
                  _loc10_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightSide.streakScore cannot be set twice.");
                  }
                  _loc11_++;
                  this.streakScore = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 13:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightSide.roleQQFaceURL cannot be set twice.");
                  }
                  _loc12_++;
                  this.roleQQFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 14:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightSide.winstreak cannot be set twice.");
                  }
                  _loc13_++;
                  this.winstreak = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 15:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightSide.totalSpeed cannot be set twice.");
                  }
                  _loc14_++;
                  this.totalSpeed = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 16:
                  this.puppetList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FightPuppetInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc15_);
                  break;
            }
         }
      }
   }
}
