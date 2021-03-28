package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Card_GetRefineInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Card_GetRefineInfo_SC";
      
      public static const CARDUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Card_GetRefineInfo_SC.cardUId","cardUId",1 << 3 | WireType.VARINT);
      
      public static const ATTRIBUTE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Card_GetRefineInfo_SC.attribute","attribute",2 << 3 | WireType.LENGTH_DELIMITED,Dto_RefineAttribute);
      
      public static const SPEED:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Card_GetRefineInfo_SC.speed","speed",3 << 3 | WireType.VARINT);
      
      public static const TOTALREFINETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Card_GetRefineInfo_SC.totalRefineTimes","totalRefineTimes",4 << 3 | WireType.VARINT);
      
      public static const LEFTREFINETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Card_GetRefineInfo_SC.leftRefineTimes","leftRefineTimes",5 << 3 | WireType.VARINT);
       
      
      private var cardUId$field:Int64;
      
      public var attribute:Array;
      
      private var speed$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var totalRefineTimes$field:uint;
      
      private var leftRefineTimes$field:uint;
      
      public function Cmd_Card_GetRefineInfo_SC()
      {
         this.attribute = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Card_GetRefineInfo_SC.$MessageID;
      }
      
      public function clearCardUId() : void
      {
         this.cardUId$field = null;
      }
      
      public function get hasCardUId() : Boolean
      {
         return this.cardUId$field != null;
      }
      
      public function set cardUId(param1:Int64) : void
      {
         this.cardUId$field = param1;
      }
      
      public function get cardUId() : Int64
      {
         return this.cardUId$field;
      }
      
      public function clearSpeed() : void
      {
         this.hasField$0 &= 4294967294;
         this.speed$field = new uint();
      }
      
      public function get hasSpeed() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set speed(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.speed$field = param1;
      }
      
      public function get speed() : uint
      {
         return this.speed$field;
      }
      
      public function clearTotalRefineTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.totalRefineTimes$field = new uint();
      }
      
      public function get hasTotalRefineTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set totalRefineTimes(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.totalRefineTimes$field = param1;
      }
      
      public function get totalRefineTimes() : uint
      {
         return this.totalRefineTimes$field;
      }
      
      public function clearLeftRefineTimes() : void
      {
         this.hasField$0 &= 4294967291;
         this.leftRefineTimes$field = new uint();
      }
      
      public function get hasLeftRefineTimes() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set leftRefineTimes(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.leftRefineTimes$field = param1;
      }
      
      public function get leftRefineTimes() : uint
      {
         return this.leftRefineTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasCardUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.cardUId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.attribute.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.attribute[_loc2_]);
            _loc2_++;
         }
         if(this.hasSpeed)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.speed$field);
         }
         if(this.hasTotalRefineTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.totalRefineTimes$field);
         }
         if(this.hasLeftRefineTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.leftRefineTimes$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Cmd_Card_GetRefineInfo_SC.cardUId cannot be set twice.");
                  }
                  _loc3_++;
                  this.cardUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  this.attribute.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_RefineAttribute()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_GetRefineInfo_SC.speed cannot be set twice.");
                  }
                  _loc4_++;
                  this.speed = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_GetRefineInfo_SC.totalRefineTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.totalRefineTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_GetRefineInfo_SC.leftRefineTimes cannot be set twice.");
                  }
                  _loc6_++;
                  this.leftRefineTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
