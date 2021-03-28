package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_PuppetSparInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_PuppetSparInfo";
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_PuppetSparInfo.level","level",1 << 3 | WireType.VARINT);
      
      public static const QUALITY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_PuppetSparInfo.quality","quality",2 << 3 | WireType.VARINT);
       
      
      private var level$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var quality$field:uint;
      
      public function Dto_PuppetSparInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_PuppetSparInfo.$MessageID;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasQuality)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.quality$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PuppetSparInfo.level cannot be set twice.");
                  }
                  _loc3_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PuppetSparInfo.quality cannot be set twice.");
                  }
                  _loc4_++;
                  this.quality = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
