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
   
   public final class Cmd_LuckyStar_Info_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_LuckyStar_Info_SC";
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_LuckyStar_Info_SC.id","id",1 << 3 | WireType.VARINT);
      
      public static const BEGINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_LuckyStar_Info_SC.beginTime","beginTime",2 << 3 | WireType.VARINT);
      
      public static const ENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_LuckyStar_Info_SC.endTime","endTime",3 << 3 | WireType.VARINT);
      
      public static const ISTAKEDAILYPACK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_LuckyStar_Info_SC.isTakeDailyPack","isTakeDailyPack",4 << 3 | WireType.VARINT);
      
      public static const DAILYPACKID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_LuckyStar_Info_SC.dailyPackId","dailyPackId",5 << 3 | WireType.VARINT);
      
      public static const PRODUCT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_LuckyStar_Info_SC.product","product",6 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var beginTime$field:uint;
      
      private var endTime$field:uint;
      
      private var isTakeDailyPack$field:uint;
      
      private var dailyPackId$field:uint;
      
      public var product:Array;
      
      public function Cmd_LuckyStar_Info_SC()
      {
         this.product = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_LuckyStar_Info_SC.$MessageID;
      }
      
      public function clearId() : void
      {
         this.hasField$0 &= 4294967294;
         this.id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.id$field = param1;
      }
      
      public function get id() : uint
      {
         return this.id$field;
      }
      
      public function clearBeginTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.beginTime$field = new uint();
      }
      
      public function get hasBeginTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set beginTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.beginTime$field = param1;
      }
      
      public function get beginTime() : uint
      {
         return this.beginTime$field;
      }
      
      public function clearEndTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.endTime$field = new uint();
      }
      
      public function get hasEndTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set endTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.endTime$field = param1;
      }
      
      public function get endTime() : uint
      {
         return this.endTime$field;
      }
      
      public function clearIsTakeDailyPack() : void
      {
         this.hasField$0 &= 4294967287;
         this.isTakeDailyPack$field = new uint();
      }
      
      public function get hasIsTakeDailyPack() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set isTakeDailyPack(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.isTakeDailyPack$field = param1;
      }
      
      public function get isTakeDailyPack() : uint
      {
         return this.isTakeDailyPack$field;
      }
      
      public function clearDailyPackId() : void
      {
         this.hasField$0 &= 4294967279;
         this.dailyPackId$field = new uint();
      }
      
      public function get hasDailyPackId() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set dailyPackId(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.dailyPackId$field = param1;
      }
      
      public function get dailyPackId() : uint
      {
         return this.dailyPackId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.id$field);
         }
         if(this.hasBeginTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.beginTime$field);
         }
         if(this.hasEndTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.endTime$field);
         }
         if(this.hasIsTakeDailyPack)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.isTakeDailyPack$field);
         }
         if(this.hasDailyPackId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.dailyPackId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.product.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.product[_loc2_]);
            _loc2_++;
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
                     throw new IOError("Bad data format: Cmd_LuckyStar_Info_SC.id cannot be set twice.");
                  }
                  _loc3_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_LuckyStar_Info_SC.beginTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.beginTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_LuckyStar_Info_SC.endTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.endTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_LuckyStar_Info_SC.isTakeDailyPack cannot be set twice.");
                  }
                  _loc6_++;
                  this.isTakeDailyPack = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_LuckyStar_Info_SC.dailyPackId cannot be set twice.");
                  }
                  _loc7_++;
                  this.dailyPackId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  this.product.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
