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
   
   public final class Cmd_Nutrition_NormalCall_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Nutrition_NormalCall_SC";
      
      public static const DIETICIANID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_NormalCall_SC.dieticianId","dieticianId",1 << 3 | WireType.VARINT);
      
      public static const ACTIVATELIST:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_NormalCall_SC.activateList","activateList",2 << 3 | WireType.VARINT);
      
      public static const REAGENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_NormalCall_SC.reagent","reagent",3 << 3 | WireType.VARINT);
      
      public static const GOLDREAGENTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_NormalCall_SC.goldReagentNum","goldReagentNum",4 << 3 | WireType.VARINT);
      
      public static const FREELIST:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_NormalCall_SC.freeList","freeList",5 << 3 | WireType.VARINT);
       
      
      private var dieticianId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var activateList:Array;
      
      private var reagent$field:uint;
      
      private var goldReagentNum$field:uint;
      
      public var freeList:Array;
      
      public function Cmd_Nutrition_NormalCall_SC()
      {
         this.activateList = [];
         this.freeList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Nutrition_NormalCall_SC.$MessageID;
      }
      
      public function clearDieticianId() : void
      {
         this.hasField$0 &= 4294967294;
         this.dieticianId$field = new uint();
      }
      
      public function get hasDieticianId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set dieticianId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.dieticianId$field = param1;
      }
      
      public function get dieticianId() : uint
      {
         return this.dieticianId$field;
      }
      
      public function clearReagent() : void
      {
         this.hasField$0 &= 4294967293;
         this.reagent$field = new uint();
      }
      
      public function get hasReagent() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set reagent(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.reagent$field = param1;
      }
      
      public function get reagent() : uint
      {
         return this.reagent$field;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasDieticianId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.dieticianId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.activateList.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.activateList[_loc2_]);
            _loc2_++;
         }
         if(this.hasReagent)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.reagent$field);
         }
         if(this.hasGoldReagentNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.goldReagentNum$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.freeList.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.freeList[_loc3_]);
            _loc3_++;
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                     throw new IOError("Bad data format: Cmd_Nutrition_NormalCall_SC.dieticianId cannot be set twice.");
                  }
                  _loc3_++;
                  this.dieticianId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if((_loc6_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.activateList);
                  }
                  else
                  {
                     this.activateList.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_NormalCall_SC.reagent cannot be set twice.");
                  }
                  _loc4_++;
                  this.reagent = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_NormalCall_SC.goldReagentNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.goldReagentNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if((_loc6_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.freeList);
                  }
                  else
                  {
                     this.freeList.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
