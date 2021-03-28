package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_ScrewUp_Restart_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ScrewUp_Restart_SC";
      
      public static const RESULT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_ScrewUp_Restart_SC.result","result",1 << 3 | WireType.VARINT);
      
      public static const RESTARTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ScrewUp_Restart_SC.restartNum","restartNum",2 << 3 | WireType.VARINT);
      
      public static const VIPRESTARTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ScrewUp_Restart_SC.vipRestartNum","vipRestartNum",3 << 3 | WireType.VARINT);
       
      
      private var result$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var restartNum$field:uint;
      
      private var vipRestartNum$field:uint;
      
      public function Cmd_ScrewUp_Restart_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ScrewUp_Restart_SC.$MessageID;
      }
      
      public function clearResult() : void
      {
         this.hasField$0 &= 4294967294;
         this.result$field = new Boolean();
      }
      
      public function get hasResult() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set result(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.result$field = param1;
      }
      
      public function get result() : Boolean
      {
         return this.result$field;
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
      
      public function clearVipRestartNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.vipRestartNum$field = new uint();
      }
      
      public function get hasVipRestartNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set vipRestartNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.vipRestartNum$field = param1;
      }
      
      public function get vipRestartNum() : uint
      {
         return this.vipRestartNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasResult)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_BOOL(param1,this.result$field);
         }
         if(this.hasRestartNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.restartNum$field);
         }
         if(this.hasVipRestartNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.vipRestartNum$field);
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
                     throw new IOError("Bad data format: Cmd_ScrewUp_Restart_SC.result cannot be set twice.");
                  }
                  _loc3_++;
                  this.result = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ScrewUp_Restart_SC.restartNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.restartNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ScrewUp_Restart_SC.vipRestartNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.vipRestartNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
