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
   
   public final class Cmd_GuildFuben_DayReward_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GuildFuben_DayReward_GetInfo_SC";
      
      public static const NEEDFIGHTTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFuben_DayReward_GetInfo_SC.needFightTimes","needFightTimes",2 << 3 | WireType.VARINT);
      
      public static const CURFIGHTTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFuben_DayReward_GetInfo_SC.curFightTimes","curFightTimes",3 << 3 | WireType.VARINT);
      
      public static const HASGOT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_GuildFuben_DayReward_GetInfo_SC.hasGot","hasGot",4 << 3 | WireType.VARINT);
       
      
      private var needFightTimes$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var curFightTimes$field:uint;
      
      private var hasGot$field:Boolean;
      
      public function Cmd_GuildFuben_DayReward_GetInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GuildFuben_DayReward_GetInfo_SC.$MessageID;
      }
      
      public function clearNeedFightTimes() : void
      {
         this.hasField$0 &= 4294967294;
         this.needFightTimes$field = new uint();
      }
      
      public function get hasNeedFightTimes() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set needFightTimes(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.needFightTimes$field = param1;
      }
      
      public function get needFightTimes() : uint
      {
         return this.needFightTimes$field;
      }
      
      public function clearCurFightTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.curFightTimes$field = new uint();
      }
      
      public function get hasCurFightTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set curFightTimes(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.curFightTimes$field = param1;
      }
      
      public function get curFightTimes() : uint
      {
         return this.curFightTimes$field;
      }
      
      public function clearHasGot() : void
      {
         this.hasField$0 &= 4294967291;
         this.hasGot$field = new Boolean();
      }
      
      public function get hasHasGot() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set hasGot(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.hasGot$field = param1;
      }
      
      public function get hasGot() : Boolean
      {
         return this.hasGot$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasNeedFightTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.needFightTimes$field);
         }
         if(this.hasCurFightTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.curFightTimes$field);
         }
         if(this.hasHasGot)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.hasGot$field);
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
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFuben_DayReward_GetInfo_SC.needFightTimes cannot be set twice.");
                  }
                  _loc3_++;
                  this.needFightTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFuben_DayReward_GetInfo_SC.curFightTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.curFightTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFuben_DayReward_GetInfo_SC.hasGot cannot be set twice.");
                  }
                  _loc5_++;
                  this.hasGot = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
