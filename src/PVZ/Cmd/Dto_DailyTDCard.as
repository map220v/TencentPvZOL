package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_DailyTDCard extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_DailyTDCard";
      
      public static const ETYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_DailyTDCard.eType","eType",1 << 3 | WireType.VARINT,E_DailyTD_CardType);
      
      public static const IPLANTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DailyTDCard.iPlantId","iPlantId",2 << 3 | WireType.VARINT);
      
      public static const INUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DailyTDCard.iNum","iNum",3 << 3 | WireType.VARINT);
       
      
      private var eType$field:int;
      
      private var hasField$0:uint = 0;
      
      private var iPlantId$field:uint;
      
      private var iNum$field:uint;
      
      public function Dto_DailyTDCard()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_DailyTDCard.$MessageID;
      }
      
      public function clearEType() : void
      {
         this.hasField$0 &= 4294967294;
         this.eType$field = new int();
      }
      
      public function get hasEType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set eType(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.eType$field = param1;
      }
      
      public function get eType() : int
      {
         return this.eType$field;
      }
      
      public function clearIPlantId() : void
      {
         this.hasField$0 &= 4294967293;
         this.iPlantId$field = new uint();
      }
      
      public function get hasIPlantId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set iPlantId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.iPlantId$field = param1;
      }
      
      public function get iPlantId() : uint
      {
         return this.iPlantId$field;
      }
      
      public function clearINum() : void
      {
         this.hasField$0 &= 4294967291;
         this.iNum$field = new uint();
      }
      
      public function get hasINum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set iNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.iNum$field = param1;
      }
      
      public function get iNum() : uint
      {
         return this.iNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasEType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_ENUM(param1,this.eType$field);
         }
         if(this.hasIPlantId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.iPlantId$field);
         }
         if(this.hasINum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.iNum$field);
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
                     throw new IOError("Bad data format: Dto_DailyTDCard.eType cannot be set twice.");
                  }
                  _loc3_++;
                  this.eType = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DailyTDCard.iPlantId cannot be set twice.");
                  }
                  _loc4_++;
                  this.iPlantId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DailyTDCard.iNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.iNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
