package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Melee_GetMyInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Melee_GetMyInfo_SC";
      
      public static const MYINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Melee_GetMyInfo_SC.myInfo","myInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_MeleeMyInfo);
      
      public static const LEFTSECONDS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Melee_GetMyInfo_SC.leftSeconds","leftSeconds",2 << 3 | WireType.VARINT);
      
      public static const JOINROLESIZE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Melee_GetMyInfo_SC.joinRoleSize","joinRoleSize",3 << 3 | WireType.VARINT);
      
      public static const ISSTARTED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Melee_GetMyInfo_SC.isStarted","isStarted",5 << 3 | WireType.VARINT);
      
      public static const NOGETREWARDINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Melee_GetMyInfo_SC.noGetRewardInfo","noGetRewardInfo",6 << 3 | WireType.LENGTH_DELIMITED,Dto_Melee_NoGetRewardInfo);
       
      
      private var myInfo$field:Dto_MeleeMyInfo;
      
      private var leftSeconds$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var joinRoleSize$field:uint;
      
      private var isStarted$field:Boolean;
      
      private var noGetRewardInfo$field:Dto_Melee_NoGetRewardInfo;
      
      public function Cmd_Melee_GetMyInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Melee_GetMyInfo_SC.$MessageID;
      }
      
      public function clearMyInfo() : void
      {
         this.myInfo$field = null;
      }
      
      public function get hasMyInfo() : Boolean
      {
         return this.myInfo$field != null;
      }
      
      public function set myInfo(param1:Dto_MeleeMyInfo) : void
      {
         this.myInfo$field = param1;
      }
      
      public function get myInfo() : Dto_MeleeMyInfo
      {
         return this.myInfo$field;
      }
      
      public function clearLeftSeconds() : void
      {
         this.hasField$0 &= 4294967294;
         this.leftSeconds$field = new uint();
      }
      
      public function get hasLeftSeconds() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set leftSeconds(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.leftSeconds$field = param1;
      }
      
      public function get leftSeconds() : uint
      {
         return this.leftSeconds$field;
      }
      
      public function clearJoinRoleSize() : void
      {
         this.hasField$0 &= 4294967293;
         this.joinRoleSize$field = new uint();
      }
      
      public function get hasJoinRoleSize() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set joinRoleSize(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.joinRoleSize$field = param1;
      }
      
      public function get joinRoleSize() : uint
      {
         return this.joinRoleSize$field;
      }
      
      public function clearIsStarted() : void
      {
         this.hasField$0 &= 4294967291;
         this.isStarted$field = new Boolean();
      }
      
      public function get hasIsStarted() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set isStarted(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.isStarted$field = param1;
      }
      
      public function get isStarted() : Boolean
      {
         return this.isStarted$field;
      }
      
      public function clearNoGetRewardInfo() : void
      {
         this.noGetRewardInfo$field = null;
      }
      
      public function get hasNoGetRewardInfo() : Boolean
      {
         return this.noGetRewardInfo$field != null;
      }
      
      public function set noGetRewardInfo(param1:Dto_Melee_NoGetRewardInfo) : void
      {
         this.noGetRewardInfo$field = param1;
      }
      
      public function get noGetRewardInfo() : Dto_Melee_NoGetRewardInfo
      {
         return this.noGetRewardInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasMyInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.myInfo$field);
         }
         if(this.hasLeftSeconds)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.leftSeconds$field);
         }
         if(this.hasJoinRoleSize)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.joinRoleSize$field);
         }
         if(this.hasIsStarted)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.isStarted$field);
         }
         if(this.hasNoGetRewardInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.noGetRewardInfo$field);
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
                     throw new IOError("Bad data format: Cmd_Melee_GetMyInfo_SC.myInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.myInfo = new Dto_MeleeMyInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.myInfo);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Melee_GetMyInfo_SC.leftSeconds cannot be set twice.");
                  }
                  _loc4_++;
                  this.leftSeconds = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Melee_GetMyInfo_SC.joinRoleSize cannot be set twice.");
                  }
                  _loc5_++;
                  this.joinRoleSize = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Melee_GetMyInfo_SC.isStarted cannot be set twice.");
                  }
                  _loc6_++;
                  this.isStarted = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Melee_GetMyInfo_SC.noGetRewardInfo cannot be set twice.");
                  }
                  _loc7_++;
                  this.noGetRewardInfo = new Dto_Melee_NoGetRewardInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.noGetRewardInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
