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
   
   public final class Cmd_LuckyStar_Take_DailyPack_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_LuckyStar_Take_DailyPack_SC";
      
      public static const ISTAKEDAILYPACK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_LuckyStar_Take_DailyPack_SC.isTakeDailyPack","isTakeDailyPack",1 << 3 | WireType.VARINT);
      
      public static const DAILYPACKID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_LuckyStar_Take_DailyPack_SC.dailyPackId","dailyPackId",2 << 3 | WireType.VARINT);
       
      
      private var isTakeDailyPack$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var dailyPackId$field:uint;
      
      public function Cmd_LuckyStar_Take_DailyPack_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_LuckyStar_Take_DailyPack_SC.$MessageID;
      }
      
      public function clearIsTakeDailyPack() : void
      {
         this.hasField$0 &= 4294967294;
         this.isTakeDailyPack$field = new uint();
      }
      
      public function get hasIsTakeDailyPack() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set isTakeDailyPack(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.isTakeDailyPack$field = param1;
      }
      
      public function get isTakeDailyPack() : uint
      {
         return this.isTakeDailyPack$field;
      }
      
      public function clearDailyPackId() : void
      {
         this.hasField$0 &= 4294967293;
         this.dailyPackId$field = new uint();
      }
      
      public function get hasDailyPackId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set dailyPackId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.dailyPackId$field = param1;
      }
      
      public function get dailyPackId() : uint
      {
         return this.dailyPackId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasIsTakeDailyPack)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.isTakeDailyPack$field);
         }
         if(this.hasDailyPackId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.dailyPackId$field);
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
                     throw new IOError("Bad data format: Cmd_LuckyStar_Take_DailyPack_SC.isTakeDailyPack cannot be set twice.");
                  }
                  _loc3_++;
                  this.isTakeDailyPack = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_LuckyStar_Take_DailyPack_SC.dailyPackId cannot be set twice.");
                  }
                  _loc4_++;
                  this.dailyPackId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
