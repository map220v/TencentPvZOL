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
   
   public final class Cmd_FlexibleActivity26_BreakJar_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_FlexibleActivity26_BreakJar_SC";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity26_BreakJar_SC.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const BREAKID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity26_BreakJar_SC.breakId","breakId",2 << 3 | WireType.VARINT);
      
      public static const SELECTREWARDINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity26_BreakJar_SC.selectRewardIndex","selectRewardIndex",3 << 3 | WireType.VARINT);
      
      public static const ITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_FlexibleActivity26_BreakJar_SC.item","item",4 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var breakId$field:uint;
      
      private var selectRewardIndex$field:uint;
      
      private var item$field:Dto_IdNum;
      
      public function Cmd_FlexibleActivity26_BreakJar_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_FlexibleActivity26_BreakJar_SC.$MessageID;
      }
      
      public function clearActivityId() : void
      {
         this.hasField$0 &= 4294967294;
         this.activityId$field = new uint();
      }
      
      public function get hasActivityId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set activityId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.activityId$field = param1;
      }
      
      public function get activityId() : uint
      {
         return this.activityId$field;
      }
      
      public function clearBreakId() : void
      {
         this.hasField$0 &= 4294967293;
         this.breakId$field = new uint();
      }
      
      public function get hasBreakId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set breakId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.breakId$field = param1;
      }
      
      public function get breakId() : uint
      {
         return this.breakId$field;
      }
      
      public function clearSelectRewardIndex() : void
      {
         this.hasField$0 &= 4294967291;
         this.selectRewardIndex$field = new uint();
      }
      
      public function get hasSelectRewardIndex() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set selectRewardIndex(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.selectRewardIndex$field = param1;
      }
      
      public function get selectRewardIndex() : uint
      {
         return this.selectRewardIndex$field;
      }
      
      public function clearItem() : void
      {
         this.item$field = null;
      }
      
      public function get hasItem() : Boolean
      {
         return this.item$field != null;
      }
      
      public function set item(param1:Dto_IdNum) : void
      {
         this.item$field = param1;
      }
      
      public function get item() : Dto_IdNum
      {
         return this.item$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         if(this.hasBreakId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.breakId$field);
         }
         if(this.hasSelectRewardIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.selectRewardIndex$field);
         }
         if(this.hasItem)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.item$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity26_BreakJar_SC.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity26_BreakJar_SC.breakId cannot be set twice.");
                  }
                  _loc4_++;
                  this.breakId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity26_BreakJar_SC.selectRewardIndex cannot be set twice.");
                  }
                  _loc5_++;
                  this.selectRewardIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity26_BreakJar_SC.item cannot be set twice.");
                  }
                  _loc6_++;
                  this.item = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.item);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
