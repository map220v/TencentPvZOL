package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Hoodle_Fire_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Hoodle_Fire_SC";
      
      public static const HOODLETYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Hoodle_Fire_SC.hoodleType","hoodleType",1 << 3 | WireType.VARINT);
      
      public static const HIT:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Hoodle_Fire_SC.hit","hit",2 << 3 | WireType.VARINT);
      
      public static const ADDTICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Hoodle_Fire_SC.addTicket","addTicket",3 << 3 | WireType.VARINT);
       
      
      private var hoodleType$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var hit:Array;
      
      private var addTicket$field:uint;
      
      public function Cmd_Hoodle_Fire_SC()
      {
         this.hit = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Hoodle_Fire_SC.$MessageID;
      }
      
      public function clearHoodleType() : void
      {
         this.hasField$0 &= 4294967294;
         this.hoodleType$field = new uint();
      }
      
      public function get hasHoodleType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set hoodleType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.hoodleType$field = param1;
      }
      
      public function get hoodleType() : uint
      {
         return this.hoodleType$field;
      }
      
      public function clearAddTicket() : void
      {
         this.hasField$0 &= 4294967293;
         this.addTicket$field = new uint();
      }
      
      public function get hasAddTicket() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set addTicket(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.addTicket$field = param1;
      }
      
      public function get addTicket() : uint
      {
         return this.addTicket$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasHoodleType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.hoodleType$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.hit.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.hit[_loc2_]);
            _loc2_++;
         }
         if(this.hasAddTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.addTicket$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Cmd_Hoodle_Fire_SC.hoodleType cannot be set twice.");
                  }
                  _loc3_++;
                  this.hoodleType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if((_loc5_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.hit);
                  }
                  else
                  {
                     this.hit.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Hoodle_Fire_SC.addTicket cannot be set twice.");
                  }
                  _loc4_++;
                  this.addTicket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
