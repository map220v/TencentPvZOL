package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_PlantTest_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_PlantTest_GetInfo_SC";
      
      public static const OPENEDSTAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PlantTest_GetInfo_SC.openedStage","openedStage",1 << 3 | WireType.VARINT);
      
      public static const RESTARTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PlantTest_GetInfo_SC.restartNum","restartNum",2 << 3 | WireType.VARINT);
      
      public static const LASTCHALLENGESTAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PlantTest_GetInfo_SC.lastChallengeStage","lastChallengeStage",3 << 3 | WireType.VARINT);
       
      
      private var openedStage$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var restartNum$field:uint;
      
      private var lastChallengeStage$field:uint;
      
      public function Cmd_PlantTest_GetInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_PlantTest_GetInfo_SC.$MessageID;
      }
      
      public function clearOpenedStage() : void
      {
         this.hasField$0 &= 4294967294;
         this.openedStage$field = new uint();
      }
      
      public function get hasOpenedStage() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set openedStage(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.openedStage$field = param1;
      }
      
      public function get openedStage() : uint
      {
         return this.openedStage$field;
      }
      
      public function clearRestartNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.restartNum$field = new uint();
      }
      
      public function get hasRestartNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set restartNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.restartNum$field = param1;
      }
      
      public function get restartNum() : uint
      {
         return this.restartNum$field;
      }
      
      public function clearLastChallengeStage() : void
      {
         this.hasField$0 &= 4294967291;
         this.lastChallengeStage$field = new uint();
      }
      
      public function get hasLastChallengeStage() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set lastChallengeStage(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.lastChallengeStage$field = param1;
      }
      
      public function get lastChallengeStage() : uint
      {
         return this.lastChallengeStage$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasOpenedStage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.openedStage$field);
         }
         if(this.hasRestartNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.restartNum$field);
         }
         if(this.hasLastChallengeStage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.lastChallengeStage$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PlantTest_GetInfo_SC.openedStage cannot be set twice.");
                  }
                  _loc3_++;
                  this.openedStage = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PlantTest_GetInfo_SC.restartNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.restartNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PlantTest_GetInfo_SC.lastChallengeStage cannot be set twice.");
                  }
                  _loc5_++;
                  this.lastChallengeStage = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
