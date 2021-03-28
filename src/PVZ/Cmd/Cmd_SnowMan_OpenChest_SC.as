package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_SnowMan_OpenChest_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SnowMan_OpenChest_SC";
      
      public static const MODEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SnowMan_OpenChest_SC.modeId","modeId",1 << 3 | WireType.VARINT);
      
      public static const REWARDITEM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_SnowMan_OpenChest_SC.rewardItem","rewardItem",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const LEFTKEYNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SnowMan_OpenChest_SC.leftKeyNum","leftKeyNum",3 << 3 | WireType.VARINT);
      
      public static const OPENTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SnowMan_OpenChest_SC.openTime","openTime",4 << 3 | WireType.VARINT);
       
      
      private var modeId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var rewardItem:Array;
      
      private var leftKeyNum$field:uint;
      
      private var openTime$field:uint;
      
      public function Cmd_SnowMan_OpenChest_SC()
      {
         this.rewardItem = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SnowMan_OpenChest_SC.$MessageID;
      }
      
      public function clearModeId() : void
      {
         this.hasField$0 &= 4294967294;
         this.modeId$field = new uint();
      }
      
      public function get hasModeId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set modeId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.modeId$field = param1;
      }
      
      public function get modeId() : uint
      {
         return this.modeId$field;
      }
      
      public function clearLeftKeyNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.leftKeyNum$field = new uint();
      }
      
      public function get hasLeftKeyNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set leftKeyNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.leftKeyNum$field = param1;
      }
      
      public function get leftKeyNum() : uint
      {
         return this.leftKeyNum$field;
      }
      
      public function clearOpenTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.openTime$field = new uint();
      }
      
      public function get hasOpenTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set openTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.openTime$field = param1;
      }
      
      public function get openTime() : uint
      {
         return this.openTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasModeId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.modeId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewardItem.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardItem[_loc2_]);
            _loc2_++;
         }
         if(this.hasLeftKeyNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.leftKeyNum$field);
         }
         if(this.hasOpenTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.openTime$field);
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
                     throw new IOError("Bad data format: Cmd_SnowMan_OpenChest_SC.modeId cannot be set twice.");
                  }
                  _loc3_++;
                  this.modeId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.rewardItem.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SnowMan_OpenChest_SC.leftKeyNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.leftKeyNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SnowMan_OpenChest_SC.openTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.openTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
