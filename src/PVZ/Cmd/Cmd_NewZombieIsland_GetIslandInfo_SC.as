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
   
   public final class Cmd_NewZombieIsland_GetIslandInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_NewZombieIsland_GetIslandInfo_SC";
      
      public static const REWARDSTATE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NewZombieIsland_GetIslandInfo_SC.rewardState","rewardState",1 << 3 | WireType.LENGTH_DELIMITED,Dto_RewardBox);
      
      public static const NEXTLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NewZombieIsland_GetIslandInfo_SC.nextLevel","nextLevel",2 << 3 | WireType.VARINT);
      
      public static const REFRESHTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NewZombieIsland_GetIslandInfo_SC.refreshTimes","refreshTimes",3 << 3 | WireType.VARINT);
      
      public static const REMAINTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NewZombieIsland_GetIslandInfo_SC.remainTimes","remainTimes",4 << 3 | WireType.VARINT);
       
      
      public var rewardState:Array;
      
      private var nextLevel$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var refreshTimes$field:uint;
      
      private var remainTimes$field:uint;
      
      public function Cmd_NewZombieIsland_GetIslandInfo_SC()
      {
         this.rewardState = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_NewZombieIsland_GetIslandInfo_SC.$MessageID;
      }
      
      public function clearNextLevel() : void
      {
         this.hasField$0 &= 4294967294;
         this.nextLevel$field = new uint();
      }
      
      public function get hasNextLevel() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set nextLevel(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.nextLevel$field = param1;
      }
      
      public function get nextLevel() : uint
      {
         return this.nextLevel$field;
      }
      
      public function clearRefreshTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.refreshTimes$field = new uint();
      }
      
      public function get hasRefreshTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set refreshTimes(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.refreshTimes$field = param1;
      }
      
      public function get refreshTimes() : uint
      {
         return this.refreshTimes$field;
      }
      
      public function clearRemainTimes() : void
      {
         this.hasField$0 &= 4294967291;
         this.remainTimes$field = new uint();
      }
      
      public function get hasRemainTimes() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set remainTimes(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.remainTimes$field = param1;
      }
      
      public function get remainTimes() : uint
      {
         return this.remainTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewardState.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardState[_loc2_]);
            _loc2_++;
         }
         if(this.hasNextLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.nextLevel$field);
         }
         if(this.hasRefreshTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.refreshTimes$field);
         }
         if(this.hasRemainTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.remainTimes$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                  this.rewardState.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_RewardBox()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NewZombieIsland_GetIslandInfo_SC.nextLevel cannot be set twice.");
                  }
                  _loc3_++;
                  this.nextLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NewZombieIsland_GetIslandInfo_SC.refreshTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.refreshTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NewZombieIsland_GetIslandInfo_SC.remainTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.remainTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
