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
   
   public final class Cmd_Friend_SyncOperationStatus_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Friend_SyncOperationStatus_SC";
      
      public static const FRIENDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Friend_SyncOperationStatus_SC.friends","friends",1 << 3 | WireType.LENGTH_DELIMITED,Dto_FriendStaus);
      
      public static const FIGHTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_SyncOperationStatus_SC.fightNum","fightNum",2 << 3 | WireType.VARINT);
      
      public static const PRESENTENERGYNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_SyncOperationStatus_SC.presentEnergyNum","presentEnergyNum",3 << 3 | WireType.VARINT);
      
      public static const STEALFARMNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Friend_SyncOperationStatus_SC.stealFarmNum","stealFarmNum",4 << 3 | WireType.VARINT);
       
      
      public var friends:Array;
      
      private var fightNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var presentEnergyNum$field:uint;
      
      private var stealFarmNum$field:uint;
      
      public function Cmd_Friend_SyncOperationStatus_SC()
      {
         this.friends = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Friend_SyncOperationStatus_SC.$MessageID;
      }
      
      public function clearFightNum() : void
      {
         this.hasField$0 &= 4294967294;
         this.fightNum$field = new uint();
      }
      
      public function get hasFightNum() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set fightNum(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.fightNum$field = param1;
      }
      
      public function get fightNum() : uint
      {
         return this.fightNum$field;
      }
      
      public function clearPresentEnergyNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.presentEnergyNum$field = new uint();
      }
      
      public function get hasPresentEnergyNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set presentEnergyNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.presentEnergyNum$field = param1;
      }
      
      public function get presentEnergyNum() : uint
      {
         return this.presentEnergyNum$field;
      }
      
      public function clearStealFarmNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.stealFarmNum$field = new uint();
      }
      
      public function get hasStealFarmNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set stealFarmNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.stealFarmNum$field = param1;
      }
      
      public function get stealFarmNum() : uint
      {
         return this.stealFarmNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.friends.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.friends[_loc2_]);
            _loc2_++;
         }
         if(this.hasFightNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.fightNum$field);
         }
         if(this.hasPresentEnergyNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.presentEnergyNum$field);
         }
         if(this.hasStealFarmNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.stealFarmNum$field);
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
                  this.friends.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FriendStaus()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_SyncOperationStatus_SC.fightNum cannot be set twice.");
                  }
                  _loc3_++;
                  this.fightNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_SyncOperationStatus_SC.presentEnergyNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.presentEnergyNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Friend_SyncOperationStatus_SC.stealFarmNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.stealFarmNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
