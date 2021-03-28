package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Nutrition_SuperTrade_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Nutrition_SuperTrade_SC";
      
      public static const OLDEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_SuperTrade_SC.oldExp","oldExp",1 << 3 | WireType.VARINT);
      
      public static const NEWEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_SuperTrade_SC.newExp","newExp",2 << 3 | WireType.VARINT);
      
      public static const GOLDREAGENTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_SuperTrade_SC.goldReagentNum","goldReagentNum",3 << 3 | WireType.VARINT);
      
      public static const COST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_SuperTrade_SC.cost","cost",4 << 3 | WireType.VARINT);
      
      public static const QUALITYNUM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Nutrition_SuperTrade_SC.qualityNum","qualityNum",5 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const STOPREASON:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Cmd_Nutrition_SuperTrade_SC.stopReason","stopReason",6 << 3 | WireType.VARINT);
      
      public static const ACTIVATELIST:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_SuperTrade_SC.activateList","activateList",7 << 3 | WireType.VARINT);
      
      public static const FREELIST:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_SuperTrade_SC.freeList","freeList",8 << 3 | WireType.VARINT);
       
      
      private var oldExp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var newExp$field:uint;
      
      private var goldReagentNum$field:uint;
      
      private var cost$field:uint;
      
      public var qualityNum:Array;
      
      private var stopReason$field:int;
      
      public var activateList:Array;
      
      public var freeList:Array;
      
      public function Cmd_Nutrition_SuperTrade_SC()
      {
         this.qualityNum = [];
         this.activateList = [];
         this.freeList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Nutrition_SuperTrade_SC.$MessageID;
      }
      
      public function clearOldExp() : void
      {
         this.hasField$0 &= 4294967294;
         this.oldExp$field = new uint();
      }
      
      public function get hasOldExp() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set oldExp(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.oldExp$field = param1;
      }
      
      public function get oldExp() : uint
      {
         return this.oldExp$field;
      }
      
      public function clearNewExp() : void
      {
         this.hasField$0 &= 4294967293;
         this.newExp$field = new uint();
      }
      
      public function get hasNewExp() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set newExp(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.newExp$field = param1;
      }
      
      public function get newExp() : uint
      {
         return this.newExp$field;
      }
      
      public function clearGoldReagentNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.goldReagentNum$field = new uint();
      }
      
      public function get hasGoldReagentNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set goldReagentNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.goldReagentNum$field = param1;
      }
      
      public function get goldReagentNum() : uint
      {
         return this.goldReagentNum$field;
      }
      
      public function clearCost() : void
      {
         this.hasField$0 &= 4294967287;
         this.cost$field = new uint();
      }
      
      public function get hasCost() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set cost(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.cost$field = param1;
      }
      
      public function get cost() : uint
      {
         return this.cost$field;
      }
      
      public function clearStopReason() : void
      {
         this.hasField$0 &= 4294967279;
         this.stopReason$field = new int();
      }
      
      public function get hasStopReason() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set stopReason(param1:int) : void
      {
         this.hasField$0 |= 16;
         this.stopReason$field = param1;
      }
      
      public function get stopReason() : int
      {
         return this.stopReason$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         if(this.hasOldExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.oldExp$field);
         }
         if(this.hasNewExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.newExp$field);
         }
         if(this.hasGoldReagentNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.goldReagentNum$field);
         }
         if(this.hasCost)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.cost$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.qualityNum.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.qualityNum[_loc2_]);
            _loc2_++;
         }
         if(this.hasStopReason)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_INT32(param1,this.stopReason$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.activateList.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.activateList[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.freeList.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.freeList[_loc4_]);
            _loc4_++;
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
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
                     throw new IOError("Bad data format: Cmd_Nutrition_SuperTrade_SC.oldExp cannot be set twice.");
                  }
                  _loc3_++;
                  this.oldExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_SuperTrade_SC.newExp cannot be set twice.");
                  }
                  _loc4_++;
                  this.newExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_SuperTrade_SC.goldReagentNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.goldReagentNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_SuperTrade_SC.cost cannot be set twice.");
                  }
                  _loc6_++;
                  this.cost = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  this.qualityNum.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_SuperTrade_SC.stopReason cannot be set twice.");
                  }
                  _loc7_++;
                  this.stopReason = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 7:
                  if((_loc8_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.activateList);
                  }
                  else
                  {
                     this.activateList.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 8:
                  if((_loc8_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.freeList);
                  }
                  else
                  {
                     this.freeList.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
