package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_FlexibleActivity27_Random_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_FlexibleActivity27_Random_SC";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity27_Random_SC.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity27_Random_SC.count","count",2 << 3 | WireType.VARINT);
      
      public static const LUCKY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity27_Random_SC.lucky","lucky",3 << 3 | WireType.VARINT);
      
      public static const INDEXID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity27_Random_SC.indexId","indexId",4 << 3 | WireType.VARINT);
      
      public static const LUCKYCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity27_Random_SC.luckyCount","luckyCount",5 << 3 | WireType.VARINT);
      
      public static const RANDOMCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity27_Random_SC.randomCount","randomCount",6 << 3 | WireType.VARINT);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var count$field:uint;
      
      private var lucky$field:uint;
      
      public var indexId:Array;
      
      private var luckyCount$field:uint;
      
      private var randomCount$field:uint;
      
      public function Cmd_FlexibleActivity27_Random_SC()
      {
         this.indexId = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_FlexibleActivity27_Random_SC.$MessageID;
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
      
      public function clearCount() : void
      {
         this.hasField$0 &= 4294967293;
         this.count$field = new uint();
      }
      
      public function get hasCount() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set count(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.count$field = param1;
      }
      
      public function get count() : uint
      {
         return this.count$field;
      }
      
      public function clearLucky() : void
      {
         this.hasField$0 &= 4294967291;
         this.lucky$field = new uint();
      }
      
      public function get hasLucky() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set lucky(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.lucky$field = param1;
      }
      
      public function get lucky() : uint
      {
         return this.lucky$field;
      }
      
      public function clearLuckyCount() : void
      {
         this.hasField$0 &= 4294967287;
         this.luckyCount$field = new uint();
      }
      
      public function get hasLuckyCount() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set luckyCount(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.luckyCount$field = param1;
      }
      
      public function get luckyCount() : uint
      {
         return this.luckyCount$field;
      }
      
      public function clearRandomCount() : void
      {
         this.hasField$0 &= 4294967279;
         this.randomCount$field = new uint();
      }
      
      public function get hasRandomCount() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set randomCount(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.randomCount$field = param1;
      }
      
      public function get randomCount() : uint
      {
         return this.randomCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         if(this.hasCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.count$field);
         }
         if(this.hasLucky)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.lucky$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.indexId.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.indexId[_loc2_]);
            _loc2_++;
         }
         if(this.hasLuckyCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.luckyCount$field);
         }
         if(this.hasRandomCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.randomCount$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity27_Random_SC.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity27_Random_SC.count cannot be set twice.");
                  }
                  _loc4_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity27_Random_SC.lucky cannot be set twice.");
                  }
                  _loc5_++;
                  this.lucky = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if((_loc8_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.indexId);
                  }
                  else
                  {
                     this.indexId.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity27_Random_SC.luckyCount cannot be set twice.");
                  }
                  _loc6_++;
                  this.luckyCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity27_Random_SC.randomCount cannot be set twice.");
                  }
                  _loc7_++;
                  this.randomCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
