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
   
   public final class Cmd_VipBuy_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_VipBuy_SC";
      
      public static const GOLDTICKET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_VipBuy_SC.goldTicket","goldTicket",1 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const FREECOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_VipBuy_SC.freeCount","freeCount",2 << 3 | WireType.VARINT);
       
      
      private var goldTicket$field:Dto_IdNum;
      
      private var freeCount$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_VipBuy_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_VipBuy_SC.$MessageID;
      }
      
      public function clearGoldTicket() : void
      {
         this.goldTicket$field = null;
      }
      
      public function get hasGoldTicket() : Boolean
      {
         return this.goldTicket$field != null;
      }
      
      public function set goldTicket(param1:Dto_IdNum) : void
      {
         this.goldTicket$field = param1;
      }
      
      public function get goldTicket() : Dto_IdNum
      {
         return this.goldTicket$field;
      }
      
      public function clearFreeCount() : void
      {
         this.hasField$0 &= 4294967294;
         this.freeCount$field = new uint();
      }
      
      public function get hasFreeCount() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set freeCount(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.freeCount$field = param1;
      }
      
      public function get freeCount() : uint
      {
         return this.freeCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasGoldTicket)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.goldTicket$field);
         }
         if(this.hasFreeCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.freeCount$field);
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
                     throw new IOError("Bad data format: Cmd_VipBuy_SC.goldTicket cannot be set twice.");
                  }
                  _loc3_++;
                  this.goldTicket = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.goldTicket);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_VipBuy_SC.freeCount cannot be set twice.");
                  }
                  _loc4_++;
                  this.freeCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
