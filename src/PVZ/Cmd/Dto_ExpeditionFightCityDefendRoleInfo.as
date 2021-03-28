package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_ExpeditionFightCityDefendRoleInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ExpeditionFightCityDefendRoleInfo";
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ExpeditionFightCityDefendRoleInfo.roleName","roleName",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const HEALTH:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightCityDefendRoleInfo.health","health",2 << 3 | WireType.VARINT);
      
      public static const POWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightCityDefendRoleInfo.power","power",3 << 3 | WireType.VARINT);
      
      public static const HPRATIO:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightCityDefendRoleInfo.hpRatio","hpRatio",4 << 3 | WireType.VARINT);
       
      
      private var roleName$field:String;
      
      private var health$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var power$field:uint;
      
      private var hpRatio$field:uint;
      
      public function Dto_ExpeditionFightCityDefendRoleInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ExpeditionFightCityDefendRoleInfo.$MessageID;
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
      
      public function clearHealth() : void
      {
         this.hasField$0 &= 4294967294;
         this.health$field = new uint();
      }
      
      public function get hasHealth() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set health(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.health$field = param1;
      }
      
      public function get health() : uint
      {
         return this.health$field;
      }
      
      public function clearPower() : void
      {
         this.hasField$0 &= 4294967293;
         this.power$field = new uint();
      }
      
      public function get hasPower() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set power(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.power$field = param1;
      }
      
      public function get power() : uint
      {
         return this.power$field;
      }
      
      public function clearHpRatio() : void
      {
         this.hasField$0 &= 4294967291;
         this.hpRatio$field = new uint();
      }
      
      public function get hasHpRatio() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set hpRatio(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.hpRatio$field = param1;
      }
      
      public function get hpRatio() : uint
      {
         return this.hpRatio$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasHealth)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.health$field);
         }
         if(this.hasPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.power$field);
         }
         if(this.hasHpRatio)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.hpRatio$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightCityDefendRoleInfo.roleName cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightCityDefendRoleInfo.health cannot be set twice.");
                  }
                  _loc4_++;
                  this.health = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightCityDefendRoleInfo.power cannot be set twice.");
                  }
                  _loc5_++;
                  this.power = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightCityDefendRoleInfo.hpRatio cannot be set twice.");
                  }
                  _loc6_++;
                  this.hpRatio = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
