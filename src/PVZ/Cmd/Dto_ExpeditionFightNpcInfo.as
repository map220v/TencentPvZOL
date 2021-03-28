package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_DOUBLE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_ExpeditionFightNpcInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ExpeditionFightNpcInfo";
      
      public static const NPCID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightNpcInfo.npcId","npcId",1 << 3 | WireType.VARINT);
      
      public static const LEFTSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightNpcInfo.leftScore","leftScore",2 << 3 | WireType.VARINT);
      
      public static const KILLED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_ExpeditionFightNpcInfo.killed","killed",3 << 3 | WireType.VARINT);
      
      public static const HPRATIO:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("PVZ.Cmd.Dto_ExpeditionFightNpcInfo.hpRatio","hpRatio",4 << 3 | WireType.FIXED_64_BIT);
      
      public static const KILLERSIDEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightNpcInfo.killerSideId","killerSideId",5 << 3 | WireType.VARINT);
      
      public static const KILLERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ExpeditionFightNpcInfo.killerName","killerName",6 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const KILLTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightNpcInfo.killTime","killTime",7 << 3 | WireType.VARINT);
       
      
      private var npcId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var leftScore$field:uint;
      
      private var killed$field:Boolean;
      
      private var hpRatio$field:Number;
      
      private var killerSideId$field:uint;
      
      private var killerName$field:String;
      
      private var killTime$field:uint;
      
      public function Dto_ExpeditionFightNpcInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ExpeditionFightNpcInfo.$MessageID;
      }
      
      public function clearNpcId() : void
      {
         this.hasField$0 &= 4294967294;
         this.npcId$field = new uint();
      }
      
      public function get hasNpcId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set npcId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.npcId$field = param1;
      }
      
      public function get npcId() : uint
      {
         return this.npcId$field;
      }
      
      public function clearLeftScore() : void
      {
         this.hasField$0 &= 4294967293;
         this.leftScore$field = new uint();
      }
      
      public function get hasLeftScore() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set leftScore(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.leftScore$field = param1;
      }
      
      public function get leftScore() : uint
      {
         return this.leftScore$field;
      }
      
      public function clearKilled() : void
      {
         this.hasField$0 &= 4294967291;
         this.killed$field = new Boolean();
      }
      
      public function get hasKilled() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set killed(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.killed$field = param1;
      }
      
      public function get killed() : Boolean
      {
         return this.killed$field;
      }
      
      public function clearHpRatio() : void
      {
         this.hasField$0 &= 4294967287;
         this.hpRatio$field = new Number();
      }
      
      public function get hasHpRatio() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set hpRatio(param1:Number) : void
      {
         this.hasField$0 |= 8;
         this.hpRatio$field = param1;
      }
      
      public function get hpRatio() : Number
      {
         return this.hpRatio$field;
      }
      
      public function clearKillerSideId() : void
      {
         this.hasField$0 &= 4294967279;
         this.killerSideId$field = new uint();
      }
      
      public function get hasKillerSideId() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set killerSideId(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.killerSideId$field = param1;
      }
      
      public function get killerSideId() : uint
      {
         return this.killerSideId$field;
      }
      
      public function clearKillerName() : void
      {
         this.killerName$field = null;
      }
      
      public function get hasKillerName() : Boolean
      {
         return this.killerName$field != null;
      }
      
      public function set killerName(param1:String) : void
      {
         this.killerName$field = param1;
      }
      
      public function get killerName() : String
      {
         return this.killerName$field;
      }
      
      public function clearKillTime() : void
      {
         this.hasField$0 &= 4294967263;
         this.killTime$field = new uint();
      }
      
      public function get hasKillTime() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set killTime(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.killTime$field = param1;
      }
      
      public function get killTime() : uint
      {
         return this.killTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasNpcId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.npcId$field);
         }
         if(this.hasLeftScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.leftScore$field);
         }
         if(this.hasKilled)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.killed$field);
         }
         if(this.hasHpRatio)
         {
            WriteUtils.writeTag(param1,WireType.FIXED_64_BIT,4);
            WriteUtils.write$TYPE_DOUBLE(param1,this.hpRatio$field);
         }
         if(this.hasKillerSideId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.killerSideId$field);
         }
         if(this.hasKillerName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_STRING(param1,this.killerName$field);
         }
         if(this.hasKillTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.killTime$field);
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
                     throw new IOError("Bad data format: Dto_ExpeditionFightNpcInfo.npcId cannot be set twice.");
                  }
                  _loc3_++;
                  this.npcId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightNpcInfo.leftScore cannot be set twice.");
                  }
                  _loc4_++;
                  this.leftScore = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightNpcInfo.killed cannot be set twice.");
                  }
                  _loc5_++;
                  this.killed = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightNpcInfo.hpRatio cannot be set twice.");
                  }
                  _loc6_++;
                  this.hpRatio = ReadUtils.read$TYPE_DOUBLE(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightNpcInfo.killerSideId cannot be set twice.");
                  }
                  _loc7_++;
                  this.killerSideId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightNpcInfo.killerName cannot be set twice.");
                  }
                  _loc8_++;
                  this.killerName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightNpcInfo.killTime cannot be set twice.");
                  }
                  _loc9_++;
                  this.killTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
