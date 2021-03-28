package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Battle_SyncNewFormation_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Battle_SyncNewFormation_SC";
      
      public static const UNLOCKTEAMNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Battle_SyncNewFormation_SC.unlockTeamNum","unlockTeamNum",1 << 3 | WireType.VARINT);
      
      public static const TEAMMAXNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Battle_SyncNewFormation_SC.teamMaxNum","teamMaxNum",2 << 3 | WireType.VARINT);
      
      public static const TEAMIDLIST:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Battle_SyncNewFormation_SC.teamIdList","teamIdList",3 << 3 | WireType.VARINT);
       
      
      private var unlockTeamNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var teamMaxNum$field:uint;
      
      public var teamIdList:Array;
      
      public function Cmd_Battle_SyncNewFormation_SC()
      {
         this.teamIdList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Battle_SyncNewFormation_SC.$MessageID;
      }
      
      public function clearUnlockTeamNum() : void
      {
         this.hasField$0 &= 4294967294;
         this.unlockTeamNum$field = new uint();
      }
      
      public function get hasUnlockTeamNum() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set unlockTeamNum(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.unlockTeamNum$field = param1;
      }
      
      public function get unlockTeamNum() : uint
      {
         return this.unlockTeamNum$field;
      }
      
      public function clearTeamMaxNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.teamMaxNum$field = new uint();
      }
      
      public function get hasTeamMaxNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set teamMaxNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.teamMaxNum$field = param1;
      }
      
      public function get teamMaxNum() : uint
      {
         return this.teamMaxNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasUnlockTeamNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.unlockTeamNum$field);
         }
         if(this.hasTeamMaxNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.teamMaxNum$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.teamIdList.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.teamIdList[_loc2_]);
            _loc2_++;
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
                     throw new IOError("Bad data format: Cmd_Battle_SyncNewFormation_SC.unlockTeamNum cannot be set twice.");
                  }
                  _loc3_++;
                  this.unlockTeamNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Battle_SyncNewFormation_SC.teamMaxNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.teamMaxNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if((_loc5_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.teamIdList);
                  }
                  else
                  {
                     this.teamIdList.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
