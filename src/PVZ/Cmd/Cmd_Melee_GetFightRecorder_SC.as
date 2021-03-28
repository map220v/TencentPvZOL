package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Melee_GetFightRecorder_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Melee_GetFightRecorder_SC";
      
      public static const RECORDERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Melee_GetFightRecorder_SC.recorders","recorders",1 << 3 | WireType.LENGTH_DELIMITED,Dto_MeleeRecorder);
      
      public static const KEYRECORDERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Melee_GetFightRecorder_SC.keyRecorders","keyRecorders",2 << 3 | WireType.LENGTH_DELIMITED,Dto_MeleeRecorder);
      
      public static const MYRECORDERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Melee_GetFightRecorder_SC.myRecorders","myRecorders",3 << 3 | WireType.LENGTH_DELIMITED,Dto_MeleeRecorder);
      
      public static const MYINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Melee_GetFightRecorder_SC.myInfo","myInfo",4 << 3 | WireType.LENGTH_DELIMITED,Dto_MeleeMyInfo);
      
      public static const LEFTSECONDS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Melee_GetFightRecorder_SC.leftSeconds","leftSeconds",5 << 3 | WireType.VARINT);
      
      public static const JOINROLESIZE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Melee_GetFightRecorder_SC.joinRoleSize","joinRoleSize",6 << 3 | WireType.VARINT);
       
      
      public var recorders:Array;
      
      public var keyRecorders:Array;
      
      public var myRecorders:Array;
      
      private var myInfo$field:Dto_MeleeMyInfo;
      
      private var leftSeconds$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var joinRoleSize$field:uint;
      
      public function Cmd_Melee_GetFightRecorder_SC()
      {
         this.recorders = [];
         this.keyRecorders = [];
         this.myRecorders = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Melee_GetFightRecorder_SC.$MessageID;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.recorders.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.recorders[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.keyRecorders.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.keyRecorders[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.myRecorders.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.myRecorders[_loc4_]);
            _loc4_++;
         }
         if(this.hasMyInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.myInfo$field);
         }
         if(this.hasLeftSeconds)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.leftSeconds$field);
         }
         if(this.hasJoinRoleSize)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.joinRoleSize$field);
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
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
                  this.recorders.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_MeleeRecorder()));
                  break;
               case 2:
                  this.keyRecorders.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_MeleeRecorder()));
                  break;
               case 3:
                  this.myRecorders.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_MeleeRecorder()));
                  break;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Melee_GetFightRecorder_SC.myInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.myInfo = new Dto_MeleeMyInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.myInfo);
                  break;
               case 5:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Melee_GetFightRecorder_SC.leftSeconds cannot be set twice.");
                  }
                  _loc4_++;
                  this.leftSeconds = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Melee_GetFightRecorder_SC.joinRoleSize cannot be set twice.");
                  }
                  _loc5_++;
                  this.joinRoleSize = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
