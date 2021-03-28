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
   
   public final class Cmd_Garden_PotUpLevel_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Garden_PotUpLevel_SC";
      
      public static const FIELDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Garden_PotUpLevel_SC.fieldid","fieldid",1 << 3 | WireType.VARINT);
      
      public static const FIELD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Garden_PotUpLevel_SC.field","field",2 << 3 | WireType.LENGTH_DELIMITED,Dto_Field);
       
      
      private var fieldid$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var field$field:Dto_Field;
      
      public function Cmd_Garden_PotUpLevel_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Garden_PotUpLevel_SC.$MessageID;
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
      
      public function clearField() : void
      {
         this.field$field = null;
      }
      
      public function get hasField() : Boolean
      {
         return this.field$field != null;
      }
      
      public function set field(param1:Dto_Field) : void
      {
         this.field$field = param1;
      }
      
      public function get field() : Dto_Field
      {
         return this.field$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasFieldid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.fieldid$field);
         }
         if(this.hasField)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.field$field);
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
                     throw new IOError("Bad data format: Cmd_Garden_PotUpLevel_SC.fieldid cannot be set twice.");
                  }
                  _loc3_++;
                  this.fieldid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Garden_PotUpLevel_SC.field cannot be set twice.");
                  }
                  _loc4_++;
                  this.field = new Dto_Field();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.field);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
