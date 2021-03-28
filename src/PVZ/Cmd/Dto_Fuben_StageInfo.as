package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Fuben_StageInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Fuben_StageInfo";
      
      public static const CHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fuben_StageInfo.chapterid","chapterid",1 << 3 | WireType.VARINT);
      
      public static const MODEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fuben_StageInfo.modeid","modeid",2 << 3 | WireType.VARINT);
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fuben_StageInfo.stageid","stageid",3 << 3 | WireType.VARINT);
      
      public static const STAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fuben_StageInfo.star","star",4 << 3 | WireType.VARINT);
      
      public static const HASLIMIT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_Fuben_StageInfo.hasLimit","hasLimit",5 << 3 | WireType.VARINT);
      
      public static const TIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fuben_StageInfo.times","times",6 << 3 | WireType.VARINT);
      
      public static const CANSINGLESWEEP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_Fuben_StageInfo.canSingleSweep","canSingleSweep",7 << 3 | WireType.VARINT);
      
      public static const CANMULTISWEEP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_Fuben_StageInfo.canMultiSweep","canMultiSweep",8 << 3 | WireType.VARINT);
      
      public static const MULTISWEEPTTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fuben_StageInfo.multiSweeptTimes","multiSweeptTimes",9 << 3 | WireType.VARINT);
       
      
      private var chapterid$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var modeid$field:uint;
      
      private var stageid$field:uint;
      
      private var star$field:uint;
      
      private var hasLimit$field:Boolean;
      
      private var times$field:uint;
      
      private var canSingleSweep$field:Boolean;
      
      private var canMultiSweep$field:Boolean;
      
      private var multiSweeptTimes$field:uint;
      
      public function Dto_Fuben_StageInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Fuben_StageInfo.$MessageID;
      }
      
      public function clearChapterid() : void
      {
         this.hasField$0 &= 4294967294;
         this.chapterid$field = new uint();
      }
      
      public function get hasChapterid() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set chapterid(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.chapterid$field = param1;
      }
      
      public function get chapterid() : uint
      {
         return this.chapterid$field;
      }
      
      public function clearModeid() : void
      {
         this.hasField$0 &= 4294967293;
         this.modeid$field = new uint();
      }
      
      public function get hasModeid() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set modeid(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.modeid$field = param1;
      }
      
      public function get modeid() : uint
      {
         return this.modeid$field;
      }
      
      public function clearStageid() : void
      {
         this.hasField$0 &= 4294967291;
         this.stageid$field = new uint();
      }
      
      public function get hasStageid() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set stageid(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.stageid$field = param1;
      }
      
      public function get stageid() : uint
      {
         return this.stageid$field;
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
      
      public function clearHasLimit() : void
      {
         this.hasField$0 &= 4294967279;
         this.hasLimit$field = new Boolean();
      }
      
      public function get hasHasLimit() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set hasLimit(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.hasLimit$field = param1;
      }
      
      public function get hasLimit() : Boolean
      {
         if(!this.hasHasLimit)
         {
            return false;
         }
         return this.hasLimit$field;
      }
      
      public function clearTimes() : void
      {
         this.hasField$0 &= 4294967263;
         this.times$field = new uint();
      }
      
      public function get hasTimes() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set times(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.times$field = param1;
      }
      
      public function get times() : uint
      {
         return this.times$field;
      }
      
      public function clearCanSingleSweep() : void
      {
         this.hasField$0 &= 4294967231;
         this.canSingleSweep$field = new Boolean();
      }
      
      public function get hasCanSingleSweep() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set canSingleSweep(param1:Boolean) : void
      {
         this.hasField$0 |= 64;
         this.canSingleSweep$field = param1;
      }
      
      public function get canSingleSweep() : Boolean
      {
         return this.canSingleSweep$field;
      }
      
      public function clearCanMultiSweep() : void
      {
         this.hasField$0 &= 4294967167;
         this.canMultiSweep$field = new Boolean();
      }
      
      public function get hasCanMultiSweep() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set canMultiSweep(param1:Boolean) : void
      {
         this.hasField$0 |= 128;
         this.canMultiSweep$field = param1;
      }
      
      public function get canMultiSweep() : Boolean
      {
         return this.canMultiSweep$field;
      }
      
      public function clearMultiSweeptTimes() : void
      {
         this.hasField$0 &= 4294967039;
         this.multiSweeptTimes$field = new uint();
      }
      
      public function get hasMultiSweeptTimes() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set multiSweeptTimes(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.multiSweeptTimes$field = param1;
      }
      
      public function get multiSweeptTimes() : uint
      {
         return this.multiSweeptTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasChapterid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.chapterid$field);
         }
         if(this.hasModeid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.modeid$field);
         }
         if(this.hasStageid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.stageid$field);
         }
         if(this.hasStar)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.star$field);
         }
         if(this.hasHasLimit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.hasLimit$field);
         }
         if(this.hasTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.times$field);
         }
         if(this.hasCanSingleSweep)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.canSingleSweep$field);
         }
         if(this.hasCanMultiSweep)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_BOOL(param1,this.canMultiSweep$field);
         }
         if(this.hasMultiSweeptTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.multiSweeptTimes$field);
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
                     throw new IOError("Bad data format: Dto_Fuben_StageInfo.chapterid cannot be set twice.");
                  }
                  _loc3_++;
                  this.chapterid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fuben_StageInfo.modeid cannot be set twice.");
                  }
                  _loc4_++;
                  this.modeid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fuben_StageInfo.stageid cannot be set twice.");
                  }
                  _loc5_++;
                  this.stageid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fuben_StageInfo.star cannot be set twice.");
                  }
                  _loc6_++;
                  this.star = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fuben_StageInfo.hasLimit cannot be set twice.");
                  }
                  _loc7_++;
                  this.hasLimit = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fuben_StageInfo.times cannot be set twice.");
                  }
                  _loc8_++;
                  this.times = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fuben_StageInfo.canSingleSweep cannot be set twice.");
                  }
                  _loc9_++;
                  this.canSingleSweep = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fuben_StageInfo.canMultiSweep cannot be set twice.");
                  }
                  _loc10_++;
                  this.canMultiSweep = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fuben_StageInfo.multiSweeptTimes cannot be set twice.");
                  }
                  _loc11_++;
                  this.multiSweeptTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc12_);
                  break;
            }
         }
      }
   }
}
