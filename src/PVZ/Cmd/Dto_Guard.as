package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Guard extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Guard";
      
      public static const GUARDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_Guard.guardId","guardId",1 << 3 | WireType.VARINT);
      
      public static const GUARDTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guard.guardType","guardType",2 << 3 | WireType.VARINT);
      
      public static const FINISHTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guard.finishTime","finishTime",3 << 3 | WireType.VARINT);
      
      public static const MEMBER:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Guard.member","member",4 << 3 | WireType.LENGTH_DELIMITED,Dto_Guard_Member);
      
      public static const FINISH:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_Guard.finish","finish",5 << 3 | WireType.VARINT);
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Guard.reward","reward",6 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var guardId$field:Int64;
      
      private var guardType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var finishTime$field:uint;
      
      public var member:Array;
      
      private var finish$field:Boolean;
      
      public var reward:Array;
      
      public function Dto_Guard()
      {
         this.member = [];
         this.reward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Guard.$MessageID;
      }
      
      public function clearGuardId() : void
      {
         this.guardId$field = null;
      }
      
      public function get hasGuardId() : Boolean
      {
         return this.guardId$field != null;
      }
      
      public function set guardId(param1:Int64) : void
      {
         this.guardId$field = param1;
      }
      
      public function get guardId() : Int64
      {
         return this.guardId$field;
      }
      
      public function clearGuardType() : void
      {
         this.hasField$0 &= 4294967294;
         this.guardType$field = new uint();
      }
      
      public function get hasGuardType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set guardType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.guardType$field = param1;
      }
      
      public function get guardType() : uint
      {
         return this.guardType$field;
      }
      
      public function clearFinishTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.finishTime$field = new uint();
      }
      
      public function get hasFinishTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set finishTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.finishTime$field = param1;
      }
      
      public function get finishTime() : uint
      {
         return this.finishTime$field;
      }
      
      public function clearFinish() : void
      {
         this.hasField$0 &= 4294967291;
         this.finish$field = new Boolean();
      }
      
      public function get hasFinish() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set finish(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.finish$field = param1;
      }
      
      public function get finish() : Boolean
      {
         return this.finish$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasGuardId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.guardId$field);
         }
         if(this.hasGuardType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.guardType$field);
         }
         if(this.hasFinishTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.finishTime$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.member.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.member[_loc2_]);
            _loc2_++;
         }
         if(this.hasFinish)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.finish$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc3_]);
            _loc3_++;
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard.guardId cannot be set twice.");
                  }
                  _loc3_++;
                  this.guardId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard.guardType cannot be set twice.");
                  }
                  _loc4_++;
                  this.guardType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard.finishTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.finishTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  this.member.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Guard_Member()));
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard.finish cannot be set twice.");
                  }
                  _loc6_++;
                  this.finish = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 6:
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
