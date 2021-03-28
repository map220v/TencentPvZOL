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
   
   public final class Cmd_Arena_Challenge_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Arena_Challenge_SC";
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Arena_Challenge_SC.rank","rank",1 << 3 | WireType.VARINT);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Arena_Challenge_SC.score","score",2 << 3 | WireType.VARINT);
      
      public static const RECORDER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Arena_Challenge_SC.recorder","recorder",3 << 3 | WireType.LENGTH_DELIMITED,Dto_ArenaRecorder);
       
      
      private var rank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var score$field:uint;
      
      private var recorder$field:Dto_ArenaRecorder;
      
      public function Cmd_Arena_Challenge_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Arena_Challenge_SC.$MessageID;
      }
      
      public function clearRank() : void
      {
         this.hasField$0 &= 4294967294;
         this.rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return this.rank$field;
      }
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967293;
         this.score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.score$field = param1;
      }
      
      public function get score() : uint
      {
         return this.score$field;
      }
      
      public function clearRecorder() : void
      {
         this.recorder$field = null;
      }
      
      public function get hasRecorder() : Boolean
      {
         return this.recorder$field != null;
      }
      
      public function set recorder(param1:Dto_ArenaRecorder) : void
      {
         this.recorder$field = param1;
      }
      
      public function get recorder() : Dto_ArenaRecorder
      {
         return this.recorder$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.score$field);
         }
         if(this.hasRecorder)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.recorder$field);
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
                     throw new IOError("Bad data format: Cmd_Arena_Challenge_SC.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Arena_Challenge_SC.score cannot be set twice.");
                  }
                  _loc4_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Arena_Challenge_SC.recorder cannot be set twice.");
                  }
                  _loc5_++;
                  this.recorder = new Dto_ArenaRecorder();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.recorder);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
