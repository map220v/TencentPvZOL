package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Question_Info_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Question_Info_SC";
      
      public static const ISACTIVE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Question_Info_SC.isActive","isActive",1 << 3 | WireType.VARINT);
      
      public static const STATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Cmd_Question_Info_SC.status","status",2 << 3 | WireType.VARINT,E_QuestionStatus);
      
      public static const REMAINQUESTIONCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Question_Info_SC.remainQuestionCount","remainQuestionCount",3 << 3 | WireType.VARINT);
      
      public static const REMAINRETRYCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Question_Info_SC.remainRetryCount","remainRetryCount",4 << 3 | WireType.VARINT);
      
      public static const LASTQUESTIONDATA:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Question_Info_SC.lastQuestionData","lastQuestionData",5 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const LASTANSWERDATA:RepeatedFieldDescriptor$TYPE_STRING = new RepeatedFieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Question_Info_SC.lastAnswerData","lastAnswerData",6 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const LASTANSWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Question_Info_SC.lastAnswer","lastAnswer",7 << 3 | WireType.VARINT);
      
      public static const ANSWERDATA:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Question_Info_SC.answerData","answerData",8 << 3 | WireType.LENGTH_DELIMITED,Dto_AnswerData);
       
      
      private var isActive$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var status$field:int;
      
      private var remainQuestionCount$field:uint;
      
      private var remainRetryCount$field:uint;
      
      private var lastQuestionData$field:String;
      
      public var lastAnswerData:Array;
      
      private var lastAnswer$field:uint;
      
      public var answerData:Array;
      
      public function Cmd_Question_Info_SC()
      {
         this.lastAnswerData = [];
         this.answerData = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Question_Info_SC.$MessageID;
      }
      
      public function clearIsActive() : void
      {
         this.hasField$0 &= 4294967294;
         this.isActive$field = new Boolean();
      }
      
      public function get hasIsActive() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.isActive$field = param1;
      }
      
      public function get isActive() : Boolean
      {
         return this.isActive$field;
      }
      
      public function clearStatus() : void
      {
         this.hasField$0 &= 4294967293;
         this.status$field = new int();
      }
      
      public function get hasStatus() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set status(param1:int) : void
      {
         this.hasField$0 |= 2;
         this.status$field = param1;
      }
      
      public function get status() : int
      {
         return this.status$field;
      }
      
      public function clearRemainQuestionCount() : void
      {
         this.hasField$0 &= 4294967291;
         this.remainQuestionCount$field = new uint();
      }
      
      public function get hasRemainQuestionCount() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set remainQuestionCount(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.remainQuestionCount$field = param1;
      }
      
      public function get remainQuestionCount() : uint
      {
         return this.remainQuestionCount$field;
      }
      
      public function clearRemainRetryCount() : void
      {
         this.hasField$0 &= 4294967287;
         this.remainRetryCount$field = new uint();
      }
      
      public function get hasRemainRetryCount() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set remainRetryCount(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.remainRetryCount$field = param1;
      }
      
      public function get remainRetryCount() : uint
      {
         return this.remainRetryCount$field;
      }
      
      public function clearLastQuestionData() : void
      {
         this.lastQuestionData$field = null;
      }
      
      public function get hasLastQuestionData() : Boolean
      {
         return this.lastQuestionData$field != null;
      }
      
      public function set lastQuestionData(param1:String) : void
      {
         this.lastQuestionData$field = param1;
      }
      
      public function get lastQuestionData() : String
      {
         return this.lastQuestionData$field;
      }
      
      public function clearLastAnswer() : void
      {
         this.hasField$0 &= 4294967279;
         this.lastAnswer$field = new uint();
      }
      
      public function get hasLastAnswer() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set lastAnswer(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.lastAnswer$field = param1;
      }
      
      public function get lastAnswer() : uint
      {
         return this.lastAnswer$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasIsActive)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_BOOL(param1,this.isActive$field);
         }
         if(this.hasStatus)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_ENUM(param1,this.status$field);
         }
         if(this.hasRemainQuestionCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.remainQuestionCount$field);
         }
         if(this.hasRemainRetryCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.remainRetryCount$field);
         }
         if(this.hasLastQuestionData)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_STRING(param1,this.lastQuestionData$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.lastAnswerData.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_STRING(param1,this.lastAnswerData[_loc2_]);
            _loc2_++;
         }
         if(this.hasLastAnswer)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.lastAnswer$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.answerData.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.answerData[_loc3_]);
            _loc3_++;
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Question_Info_SC.isActive cannot be set twice.");
                  }
                  _loc3_++;
                  this.isActive = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Question_Info_SC.status cannot be set twice.");
                  }
                  _loc4_++;
                  this.status = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Question_Info_SC.remainQuestionCount cannot be set twice.");
                  }
                  _loc5_++;
                  this.remainQuestionCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Question_Info_SC.remainRetryCount cannot be set twice.");
                  }
                  _loc6_++;
                  this.remainRetryCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Question_Info_SC.lastQuestionData cannot be set twice.");
                  }
                  _loc7_++;
                  this.lastQuestionData = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 6:
                  this.lastAnswerData.push(ReadUtils.read$TYPE_STRING(param1));
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Question_Info_SC.lastAnswer cannot be set twice.");
                  }
                  _loc8_++;
                  this.lastAnswer = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  this.answerData.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_AnswerData()));
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
