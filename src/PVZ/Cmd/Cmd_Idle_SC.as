package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Idle_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Idle_SC";
      
      public static const SEQID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Idle_SC.seqID","seqID",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const SERVERTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Idle_SC.serverTime","serverTime",2 << 3 | WireType.VARINT);
       
      
      private var seqID$field:String;
      
      private var serverTime$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Idle_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Idle_SC.$MessageID;
      }
      
      public function clearSeqID() : void
      {
         this.seqID$field = null;
      }
      
      public function get hasSeqID() : Boolean
      {
         return this.seqID$field != null;
      }
      
      public function set seqID(param1:String) : void
      {
         this.seqID$field = param1;
      }
      
      public function get seqID() : String
      {
         return this.seqID$field;
      }
      
      public function clearServerTime() : void
      {
         this.hasField$0 &= 4294967294;
         this.serverTime$field = new uint();
      }
      
      public function get hasServerTime() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set serverTime(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.serverTime$field = param1;
      }
      
      public function get serverTime() : uint
      {
         return this.serverTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasSeqID)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.seqID$field);
         }
         if(this.hasServerTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.serverTime$field);
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
                     throw new IOError("Bad data format: Cmd_Idle_SC.seqID cannot be set twice.");
                  }
                  _loc3_++;
                  this.seqID = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Idle_SC.serverTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.serverTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
