package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_RefineOperation extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_RefineOperation";
      
      public static const RESULT:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_RefineOperation.result","result",1 << 3 | WireType.VARINT,E_RefineOperationResult);
      
      public static const ATTRIBUTE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_RefineOperation.attribute","attribute",2 << 3 | WireType.LENGTH_DELIMITED,Dto_RefineAttribute);
      
      public static const SPEED:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RefineOperation.speed","speed",3 << 3 | WireType.VARINT);
       
      
      private var result$field:int;
      
      private var hasField$0:uint = 0;
      
      public var attribute:Array;
      
      private var speed$field:uint;
      
      public function Dto_RefineOperation()
      {
         this.attribute = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_RefineOperation.$MessageID;
      }
      
      public function clearResult() : void
      {
         this.hasField$0 &= 4294967294;
         this.result$field = new int();
      }
      
      public function get hasResult() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set result(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.result$field = param1;
      }
      
      public function get result() : int
      {
         return this.result$field;
      }
      
      public function clearSpeed() : void
      {
         this.hasField$0 &= 4294967293;
         this.speed$field = new uint();
      }
      
      public function get hasSpeed() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set speed(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.speed$field = param1;
      }
      
      public function get speed() : uint
      {
         return this.speed$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasResult)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_ENUM(param1,this.result$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.attribute.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.attribute[_loc2_]);
            _loc2_++;
         }
         if(this.hasSpeed)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.speed$field);
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
                     throw new IOError("Bad data format: Dto_RefineOperation.result cannot be set twice.");
                  }
                  _loc3_++;
                  this.result = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 2:
                  this.attribute.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_RefineAttribute()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RefineOperation.speed cannot be set twice.");
                  }
                  _loc4_++;
                  this.speed = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
