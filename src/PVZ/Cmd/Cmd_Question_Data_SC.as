package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Question_Data_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Question_Data_SC";
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Question_Data_SC.id","id",1 << 3 | WireType.VARINT);
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Question_Data_SC.time","time",2 << 3 | WireType.VARINT);
      
      public static const QUESTIONDATA:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Question_Data_SC.questionData","questionData",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ANSWERDATA:RepeatedFieldDescriptor$TYPE_STRING = new RepeatedFieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Question_Data_SC.answerData","answerData",4 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var time$field:uint;
      
      private var questionData$field:String;
      
      public var answerData:Array;
      
      public function Cmd_Question_Data_SC()
      {
         this.answerData = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Question_Data_SC.$MessageID;
      }
      
      public function clearId() : void
      {
         this.hasField$0 &= 4294967294;
         this.id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.id$field = param1;
      }
      
      public function get id() : uint
      {
         return this.id$field;
      }
      
      public function clearTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.time$field = new uint();
      }
      
      public function get hasTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set time(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.time$field = param1;
      }
      
      public function get time() : uint
      {
         return this.time$field;
      }
      
      public function clearQuestionData() : void
      {
         this.questionData$field = null;
      }
      
      public function get hasQuestionData() : Boolean
      {
         return this.questionData$field != null;
      }
      
      public function set questionData(param1:String) : void
      {
         this.questionData$field = param1;
      }
      
      public function get questionData() : String
      {
         return this.questionData$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.id$field);
         }
         if(this.hasTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.time$field);
         }
         if(this.hasQuestionData)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.questionData$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.answerData.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.answerData[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Cmd_Question_Data_SC.id cannot be set twice.");
                  }
                  _loc3_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Question_Data_SC.time cannot be set twice.");
                  }
                  _loc4_++;
                  this.time = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Question_Data_SC.questionData cannot be set twice.");
                  }
                  _loc5_++;
                  this.questionData = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  this.answerData.push(ReadUtils.read$TYPE_STRING(param1));
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
