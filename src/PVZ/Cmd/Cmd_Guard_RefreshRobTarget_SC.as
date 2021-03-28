package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Guard_RefreshRobTarget_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Guard_RefreshRobTarget_SC";
      
      public static const ZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Guard_RefreshRobTarget_SC.zoneId","zoneId",1 << 3 | WireType.VARINT);
      
      public static const GUARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Guard_RefreshRobTarget_SC.guard","guard",2 << 3 | WireType.LENGTH_DELIMITED,Dto_Guard);
      
      public static const REFRESHCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Guard_RefreshRobTarget_SC.refreshCount","refreshCount",3 << 3 | WireType.VARINT);
       
      
      private var zoneId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var guard$field:Dto_Guard;
      
      private var refreshCount$field:uint;
      
      public function Cmd_Guard_RefreshRobTarget_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Guard_RefreshRobTarget_SC.$MessageID;
      }
      
      public function clearZoneId() : void
      {
         this.hasField$0 &= 4294967294;
         this.zoneId$field = new uint();
      }
      
      public function get hasZoneId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set zoneId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.zoneId$field = param1;
      }
      
      public function get zoneId() : uint
      {
         return this.zoneId$field;
      }
      
      public function clearGuard() : void
      {
         this.guard$field = null;
      }
      
      public function get hasGuard() : Boolean
      {
         return this.guard$field != null;
      }
      
      public function set guard(param1:Dto_Guard) : void
      {
         this.guard$field = param1;
      }
      
      public function get guard() : Dto_Guard
      {
         return this.guard$field;
      }
      
      public function clearRefreshCount() : void
      {
         this.hasField$0 &= 4294967293;
         this.refreshCount$field = new uint();
      }
      
      public function get hasRefreshCount() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set refreshCount(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.refreshCount$field = param1;
      }
      
      public function get refreshCount() : uint
      {
         return this.refreshCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasZoneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneId$field);
         }
         if(this.hasGuard)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guard$field);
         }
         if(this.hasRefreshCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.refreshCount$field);
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
                     throw new IOError("Bad data format: Cmd_Guard_RefreshRobTarget_SC.zoneId cannot be set twice.");
                  }
                  _loc3_++;
                  this.zoneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Guard_RefreshRobTarget_SC.guard cannot be set twice.");
                  }
                  _loc4_++;
                  this.guard = new Dto_Guard();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.guard);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Guard_RefreshRobTarget_SC.refreshCount cannot be set twice.");
                  }
                  _loc5_++;
                  this.refreshCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
