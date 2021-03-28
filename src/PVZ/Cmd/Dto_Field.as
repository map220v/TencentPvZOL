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
   
   public final class Dto_Field extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Field";
      
      public static const FIELDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Field.fieldid","fieldid",1 << 3 | WireType.VARINT);
      
      public static const POT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Field.pot","pot",2 << 3 | WireType.LENGTH_DELIMITED,Dto_Pot);
       
      
      private var fieldid$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var pot$field:Dto_Pot;
      
      public function Dto_Field()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Field.$MessageID;
      }
      
      public function clearFieldid() : void
      {
         this.hasField$0 &= 4294967294;
         this.fieldid$field = new uint();
      }
      
      public function get hasFieldid() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set fieldid(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.fieldid$field = param1;
      }
      
      public function get fieldid() : uint
      {
         return this.fieldid$field;
      }
      
      public function clearPot() : void
      {
         this.pot$field = null;
      }
      
      public function get hasPot() : Boolean
      {
         return this.pot$field != null;
      }
      
      public function set pot(param1:Dto_Pot) : void
      {
         this.pot$field = param1;
      }
      
      public function get pot() : Dto_Pot
      {
         return this.pot$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasFieldid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.fieldid$field);
         }
         if(this.hasPot)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.pot$field);
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
                     throw new IOError("Bad data format: Dto_Field.fieldid cannot be set twice.");
                  }
                  _loc3_++;
                  this.fieldid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Field.pot cannot be set twice.");
                  }
                  _loc4_++;
                  this.pot = new Dto_Pot();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.pot);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
