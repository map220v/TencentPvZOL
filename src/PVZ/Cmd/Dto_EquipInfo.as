package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_EquipInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_EquipInfo";
      
      public static const EQUIPEFFECT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_EquipInfo.equipEffect","equipEffect",1 << 3 | WireType.LENGTH_DELIMITED,Dto_EquipEffect);
      
      public static const QUALITY:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_EquipInfo.quality","quality",2 << 3 | WireType.VARINT,E_EquipQuality);
      
      public static const ICARDUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_EquipInfo.iCardUId","iCardUId",3 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_EquipInfo.level","level",4 << 3 | WireType.VARINT);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_EquipInfo.exp","exp",5 << 3 | WireType.VARINT);
      
      public static const GRADEPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_EquipInfo.gradePercent","gradePercent",6 << 3 | WireType.VARINT);
      
      public static const ISCLONE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_EquipInfo.isClone","isClone",7 << 3 | WireType.VARINT);
       
      
      public var equipEffect:Array;
      
      private var quality$field:int;
      
      private var hasField$0:uint = 0;
      
      private var iCardUId$field:Int64;
      
      private var level$field:uint;
      
      private var exp$field:uint;
      
      private var gradePercent$field:uint;
      
      private var isClone$field:Boolean;
      
      public function Dto_EquipInfo()
      {
         this.equipEffect = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_EquipInfo.$MessageID;
      }
      
      public function clearQuality() : void
      {
         this.hasField$0 &= 4294967294;
         this.quality$field = new int();
      }
      
      public function get hasQuality() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set quality(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.quality$field = param1;
      }
      
      public function get quality() : int
      {
         return this.quality$field;
      }
      
      public function clearICardUId() : void
      {
         this.iCardUId$field = null;
      }
      
      public function get hasICardUId() : Boolean
      {
         return this.iCardUId$field != null;
      }
      
      public function set iCardUId(param1:Int64) : void
      {
         this.iCardUId$field = param1;
      }
      
      public function get iCardUId() : Int64
      {
         return this.iCardUId$field;
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
      
      public function clearExp() : void
      {
         this.hasField$0 &= 4294967291;
         this.exp$field = new uint();
      }
      
      public function get hasExp() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set exp(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.exp$field = param1;
      }
      
      public function get exp() : uint
      {
         return this.exp$field;
      }
      
      public function clearGradePercent() : void
      {
         this.hasField$0 &= 4294967287;
         this.gradePercent$field = new uint();
      }
      
      public function get hasGradePercent() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set gradePercent(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.gradePercent$field = param1;
      }
      
      public function get gradePercent() : uint
      {
         return this.gradePercent$field;
      }
      
      public function clearIsClone() : void
      {
         this.hasField$0 &= 4294967279;
         this.isClone$field = new Boolean();
      }
      
      public function get hasIsClone() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set isClone(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.isClone$field = param1;
      }
      
      public function get isClone() : Boolean
      {
         return this.isClone$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.equipEffect.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.equipEffect[_loc2_]);
            _loc2_++;
         }
         if(this.hasQuality)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_ENUM(param1,this.quality$field);
         }
         if(this.hasICardUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT64(param1,this.iCardUId$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.exp$field);
         }
         if(this.hasGradePercent)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.gradePercent$field);
         }
         if(this.hasIsClone)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.isClone$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  this.equipEffect.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_EquipEffect()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_EquipInfo.quality cannot be set twice.");
                  }
                  _loc3_++;
                  this.quality = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_EquipInfo.iCardUId cannot be set twice.");
                  }
                  _loc4_++;
                  this.iCardUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_EquipInfo.level cannot be set twice.");
                  }
                  _loc5_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_EquipInfo.exp cannot be set twice.");
                  }
                  _loc6_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_EquipInfo.gradePercent cannot be set twice.");
                  }
                  _loc7_++;
                  this.gradePercent = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_EquipInfo.isClone cannot be set twice.");
                  }
                  _loc8_++;
                  this.isClone = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
