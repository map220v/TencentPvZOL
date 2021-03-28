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
   
   public final class Cmd_DailyVow_DoVow_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_DailyVow_DoVow_SC";
      
      public static const VOWTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyVow_DoVow_SC.vowType","vowType",1 << 3 | WireType.VARINT);
      
      public static const CRITICALTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyVow_DoVow_SC.criticalTimes","criticalTimes",2 << 3 | WireType.VARINT);
      
      public static const REWARDITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_DailyVow_DoVow_SC.rewardItems","rewardItems",3 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const ADDEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyVow_DoVow_SC.addExp","addExp",4 << 3 | WireType.VARINT);
       
      
      private var vowType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var criticalTimes$field:uint;
      
      public var rewardItems:Array;
      
      private var addExp$field:uint;
      
      public function Cmd_DailyVow_DoVow_SC()
      {
         this.rewardItems = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_DailyVow_DoVow_SC.$MessageID;
      }
      
      public function clearVowType() : void
      {
         this.hasField$0 &= 4294967294;
         this.vowType$field = new uint();
      }
      
      public function get hasVowType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set vowType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.vowType$field = param1;
      }
      
      public function get vowType() : uint
      {
         return this.vowType$field;
      }
      
      public function clearCriticalTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.criticalTimes$field = new uint();
      }
      
      public function get hasCriticalTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set criticalTimes(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.criticalTimes$field = param1;
      }
      
      public function get criticalTimes() : uint
      {
         return this.criticalTimes$field;
      }
      
      public function clearAddExp() : void
      {
         this.hasField$0 &= 4294967291;
         this.addExp$field = new uint();
      }
      
      public function get hasAddExp() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set addExp(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.addExp$field = param1;
      }
      
      public function get addExp() : uint
      {
         return this.addExp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasVowType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.vowType$field);
         }
         if(this.hasCriticalTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.criticalTimes$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewardItems.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardItems[_loc2_]);
            _loc2_++;
         }
         if(this.hasAddExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.addExp$field);
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
                     throw new IOError("Bad data format: Cmd_DailyVow_DoVow_SC.vowType cannot be set twice.");
                  }
                  _loc3_++;
                  this.vowType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyVow_DoVow_SC.criticalTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.criticalTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  this.rewardItems.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyVow_DoVow_SC.addExp cannot be set twice.");
                  }
                  _loc5_++;
                  this.addExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
