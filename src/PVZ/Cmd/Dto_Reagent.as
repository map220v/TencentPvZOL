package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Reagent extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Reagent";
      
      public static const REAGENTUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_Reagent.reagentUID","reagentUID",1 << 3 | WireType.VARINT);
      
      public static const BASEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Reagent.baseId","baseId",2 << 3 | WireType.VARINT);
      
      public static const QUALITY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Reagent.quality","quality",3 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Reagent.level","level",4 << 3 | WireType.VARINT);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Reagent.exp","exp",5 << 3 | WireType.VARINT);
      
      public static const BUFFTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Reagent.buffType","buffType",6 << 3 | WireType.VARINT);
      
      public static const BUFFVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Reagent.buffValue","buffValue",7 << 3 | WireType.VARINT);
      
      public static const POSITION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Reagent.position","position",8 << 3 | WireType.VARINT);
      
      public static const SLOTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Reagent.slotId","slotId",9 << 3 | WireType.VARINT);
      
      public static const FIGHTPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Reagent.fightPower","fightPower",10 << 3 | WireType.VARINT);
       
      
      private var reagentUID$field:Int64;
      
      private var baseId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var quality$field:uint;
      
      private var level$field:uint;
      
      private var exp$field:uint;
      
      private var buffType$field:uint;
      
      private var buffValue$field:uint;
      
      private var position$field:uint;
      
      private var slotId$field:uint;
      
      private var fightPower$field:uint;
      
      public function Dto_Reagent()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Reagent.$MessageID;
      }
      
      public function clearReagentUID() : void
      {
         this.reagentUID$field = null;
      }
      
      public function get hasReagentUID() : Boolean
      {
         return this.reagentUID$field != null;
      }
      
      public function set reagentUID(param1:Int64) : void
      {
         this.reagentUID$field = param1;
      }
      
      public function get reagentUID() : Int64
      {
         return this.reagentUID$field;
      }
      
      public function clearBaseId() : void
      {
         this.hasField$0 &= 4294967294;
         this.baseId$field = new uint();
      }
      
      public function get hasBaseId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set baseId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.baseId$field = param1;
      }
      
      public function get baseId() : uint
      {
         return this.baseId$field;
      }
      
      public function clearQuality() : void
      {
         this.hasField$0 &= 4294967293;
         this.quality$field = new uint();
      }
      
      public function get hasQuality() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set quality(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.quality$field = param1;
      }
      
      public function get quality() : uint
      {
         return this.quality$field;
      }
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967291;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.level$field = param1;
      }
      
      public function get level() : uint
      {
         return this.level$field;
      }
      
      public function clearExp() : void
      {
         this.hasField$0 &= 4294967287;
         this.exp$field = new uint();
      }
      
      public function get hasExp() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set exp(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.exp$field = param1;
      }
      
      public function get exp() : uint
      {
         return this.exp$field;
      }
      
      public function clearBuffType() : void
      {
         this.hasField$0 &= 4294967279;
         this.buffType$field = new uint();
      }
      
      public function get hasBuffType() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set buffType(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.buffType$field = param1;
      }
      
      public function get buffType() : uint
      {
         return this.buffType$field;
      }
      
      public function clearBuffValue() : void
      {
         this.hasField$0 &= 4294967263;
         this.buffValue$field = new uint();
      }
      
      public function get hasBuffValue() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set buffValue(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.buffValue$field = param1;
      }
      
      public function get buffValue() : uint
      {
         return this.buffValue$field;
      }
      
      public function clearPosition() : void
      {
         this.hasField$0 &= 4294967231;
         this.position$field = new uint();
      }
      
      public function get hasPosition() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set position(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.position$field = param1;
      }
      
      public function get position() : uint
      {
         return this.position$field;
      }
      
      public function clearSlotId() : void
      {
         this.hasField$0 &= 4294967167;
         this.slotId$field = new uint();
      }
      
      public function get hasSlotId() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set slotId(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.slotId$field = param1;
      }
      
      public function get slotId() : uint
      {
         return this.slotId$field;
      }
      
      public function clearFightPower() : void
      {
         this.hasField$0 &= 4294967039;
         this.fightPower$field = new uint();
      }
      
      public function get hasFightPower() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set fightPower(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.fightPower$field = param1;
      }
      
      public function get fightPower() : uint
      {
         return this.fightPower$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasReagentUID)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.reagentUID$field);
         }
         if(this.hasBaseId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.baseId$field);
         }
         if(this.hasQuality)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.quality$field);
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
         if(this.hasBuffType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.buffType$field);
         }
         if(this.hasBuffValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.buffValue$field);
         }
         if(this.hasPosition)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.position$field);
         }
         if(this.hasSlotId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.slotId$field);
         }
         if(this.hasFightPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.fightPower$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc13_:uint = 0;
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
         while(param1.bytesAvailable > param2)
         {
            _loc13_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc13_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Reagent.reagentUID cannot be set twice.");
                  }
                  _loc3_++;
                  this.reagentUID = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Reagent.baseId cannot be set twice.");
                  }
                  _loc4_++;
                  this.baseId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Reagent.quality cannot be set twice.");
                  }
                  _loc5_++;
                  this.quality = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Reagent.level cannot be set twice.");
                  }
                  _loc6_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Reagent.exp cannot be set twice.");
                  }
                  _loc7_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Reagent.buffType cannot be set twice.");
                  }
                  _loc8_++;
                  this.buffType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Reagent.buffValue cannot be set twice.");
                  }
                  _loc9_++;
                  this.buffValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Reagent.position cannot be set twice.");
                  }
                  _loc10_++;
                  this.position = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Reagent.slotId cannot be set twice.");
                  }
                  _loc11_++;
                  this.slotId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Reagent.fightPower cannot be set twice.");
                  }
                  _loc12_++;
                  this.fightPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc13_);
                  break;
            }
         }
      }
   }
}
