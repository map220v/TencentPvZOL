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
   
   public final class Dto_ActiveEvent extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ActiveEvent";
      
      public static const EVENTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ActiveEvent.eventId","eventId",1 << 3 | WireType.VARINT);
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ActiveEvent.count","count",2 << 3 | WireType.VARINT);
      
      public static const UNITACTIVEVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ActiveEvent.unitActiveValue","unitActiveValue",3 << 3 | WireType.VARINT);
       
      
      private var eventId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var count$field:uint;
      
      private var unitActiveValue$field:uint;
      
      public function Dto_ActiveEvent()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ActiveEvent.$MessageID;
      }
      
      public function clearEventId() : void
      {
         this.hasField$0 &= 4294967294;
         this.eventId$field = new uint();
      }
      
      public function get hasEventId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set eventId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.eventId$field = param1;
      }
      
      public function get eventId() : uint
      {
         return this.eventId$field;
      }
      
      public function clearCount() : void
      {
         this.hasField$0 &= 4294967293;
         this.count$field = new uint();
      }
      
      public function get hasCount() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set count(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.count$field = param1;
      }
      
      public function get count() : uint
      {
         return this.count$field;
      }
      
      public function clearUnitActiveValue() : void
      {
         this.hasField$0 &= 4294967291;
         this.unitActiveValue$field = new uint();
      }
      
      public function get hasUnitActiveValue() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set unitActiveValue(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.unitActiveValue$field = param1;
      }
      
      public function get unitActiveValue() : uint
      {
         return this.unitActiveValue$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasEventId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.eventId$field);
         }
         if(this.hasCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.count$field);
         }
         if(this.hasUnitActiveValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.unitActiveValue$field);
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
                     throw new IOError("Bad data format: Dto_ActiveEvent.eventId cannot be set twice.");
                  }
                  _loc3_++;
                  this.eventId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ActiveEvent.count cannot be set twice.");
                  }
                  _loc4_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ActiveEvent.unitActiveValue cannot be set twice.");
                  }
                  _loc5_++;
                  this.unitActiveValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
