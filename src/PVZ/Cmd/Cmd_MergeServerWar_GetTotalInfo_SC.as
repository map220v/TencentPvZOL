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
   
   public final class Cmd_MergeServerWar_GetTotalInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_MergeServerWar_GetTotalInfo_SC";
      
      public static const INFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_MergeServerWar_GetTotalInfo_SC.info","info",1 << 3 | WireType.LENGTH_DELIMITED,Dto_MergeServerWar_GuildInfo);
      
      public static const HASTAKEREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_MergeServerWar_GetTotalInfo_SC.hasTakeReward","hasTakeReward",2 << 3 | WireType.VARINT);
      
      public static const CANTAKEREWARDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_MergeServerWar_GetTotalInfo_SC.canTakeRewardTime","canTakeRewardTime",3 << 3 | WireType.VARINT);
       
      
      public var info:Array;
      
      private var hasTakeReward$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var canTakeRewardTime$field:uint;
      
      public function Cmd_MergeServerWar_GetTotalInfo_SC()
      {
         this.info = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_MergeServerWar_GetTotalInfo_SC.$MessageID;
      }
      
      public function clearHasTakeReward() : void
      {
         this.hasField$0 &= 4294967294;
         this.hasTakeReward$field = new Boolean();
      }
      
      public function get hasHasTakeReward() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set hasTakeReward(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.hasTakeReward$field = param1;
      }
      
      public function get hasTakeReward() : Boolean
      {
         return this.hasTakeReward$field;
      }
      
      public function clearCanTakeRewardTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.canTakeRewardTime$field = new uint();
      }
      
      public function get hasCanTakeRewardTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set canTakeRewardTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.canTakeRewardTime$field = param1;
      }
      
      public function get canTakeRewardTime() : uint
      {
         return this.canTakeRewardTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.info.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.info[_loc2_]);
            _loc2_++;
         }
         if(this.hasHasTakeReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.hasTakeReward$field);
         }
         if(this.hasCanTakeRewardTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.canTakeRewardTime$field);
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
                  this.info.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_MergeServerWar_GuildInfo()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_MergeServerWar_GetTotalInfo_SC.hasTakeReward cannot be set twice.");
                  }
                  _loc3_++;
                  this.hasTakeReward = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_MergeServerWar_GetTotalInfo_SC.canTakeRewardTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.canTakeRewardTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
