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
   
   public final class Dto_PuppetFuben_StageInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_PuppetFuben_StageInfo";
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_PuppetFuben_StageInfo.stageId","stageId",1 << 3 | WireType.VARINT);
      
      public static const STAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_PuppetFuben_StageInfo.star","star",2 << 3 | WireType.VARINT);
      
      public static const HASLIMIT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_PuppetFuben_StageInfo.hasLimit","hasLimit",3 << 3 | WireType.VARINT);
      
      public static const TIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_PuppetFuben_StageInfo.times","times",4 << 3 | WireType.VARINT);
      
      public static const CANSWEEP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_PuppetFuben_StageInfo.canSweep","canSweep",5 << 3 | WireType.VARINT);
       
      
      private var stageId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var star$field:uint;
      
      private var hasLimit$field:Boolean;
      
      private var times$field:uint;
      
      private var canSweep$field:Boolean;
      
      public function Dto_PuppetFuben_StageInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_PuppetFuben_StageInfo.$MessageID;
      }
      
      public function clearStageId() : void
      {
         this.hasField$0 &= 4294967294;
         this.stageId$field = new uint();
      }
      
      public function get hasStageId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set stageId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.stageId$field = param1;
      }
      
      public function get stageId() : uint
      {
         return this.stageId$field;
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
      
      public function clearHasLimit() : void
      {
         this.hasField$0 &= 4294967291;
         this.hasLimit$field = new Boolean();
      }
      
      public function get hasHasLimit() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set hasLimit(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
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
         this.hasField$0 &= 4294967287;
         this.times$field = new uint();
      }
      
      public function get hasTimes() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set times(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.times$field = param1;
      }
      
      public function get times() : uint
      {
         return this.times$field;
      }
      
      public function clearCanSweep() : void
      {
         this.hasField$0 &= 4294967279;
         this.canSweep$field = new Boolean();
      }
      
      public function get hasCanSweep() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set canSweep(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.canSweep$field = param1;
      }
      
      public function get canSweep() : Boolean
      {
         return this.canSweep$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         if(this.hasStar)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.star$field);
         }
         if(this.hasHasLimit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.hasLimit$field);
         }
         if(this.hasTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.times$field);
         }
         if(this.hasCanSweep)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.canSweep$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Dto_PuppetFuben_StageInfo.stageId cannot be set twice.");
                  }
                  _loc3_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PuppetFuben_StageInfo.star cannot be set twice.");
                  }
                  _loc4_++;
                  this.star = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PuppetFuben_StageInfo.hasLimit cannot be set twice.");
                  }
                  _loc5_++;
                  this.hasLimit = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PuppetFuben_StageInfo.times cannot be set twice.");
                  }
                  _loc6_++;
                  this.times = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PuppetFuben_StageInfo.canSweep cannot be set twice.");
                  }
                  _loc7_++;
                  this.canSweep = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
