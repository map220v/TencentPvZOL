package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_TD_StartTDGame_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_TD_StartTDGame_CS";
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_StartTDGame_CS.stageId","stageId",1 << 3 | WireType.VARINT);
      
      public static const LEVELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_StartTDGame_CS.levelId","levelId",2 << 3 | WireType.VARINT);
      
      public static const SUBLEVELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_StartTDGame_CS.subLevelId","subLevelId",3 << 3 | WireType.VARINT);
      
      public static const FRIENDROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_TD_StartTDGame_CS.friendRoleId","friendRoleId",4 << 3 | WireType.VARINT);
      
      public static const CHALLENGELEVELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_StartTDGame_CS.challengeLevelId","challengeLevelId",5 << 3 | WireType.VARINT);
       
      
      private var stageId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var levelId$field:uint;
      
      private var subLevelId$field:uint;
      
      private var friendRoleId$field:Int64;
      
      private var challengeLevelId$field:uint;
      
      public function Cmd_TD_StartTDGame_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_TD_StartTDGame_CS.$MessageID;
      }
      
      public function clearStageId() : void
      {
         this.hasField$0 &= 4294967294;
         this.stageId$field = new uint();
      }
      
      public function get hasStageId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set stageId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.stageId$field = param1;
      }
      
      public function get stageId() : uint
      {
         return this.stageId$field;
      }
      
      public function clearLevelId() : void
      {
         this.hasField$0 &= 4294967293;
         this.levelId$field = new uint();
      }
      
      public function get hasLevelId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set levelId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.levelId$field = param1;
      }
      
      public function get levelId() : uint
      {
         return this.levelId$field;
      }
      
      public function clearSubLevelId() : void
      {
         this.hasField$0 &= 4294967291;
         this.subLevelId$field = new uint();
      }
      
      public function get hasSubLevelId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set subLevelId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.subLevelId$field = param1;
      }
      
      public function get subLevelId() : uint
      {
         return this.subLevelId$field;
      }
      
      public function clearFriendRoleId() : void
      {
         this.friendRoleId$field = null;
      }
      
      public function get hasFriendRoleId() : Boolean
      {
         return this.friendRoleId$field != null;
      }
      
      public function set friendRoleId(param1:Int64) : void
      {
         this.friendRoleId$field = param1;
      }
      
      public function get friendRoleId() : Int64
      {
         return this.friendRoleId$field;
      }
      
      public function clearChallengeLevelId() : void
      {
         this.hasField$0 &= 4294967287;
         this.challengeLevelId$field = new uint();
      }
      
      public function get hasChallengeLevelId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set challengeLevelId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.challengeLevelId$field = param1;
      }
      
      public function get challengeLevelId() : uint
      {
         return this.challengeLevelId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         if(this.hasLevelId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.levelId$field);
         }
         if(this.hasSubLevelId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.subLevelId$field);
         }
         if(this.hasFriendRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_INT64(param1,this.friendRoleId$field);
         }
         if(this.hasChallengeLevelId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.challengeLevelId$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_StartTDGame_CS.stageId cannot be set twice.");
                  }
                  _loc3_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_StartTDGame_CS.levelId cannot be set twice.");
                  }
                  _loc4_++;
                  this.levelId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_StartTDGame_CS.subLevelId cannot be set twice.");
                  }
                  _loc5_++;
                  this.subLevelId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_StartTDGame_CS.friendRoleId cannot be set twice.");
                  }
                  _loc6_++;
                  this.friendRoleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_StartTDGame_CS.challengeLevelId cannot be set twice.");
                  }
                  _loc7_++;
                  this.challengeLevelId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
