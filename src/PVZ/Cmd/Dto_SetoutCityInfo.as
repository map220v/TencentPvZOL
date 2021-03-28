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
   
   public final class Dto_SetoutCityInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_SetoutCityInfo";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_SetoutCityInfo.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_SetoutCityInfo.roleName","roleName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ROLELEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SetoutCityInfo.roleLevel","roleLevel",3 << 3 | WireType.VARINT);
      
      public static const AREA:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SetoutCityInfo.area","area",4 << 3 | WireType.VARINT);
      
      public static const POS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_SetoutCityInfo.pos","pos",5 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const ENEMYSTATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SetoutCityInfo.enemyState","enemyState",6 << 3 | WireType.VARINT);
      
      public static const SETOUTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SetoutCityInfo.setoutTime","setoutTime",7 << 3 | WireType.VARINT);
       
      
      private var roleId$field:Int64;
      
      private var roleName$field:String;
      
      private var roleLevel$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var area$field:uint;
      
      private var pos$field:Dto_WorldMap_Pos;
      
      private var enemyState$field:uint;
      
      private var setoutTime$field:uint;
      
      public function Dto_SetoutCityInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_SetoutCityInfo.$MessageID;
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
      
      public function clearRoleLevel() : void
      {
         this.hasField$0 &= 4294967294;
         this.roleLevel$field = new uint();
      }
      
      public function get hasRoleLevel() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set roleLevel(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.roleLevel$field = param1;
      }
      
      public function get roleLevel() : uint
      {
         return this.roleLevel$field;
      }
      
      public function clearArea() : void
      {
         this.hasField$0 &= 4294967293;
         this.area$field = new uint();
      }
      
      public function get hasArea() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set area(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.area$field = param1;
      }
      
      public function get area() : uint
      {
         return this.area$field;
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
      
      public function clearEnemyState() : void
      {
         this.hasField$0 &= 4294967291;
         this.enemyState$field = new uint();
      }
      
      public function get hasEnemyState() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set enemyState(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.enemyState$field = param1;
      }
      
      public function get enemyState() : uint
      {
         return this.enemyState$field;
      }
      
      public function clearSetoutTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.setoutTime$field = new uint();
      }
      
      public function get hasSetoutTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set setoutTime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.setoutTime$field = param1;
      }
      
      public function get setoutTime() : uint
      {
         return this.setoutTime$field;
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
         if(this.hasRoleLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.roleLevel$field);
         }
         if(this.hasArea)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.area$field);
         }
         if(this.hasPos)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.pos$field);
         }
         if(this.hasEnemyState)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.enemyState$field);
         }
         if(this.hasSetoutTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.setoutTime$field);
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
                     throw new IOError("Bad data format: Dto_SetoutCityInfo.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SetoutCityInfo.roleName cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SetoutCityInfo.roleLevel cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SetoutCityInfo.area cannot be set twice.");
                  }
                  _loc6_++;
                  this.area = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SetoutCityInfo.pos cannot be set twice.");
                  }
                  _loc7_++;
                  this.pos = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.pos);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SetoutCityInfo.enemyState cannot be set twice.");
                  }
                  _loc8_++;
                  this.enemyState = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SetoutCityInfo.setoutTime cannot be set twice.");
                  }
                  _loc9_++;
                  this.setoutTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
