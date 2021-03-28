package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_PuppetInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_PuppetInfo";
      
      public static const BASEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_PuppetInfo.baseId","baseId",1 << 3 | WireType.VARINT);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_PuppetInfo.exp","exp",2 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_PuppetInfo.level","level",3 << 3 | WireType.VARINT);
      
      public static const STAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_PuppetInfo.star","star",4 << 3 | WireType.VARINT);
      
      public static const QUALITY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_PuppetInfo.quality","quality",5 << 3 | WireType.VARINT);
      
      public static const ACTIVESKILL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_PuppetInfo.activeSkill","activeSkill",6 << 3 | WireType.LENGTH_DELIMITED,Dto_PuppetSkillInfo);
      
      public static const PASSIVESKILL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_PuppetInfo.passiveSkill","passiveSkill",7 << 3 | WireType.LENGTH_DELIMITED,Dto_PuppetSkillInfo);
       
      
      private var baseId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var exp$field:uint;
      
      private var level$field:uint;
      
      private var star$field:uint;
      
      private var quality$field:uint;
      
      private var activeSkill$field:Dto_PuppetSkillInfo;
      
      private var passiveSkill$field:Dto_PuppetSkillInfo;
      
      public function Dto_PuppetInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_PuppetInfo.$MessageID;
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
      
      public function clearExp() : void
      {
         this.hasField$0 &= 4294967293;
         this.exp$field = new uint();
      }
      
      public function get hasExp() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set exp(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.exp$field = param1;
      }
      
      public function get exp() : uint
      {
         return this.exp$field;
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
      
      public function clearStar() : void
      {
         this.hasField$0 &= 4294967287;
         this.star$field = new uint();
      }
      
      public function get hasStar() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set star(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.star$field = param1;
      }
      
      public function get star() : uint
      {
         return this.star$field;
      }
      
      public function clearQuality() : void
      {
         this.hasField$0 &= 4294967279;
         this.quality$field = new uint();
      }
      
      public function get hasQuality() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set quality(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.quality$field = param1;
      }
      
      public function get quality() : uint
      {
         return this.quality$field;
      }
      
      public function clearActiveSkill() : void
      {
         this.activeSkill$field = null;
      }
      
      public function get hasActiveSkill() : Boolean
      {
         return this.activeSkill$field != null;
      }
      
      public function set activeSkill(param1:Dto_PuppetSkillInfo) : void
      {
         this.activeSkill$field = param1;
      }
      
      public function get activeSkill() : Dto_PuppetSkillInfo
      {
         return this.activeSkill$field;
      }
      
      public function clearPassiveSkill() : void
      {
         this.passiveSkill$field = null;
      }
      
      public function get hasPassiveSkill() : Boolean
      {
         return this.passiveSkill$field != null;
      }
      
      public function set passiveSkill(param1:Dto_PuppetSkillInfo) : void
      {
         this.passiveSkill$field = param1;
      }
      
      public function get passiveSkill() : Dto_PuppetSkillInfo
      {
         return this.passiveSkill$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasBaseId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.baseId$field);
         }
         if(this.hasExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.exp$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasStar)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.star$field);
         }
         if(this.hasQuality)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.quality$field);
         }
         if(this.hasActiveSkill)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.activeSkill$field);
         }
         if(this.hasPassiveSkill)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.passiveSkill$field);
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
                     throw new IOError("Bad data format: Dto_PuppetInfo.baseId cannot be set twice.");
                  }
                  _loc3_++;
                  this.baseId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PuppetInfo.exp cannot be set twice.");
                  }
                  _loc4_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PuppetInfo.level cannot be set twice.");
                  }
                  _loc5_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PuppetInfo.star cannot be set twice.");
                  }
                  _loc6_++;
                  this.star = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PuppetInfo.quality cannot be set twice.");
                  }
                  _loc7_++;
                  this.quality = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PuppetInfo.activeSkill cannot be set twice.");
                  }
                  _loc8_++;
                  this.activeSkill = new Dto_PuppetSkillInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.activeSkill);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PuppetInfo.passiveSkill cannot be set twice.");
                  }
                  _loc9_++;
                  this.passiveSkill = new Dto_PuppetSkillInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.passiveSkill);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
