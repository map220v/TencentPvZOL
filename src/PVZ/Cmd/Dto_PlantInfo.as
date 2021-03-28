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
   
   public final class Dto_PlantInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_PlantInfo";
      
      public static const PLANTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_PlantInfo.plantId","plantId",1 << 3 | WireType.VARINT);
      
      public static const ISNEW:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_PlantInfo.isNew","isNew",2 << 3 | WireType.VARINT);
      
      public static const AVATARID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_PlantInfo.avatarId","avatarId",3 << 3 | WireType.VARINT);
      
      public static const STRENGTHLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_PlantInfo.strengthLevel","strengthLevel",4 << 3 | WireType.VARINT);
       
      
      private var plantId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var isNew$field:Boolean;
      
      private var avatarId$field:uint;
      
      private var strengthLevel$field:uint;
      
      public function Dto_PlantInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_PlantInfo.$MessageID;
      }
      
      public function clearPlantId() : void
      {
         this.hasField$0 &= 4294967294;
         this.plantId$field = new uint();
      }
      
      public function get hasPlantId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set plantId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.plantId$field = param1;
      }
      
      public function get plantId() : uint
      {
         return this.plantId$field;
      }
      
      public function clearIsNew() : void
      {
         this.hasField$0 &= 4294967293;
         this.isNew$field = new Boolean();
      }
      
      public function get hasIsNew() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set isNew(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.isNew$field = param1;
      }
      
      public function get isNew() : Boolean
      {
         return this.isNew$field;
      }
      
      public function clearAvatarId() : void
      {
         this.hasField$0 &= 4294967291;
         this.avatarId$field = new uint();
      }
      
      public function get hasAvatarId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set avatarId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.avatarId$field = param1;
      }
      
      public function get avatarId() : uint
      {
         return this.avatarId$field;
      }
      
      public function clearStrengthLevel() : void
      {
         this.hasField$0 &= 4294967287;
         this.strengthLevel$field = new uint();
      }
      
      public function get hasStrengthLevel() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set strengthLevel(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.strengthLevel$field = param1;
      }
      
      public function get strengthLevel() : uint
      {
         return this.strengthLevel$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasPlantId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.plantId$field);
         }
         if(this.hasIsNew)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.isNew$field);
         }
         if(this.hasAvatarId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.avatarId$field);
         }
         if(this.hasStrengthLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.strengthLevel$field);
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
                     throw new IOError("Bad data format: Dto_PlantInfo.plantId cannot be set twice.");
                  }
                  _loc3_++;
                  this.plantId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PlantInfo.isNew cannot be set twice.");
                  }
                  _loc4_++;
                  this.isNew = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PlantInfo.avatarId cannot be set twice.");
                  }
                  _loc5_++;
                  this.avatarId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PlantInfo.strengthLevel cannot be set twice.");
                  }
                  _loc6_++;
                  this.strengthLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
