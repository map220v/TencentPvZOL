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
   
   public final class Cmd_FlexibleActivity_WealthGodRedPacketSend_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_FlexibleActivity_WealthGodRedPacketSend_CS";
      
      public static const IACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_WealthGodRedPacketSend_CS.iActivityId","iActivityId",1 << 3 | WireType.VARINT);
      
      public static const BANONY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_FlexibleActivity_WealthGodRedPacketSend_CS.bAnony","bAnony",2 << 3 | WireType.VARINT);
       
      
      private var iActivityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var bAnony$field:Boolean;
      
      public function Cmd_FlexibleActivity_WealthGodRedPacketSend_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_FlexibleActivity_WealthGodRedPacketSend_CS.$MessageID;
      }
      
      public function clearIActivityId() : void
      {
         this.hasField$0 &= 4294967294;
         this.iActivityId$field = new uint();
      }
      
      public function get hasIActivityId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set iActivityId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.iActivityId$field = param1;
      }
      
      public function get iActivityId() : uint
      {
         return this.iActivityId$field;
      }
      
      public function clearBAnony() : void
      {
         this.hasField$0 &= 4294967293;
         this.bAnony$field = new Boolean();
      }
      
      public function get hasBAnony() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set bAnony(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.bAnony$field = param1;
      }
      
      public function get bAnony() : Boolean
      {
         return this.bAnony$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasIActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.iActivityId$field);
         }
         if(this.hasBAnony)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.bAnony$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_WealthGodRedPacketSend_CS.iActivityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.iActivityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_WealthGodRedPacketSend_CS.bAnony cannot be set twice.");
                  }
                  _loc4_++;
                  this.bAnony = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
