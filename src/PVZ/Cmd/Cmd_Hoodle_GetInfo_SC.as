package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Hoodle_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Hoodle_GetInfo_SC";
      
      public static const REWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Hoodle_GetInfo_SC.rewards","rewards",1 << 3 | WireType.LENGTH_DELIMITED,Dto_HoodleReward);
      
      public static const NUTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Hoodle_GetInfo_SC.nuts","nuts",2 << 3 | WireType.LENGTH_DELIMITED,Dto_NutInfo);
      
      public static const TOTALTICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Hoodle_GetInfo_SC.totalTicket","totalTicket",3 << 3 | WireType.VARINT);
      
      public static const REMAINFREECOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Hoodle_GetInfo_SC.remainFreeCount","remainFreeCount",4 << 3 | WireType.VARINT);
      
      public static const TOP5LIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Hoodle_GetInfo_SC.top5List","top5List",5 << 3 | WireType.LENGTH_DELIMITED,Dto_HoodleTop5Info);
       
      
      public var rewards:Array;
      
      public var nuts:Array;
      
      private var totalTicket$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var remainFreeCount$field:uint;
      
      public var top5List:Array;
      
      public function Cmd_Hoodle_GetInfo_SC()
      {
         this.rewards = [];
         this.nuts = [];
         this.top5List = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Hoodle_GetInfo_SC.$MessageID;
      }
      
      public function clearTotalTicket() : void
      {
         this.hasField$0 &= 4294967294;
         this.totalTicket$field = new uint();
      }
      
      public function get hasTotalTicket() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set totalTicket(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.totalTicket$field = param1;
      }
      
      public function get totalTicket() : uint
      {
         return this.totalTicket$field;
      }
      
      public function clearRemainFreeCount() : void
      {
         this.hasField$0 &= 4294967293;
         this.remainFreeCount$field = new uint();
      }
      
      public function get hasRemainFreeCount() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set remainFreeCount(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.remainFreeCount$field = param1;
      }
      
      public function get remainFreeCount() : uint
      {
         return this.remainFreeCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewards.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewards[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.nuts.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.nuts[_loc3_]);
            _loc3_++;
         }
         if(this.hasTotalTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.totalTicket$field);
         }
         if(this.hasRemainFreeCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.remainFreeCount$field);
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.top5List.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.top5List[_loc4_]);
            _loc4_++;
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
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
                  this.rewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_HoodleReward()));
                  break;
               case 2:
                  this.nuts.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_NutInfo()));
                  break;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Hoodle_GetInfo_SC.totalTicket cannot be set twice.");
                  }
                  _loc3_++;
                  this.totalTicket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Hoodle_GetInfo_SC.remainFreeCount cannot be set twice.");
                  }
                  _loc4_++;
                  this.remainFreeCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  this.top5List.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_HoodleTop5Info()));
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
