package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_MineHolderInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_MineHolderInfo";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_MineHolderInfo.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_MineHolderInfo.roleName","roleName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const FIGHTPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MineHolderInfo.fightPower","fightPower",3 << 3 | WireType.VARINT);
      
      public static const MININGTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MineHolderInfo.miningTime","miningTime",4 << 3 | WireType.VARINT);
      
      public static const PRODUCTION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MineHolderInfo.production","production",5 << 3 | WireType.VARINT);
      
      public static const ISMINING:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_MineHolderInfo.isMining","isMining",6 << 3 | WireType.VARINT);
      
      public static const ISDEFEND:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_MineHolderInfo.isDefend","isDefend",7 << 3 | WireType.VARINT);
      
      public static const CARRYOFF:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MineHolderInfo.carryOff","carryOff",8 << 3 | WireType.VARINT);
      
      public static const COINLIMIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MineHolderInfo.coinLimit","coinLimit",9 << 3 | WireType.VARINT);
       
      
      private var roleId$field:Int64;
      
      private var roleName$field:String;
      
      private var fightPower$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var miningTime$field:uint;
      
      private var production$field:uint;
      
      private var isMining$field:Boolean;
      
      private var isDefend$field:Boolean;
      
      private var carryOff$field:uint;
      
      private var coinLimit$field:uint;
      
      public function Dto_MineHolderInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_MineHolderInfo.$MessageID;
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
      
      public function clearFightPower() : void
      {
         this.hasField$0 &= 4294967294;
         this.fightPower$field = new uint();
      }
      
      public function get hasFightPower() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set fightPower(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.fightPower$field = param1;
      }
      
      public function get fightPower() : uint
      {
         return this.fightPower$field;
      }
      
      public function clearMiningTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.miningTime$field = new uint();
      }
      
      public function get hasMiningTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set miningTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.miningTime$field = param1;
      }
      
      public function get miningTime() : uint
      {
         return this.miningTime$field;
      }
      
      public function clearProduction() : void
      {
         this.hasField$0 &= 4294967291;
         this.production$field = new uint();
      }
      
      public function get hasProduction() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set production(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.production$field = param1;
      }
      
      public function get production() : uint
      {
         return this.production$field;
      }
      
      public function clearIsMining() : void
      {
         this.hasField$0 &= 4294967287;
         this.isMining$field = new Boolean();
      }
      
      public function get hasIsMining() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set isMining(param1:Boolean) : void
      {
         this.hasField$0 |= 8;
         this.isMining$field = param1;
      }
      
      public function get isMining() : Boolean
      {
         return this.isMining$field;
      }
      
      public function clearIsDefend() : void
      {
         this.hasField$0 &= 4294967279;
         this.isDefend$field = new Boolean();
      }
      
      public function get hasIsDefend() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set isDefend(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.isDefend$field = param1;
      }
      
      public function get isDefend() : Boolean
      {
         return this.isDefend$field;
      }
      
      public function clearCarryOff() : void
      {
         this.hasField$0 &= 4294967263;
         this.carryOff$field = new uint();
      }
      
      public function get hasCarryOff() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set carryOff(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.carryOff$field = param1;
      }
      
      public function get carryOff() : uint
      {
         return this.carryOff$field;
      }
      
      public function clearCoinLimit() : void
      {
         this.hasField$0 &= 4294967231;
         this.coinLimit$field = new uint();
      }
      
      public function get hasCoinLimit() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set coinLimit(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.coinLimit$field = param1;
      }
      
      public function get coinLimit() : uint
      {
         return this.coinLimit$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasFightPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.fightPower$field);
         }
         if(this.hasMiningTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.miningTime$field);
         }
         if(this.hasProduction)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.production$field);
         }
         if(this.hasIsMining)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_BOOL(param1,this.isMining$field);
         }
         if(this.hasIsDefend)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.isDefend$field);
         }
         if(this.hasCarryOff)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.carryOff$field);
         }
         if(this.hasCoinLimit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.coinLimit$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc12_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc12_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc12_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MineHolderInfo.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MineHolderInfo.roleName cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MineHolderInfo.fightPower cannot be set twice.");
                  }
                  _loc5_++;
                  this.fightPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MineHolderInfo.miningTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.miningTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MineHolderInfo.production cannot be set twice.");
                  }
                  _loc7_++;
                  this.production = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MineHolderInfo.isMining cannot be set twice.");
                  }
                  _loc8_++;
                  this.isMining = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MineHolderInfo.isDefend cannot be set twice.");
                  }
                  _loc9_++;
                  this.isDefend = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MineHolderInfo.carryOff cannot be set twice.");
                  }
                  _loc10_++;
                  this.carryOff = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MineHolderInfo.coinLimit cannot be set twice.");
                  }
                  _loc11_++;
                  this.coinLimit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc12_);
                  break;
            }
         }
      }
   }
}
