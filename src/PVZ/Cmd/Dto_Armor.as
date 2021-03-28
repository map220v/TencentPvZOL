package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Armor extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Armor";
      
      public static const ARMORTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Armor.armorType","armorType",1 << 3 | WireType.VARINT);
      
      public static const STAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Armor.star","star",2 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Armor.level","level",3 << 3 | WireType.VARINT);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Armor.exp","exp",4 << 3 | WireType.VARINT);
      
      public static const GEM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Armor.gem","gem",5 << 3 | WireType.LENGTH_DELIMITED,Dto_ArmorGem);
      
      public static const SUBSTAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Armor.subStar","subStar",6 << 3 | WireType.VARINT);
       
      
      private var armorType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var star$field:uint;
      
      private var level$field:uint;
      
      private var exp$field:uint;
      
      public var gem:Array;
      
      private var subStar$field:uint;
      
      public function Dto_Armor()
      {
         this.gem = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Armor.$MessageID;
      }
      
      public function clearArmorType() : void
      {
         this.hasField$0 &= 4294967294;
         this.armorType$field = new uint();
      }
      
      public function get hasArmorType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set armorType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.armorType$field = param1;
      }
      
      public function get armorType() : uint
      {
         return this.armorType$field;
      }
      
      public function clearStar() : void
      {
         this.hasField$0 &= 4294967293;
         this.star$field = new uint();
      }
      
      public function get hasStar() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set star(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.star$field = param1;
      }
      
      public function get star() : uint
      {
         return this.star$field;
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
      
      public function clearSubStar() : void
      {
         this.hasField$0 &= 4294967279;
         this.subStar$field = new uint();
      }
      
      public function get hasSubStar() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set subStar(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.subStar$field = param1;
      }
      
      public function get subStar() : uint
      {
         return this.subStar$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasArmorType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.armorType$field);
         }
         if(this.hasStar)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.star$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.exp$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.gem.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.gem[_loc2_]);
            _loc2_++;
         }
         if(this.hasSubStar)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.subStar$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Armor.armorType cannot be set twice.");
                  }
                  _loc3_++;
                  this.armorType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Armor.star cannot be set twice.");
                  }
                  _loc4_++;
                  this.star = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Armor.level cannot be set twice.");
                  }
                  _loc5_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Armor.exp cannot be set twice.");
                  }
                  _loc6_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  this.gem.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ArmorGem()));
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Armor.subStar cannot be set twice.");
                  }
                  _loc7_++;
                  this.subStar = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
