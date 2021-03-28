package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_MeleeRecorder extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_MeleeRecorder";
      
      public static const LEFTROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_MeleeRecorder.leftRoleId","leftRoleId",1 << 3 | WireType.VARINT);
      
      public static const LEFTNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_MeleeRecorder.leftName","leftName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const RIGHTROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_MeleeRecorder.rightRoleId","rightRoleId",3 << 3 | WireType.VARINT);
      
      public static const RIGHTNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_MeleeRecorder.rightName","rightName",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const WIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_MeleeRecorder.win","win",5 << 3 | WireType.VARINT);
      
      public static const WINSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MeleeRecorder.winScore","winScore",6 << 3 | WireType.VARINT);
      
      public static const WINSTREAKCOUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_MeleeRecorder.winStreakCount","winStreakCount",7 << 3 | WireType.VARINT);
      
      public static const TERMINATEWINSTREAKCOUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_MeleeRecorder.terminateWinStreakCount","terminateWinStreakCount",8 << 3 | WireType.VARINT);
      
      public static const TIMESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MeleeRecorder.timestamp","timestamp",9 << 3 | WireType.VARINT);
      
      public static const RECORDERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_MeleeRecorder.recorders","recorders",10 << 3 | WireType.LENGTH_DELIMITED,Dto_MeleeSingleFighterRecorder);
      
      public static const SEQID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MeleeRecorder.seqId","seqId",11 << 3 | WireType.VARINT);
       
      
      private var leftRoleId$field:Int64;
      
      private var leftName$field:String;
      
      private var rightRoleId$field:Int64;
      
      private var rightName$field:String;
      
      private var win$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var winScore$field:uint;
      
      private var winStreakCount$field:int;
      
      private var terminateWinStreakCount$field:int;
      
      private var timestamp$field:uint;
      
      public var recorders:Array;
      
      private var seqId$field:uint;
      
      public function Dto_MeleeRecorder()
      {
         this.recorders = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_MeleeRecorder.$MessageID;
      }
      
      public function clearLeftRoleId() : void
      {
         this.leftRoleId$field = null;
      }
      
      public function get hasLeftRoleId() : Boolean
      {
         return this.leftRoleId$field != null;
      }
      
      public function set leftRoleId(param1:Int64) : void
      {
         this.leftRoleId$field = param1;
      }
      
      public function get leftRoleId() : Int64
      {
         return this.leftRoleId$field;
      }
      
      public function clearLeftName() : void
      {
         this.leftName$field = null;
      }
      
      public function get hasLeftName() : Boolean
      {
         return this.leftName$field != null;
      }
      
      public function set leftName(param1:String) : void
      {
         this.leftName$field = param1;
      }
      
      public function get leftName() : String
      {
         return this.leftName$field;
      }
      
      public function clearRightRoleId() : void
      {
         this.rightRoleId$field = null;
      }
      
      public function get hasRightRoleId() : Boolean
      {
         return this.rightRoleId$field != null;
      }
      
      public function set rightRoleId(param1:Int64) : void
      {
         this.rightRoleId$field = param1;
      }
      
      public function get rightRoleId() : Int64
      {
         return this.rightRoleId$field;
      }
      
      public function clearRightName() : void
      {
         this.rightName$field = null;
      }
      
      public function get hasRightName() : Boolean
      {
         return this.rightName$field != null;
      }
      
      public function set rightName(param1:String) : void
      {
         this.rightName$field = param1;
      }
      
      public function get rightName() : String
      {
         return this.rightName$field;
      }
      
      public function clearWin() : void
      {
         this.hasField$0 &= 4294967294;
         this.win$field = new Boolean();
      }
      
      public function get hasWin() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set win(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.win$field = param1;
      }
      
      public function get win() : Boolean
      {
         return this.win$field;
      }
      
      public function clearWinScore() : void
      {
         this.hasField$0 &= 4294967293;
         this.winScore$field = new uint();
      }
      
      public function get hasWinScore() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set winScore(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.winScore$field = param1;
      }
      
      public function get winScore() : uint
      {
         return this.winScore$field;
      }
      
      public function clearWinStreakCount() : void
      {
         this.hasField$0 &= 4294967291;
         this.winStreakCount$field = new int();
      }
      
      public function get hasWinStreakCount() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set winStreakCount(param1:int) : void
      {
         this.hasField$0 |= 4;
         this.winStreakCount$field = param1;
      }
      
      public function get winStreakCount() : int
      {
         return this.winStreakCount$field;
      }
      
      public function clearTerminateWinStreakCount() : void
      {
         this.hasField$0 &= 4294967287;
         this.terminateWinStreakCount$field = new int();
      }
      
      public function get hasTerminateWinStreakCount() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set terminateWinStreakCount(param1:int) : void
      {
         this.hasField$0 |= 8;
         this.terminateWinStreakCount$field = param1;
      }
      
      public function get terminateWinStreakCount() : int
      {
         return this.terminateWinStreakCount$field;
      }
      
      public function clearTimestamp() : void
      {
         this.hasField$0 &= 4294967279;
         this.timestamp$field = new uint();
      }
      
      public function get hasTimestamp() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set timestamp(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.timestamp$field = param1;
      }
      
      public function get timestamp() : uint
      {
         return this.timestamp$field;
      }
      
      public function clearSeqId() : void
      {
         this.hasField$0 &= 4294967263;
         this.seqId$field = new uint();
      }
      
      public function get hasSeqId() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set seqId(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.seqId$field = param1;
      }
      
      public function get seqId() : uint
      {
         return this.seqId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasLeftRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.leftRoleId$field);
         }
         if(this.hasLeftName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.leftName$field);
         }
         if(this.hasRightRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT64(param1,this.rightRoleId$field);
         }
         if(this.hasRightName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.rightName$field);
         }
         if(this.hasWin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.win$field);
         }
         if(this.hasWinScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.winScore$field);
         }
         if(this.hasWinStreakCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_INT32(param1,this.winStreakCount$field);
         }
         if(this.hasTerminateWinStreakCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_INT32(param1,this.terminateWinStreakCount$field);
         }
         if(this.hasTimestamp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.timestamp$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.recorders.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.recorders[_loc2_]);
            _loc2_++;
         }
         if(this.hasSeqId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.seqId$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc13_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc13_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc13_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeRecorder.leftRoleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.leftRoleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeRecorder.leftName cannot be set twice.");
                  }
                  _loc4_++;
                  this.leftName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeRecorder.rightRoleId cannot be set twice.");
                  }
                  _loc5_++;
                  this.rightRoleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeRecorder.rightName cannot be set twice.");
                  }
                  _loc6_++;
                  this.rightName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeRecorder.win cannot be set twice.");
                  }
                  _loc7_++;
                  this.win = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeRecorder.winScore cannot be set twice.");
                  }
                  _loc8_++;
                  this.winScore = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeRecorder.winStreakCount cannot be set twice.");
                  }
                  _loc9_++;
                  this.winStreakCount = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeRecorder.terminateWinStreakCount cannot be set twice.");
                  }
                  _loc10_++;
                  this.terminateWinStreakCount = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeRecorder.timestamp cannot be set twice.");
                  }
                  _loc11_++;
                  this.timestamp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  this.recorders.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_MeleeSingleFighterRecorder()));
                  break;
               case 11:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeRecorder.seqId cannot be set twice.");
                  }
                  _loc12_++;
                  this.seqId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc13_);
                  break;
            }
         }
      }
   }
}
