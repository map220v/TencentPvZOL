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
   
   public final class Cmd_TopFight_StatusChanged_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_TopFight_StatusChanged_SC";
      
      public static const SEASONID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TopFight_StatusChanged_SC.seasonId","seasonId",1 << 3 | WireType.VARINT);
      
      public static const OPENING:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_TopFight_StatusChanged_SC.opening","opening",2 << 3 | WireType.VARINT);
       
      
      private var seasonId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var opening$field:Boolean;
      
      public function Cmd_TopFight_StatusChanged_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_TopFight_StatusChanged_SC.$MessageID;
      }
      
      public function clearSeasonId() : void
      {
         this.hasField$0 &= 4294967294;
         this.seasonId$field = new uint();
      }
      
      public function get hasSeasonId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set seasonId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.seasonId$field = param1;
      }
      
      public function get seasonId() : uint
      {
         return this.seasonId$field;
      }
      
      public function clearOpening() : void
      {
         this.hasField$0 &= 4294967293;
         this.opening$field = new Boolean();
      }
      
      public function get hasOpening() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set opening(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.opening$field = param1;
      }
      
      public function get opening() : Boolean
      {
         return this.opening$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasSeasonId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.seasonId$field);
         }
         if(this.hasOpening)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.opening$field);
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
                     throw new IOError("Bad data format: Cmd_TopFight_StatusChanged_SC.seasonId cannot be set twice.");
                  }
                  _loc3_++;
                  this.seasonId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_StatusChanged_SC.opening cannot be set twice.");
                  }
                  _loc4_++;
                  this.opening = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
