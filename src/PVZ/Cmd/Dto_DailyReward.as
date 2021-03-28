package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_DailyReward extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_DailyReward";
      
      public static const ITEM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_DailyReward.item","item",1 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const TAKED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_DailyReward.taked","taked",101 << 3 | WireType.VARINT);
       
      
      public var item:Array;
      
      private var taked$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function Dto_DailyReward()
      {
         this.item = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_DailyReward.$MessageID;
      }
      
      public function clearTaked() : void
      {
         this.hasField$0 &= 4294967294;
         this.taked$field = new Boolean();
      }
      
      public function get hasTaked() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set taked(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.taked$field = param1;
      }
      
      public function get taked() : Boolean
      {
         return this.taked$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.item.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
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
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  this.item.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 101:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DailyReward.taked cannot be set twice.");
                  }
                  _loc3_++;
                  this.taked = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
