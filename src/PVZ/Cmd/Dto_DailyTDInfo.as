package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_DailyTDInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_DailyTDInfo";
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DailyTDInfo.stageId","stageId",1 << 3 | WireType.VARINT);
      
      public static const ITDSEQID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DailyTDInfo.iTDSeqId","iTDSeqId",2 << 3 | WireType.VARINT);
      
      public static const EPROCESS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_DailyTDInfo.eProcess","eProcess",3 << 3 | WireType.VARINT,E_DailyTDProcess);
      
      public static const PLANTCARD:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DailyTDInfo.plantCard","plantCard",4 << 3 | WireType.VARINT);
      
      public static const CARDITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_DailyTDInfo.cardItem","cardItem",5 << 3 | WireType.LENGTH_DELIMITED,Dto_DailyTDCard);
      
      public static const PLANTINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_DailyTDInfo.plantInfo","plantInfo",6 << 3 | WireType.LENGTH_DELIMITED,Dto_PlantInfo);
      
      public static const ISUN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DailyTDInfo.iSun","iSun",7 << 3 | WireType.VARINT);
      
      public static const IENERGYBEAN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DailyTDInfo.iEnergyBean","iEnergyBean",8 << 3 | WireType.VARINT);
      
      public static const CARLIST:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DailyTDInfo.carList","carList",9 << 3 | WireType.VARINT);
       
      
      private var stageId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var iTDSeqId$field:uint;
      
      private var eProcess$field:int;
      
      public var plantCard:Array;
      
      private var cardItem$field:Dto_DailyTDCard;
      
      public var plantInfo:Array;
      
      private var iSun$field:uint;
      
      private var iEnergyBean$field:uint;
      
      public var carList:Array;
      
      public function Dto_DailyTDInfo()
      {
         this.plantCard = [];
         this.plantInfo = [];
         this.carList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_DailyTDInfo.$MessageID;
      }
      
      public function clearStageId() : void
      {
         this.hasField$0 &= 4294967294;
         this.stageId$field = new uint();
      }
      
      public function get hasStageId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set stageId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.stageId$field = param1;
      }
      
      public function get stageId() : uint
      {
         return this.stageId$field;
      }
      
      public function clearITDSeqId() : void
      {
         this.hasField$0 &= 4294967293;
         this.iTDSeqId$field = new uint();
      }
      
      public function get hasITDSeqId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set iTDSeqId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.iTDSeqId$field = param1;
      }
      
      public function get iTDSeqId() : uint
      {
         return this.iTDSeqId$field;
      }
      
      public function clearEProcess() : void
      {
         this.hasField$0 &= 4294967291;
         this.eProcess$field = new int();
      }
      
      public function get hasEProcess() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set eProcess(param1:int) : void
      {
         this.hasField$0 |= 4;
         this.eProcess$field = param1;
      }
      
      public function get eProcess() : int
      {
         return this.eProcess$field;
      }
      
      public function clearCardItem() : void
      {
         this.cardItem$field = null;
      }
      
      public function get hasCardItem() : Boolean
      {
         return this.cardItem$field != null;
      }
      
      public function set cardItem(param1:Dto_DailyTDCard) : void
      {
         this.cardItem$field = param1;
      }
      
      public function get cardItem() : Dto_DailyTDCard
      {
         return this.cardItem$field;
      }
      
      public function clearISun() : void
      {
         this.hasField$0 &= 4294967287;
         this.iSun$field = new uint();
      }
      
      public function get hasISun() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set iSun(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.iSun$field = param1;
      }
      
      public function get iSun() : uint
      {
         return this.iSun$field;
      }
      
      public function clearIEnergyBean() : void
      {
         this.hasField$0 &= 4294967279;
         this.iEnergyBean$field = new uint();
      }
      
      public function get hasIEnergyBean() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set iEnergyBean(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.iEnergyBean$field = param1;
      }
      
      public function get iEnergyBean() : uint
      {
         return this.iEnergyBean$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         if(this.hasITDSeqId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.iTDSeqId$field);
         }
         if(this.hasEProcess)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_ENUM(param1,this.eProcess$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.plantCard.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.plantCard[_loc2_]);
            _loc2_++;
         }
         if(this.hasCardItem)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cardItem$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.plantInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.plantInfo[_loc3_]);
            _loc3_++;
         }
         if(this.hasISun)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.iSun$field);
         }
         if(this.hasIEnergyBean)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.iEnergyBean$field);
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.carList.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.carList[_loc4_]);
            _loc4_++;
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DailyTDInfo.stageId cannot be set twice.");
                  }
                  _loc3_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DailyTDInfo.iTDSeqId cannot be set twice.");
                  }
                  _loc4_++;
                  this.iTDSeqId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DailyTDInfo.eProcess cannot be set twice.");
                  }
                  _loc5_++;
                  this.eProcess = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 4:
                  if((_loc9_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.plantCard);
                  }
                  else
                  {
                     this.plantCard.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DailyTDInfo.cardItem cannot be set twice.");
                  }
                  _loc6_++;
                  this.cardItem = new Dto_DailyTDCard();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.cardItem);
                  break;
               case 6:
                  this.plantInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_PlantInfo()));
                  break;
               case 7:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DailyTDInfo.iSun cannot be set twice.");
                  }
                  _loc7_++;
                  this.iSun = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DailyTDInfo.iEnergyBean cannot be set twice.");
                  }
                  _loc8_++;
                  this.iEnergyBean = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if((_loc9_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.carList);
                  }
                  else
                  {
                     this.carList.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
