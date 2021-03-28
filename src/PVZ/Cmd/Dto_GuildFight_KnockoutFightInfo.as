package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_GuildFight_KnockoutFightInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_GuildFight_KnockoutFightInfo";
      
      public static const CLASHID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_KnockoutFightInfo.clashId","clashId",1 << 3 | WireType.VARINT);
      
      public static const LEFTSTATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_KnockoutFightInfo.leftState","leftState",2 << 3 | WireType.VARINT);
      
      public static const LEFTROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_GuildFight_KnockoutFightInfo.leftRoleId","leftRoleId",3 << 3 | WireType.VARINT);
      
      public static const LEFTROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_GuildFight_KnockoutFightInfo.leftRoleName","leftRoleName",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const LEFTROLECYCLES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_KnockoutFightInfo.leftRoleCycles","leftRoleCycles",5 << 3 | WireType.VARINT);
      
      public static const LEFTREMAINROLE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_KnockoutFightInfo.leftRemainRole","leftRemainRole",6 << 3 | WireType.VARINT);
      
      public static const LEFTWINNUMBER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_KnockoutFightInfo.leftWinNumber","leftWinNumber",7 << 3 | WireType.VARINT);
      
      public static const RIGHTROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_GuildFight_KnockoutFightInfo.rightRoleId","rightRoleId",8 << 3 | WireType.VARINT);
      
      public static const RIGHTROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_GuildFight_KnockoutFightInfo.rightRoleName","rightRoleName",9 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const RIGHTROLECYCLES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_KnockoutFightInfo.rightRoleCycles","rightRoleCycles",10 << 3 | WireType.VARINT);
      
      public static const RIGHTREMAINROLE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_KnockoutFightInfo.rightRemainRole","rightRemainRole",11 << 3 | WireType.VARINT);
      
      public static const RIGHTWINNUMBER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_KnockoutFightInfo.rightWinNumber","rightWinNumber",12 << 3 | WireType.VARINT);
       
      
      private var clashId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var leftState$field:uint;
      
      private var leftRoleId$field:Int64;
      
      private var leftRoleName$field:String;
      
      private var leftRoleCycles$field:uint;
      
      private var leftRemainRole$field:uint;
      
      private var leftWinNumber$field:uint;
      
      private var rightRoleId$field:Int64;
      
      private var rightRoleName$field:String;
      
      private var rightRoleCycles$field:uint;
      
      private var rightRemainRole$field:uint;
      
      private var rightWinNumber$field:uint;
      
      public function Dto_GuildFight_KnockoutFightInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_GuildFight_KnockoutFightInfo.$MessageID;
      }
      
      public function clearClashId() : void
      {
         this.hasField$0 &= 4294967294;
         this.clashId$field = new uint();
      }
      
      public function get hasClashId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set clashId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.clashId$field = param1;
      }
      
      public function get clashId() : uint
      {
         return this.clashId$field;
      }
      
      public function clearLeftState() : void
      {
         this.hasField$0 &= 4294967293;
         this.leftState$field = new uint();
      }
      
      public function get hasLeftState() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set leftState(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.leftState$field = param1;
      }
      
      public function get leftState() : uint
      {
         return this.leftState$field;
      }
      
      public function clearLeftRoleId() : void
      {
         this.leftRoleId$field = null;
      }
      
      public function get hasLeftRoleId() : Boolean
      {
         return this.leftRoleId$field != null;
      }
      
      public function set leftRoleId(param1:Int64) : void
      {
         this.leftRoleId$field = param1;
      }
      
      public function get leftRoleId() : Int64
      {
         return this.leftRoleId$field;
      }
      
      public function clearLeftRoleName() : void
      {
         this.leftRoleName$field = null;
      }
      
      public function get hasLeftRoleName() : Boolean
      {
         return this.leftRoleName$field != null;
      }
      
      public function set leftRoleName(param1:String) : void
      {
         this.leftRoleName$field = param1;
      }
      
      public function get leftRoleName() : String
      {
         return this.leftRoleName$field;
      }
      
      public function clearLeftRoleCycles() : void
      {
         this.hasField$0 &= 4294967291;
         this.leftRoleCycles$field = new uint();
      }
      
      public function get hasLeftRoleCycles() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set leftRoleCycles(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.leftRoleCycles$field = param1;
      }
      
      public function get leftRoleCycles() : uint
      {
         return this.leftRoleCycles$field;
      }
      
      public function clearLeftRemainRole() : void
      {
         this.hasField$0 &= 4294967287;
         this.leftRemainRole$field = new uint();
      }
      
      public function get hasLeftRemainRole() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set leftRemainRole(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.leftRemainRole$field = param1;
      }
      
      public function get leftRemainRole() : uint
      {
         return this.leftRemainRole$field;
      }
      
      public function clearLeftWinNumber() : void
      {
         this.hasField$0 &= 4294967279;
         this.leftWinNumber$field = new uint();
      }
      
      public function get hasLeftWinNumber() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set leftWinNumber(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.leftWinNumber$field = param1;
      }
      
      public function get leftWinNumber() : uint
      {
         return this.leftWinNumber$field;
      }
      
      public function clearRightRoleId() : void
      {
         this.rightRoleId$field = null;
      }
      
      public function get hasRightRoleId() : Boolean
      {
         return this.rightRoleId$field != null;
      }
      
      public function set rightRoleId(param1:Int64) : void
      {
         this.rightRoleId$field = param1;
      }
      
      public function get rightRoleId() : Int64
      {
         return this.rightRoleId$field;
      }
      
      public function clearRightRoleName() : void
      {
         this.rightRoleName$field = null;
      }
      
      public function get hasRightRoleName() : Boolean
      {
         return this.rightRoleName$field != null;
      }
      
      public function set rightRoleName(param1:String) : void
      {
         this.rightRoleName$field = param1;
      }
      
      public function get rightRoleName() : String
      {
         return this.rightRoleName$field;
      }
      
      public function clearRightRoleCycles() : void
      {
         this.hasField$0 &= 4294967263;
         this.rightRoleCycles$field = new uint();
      }
      
      public function get hasRightRoleCycles() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set rightRoleCycles(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.rightRoleCycles$field = param1;
      }
      
      public function get rightRoleCycles() : uint
      {
         return this.rightRoleCycles$field;
      }
      
      public function clearRightRemainRole() : void
      {
         this.hasField$0 &= 4294967231;
         this.rightRemainRole$field = new uint();
      }
      
      public function get hasRightRemainRole() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set rightRemainRole(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.rightRemainRole$field = param1;
      }
      
      public function get rightRemainRole() : uint
      {
         return this.rightRemainRole$field;
      }
      
      public function clearRightWinNumber() : void
      {
         this.hasField$0 &= 4294967167;
         this.rightWinNumber$field = new uint();
      }
      
      public function get hasRightWinNumber() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set rightWinNumber(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.rightWinNumber$field = param1;
      }
      
      public function get rightWinNumber() : uint
      {
         return this.rightWinNumber$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasClashId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.clashId$field);
         }
         if(this.hasLeftState)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.leftState$field);
         }
         if(this.hasLeftRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT64(param1,this.leftRoleId$field);
         }
         if(this.hasLeftRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.leftRoleName$field);
         }
         if(this.hasLeftRoleCycles)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.leftRoleCycles$field);
         }
         if(this.hasLeftRemainRole)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.leftRemainRole$field);
         }
         if(this.hasLeftWinNumber)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.leftWinNumber$field);
         }
         if(this.hasRightRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_INT64(param1,this.rightRoleId$field);
         }
         if(this.hasRightRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_STRING(param1,this.rightRoleName$field);
         }
         if(this.hasRightRoleCycles)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.rightRoleCycles$field);
         }
         if(this.hasRightRemainRole)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.rightRemainRole$field);
         }
         if(this.hasRightWinNumber)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.rightWinNumber$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Dto_GuildFight_KnockoutFightInfo.clashId cannot be set twice.");
                  }
                  _loc3_++;
                  this.clashId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_KnockoutFightInfo.leftState cannot be set twice.");
                  }
                  _loc4_++;
                  this.leftState = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_KnockoutFightInfo.leftRoleId cannot be set twice.");
                  }
                  _loc5_++;
                  this.leftRoleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_KnockoutFightInfo.leftRoleName cannot be set twice.");
                  }
                  _loc6_++;
                  this.leftRoleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_KnockoutFightInfo.leftRoleCycles cannot be set twice.");
                  }
                  _loc7_++;
                  this.leftRoleCycles = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_KnockoutFightInfo.leftRemainRole cannot be set twice.");
                  }
                  _loc8_++;
                  this.leftRemainRole = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_KnockoutFightInfo.leftWinNumber cannot be set twice.");
                  }
                  _loc9_++;
                  this.leftWinNumber = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_KnockoutFightInfo.rightRoleId cannot be set twice.");
                  }
                  _loc10_++;
                  this.rightRoleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_KnockoutFightInfo.rightRoleName cannot be set twice.");
                  }
                  _loc11_++;
                  this.rightRoleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_KnockoutFightInfo.rightRoleCycles cannot be set twice.");
                  }
                  _loc12_++;
                  this.rightRoleCycles = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_KnockoutFightInfo.rightRemainRole cannot be set twice.");
                  }
                  _loc13_++;
                  this.rightRemainRole = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_KnockoutFightInfo.rightWinNumber cannot be set twice.");
                  }
                  _loc14_++;
                  this.rightWinNumber = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc15_);
                  break;
            }
         }
      }
   }
}
