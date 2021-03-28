package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Pot extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Pot";
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Pot.level","level",1 << 3 | WireType.VARINT);
      
      public static const ISSEVENCOLOR:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_Pot.issevencolor","issevencolor",2 << 3 | WireType.VARINT);
      
      public static const SEEDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Pot.seedid","seedid",3 << 3 | WireType.VARINT);
      
      public static const PLANTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Pot.planttime","planttime",4 << 3 | WireType.VARINT);
      
      public static const NEXTHARVESTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Pot.nextharvesttime","nextharvesttime",5 << 3 | WireType.VARINT);
      
      public static const LASTFERTILIZETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Pot.lastfertilizetime","lastfertilizetime",6 << 3 | WireType.VARINT);
      
      public static const NEEDFERTILIZE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_Pot.needfertilize","needfertilize",7 << 3 | WireType.VARINT);
      
      public static const FERTILIZERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Pot.fertilizerid","fertilizerid",8 << 3 | WireType.VARINT);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Pot.exp","exp",9 << 3 | WireType.VARINT);
      
      public static const LASTHARVESTEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Pot.lastharvestexp","lastharvestexp",10 << 3 | WireType.VARINT);
      
      public static const BIGBALL:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_Pot.bigball","bigball",11 << 3 | WireType.VARINT);
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Pot.reward","reward",12 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var level$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var issevencolor$field:Boolean;
      
      private var seedid$field:uint;
      
      private var planttime$field:uint;
      
      private var nextharvesttime$field:uint;
      
      private var lastfertilizetime$field:uint;
      
      private var needfertilize$field:Boolean;
      
      private var fertilizerid$field:uint;
      
      private var exp$field:uint;
      
      private var lastharvestexp$field:uint;
      
      private var bigball$field:Boolean;
      
      public var reward:Array;
      
      public function Dto_Pot()
      {
         this.reward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Pot.$MessageID;
      }
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967294;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.level$field = param1;
      }
      
      public function get level() : uint
      {
         return this.level$field;
      }
      
      public function clearIssevencolor() : void
      {
         this.hasField$0 &= 4294967293;
         this.issevencolor$field = new Boolean();
      }
      
      public function get hasIssevencolor() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set issevencolor(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.issevencolor$field = param1;
      }
      
      public function get issevencolor() : Boolean
      {
         return this.issevencolor$field;
      }
      
      public function clearSeedid() : void
      {
         this.hasField$0 &= 4294967291;
         this.seedid$field = new uint();
      }
      
      public function get hasSeedid() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set seedid(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.seedid$field = param1;
      }
      
      public function get seedid() : uint
      {
         return this.seedid$field;
      }
      
      public function clearPlanttime() : void
      {
         this.hasField$0 &= 4294967287;
         this.planttime$field = new uint();
      }
      
      public function get hasPlanttime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set planttime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.planttime$field = param1;
      }
      
      public function get planttime() : uint
      {
         return this.planttime$field;
      }
      
      public function clearNextharvesttime() : void
      {
         this.hasField$0 &= 4294967279;
         this.nextharvesttime$field = new uint();
      }
      
      public function get hasNextharvesttime() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set nextharvesttime(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.nextharvesttime$field = param1;
      }
      
      public function get nextharvesttime() : uint
      {
         return this.nextharvesttime$field;
      }
      
      public function clearLastfertilizetime() : void
      {
         this.hasField$0 &= 4294967263;
         this.lastfertilizetime$field = new uint();
      }
      
      public function get hasLastfertilizetime() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set lastfertilizetime(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.lastfertilizetime$field = param1;
      }
      
      public function get lastfertilizetime() : uint
      {
         return this.lastfertilizetime$field;
      }
      
      public function clearNeedfertilize() : void
      {
         this.hasField$0 &= 4294967231;
         this.needfertilize$field = new Boolean();
      }
      
      public function get hasNeedfertilize() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set needfertilize(param1:Boolean) : void
      {
         this.hasField$0 |= 64;
         this.needfertilize$field = param1;
      }
      
      public function get needfertilize() : Boolean
      {
         return this.needfertilize$field;
      }
      
      public function clearFertilizerid() : void
      {
         this.hasField$0 &= 4294967167;
         this.fertilizerid$field = new uint();
      }
      
      public function get hasFertilizerid() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set fertilizerid(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.fertilizerid$field = param1;
      }
      
      public function get fertilizerid() : uint
      {
         return this.fertilizerid$field;
      }
      
      public function clearExp() : void
      {
         this.hasField$0 &= 4294967039;
         this.exp$field = new uint();
      }
      
      public function get hasExp() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set exp(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.exp$field = param1;
      }
      
      public function get exp() : uint
      {
         return this.exp$field;
      }
      
      public function clearLastharvestexp() : void
      {
         this.hasField$0 &= 4294966783;
         this.lastharvestexp$field = new uint();
      }
      
      public function get hasLastharvestexp() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set lastharvestexp(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.lastharvestexp$field = param1;
      }
      
      public function get lastharvestexp() : uint
      {
         return this.lastharvestexp$field;
      }
      
      public function clearBigball() : void
      {
         this.hasField$0 &= 4294966271;
         this.bigball$field = new Boolean();
      }
      
      public function get hasBigball() : Boolean
      {
         return (this.hasField$0 & 1024) != 0;
      }
      
      public function set bigball(param1:Boolean) : void
      {
         this.hasField$0 |= 1024;
         this.bigball$field = param1;
      }
      
      public function get bigball() : Boolean
      {
         return this.bigball$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasIssevencolor)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.issevencolor$field);
         }
         if(this.hasSeedid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.seedid$field);
         }
         if(this.hasPlanttime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.planttime$field);
         }
         if(this.hasNextharvesttime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.nextharvesttime$field);
         }
         if(this.hasLastfertilizetime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.lastfertilizetime$field);
         }
         if(this.hasNeedfertilize)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.needfertilize$field);
         }
         if(this.hasFertilizerid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.fertilizerid$field);
         }
         if(this.hasExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.exp$field);
         }
         if(this.hasLastharvestexp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.lastharvestexp$field);
         }
         if(this.hasBigball)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_BOOL(param1,this.bigball$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,12);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc14_:uint = 0;
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
         while(param1.bytesAvailable > param2)
         {
            _loc14_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc14_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Pot.level cannot be set twice.");
                  }
                  _loc3_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Pot.issevencolor cannot be set twice.");
                  }
                  _loc4_++;
                  this.issevencolor = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Pot.seedid cannot be set twice.");
                  }
                  _loc5_++;
                  this.seedid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Pot.planttime cannot be set twice.");
                  }
                  _loc6_++;
                  this.planttime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Pot.nextharvesttime cannot be set twice.");
                  }
                  _loc7_++;
                  this.nextharvesttime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Pot.lastfertilizetime cannot be set twice.");
                  }
                  _loc8_++;
                  this.lastfertilizetime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Pot.needfertilize cannot be set twice.");
                  }
                  _loc9_++;
                  this.needfertilize = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Pot.fertilizerid cannot be set twice.");
                  }
                  _loc10_++;
                  this.fertilizerid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Pot.exp cannot be set twice.");
                  }
                  _loc11_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Pot.lastharvestexp cannot be set twice.");
                  }
                  _loc12_++;
                  this.lastharvestexp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Pot.bigball cannot be set twice.");
                  }
                  _loc13_++;
                  this.bigball = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 12:
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               default:
                  super.readUnknown(param1,_loc14_);
                  break;
            }
         }
      }
   }
}
