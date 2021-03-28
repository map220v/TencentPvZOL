package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Guard_DefenceHistory extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Guard_DefenceHistory";
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Guard_DefenceHistory.name","name",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guard_DefenceHistory.zoneId","zoneId",2 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guard_DefenceHistory.level","level",3 << 3 | WireType.VARINT);
      
      public static const FACEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guard_DefenceHistory.faceId","faceId",4 << 3 | WireType.VARINT);
      
      public static const QQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Guard_DefenceHistory.qqFaceURL","qqFaceURL",5 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guard_DefenceHistory.time","time",6 << 3 | WireType.VARINT);
      
      public static const ROBWIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_Guard_DefenceHistory.robWin","robWin",7 << 3 | WireType.VARINT);
      
      public static const GUARDTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guard_DefenceHistory.guardType","guardType",8 << 3 | WireType.VARINT);
      
      public static const POWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guard_DefenceHistory.power","power",9 << 3 | WireType.VARINT);
       
      
      private var name$field:String;
      
      private var zoneId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var level$field:uint;
      
      private var faceId$field:uint;
      
      private var qqFaceURL$field:String;
      
      private var time$field:uint;
      
      private var robWin$field:Boolean;
      
      private var guardType$field:uint;
      
      private var power$field:uint;
      
      public function Dto_Guard_DefenceHistory()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Guard_DefenceHistory.$MessageID;
      }
      
      public function clearName() : void
      {
         this.name$field = null;
      }
      
      public function get hasName() : Boolean
      {
         return this.name$field != null;
      }
      
      public function set name(param1:String) : void
      {
         this.name$field = param1;
      }
      
      public function get name() : String
      {
         return this.name$field;
      }
      
      public function clearZoneId() : void
      {
         this.hasField$0 &= 4294967294;
         this.zoneId$field = new uint();
      }
      
      public function get hasZoneId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set zoneId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.zoneId$field = param1;
      }
      
      public function get zoneId() : uint
      {
         return this.zoneId$field;
      }
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967293;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.level$field = param1;
      }
      
      public function get level() : uint
      {
         return this.level$field;
      }
      
      public function clearFaceId() : void
      {
         this.hasField$0 &= 4294967291;
         this.faceId$field = new uint();
      }
      
      public function get hasFaceId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set faceId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.faceId$field = param1;
      }
      
      public function get faceId() : uint
      {
         return this.faceId$field;
      }
      
      public function clearQqFaceURL() : void
      {
         this.qqFaceURL$field = null;
      }
      
      public function get hasQqFaceURL() : Boolean
      {
         return this.qqFaceURL$field != null;
      }
      
      public function set qqFaceURL(param1:String) : void
      {
         this.qqFaceURL$field = param1;
      }
      
      public function get qqFaceURL() : String
      {
         return this.qqFaceURL$field;
      }
      
      public function clearTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.time$field = new uint();
      }
      
      public function get hasTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set time(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.time$field = param1;
      }
      
      public function get time() : uint
      {
         return this.time$field;
      }
      
      public function clearRobWin() : void
      {
         this.hasField$0 &= 4294967279;
         this.robWin$field = new Boolean();
      }
      
      public function get hasRobWin() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set robWin(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.robWin$field = param1;
      }
      
      public function get robWin() : Boolean
      {
         return this.robWin$field;
      }
      
      public function clearGuardType() : void
      {
         this.hasField$0 &= 4294967263;
         this.guardType$field = new uint();
      }
      
      public function get hasGuardType() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set guardType(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.guardType$field = param1;
      }
      
      public function get guardType() : uint
      {
         return this.guardType$field;
      }
      
      public function clearPower() : void
      {
         this.hasField$0 &= 4294967231;
         this.power$field = new uint();
      }
      
      public function get hasPower() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set power(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.power$field = param1;
      }
      
      public function get power() : uint
      {
         return this.power$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.name$field);
         }
         if(this.hasZoneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneId$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasFaceId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.faceId$field);
         }
         if(this.hasQqFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_STRING(param1,this.qqFaceURL$field);
         }
         if(this.hasTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.time$field);
         }
         if(this.hasRobWin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.robWin$field);
         }
         if(this.hasGuardType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.guardType$field);
         }
         if(this.hasPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.power$field);
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
                     throw new IOError("Bad data format: Dto_Guard_DefenceHistory.name cannot be set twice.");
                  }
                  _loc3_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard_DefenceHistory.zoneId cannot be set twice.");
                  }
                  _loc4_++;
                  this.zoneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard_DefenceHistory.level cannot be set twice.");
                  }
                  _loc5_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard_DefenceHistory.faceId cannot be set twice.");
                  }
                  _loc6_++;
                  this.faceId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard_DefenceHistory.qqFaceURL cannot be set twice.");
                  }
                  _loc7_++;
                  this.qqFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard_DefenceHistory.time cannot be set twice.");
                  }
                  _loc8_++;
                  this.time = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard_DefenceHistory.robWin cannot be set twice.");
                  }
                  _loc9_++;
                  this.robWin = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard_DefenceHistory.guardType cannot be set twice.");
                  }
                  _loc10_++;
                  this.guardType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard_DefenceHistory.power cannot be set twice.");
                  }
                  _loc11_++;
                  this.power = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc12_);
                  break;
            }
         }
      }
   }
}
