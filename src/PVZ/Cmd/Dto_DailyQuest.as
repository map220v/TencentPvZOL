package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_DailyQuest extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_DailyQuest";
      
      public static const QUESTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DailyQuest.questId","questId",1 << 3 | WireType.VARINT);
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DailyQuest.count","count",2 << 3 | WireType.VARINT);
      
      public static const STATE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_DailyQuest.state","state",3 << 3 | WireType.VARINT,E_DailyQuestState);
       
      
      private var questId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var count$field:uint;
      
      private var state$field:int;
      
      public function Dto_DailyQuest()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_DailyQuest.$MessageID;
      }
      
      public function clearQuestId() : void
      {
         this.hasField$0 &= 4294967294;
         this.questId$field = new uint();
      }
      
      public function get hasQuestId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set questId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.questId$field = param1;
      }
      
      public function get questId() : uint
      {
         return this.questId$field;
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
      
      public function clearState() : void
      {
         this.hasField$0 &= 4294967291;
         this.state$field = new int();
      }
      
      public function get hasState() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set state(param1:int) : void
      {
         this.hasField$0 |= 4;
         this.state$field = param1;
      }
      
      public function get state() : int
      {
         return this.state$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasQuestId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.questId$field);
         }
         if(this.hasCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.count$field);
         }
         if(this.hasState)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_ENUM(param1,this.state$field);
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
                     throw new IOError("Bad data format: Dto_DailyQuest.questId cannot be set twice.");
                  }
                  _loc3_++;
                  this.questId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DailyQuest.count cannot be set twice.");
                  }
                  _loc4_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DailyQuest.state cannot be set twice.");
                  }
                  _loc5_++;
                  this.state = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
