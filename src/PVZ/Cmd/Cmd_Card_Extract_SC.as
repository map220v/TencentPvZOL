package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Card_Extract_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Card_Extract_SC";
      
      public static const ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Card_Extract_SC.items","items",1 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const LUCKYFLOWERNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Card_Extract_SC.luckyFlowerNum","luckyFlowerNum",2 << 3 | WireType.VARINT);
      
      public static const FREEINFOS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Card_Extract_SC.freeInfos","freeInfos",3 << 3 | WireType.LENGTH_DELIMITED,Dto_Card_MarketFreeInfo);
      
      public static const GROUP1EXTRACTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Card_Extract_SC.group1ExtractNum","group1ExtractNum",5 << 3 | WireType.VARINT);
      
      public static const DEBRIS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Card_Extract_SC.debris","debris",6 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      public var items:Array;
      
      private var luckyFlowerNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var freeInfos$field:Dto_Card_MarketFreeInfo;
      
      private var group1ExtractNum$field:uint;
      
      private var debris$field:Dto_IdNum;
      
      public function Cmd_Card_Extract_SC()
      {
         this.items = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Card_Extract_SC.$MessageID;
      }
      
      public function clearLuckyFlowerNum() : void
      {
         this.hasField$0 &= 4294967294;
         this.luckyFlowerNum$field = new uint();
      }
      
      public function get hasLuckyFlowerNum() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set luckyFlowerNum(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.luckyFlowerNum$field = param1;
      }
      
      public function get luckyFlowerNum() : uint
      {
         return this.luckyFlowerNum$field;
      }
      
      public function clearFreeInfos() : void
      {
         this.freeInfos$field = null;
      }
      
      public function get hasFreeInfos() : Boolean
      {
         return this.freeInfos$field != null;
      }
      
      public function set freeInfos(param1:Dto_Card_MarketFreeInfo) : void
      {
         this.freeInfos$field = param1;
      }
      
      public function get freeInfos() : Dto_Card_MarketFreeInfo
      {
         return this.freeInfos$field;
      }
      
      public function clearGroup1ExtractNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.group1ExtractNum$field = new uint();
      }
      
      public function get hasGroup1ExtractNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set group1ExtractNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.group1ExtractNum$field = param1;
      }
      
      public function get group1ExtractNum() : uint
      {
         return this.group1ExtractNum$field;
      }
      
      public function clearDebris() : void
      {
         this.debris$field = null;
      }
      
      public function get hasDebris() : Boolean
      {
         return this.debris$field != null;
      }
      
      public function set debris(param1:Dto_IdNum) : void
      {
         this.debris$field = param1;
      }
      
      public function get debris() : Dto_IdNum
      {
         return this.debris$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.items.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.items[_loc2_]);
            _loc2_++;
         }
         if(this.hasLuckyFlowerNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.luckyFlowerNum$field);
         }
         if(this.hasFreeInfos)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.freeInfos$field);
         }
         if(this.hasGroup1ExtractNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.group1ExtractNum$field);
         }
         if(this.hasDebris)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.debris$field);
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
                  this.items.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_Extract_SC.luckyFlowerNum cannot be set twice.");
                  }
                  _loc3_++;
                  this.luckyFlowerNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_Extract_SC.freeInfos cannot be set twice.");
                  }
                  _loc4_++;
                  this.freeInfos = new Dto_Card_MarketFreeInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.freeInfos);
                  break;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_Extract_SC.group1ExtractNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.group1ExtractNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_Extract_SC.debris cannot be set twice.");
                  }
                  _loc6_++;
                  this.debris = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.debris);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
