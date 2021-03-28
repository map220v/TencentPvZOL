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
   
   public final class Dto_Guild_FlagInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Guild_FlagInfo";
      
      public static const COLORID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_FlagInfo.colorId","colorId",1 << 3 | WireType.VARINT);
      
      public static const COLOR2ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_FlagInfo.color2Id","color2Id",2 << 3 | WireType.VARINT);
      
      public static const SURFACEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_FlagInfo.surfaceId","surfaceId",3 << 3 | WireType.VARINT);
      
      public static const SIGNID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_FlagInfo.signId","signId",4 << 3 | WireType.VARINT);
       
      
      private var colorId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var color2Id$field:uint;
      
      private var surfaceId$field:uint;
      
      private var signId$field:uint;
      
      public function Dto_Guild_FlagInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Guild_FlagInfo.$MessageID;
      }
      
      public function clearColorId() : void
      {
         this.hasField$0 &= 4294967294;
         this.colorId$field = new uint();
      }
      
      public function get hasColorId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set colorId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.colorId$field = param1;
      }
      
      public function get colorId() : uint
      {
         return this.colorId$field;
      }
      
      public function clearColor2Id() : void
      {
         this.hasField$0 &= 4294967293;
         this.color2Id$field = new uint();
      }
      
      public function get hasColor2Id() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set color2Id(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.color2Id$field = param1;
      }
      
      public function get color2Id() : uint
      {
         return this.color2Id$field;
      }
      
      public function clearSurfaceId() : void
      {
         this.hasField$0 &= 4294967291;
         this.surfaceId$field = new uint();
      }
      
      public function get hasSurfaceId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set surfaceId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.surfaceId$field = param1;
      }
      
      public function get surfaceId() : uint
      {
         return this.surfaceId$field;
      }
      
      public function clearSignId() : void
      {
         this.hasField$0 &= 4294967287;
         this.signId$field = new uint();
      }
      
      public function get hasSignId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set signId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.signId$field = param1;
      }
      
      public function get signId() : uint
      {
         return this.signId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasColorId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.colorId$field);
         }
         if(this.hasColor2Id)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.color2Id$field);
         }
         if(this.hasSurfaceId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.surfaceId$field);
         }
         if(this.hasSignId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.signId$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_FlagInfo.colorId cannot be set twice.");
                  }
                  _loc3_++;
                  this.colorId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_FlagInfo.color2Id cannot be set twice.");
                  }
                  _loc4_++;
                  this.color2Id = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_FlagInfo.surfaceId cannot be set twice.");
                  }
                  _loc5_++;
                  this.surfaceId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_FlagInfo.signId cannot be set twice.");
                  }
                  _loc6_++;
                  this.signId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
