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
   
   public final class Dto_RewardBox extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_RewardBox";
      
      public static const LEVELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RewardBox.levelId","levelId",1 << 3 | WireType.VARINT);
      
      public static const BOXID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RewardBox.boxId","boxId",2 << 3 | WireType.VARINT);
      
      public static const HASTAKEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_RewardBox.hasTaken","hasTaken",3 << 3 | WireType.VARINT);
       
      
      private var levelId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var boxId$field:uint;
      
      private var hasTaken$field:Boolean;
      
      public function Dto_RewardBox()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_RewardBox.$MessageID;
      }
      
      public function clearLevelId() : void
      {
         this.hasField$0 &= 4294967294;
         this.levelId$field = new uint();
      }
      
      public function get hasLevelId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set levelId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.levelId$field = param1;
      }
      
      public function get levelId() : uint
      {
         return this.levelId$field;
      }
      
      public function clearBoxId() : void
      {
         this.hasField$0 &= 4294967293;
         this.boxId$field = new uint();
      }
      
      public function get hasBoxId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set boxId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.boxId$field = param1;
      }
      
      public function get boxId() : uint
      {
         return this.boxId$field;
      }
      
      public function clearHasTaken() : void
      {
         this.hasField$0 &= 4294967291;
         this.hasTaken$field = new Boolean();
      }
      
      public function get hasHasTaken() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set hasTaken(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.hasTaken$field = param1;
      }
      
      public function get hasTaken() : Boolean
      {
         return this.hasTaken$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasLevelId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.levelId$field);
         }
         if(this.hasBoxId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.boxId$field);
         }
         if(this.hasHasTaken)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.hasTaken$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RewardBox.levelId cannot be set twice.");
                  }
                  _loc3_++;
                  this.levelId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RewardBox.boxId cannot be set twice.");
                  }
                  _loc4_++;
                  this.boxId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RewardBox.hasTaken cannot be set twice.");
                  }
                  _loc5_++;
                  this.hasTaken = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
