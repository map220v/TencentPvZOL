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
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_AllServerRankArena extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_AllServerRankArena";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_AllServerRankArena.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AllServerRankArena.rank","rank",2 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_AllServerRankArena.roleName","roleName",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AllServerRankArena.zoneId","zoneId",4 << 3 | WireType.VARINT);
      
      public static const ATTACKWIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AllServerRankArena.attackWin","attackWin",5 << 3 | WireType.VARINT);
      
      public static const DEFENDWIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AllServerRankArena.defendWin","defendWin",6 << 3 | WireType.VARINT);
      
      public static const FORMATION:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_AllServerRankArena.formation","formation",7 << 3 | WireType.LENGTH_DELIMITED,Dto_ShowFormationInfo);
       
      
      private var roleId$field:Int64;
      
      private var rank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var roleName$field:String;
      
      private var zoneId$field:uint;
      
      private var attackWin$field:uint;
      
      private var defendWin$field:uint;
      
      private var formation$field:Dto_ShowFormationInfo;
      
      public function Dto_AllServerRankArena()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_AllServerRankArena.$MessageID;
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
      
      public function clearRank() : void
      {
         this.hasField$0 &= 4294967294;
         this.rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return this.rank$field;
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
      
      public function clearZoneId() : void
      {
         this.hasField$0 &= 4294967293;
         this.zoneId$field = new uint();
      }
      
      public function get hasZoneId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set zoneId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.zoneId$field = param1;
      }
      
      public function get zoneId() : uint
      {
         return this.zoneId$field;
      }
      
      public function clearAttackWin() : void
      {
         this.hasField$0 &= 4294967291;
         this.attackWin$field = new uint();
      }
      
      public function get hasAttackWin() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set attackWin(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.attackWin$field = param1;
      }
      
      public function get attackWin() : uint
      {
         return this.attackWin$field;
      }
      
      public function clearDefendWin() : void
      {
         this.hasField$0 &= 4294967287;
         this.defendWin$field = new uint();
      }
      
      public function get hasDefendWin() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set defendWin(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.defendWin$field = param1;
      }
      
      public function get defendWin() : uint
      {
         return this.defendWin$field;
      }
      
      public function clearFormation() : void
      {
         this.formation$field = null;
      }
      
      public function get hasFormation() : Boolean
      {
         return this.formation$field != null;
      }
      
      public function set formation(param1:Dto_ShowFormationInfo) : void
      {
         this.formation$field = param1;
      }
      
      public function get formation() : Dto_ShowFormationInfo
      {
         return this.formation$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasZoneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneId$field);
         }
         if(this.hasAttackWin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.attackWin$field);
         }
         if(this.hasDefendWin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.defendWin$field);
         }
         if(this.hasFormation)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.formation$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Dto_AllServerRankArena.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArena.rank cannot be set twice.");
                  }
                  _loc4_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArena.roleName cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArena.zoneId cannot be set twice.");
                  }
                  _loc6_++;
                  this.zoneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArena.attackWin cannot be set twice.");
                  }
                  _loc7_++;
                  this.attackWin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArena.defendWin cannot be set twice.");
                  }
                  _loc8_++;
                  this.defendWin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArena.formation cannot be set twice.");
                  }
                  _loc9_++;
                  this.formation = new Dto_ShowFormationInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.formation);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
