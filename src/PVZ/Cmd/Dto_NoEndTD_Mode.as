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
   
   public final class Dto_NoEndTD_Mode extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_NoEndTD_Mode";
      
      public static const MODE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NoEndTD_Mode.mode","mode",1 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NoEndTD_Mode.level","level",2 << 3 | WireType.VARINT);
      
      public static const CURWAVE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NoEndTD_Mode.curWave","curWave",3 << 3 | WireType.VARINT);
      
      public static const MAXWAVE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NoEndTD_Mode.maxWave","maxWave",4 << 3 | WireType.VARINT);
      
      public static const CURSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NoEndTD_Mode.curScore","curScore",5 << 3 | WireType.VARINT);
      
      public static const MAXSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NoEndTD_Mode.maxScore","maxScore",6 << 3 | WireType.VARINT);
      
      public static const RAIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NoEndTD_Mode.rain","rain",7 << 3 | WireType.VARINT);
      
      public static const CHALLENGETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NoEndTD_Mode.challengeTimes","challengeTimes",8 << 3 | WireType.VARINT);
      
      public static const MAPINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_NoEndTD_Mode.mapInfo","mapInfo",9 << 3 | WireType.LENGTH_DELIMITED,Dto_NoEndTD_Map);
       
      
      private var mode$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var level$field:uint;
      
      private var curWave$field:uint;
      
      private var maxWave$field:uint;
      
      private var curScore$field:uint;
      
      private var maxScore$field:uint;
      
      private var rain$field:uint;
      
      private var challengeTimes$field:uint;
      
      public var mapInfo:Array;
      
      public function Dto_NoEndTD_Mode()
      {
         this.mapInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_NoEndTD_Mode.$MessageID;
      }
      
      public function clearMode() : void
      {
         this.hasField$0 &= 4294967294;
         this.mode$field = new uint();
      }
      
      public function get hasMode() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set mode(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.mode$field = param1;
      }
      
      public function get mode() : uint
      {
         return this.mode$field;
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
      
      public function clearCurWave() : void
      {
         this.hasField$0 &= 4294967291;
         this.curWave$field = new uint();
      }
      
      public function get hasCurWave() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set curWave(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.curWave$field = param1;
      }
      
      public function get curWave() : uint
      {
         return this.curWave$field;
      }
      
      public function clearMaxWave() : void
      {
         this.hasField$0 &= 4294967287;
         this.maxWave$field = new uint();
      }
      
      public function get hasMaxWave() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set maxWave(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.maxWave$field = param1;
      }
      
      public function get maxWave() : uint
      {
         return this.maxWave$field;
      }
      
      public function clearCurScore() : void
      {
         this.hasField$0 &= 4294967279;
         this.curScore$field = new uint();
      }
      
      public function get hasCurScore() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set curScore(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.curScore$field = param1;
      }
      
      public function get curScore() : uint
      {
         return this.curScore$field;
      }
      
      public function clearMaxScore() : void
      {
         this.hasField$0 &= 4294967263;
         this.maxScore$field = new uint();
      }
      
      public function get hasMaxScore() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set maxScore(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.maxScore$field = param1;
      }
      
      public function get maxScore() : uint
      {
         return this.maxScore$field;
      }
      
      public function clearRain() : void
      {
         this.hasField$0 &= 4294967231;
         this.rain$field = new uint();
      }
      
      public function get hasRain() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set rain(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.rain$field = param1;
      }
      
      public function get rain() : uint
      {
         return this.rain$field;
      }
      
      public function clearChallengeTimes() : void
      {
         this.hasField$0 &= 4294967167;
         this.challengeTimes$field = new uint();
      }
      
      public function get hasChallengeTimes() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set challengeTimes(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.challengeTimes$field = param1;
      }
      
      public function get challengeTimes() : uint
      {
         return this.challengeTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasMode)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.mode$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasCurWave)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.curWave$field);
         }
         if(this.hasMaxWave)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.maxWave$field);
         }
         if(this.hasCurScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.curScore$field);
         }
         if(this.hasMaxScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.maxScore$field);
         }
         if(this.hasRain)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.rain$field);
         }
         if(this.hasChallengeTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.challengeTimes$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.mapInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.mapInfo[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc11_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc11_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc11_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NoEndTD_Mode.mode cannot be set twice.");
                  }
                  _loc3_++;
                  this.mode = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NoEndTD_Mode.level cannot be set twice.");
                  }
                  _loc4_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NoEndTD_Mode.curWave cannot be set twice.");
                  }
                  _loc5_++;
                  this.curWave = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NoEndTD_Mode.maxWave cannot be set twice.");
                  }
                  _loc6_++;
                  this.maxWave = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NoEndTD_Mode.curScore cannot be set twice.");
                  }
                  _loc7_++;
                  this.curScore = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NoEndTD_Mode.maxScore cannot be set twice.");
                  }
                  _loc8_++;
                  this.maxScore = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NoEndTD_Mode.rain cannot be set twice.");
                  }
                  _loc9_++;
                  this.rain = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NoEndTD_Mode.challengeTimes cannot be set twice.");
                  }
                  _loc10_++;
                  this.challengeTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  this.mapInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_NoEndTD_Map()));
                  break;
               default:
                  super.readUnknown(param1,_loc11_);
                  break;
            }
         }
      }
   }
}
