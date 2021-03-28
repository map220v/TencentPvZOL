package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_JoinReward extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_JoinReward";
      
      public static const BREAKCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_JoinReward.breakCount","breakCount",1 << 3 | WireType.VARINT);
      
      public static const ITEM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_JoinReward.item","item",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const TAKED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_JoinReward.taked","taked",101 << 3 | WireType.VARINT);
       
      
      private var breakCount$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var item:Array;
      
      private var taked$field:Boolean;
      
      public function Dto_JoinReward()
      {
         this.item = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_JoinReward.$MessageID;
      }
      
      public function clearBreakCount() : void
      {
         this.hasField$0 &= 4294967294;
         this.breakCount$field = new uint();
      }
      
      public function get hasBreakCount() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set breakCount(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.breakCount$field = param1;
      }
      
      public function get breakCount() : uint
      {
         return this.breakCount$field;
      }
      
      public function clearTaked() : void
      {
         this.hasField$0 &= 4294967293;
         this.taked$field = new Boolean();
      }
      
      public function get hasTaked() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set taked(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.taked$field = param1;
      }
      
      public function get taked() : Boolean
      {
         return this.taked$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasBreakCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.breakCount$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.item.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.item[_loc2_]);
            _loc2_++;
         }
         if(this.hasTaked)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,101);
            WriteUtils.write$TYPE_BOOL(param1,this.taked$field);
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
                     throw new IOError("Bad data format: Dto_JoinReward.breakCount cannot be set twice.");
                  }
                  _loc3_++;
                  this.breakCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.item.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 101:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_JoinReward.taked cannot be set twice.");
                  }
                  _loc4_++;
                  this.taked = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
