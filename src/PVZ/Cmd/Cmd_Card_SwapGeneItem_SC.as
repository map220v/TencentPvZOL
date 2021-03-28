package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Card_SwapGeneItem_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Card_SwapGeneItem_SC";
      
      public static const COST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Card_SwapGeneItem_SC.cost","cost",1 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Card_SwapGeneItem_SC.reward","reward",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const RESULT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Cmd_Card_SwapGeneItem_SC.result","result",3 << 3 | WireType.VARINT);
       
      
      public var cost:Array;
      
      public var reward:Array;
      
      private var result$field:int;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Card_SwapGeneItem_SC()
      {
         this.cost = [];
         this.reward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Card_SwapGeneItem_SC.$MessageID;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.cost.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cost[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc3_]);
            _loc3_++;
         }
         if(this.hasResult)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT32(param1,this.result$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                  this.cost.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 2:
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_SwapGeneItem_SC.result cannot be set twice.");
                  }
                  _loc3_++;
                  this.result = ReadUtils.read$TYPE_INT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
