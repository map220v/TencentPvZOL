package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_SevenDayLogin_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SevenDayLogin_GetInfo_SC";
      
      public static const LOGINDAY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SevenDayLogin_GetInfo_SC.loginDay","loginDay",1 << 3 | WireType.VARINT);
      
      public static const PROGRESS:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SevenDayLogin_GetInfo_SC.progress","progress",2 << 3 | WireType.VARINT);
      
      public static const HASREWARD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SevenDayLogin_GetInfo_SC.hasReward","hasReward",3 << 3 | WireType.VARINT);
      
      public static const ISOPEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_SevenDayLogin_GetInfo_SC.isOpen","isOpen",4 << 3 | WireType.VARINT);
       
      
      private var loginDay$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var progress:Array;
      
      private var hasReward$field:uint;
      
      private var isOpen$field:Boolean;
      
      public function Cmd_SevenDayLogin_GetInfo_SC()
      {
         this.progress = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SevenDayLogin_GetInfo_SC.$MessageID;
      }
      
      public function clearLoginDay() : void
      {
         this.hasField$0 &= 4294967294;
         this.loginDay$field = new uint();
      }
      
      public function get hasLoginDay() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set loginDay(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.loginDay$field = param1;
      }
      
      public function get loginDay() : uint
      {
         return this.loginDay$field;
      }
      
      public function clearHasReward() : void
      {
         this.hasField$0 &= 4294967293;
         this.hasReward$field = new uint();
      }
      
      public function get hasHasReward() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set hasReward(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.hasReward$field = param1;
      }
      
      public function get hasReward() : uint
      {
         return this.hasReward$field;
      }
      
      public function clearIsOpen() : void
      {
         this.hasField$0 &= 4294967291;
         this.isOpen$field = new Boolean();
      }
      
      public function get hasIsOpen() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set isOpen(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.isOpen$field = param1;
      }
      
      public function get isOpen() : Boolean
      {
         return this.isOpen$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasLoginDay)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.loginDay$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.progress.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.progress[_loc2_]);
            _loc2_++;
         }
         if(this.hasHasReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.hasReward$field);
         }
         if(this.hasIsOpen)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.isOpen$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Cmd_SevenDayLogin_GetInfo_SC.loginDay cannot be set twice.");
                  }
                  _loc3_++;
                  this.loginDay = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if((_loc6_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.progress);
                  }
                  else
                  {
                     this.progress.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SevenDayLogin_GetInfo_SC.hasReward cannot be set twice.");
                  }
                  _loc4_++;
                  this.hasReward = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SevenDayLogin_GetInfo_SC.isOpen cannot be set twice.");
                  }
                  _loc5_++;
                  this.isOpen = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
